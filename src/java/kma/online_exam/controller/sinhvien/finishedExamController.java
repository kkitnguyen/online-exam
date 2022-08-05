/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.sinhvien;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.dao.DethiDao;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.dao.LichsuthiDao;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lichsuthi;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.Sinhvien;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "finishedExamController", urlPatterns = {"/finishedExam"})
public class finishedExamController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        try {
            int idKQ = Integer.parseInt(request.getParameter("resultID"));
            int examid = Integer.parseInt(request.getParameter("examID"));
            DethiDao dedao = new DethiDao();
        
            //lấy DS câu hỏi để so sánh KQ
            Dethi de = dedao.findDethiById(examid);
            List<Cauhoi> list = dedao.listQuestionOfDethi(examid);
            
            int num = 0;
            
            for(Cauhoi cau : list){ //Đếm số câu trả lời đúng
                String traloi = request.getParameter("cau" + cau.getId());
                if(traloi ==null) continue;
                if(traloi.equals(cau.getDapan())) num++;
            }
            
            double point = (double) (num * 1.0 / list.size()) * 10;
            
            //Làm tròn điểm xuống 1 số thập phân
            point = (double) Math.round(point* 10)/10;
            System.out.println("Diem:" + point);
            
            //Lưu kết quả thi
            try {
                Date now = new Date();
                int timelambai = Integer.parseInt(request.getParameter("timelambai"));
                int classid = Integer.parseInt( request.getParameter("classID"));
                String tenmon = de.getMonhoc().getName();
                
                Sinhvien sv = new Sinhvien();
                sv.setMasv(usnameLogined);
                
                Dethi dethi = new Dethi();
                dethi.setId(examid);
                
                Lophoc lop = new Lophoc();
                lop.setClassid(classid);
                
                //Chèn vào bảng kết quả
                KetquaDao kqDao = new KetquaDao();
                Ketqua kq = new Ketqua();
                kq.setId(idKQ);
                kq.setSinhvien(sv);
                kq.setDethi(dethi);
                kq.setLophoc(lop);
                kq.setNgaythi(now);
                kq.setTglambai(timelambai);
                kq.setDiem(point);
                kq.setCamthi(false);
                kqDao.updateKetqua(kq);
                
                //Chèn vào bảng lích sử thi
                LichsuthiDao lsDao = new LichsuthiDao();
                
                Lichsuthi ls = new Lichsuthi();
                ls.setSinhvien(sv);
                ls.setExamname(de.getName());
                ls.setNgaythi(now);
                ls.setTglambai(timelambai);
                ls.setDiem(point);
                ls.setMon(tenmon);
                lsDao.insertLichsuthi(ls);

            } catch (Exception e) {
                e.printStackTrace();
            }
            
            request.setAttribute("result", point);
            RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/finishedExam.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
