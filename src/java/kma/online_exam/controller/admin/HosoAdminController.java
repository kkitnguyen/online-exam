/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.Utils.UploadFileUtils;
import kma.online_exam.dao.NhanvienDao;
import kma.online_exam.dao.UserAccountDao;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "HosoAdminController", urlPatterns = {"/AdminProfile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class HosoAdminController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/hosoAdmin.jsp");
        try {
            NhanvienDao nvdao = new NhanvienDao();
            Nhanvien nv = nvdao.findNhanvienByUsername(usnameLogined);
            
            request.setAttribute("nv", nv);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        NhanvienDao nvdao = new NhanvienDao();
        try {
            String username = request.getParameter("username");
            String hoten = request.getParameter("hoten");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String khoa = request.getParameter("phong");
            String chucvu = request.getParameter("chucvu");
            String gioithieu = request.getParameter("gioithieu");
            String userid = request.getParameter("userid");
            
            Nhanvien nv = new Nhanvien();
            nv.setUsername(username);
            nv.setHoten(hoten);
            nv.setEmail(email);
            if(!phone.equals("")) nv.setPhone(phone);
            nv.setPhongKhoa(khoa);
            if(!chucvu.equals("")) nv.setChucvu(chucvu);
            if(!gioithieu.equals("")) nv.setGioithieu(gioithieu);
            if(!userid.equals("")) nv.setUserid(Integer.parseInt(userid));
            nv.setLoaitk("ad");
            
            String filename = new UploadFileUtils().UploadAvatarAndRename(request, username);
            nv.setImage(filename);
                
      
            if(nvdao.updateNhanvien(nv)){
                System.out.println("Update thong tin TK thanh cong");
                UserAccount acc = new UserAccountDao().findUserByUsername(username);
                request.getSession().invalidate();
                AppUtils.storeLoginedUser(request.getSession(), acc);
            }else{
                System.out.println("Update thong tin TK that bai");
            }
            
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
