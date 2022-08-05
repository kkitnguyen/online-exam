/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.admin;

import antlr.ANTLRTokenTypes;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.MD5EncryptionUtils;
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.dao.UserAccountDao;
import kma.online_exam.models.Sinhvien;

/**
 *
 * @author KK
 */
@WebServlet(name = "AddOrEditStudentController", urlPatterns = {"/AddOrEditStudent"})
public class AddOrEditStudentController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/addOrEditStudent.jsp");
        try {
            String masv = request.getParameter("editStuID");
            if(masv != null){
                SinhvienDao svdao = new SinhvienDao();
                Sinhvien sv = svdao.findSinhvienByMaSV(masv);
                request.setAttribute("sv", sv);
            }
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/hosoSV.jsp");
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
            
            String action = request.getParameter("action");
            if(action.equals("editStudent")){
                sv.setUserid(Integer.parseInt(userid));
                SinhvienDao svdao = new SinhvienDao();
                
                if(svdao.updateSinhvien(sv)){
                    System.out.println("Update thong tin SV thanh cong");
                }else{
                    System.out.println("Update thong tin SV that bai");
                }
            }else if(action.equals("addStudent")){
                String pass = request.getParameter("password");
                MD5EncryptionUtils md5 = new MD5EncryptionUtils();
                pass = md5.getMD5(pass);
                
                UserAccountDao accdao = new UserAccountDao();
                if(accdao.createStudentAccount(sv, pass)){
                    System.out.println("Tao tai khoan SV thanh cong");
                }else{
                    System.out.println("Tao tai khoan SV that bai");
                }
            }
            
            response.sendRedirect("ListStudents");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
