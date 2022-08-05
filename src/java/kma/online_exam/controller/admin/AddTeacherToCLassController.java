/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.dao.NhanvienDao;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.Nhanvien;

/**
 *
 * @author KK
 */
@WebServlet(name = "AddTeacherToCLassController", urlPatterns = {"/AddTeacherToCLass"})
public class AddTeacherToCLassController extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("classID");
            LophocDao dao = new LophocDao();
            if(id==null){
                //Lấy danh sách lớp học
                List<Lophoc> listLop = dao.listAllLophoc();
                request.setAttribute("listLophoc", listLop);
                
                RequestDispatcher rd = request.getRequestDispatcher("views/admin/addTeacherToClass.jsp");
                rd.forward(request, response);
            }else{
                Lophoc lop = dao.findLophocById(Integer.parseInt(id));
                
                if(lop.getNhanvien() != null){ //kiểm tra lớp đã có giáo viên hay chưa
                    List<Lophoc> listLop = dao.listAllLophoc();
                    request.setAttribute("listLophoc", listLop);
                    request.setAttribute("message", "Lớp " + lop.getClassname() +" đã có giáo viên.");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("views/admin/addTeacherToClass.jsp");
                    rd.forward(request, response);
                }else{
                    request.setAttribute("lophoc", lop);
                    NhanvienDao dao2 = new NhanvienDao();
                    List<Nhanvien> gv = dao2.listAllGiaovien();
                    request.setAttribute("listGV", gv);

                    RequestDispatcher rd = request.getRequestDispatcher("views/admin/addTeacherToClass.jsp");
                    rd.forward(request, response);
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int classID = Integer.parseInt(request.getParameter("classID"));
        String usernameGV = request.getParameter("usernameGV");
        try {
            LophocDao dao = new LophocDao();
            if(dao.addGV(classID, usernameGV)){
                System.out.println("Them GV vao lop thanh cong");
                
                List<Lophoc> listLop = dao.listAllLophoc();
                request.setAttribute("listLophoc", listLop);
                request.setAttribute("success", "Thêm giáo viên vào lớp thành công");
                
                RequestDispatcher rd = request.getRequestDispatcher("views/admin/addTeacherToClass.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
