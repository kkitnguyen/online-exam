/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.SinhvienLop;

/**
 *
 * @author KK
 */
@WebServlet(name = "ClassDetailController", urlPatterns = {"/ClassDetail"})
public class ClassDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String id = request.getParameter("classID");
            RequestDispatcher rd = request.getRequestDispatcher("views/admin/classDetail.jsp");
            LophocDao dao = new LophocDao();
            
            //Lấy danh sách lớp học
            List<Lophoc> list = dao.listAllLophoc();
            request.setAttribute("listLophoc", list);
            
            if(id == null || id.equals("")) rd.forward(request, response); 
            
            else{ //lấy thông tin lớp học theo id
                Lophoc Lop = dao.findLophocById(Integer.parseInt(id));
                request.setAttribute("lophoc", Lop);
                
                //Lấy danh sách SV trong lớp
                List<SinhvienLop> listSvLop = new SinhvienDao().listSvLopByLop(Integer.parseInt(id));
                request.setAttribute("listSvLop", listSvLop);
                
                rd.forward(request, response);
            }
                 
        } catch (Exception e) {
            e.printStackTrace();
        }
                
    }

    
   
}
