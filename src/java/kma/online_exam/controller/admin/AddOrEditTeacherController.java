/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.MD5EncryptionUtils;
import kma.online_exam.dao.NhanvienDao;
import kma.online_exam.dao.UserAccountDao;
import kma.online_exam.models.Nhanvien;

/**
 *
 * @author KK
 */
@WebServlet(name = "AddOrEditTeacherController", urlPatterns = {"/AddOrEditTeacher"})
public class AddOrEditTeacherController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/addOrEditTeacher.jsp");
        try {
            String username = request.getParameter("editTeaID");
            if(username != null){
                NhanvienDao gvdao = new NhanvienDao();
                Nhanvien gv = gvdao.findNhanvienByUsername(username);
                request.setAttribute("gv", gv);
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

        try {
            String username = request.getParameter("username");
            String hoten = request.getParameter("hoten");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String khoa = request.getParameter("khoa");
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
            nv.setLoaitk("gv");
            
            String action = request.getParameter("action");
            if(action.equals("editTeacher")){
                nv.setUserid(Integer.parseInt(userid));
                NhanvienDao nvdao = new NhanvienDao();
                
                if(nvdao.updateNhanvien(nv)){
                    System.out.println("Update thong tin GV thanh cong");
                }else{
                    System.out.println("Update thong tin GV that bai");
                }
            }else if(action.equals("addTeacher")){
                String pass = request.getParameter("password");
                MD5EncryptionUtils md5 = new MD5EncryptionUtils();
                pass = md5.getMD5(pass);
                
                UserAccountDao accdao = new UserAccountDao();
                if(accdao.createTeacherAccount(nv, pass)){
                    System.out.println("Tao tai khoan GV thanh cong");
                }else{
                    System.out.println("Tao tai khoan GV that bai");
                }
            }
            
            response.sendRedirect("ListTeachers");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
