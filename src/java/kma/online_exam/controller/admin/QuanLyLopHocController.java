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
import kma.online_exam.dao.MonhocDao;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.Monhoc;

/**
 *
 * @author KK
 */
@WebServlet(name = "QuanLyLopHocController", urlPatterns = {"/ClassesManagement"})
public class QuanLyLopHocController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
             //Lấy danh sách môn học
            MonhocDao mhdao = new MonhocDao();
            List<Monhoc> listMon = mhdao.listAllMonhoc();
            request.setAttribute("listMonhoc", listMon);
            
            String name = request.getParameter("searchClass");
            if(name != null){
                //Tìm lớp học
                System.out.println("Tên lớp: " + name);
                LophocDao lopDao = new LophocDao();
                List<Lophoc> listLop = lopDao.findLophocByName(name);

                request.setAttribute("listLophoc", listLop);
                RequestDispatcher rd = request.getRequestDispatcher("views/admin/ListClasses.jsp");
                rd.forward(request, response);
            }
            else{
                //Lấy danh sách lớp học
                LophocDao lopDao = new LophocDao();
                List<Lophoc> listLop = lopDao.listAllLophoc();
                
                request.setAttribute("listLophoc", listLop);
                RequestDispatcher rd = request.getRequestDispatcher("views/admin/ListClasses.jsp");
                rd.forward(request, response);   
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try {
            if(action.equals("addSubject")){
                MonhocDao dao = new MonhocDao();
                String name = request.getParameter("tenMon");
                Monhoc mon = new Monhoc(name);
                
                if(dao.insertMonhoc(mon)){
                    System.out.println("Đã thêm môn học: " +name);
                }else{
                    System.out.println("Thêm môn học thất bại");
                }
                
                doGet(request, response);
            }else if(action.equals("addClass")){
                LophocDao dao = new LophocDao();
                
                //Lấy request
                String name = request.getParameter("className");
                String pass = request.getParameter("matkhau");
                int idMon = Integer.parseInt(request.getParameter("idMon"));
                Monhoc mon = new Monhoc();
                mon.setId(idMon);
                System.out.println(name);
                System.out.println(pass);
                System.out.println(idMon);
                
                //Set thông tin cho lớp học
                Lophoc lop = new Lophoc();
                lop.setClassname(name);
                lop.setMatkhau(pass);
                lop.setMonhoc(mon);
                lop.setSiso(0);
                
                if(dao.insertLophoc(lop)){
                    System.out.println("Đã thêm 1 lớp học: " + name);
                }else{
                    System.out.println("Thêm lớp học thất bại");
                }
                
                doGet(request, response);
            }else{
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
