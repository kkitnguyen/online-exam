/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.giaovien;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.dao.DethiDao;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lophoc;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author KK
 */
@WebServlet(name = "ExportExcelController", urlPatterns = {"/ExportToExcel"})
public class ExportExcelController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int classid = Integer.parseInt(request.getParameter("classID"));
        int examid = Integer.parseInt(request.getParameter("examID"));
        KetquaDao dao = new KetquaDao();
        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Bangdiem");
        HSSFCellStyle style = createStyleForTitle(workbook);
        
        try {
            List<Ketqua> list = dao.listKetquaDethiLop(examid, classid);
            
            if(list.size() == 0){
                String message = "Không có dữ liệu. Lớp này chưa có sinh viên nào.";
                request.setAttribute("message", message);
                KetquaDao kqdao = new KetquaDao();
                DethiDao dedao = new DethiDao();
                LophocDao lopdao = new LophocDao();
                
                //Lấy danh sách kết quả
                List<Ketqua> listkq = kqdao.listKetquaDethiLop(examid, classid);
                request.setAttribute("listKetqua", listkq);

                //Lấy thông tin đề thi
                Dethi de = dedao.findDethiById(examid);
                request.setAttribute("dethi", de);

                //Lấy thông tin lớp
                Lophoc lop = lopdao.findLophocById(classid);
                request.setAttribute("lophoc", lop);
                
                RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/viewResult.jsp");
                rd.forward(request, response);
            }
            
            for(Ketqua kq : list){
                System.out.println(kq.getSinhvien().getHoten() + " | " + kq.getDiem());
            }

            int rownum = 0;
            Cell cell;
            Row row;

            row = sheet.createRow(rownum);

             // STT
            cell = row.createCell(0, CellType.STRING);
            cell.setCellValue("STT");
            cell.setCellStyle(style);

             // Mã SV
            cell = row.createCell(1, CellType.STRING);
            cell.setCellValue("Mã SV");
            cell.setCellStyle(style);

             // Họ và tên
            cell = row.createCell(2, CellType.STRING);
            cell.setCellValue("Họ và tên");
            cell.setCellStyle(style);

             // Ngày thi
            cell = row.createCell(3, CellType.STRING);
            cell.setCellValue("Ngày thi");
            cell.setCellStyle(style);

             // Thời gian làm bài
            cell = row.createCell(4, CellType.STRING);
            cell.setCellValue("TG làm bài");
            cell.setCellStyle(style);

             // Điểm
            cell = row.createCell(5, CellType.STRING);
            cell.setCellValue("Điểm");
            cell.setCellStyle(style);
            
             // Note
            cell = row.createCell(6, CellType.STRING);
            cell.setCellValue("Note");
            cell.setCellStyle(style);
            
            for(Ketqua kq : list){
                rownum++;
                row = sheet.createRow(rownum);

                 // STT
                cell = row.createCell(0, CellType.NUMERIC);
                cell.setCellValue(rownum);

                 // Mã SV
                cell = row.createCell(1, CellType.STRING);
                cell.setCellValue(kq.getSinhvien().getMasv());

                 // Họ và tên
                cell = row.createCell(2, CellType.STRING);
                cell.setCellValue(kq.getSinhvien().getHoten());
                
                if(kq.getNgaythi()!= null){
                    // Ngày thi
                    cell = row.createCell(3, CellType.STRING);
                    String ngaythi = new SimpleDateFormat("yyyy-MM-dd hh:mm").format(kq.getNgaythi());
                    cell.setCellValue(ngaythi);

                     // Thời gian làm bài
                    cell = row.createCell(4, CellType.STRING);
                    int phut = kq.getTglambai()/60;
                    int giay = kq.getTglambai()%60;
                    cell.setCellValue(phut + " phút " + giay + " giây");

                     // Điểm
                    cell = row.createCell(5, CellType.NUMERIC);
                    cell.setCellValue(kq.getDiem());
                }
                // Note Cấm thi
                cell = row.createCell(6, CellType.NUMERIC);
                if(kq.isCamthi() == true)
                    cell.setCellValue("Cấm thi");
            }
            
            for(int i = 0; i <= 5 ; i++) { 
                //Tự động thay đổi kích thước cột
                sheet.autoSizeColumn(i);
            }

            String path = request.getServletContext().getRealPath("") + "/files";
            String filename = "Bangdiem" + classid + examid + ".xls";
            String filepath = path + "/" + filename;
            File file = new File(filepath);
            System.out.println(file.getParentFile());
            
            
            FileOutputStream outFile = new FileOutputStream(file);
            workbook.write(outFile);
            
            System.out.println("Exported bang diem: " + file.getAbsolutePath());
            outFile.close();
            workbook.close();
            
            
            //Download
            OutputStream out = response.getOutputStream();

            response.setContentType("text/html");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition",
                            "attachment; filename=" + filename);
            FileInputStream in = new FileInputStream(filepath);
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
            }
            in.close();
            out.flush();
            
//            String URL = "ViewResult?classID=" + classid
//                    + "&examID=" +examid;
//            response.sendRedirect(URL);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private HSSFCellStyle createStyleForTitle(HSSFWorkbook workbook) {
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        return style;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        

    }

}
