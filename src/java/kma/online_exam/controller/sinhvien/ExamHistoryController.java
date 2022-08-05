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
import kma.online_exam.dao.LichsuthiDao;
import kma.online_exam.models.Lichsuthi;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ExamHistoryController", urlPatterns = {"/ExamHistory"})
public class ExamHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        try {
            LichsuthiDao dedao = new LichsuthiDao();
            
            //Lấy danh sách đề thi của SV đang đăng nhập
            List<Lichsuthi> list = dedao.listLichsuthiSV(usnameLogined);
            
            request.setAttribute("listLichsuthi", list);
            RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/lichsuThi.jsp");
            rd.forward(request, response);   
            
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
