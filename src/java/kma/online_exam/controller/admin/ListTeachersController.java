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
import kma.online_exam.dao.NhanvienDao;
import kma.online_exam.models.Nhanvien;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListTeachersController", urlPatterns = {"/ListTeachers"})
public class ListTeachersController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/quanlygiaovien.jsp");
        NhanvienDao dao = new NhanvienDao();
        try {
            String teaID = request.getParameter("deleteTeaID");
            if(teaID != null){
//                if(dao.)
//                    System.out.println("Da xoa 1 de thi");
//                else System.out.println("Xoa de thi that bai");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            List<Nhanvien> listGV = dao.listAllGiaovien();
            request.setAttribute("listGV", listGV);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
