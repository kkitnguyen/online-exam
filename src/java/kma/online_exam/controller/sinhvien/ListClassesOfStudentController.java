/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.sinhvien;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListClassesOfStudent", urlPatterns = {"/Classes"})
public class ListClassesOfStudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
            
        try {
            LophocDao lopDao = new LophocDao();
            KetquaDao kqdao = new KetquaDao();
            
            //Lấy danh sách lớp học
            List<Lophoc> listLop = lopDao.listLophocSV(usnameLogined);
            request.setAttribute("listLophoc", listLop);
            
            //Lấy ds Kết quả của Sinh viên
            List<Ketqua> listKQ = kqdao.listKetquaSV(usnameLogined);
            request.setAttribute("listKetqua", listKQ);
            
            RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/listClassesOfStudent.jsp");
            rd.forward(request, response);   
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Thêm sinh viên vào lớp 
        doGet(request, response);
    }

}
