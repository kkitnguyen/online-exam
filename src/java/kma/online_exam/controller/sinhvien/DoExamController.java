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
import kma.online_exam.dao.DethiDao;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Ketqua;

/**
 *
 * @author KK
 */
@WebServlet(name = "DoExamController", urlPatterns = {"/doExam"})
public class DoExamController extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idKQ = Integer.parseInt(request.getParameter("resultID"));
        int examid = Integer.parseInt(request.getParameter("examID"));
        DethiDao dedao = new DethiDao();
        KetquaDao kqdao = new KetquaDao();
        RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/doExam.jsp");
        try {
            Dethi de = dedao.findDethiById(examid);
            Ketqua kq = kqdao.findKetquaById(idKQ);
            if(de.isType()==true){
                if(kq.getNgaythi() != null){
                    String message = "Bạn đã làm bài thi này rồi";
                    request.setAttribute("message", message);
                    rd.forward(request, response);
                    return;
                }
            }
            if(de.getStarttime() == null || de.getStarttime().after(new Date())){
                String message = "Bài thi này chưa mở";
                request.setAttribute("message", message);
                rd.forward(request, response);
                return;
            }
            if(de.getEndtime() != null && de.getEndtime().before(new Date())){
                String message = "Đã quá hạn làm bài thi này";
                request.setAttribute("message", message);
                rd.forward(request, response);
                return;
            }
            if(de.getTong() == 0){
                String message = "Bài thi này chưa có câu hỏi nào";
                request.setAttribute("message", message);
                rd.forward(request, response);
                return;
            }
            if(kq.isCamthi() == true){
                String message = "Bạn bị cấm thi bài thi này";
                request.setAttribute("message", message);
                rd.forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            Dethi de = dedao.findDethiById(examid);
            List<Cauhoi> list = dedao.listQuestionRandomOfDethi(examid);
            
            int[] stt = new int[list.size()];
            for(int i : stt){
                stt[i] = i+1;
            }
            
            Ketqua kq = kqdao.findKetquaById(idKQ);
            
            request.setAttribute("lop", kq.getLophoc());
            request.setAttribute("idKQ", idKQ);
            request.setAttribute("listCauhoi", list);
            request.setAttribute("de", de);
            
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
}
