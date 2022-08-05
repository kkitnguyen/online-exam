/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.sinhvien;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.Utils.UploadFileUtils;
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.dao.UserAccountDao;
import kma.online_exam.models.Sinhvien;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "HosoSinhvienController", urlPatterns = {"/StudentProfile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
       maxFileSize = 1024 * 1024 * 10, // 10MB
       maxRequestSize = 1024 * 1024 * 50) // 50MB
public class HosoSinhvienController extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/hosoSV.jsp");
        try {
            SinhvienDao svdao = new SinhvienDao();
            Sinhvien sv = svdao.findSinhvienByMaSV(usnameLogined);
            
            request.setAttribute("sv", sv);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        SinhvienDao svdao = new SinhvienDao();
        try {
            String masv = request.getParameter("masv");
            String hoten = request.getParameter("hoten");
            String ngaysinh = request.getParameter("ngaysinh");
            String gioitinh = request.getParameter("gioitinh");
            String cmnd = request.getParameter("cmnd");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String quequan = request.getParameter("quequan");
            String userid = request.getParameter("userid");
            
            Date ngsinh  = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);
            System.out.println(ngaysinh);
            System.out.println(ngsinh);
            
            Sinhvien sv = new Sinhvien();
            sv.setMasv(masv);
            sv.setHoten(hoten);
            sv.setNgaysinh(ngsinh);
            if(gioitinh.equals("nam")) sv.setGioitinh(true);
            if(gioitinh.equals("nu")) sv.setGioitinh(false);
            sv.setCmnd(Integer.parseInt(cmnd));
            sv.setEmail(email);
            sv.setPhone(phone);
            sv.setQuequan(quequan);
            sv.setUserid(Integer.parseInt(userid));
            
            String filename = new UploadFileUtils().UploadAvatarAndRename(request, masv);
            sv.setImage(filename);
      
            if(svdao.updateSinhvien(sv)){
                System.out.println("Update thong tin SV thanh cong");
                UserAccount acc = new UserAccountDao().findUserByUsername(masv);
                request.getSession().invalidate();
                AppUtils.storeLoginedUser(request.getSession(), acc);
            }else{
                System.out.println("Update thong tin SV that bai");
            }
            
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
