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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.dao.DethiDao;
import kma.online_exam.dao.DethiLopDao;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.DethiLop;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.SinhvienLop;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ClassDetailOfTeacherController", urlPatterns = {"/ClassInfor"})
public class ClassDetailOfTeacherController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        try {
            String id = request.getParameter("classID");
            String deleteExamID = request.getParameter("delExamClassID");
            RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/classDetailOfTeacher.jsp");
            
            LophocDao dao = new LophocDao();
            DethiDao dedao = new DethiDao();
            SinhvienDao svdao = new SinhvienDao();
            
            //Lấy danh sách lớp học của GV
            List<Lophoc> list = dao.listLophocGV(usnameLogined);
            request.setAttribute("listLophoc", list);
            
            if(id == null || id.equals("")) rd.forward(request, response); 
            
            else{
                int classid = Integer.parseInt(id);
                
                //Yêu cầu xóa dề khỏi lớp
                if(deleteExamID != null){
                    int ecID = Integer.parseInt(deleteExamID);
                    DethiLopDao delopdao = new DethiLopDao();
                    DethiLop delop = new DethiLop();
                    delop.setId(ecID);
                    
                    if(delopdao.deleteDethiLop(delop)){
                        KetquaDao kqdao = new KetquaDao();

                        //Xóa dữ liệu bảng kết quả
                        int examID = Integer.parseInt(request.getParameter("examID"));
                        kqdao.deleteKetquaByDethiLop(examID, classid);
                        
                        System.out.println("Da xoa 1 de thi trong lop hoc ");
                        response.sendRedirect("ClassInfor?classID=" + classid);
                        return;
                    }
                }
                
                //lấy thông tin lớp học theo id
                Lophoc lop = dao.findLophocById(classid);
                request.setAttribute("lophoc", lop);
                
                //Lấy ds đề thi theo username giáo viên và id lớp
                DethiLopDao delopdao = new DethiLopDao();
                List<DethiLop> listDe = delopdao.locDethiGVtheoLop(usnameLogined, classid);
                request.setAttribute("listDethi", listDe);
                
                //Lấy ds đề thi theo môn của giáo viên
                List<Dethi> listDe2 = dedao.locDethiGVtheoMon(usnameLogined, lop.getMonhoc().getId());
                request.setAttribute("listDeGV", listDe2);
                
                //Lấy danh sách SV trong lớp
                List<SinhvienLop> listSvLop = svdao.listSvLopByLop(classid);
                request.setAttribute("listSvLop", listSvLop);
                
                rd.forward(request, response);
            }
            
                 
        } catch (Exception e) {
            e.printStackTrace();
        }        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Thêm đề thi vào lớp
        int classid = Integer.parseInt(request.getParameter("classID"));
        int examid = Integer.parseInt(request.getParameter("examID"));
                    
        try {
            DethiLopDao delopdao = new DethiLopDao(); 
            //Kiểm tra Đề thi có trong lớp chưa
            if(delopdao.isExistDethiTrongLop(classid, examid)){
                String mes = "Đề thi này đã có trong lớp";
                request.setAttribute("message", mes);
                
                doGet(request, response);
                return;
            }
        
            Dethi de = new Dethi();
            de.setId(examid);
            
            Lophoc lop = new Lophoc();
            lop.setClassid(classid);
            
            DethiLop delop = new DethiLop();
            delop.setDethi(de);
            delop.setLophoc(lop);
            
            if(delopdao.insertDethiLop(delop))
                System.out.println("Da them 1 de thi vao lop");
            
            //Tạo dữ liệu cho bảng kết quả
            KetquaDao kqDao = new KetquaDao();
            SinhvienDao svdao = new SinhvienDao();
            List<SinhvienLop> listSV = svdao.listSvLopByLop(classid);
            
            if(listSV.size() > 0){
                Dethi dethi = new Dethi();
                dethi.setId(examid);
                
                for(SinhvienLop sv : listSV){
                    Ketqua kq = new Ketqua();
                    kq.setSinhvien(sv.getSinhvien());
                    kq.setDethi(dethi);
                    kq.setLophoc(lop);
                    kq.setCamthi(false);
                    kqDao.insertKetqua(kq);
                }
            }
            
            
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
   
}
