/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.Utils.MD5EncryptionUtils;
import kma.online_exam.dao.UserAccountDao;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            
            RequestDispatcher rd = request.getRequestDispatcher("views/login.jsp");
            rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userName = request.getParameter("username");
        System.out.println(userName);
        String password = request.getParameter("password");
        password = new MD5EncryptionUtils().getMD5(password);
        UserAccount userAccount = new UserAccountDao().findUser(userName, password);
 
        if (userAccount == null) {
            String errorMessage = "Sai tên đăng nhập hoặc mật khẩu";
 
            request.setAttribute("errorMessage", errorMessage);
 
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/views/login.jsp");
 
            dispatcher.forward(request, response);
            return;
        }
 
        AppUtils.storeLoginedUser(request.getSession(), userAccount);
 
        // 
        int redirectId = -1;
        try {
            redirectId = Integer.parseInt(request.getParameter("redirectId"));
        } catch (Exception e) {
        }
        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            response.sendRedirect(requestUri);
        } else {
            // Mặc định sau khi đăng nhập thành công
            // chuyển hướng về trang /userInfo
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

}
