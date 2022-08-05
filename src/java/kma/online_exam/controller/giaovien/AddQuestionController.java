/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.giaovien;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.Utils.ReadExcelUtils;
import kma.online_exam.Utils.UploadFileUtils;
import kma.online_exam.dao.CauhoiDao;
import kma.online_exam.dao.MonhocDao;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Monhoc;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "AddQuestionController", urlPatterns = {"/AddOrEditQuestion"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddQuestionController extends HttpServlet {

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/addOrEditQuestion.jsp");
        try {
            String idCauhoi = request.getParameter("editQuestionID");
            if(idCauhoi!= null){
                CauhoiDao dao = new CauhoiDao();
                Cauhoi cau = dao.findCauhoiById(Integer.parseInt(idCauhoi));
                request.setAttribute("cauhoi", cau);
                rd.forward(request, response);
                return;
            }
            
            MonhocDao mhdao = new MonhocDao();
            List<Monhoc> listMon = mhdao.listAllMonhoc();
            request.setAttribute("listMonhoc", listMon);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        CauhoiDao dao = new CauhoiDao();
        Cauhoi cau = new Cauhoi();
        String action = request.getParameter("action");
        
        if(action.equals("AddQuestionFromExcel")){
            addQfromExcel(request, response);
            return;
        }
        
        try {
            int idMon = Integer.parseInt(request.getParameter("idMon"));
            String dokho = request.getParameter("dokho");
            String noidung = request.getParameter("noidung");
            String A = request.getParameter("A");
            String B = request.getParameter("B");
            String C = request.getParameter("C");
            String D = request.getParameter("D");
            String dapan = request.getParameter("dapan");
            String usernameGV = usnameLogined;
            
            Monhoc mon = new Monhoc();
            mon.setId(idMon);
            Nhanvien gv = new Nhanvien();
            gv.setUsername(usernameGV);
            
            cau.setMonhoc(mon);
            cau.setDokho(dokho);
            cau.setDebai(noidung);
            cau.setA(A);
            cau.setB(B);
            cau.setC(C);
            cau.setD(D);
            cau.setDapan(dapan);
            cau.setNhanvien(gv);
            
            if(action.equals("EditQuestion")){
                int questionID = Integer.parseInt(request.getParameter("questionID"));
                cau.setId(questionID);

                 if(dao.updateCauhoi(cau)){
                    System.out.println("Updated cau hoi");
                    response.sendRedirect("ListQuestions");
                    return;
                }else System.out.println("Them cau hoi that bai");
            }else if(action.equals("AddQuestion")){
                if(dao.insertCauhoi(cau)){
                    System.out.println("Da them 1 cau hoi");
                    request.setAttribute("message", "Thêm câu hỏi thành công!");
                }else{
                    System.out.println("Them cau hoi that bai");
                    request.setAttribute("message", "Thêm câu hỏi thất bại!");
                }  
            }
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    protected void addQfromExcel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        CauhoiDao dao = new CauhoiDao();
        try {
            UploadFileUtils upfile = new UploadFileUtils();
            String filepath = upfile.UploadExcelQuestion(request);
            System.out.println(filepath);

            int idMon = Integer.parseInt(request.getParameter("idMon"));

            List<Cauhoi> list = new ReadExcelUtils().readListQuestions(idMon, usnameLogined, filepath);
            if(list == null){
                System.out.println("Excel loi");
                request.setAttribute("message", "File excel không có câu hỏi hoặc không đúng định dạng!");
            }
            else if(dao.insertListCauhoi(list)){
                System.out.println("Them cau hoi tu excel thanh cong");
                request.setAttribute("message", "Thêm câu hỏi từ file excel thành công!");
            }else{
                System.out.println("Them cau hoi tu excel that bai");
                request.setAttribute("message", "Thêm câu hỏi từ file excel thất bại!");
            }
        } catch (Exception e) {
        }
        
        doGet(request, response);
    }

 
}
