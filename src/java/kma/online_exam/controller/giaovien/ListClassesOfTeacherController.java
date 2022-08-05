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
import kma.online_exam.dao.LophocDao;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListClassesOfTeacher", urlPatterns = {"/ListClasses"})
public class ListClassesOfTeacherController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        try {
            String name = request.getParameter("searchClass");
            LophocDao lopDao = new LophocDao();
            if(name != null){
                //Tìm lớp học
                List<Lophoc> listLop = lopDao.findLophocByName(name);

                //Lọc ra lớp của giáo viên đang đăng nhập
                for(int i = 0 ; i<listLop.size() ; i++){ 
                    Lophoc lop = listLop.get(i);
                    if(lop.getNhanvien() == null) listLop.remove(lop);
                    else if(!lop.getNhanvien().getUsername().equals(usnameLogined)) listLop.remove(lop);
                }
                
                request.setAttribute("listLophoc", listLop);
                RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/listClassesOfTeacher.jsp");
                rd.forward(request, response);
            }
            else{
                //Lấy danh sách lớp học
                List<Lophoc> listLop = lopDao.listAllLophoc();
                
                //Lọc ra lớp của giáo viên đang đăng nhập
                for(int i = 0 ; i<listLop.size() ; i++){ 
                    Lophoc lop = listLop.get(i);
                    if(lop.getNhanvien() == null) {
                        listLop.remove(lop);
                        i--;
                    }
                    else if(!lop.getNhanvien().getUsername().equals(usnameLogined)){
                        listLop.remove(lop);
                        i--;
                    }
                }
                
                request.setAttribute("listLophoc", listLop);
                RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/listClassesOfTeacher.jsp");
                rd.forward(request, response);   
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
