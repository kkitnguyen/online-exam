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
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.models.Sinhvien;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListStudentsController", urlPatterns = {"/ListStudents"})
public class ListStudentsController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/quanlyhocsinh.jsp");
        SinhvienDao dao = new SinhvienDao();
        try {
            String stuID = request.getParameter("deleteStuID");
            if(stuID != null){
//                if(dao.)
//                    System.out.println("Da xoa 1 de thi");
//                else System.out.println("Xoa de thi that bai");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            List<Sinhvien> listsv = dao.listAllSinhvien();
            request.setAttribute("listSV", listsv);
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
