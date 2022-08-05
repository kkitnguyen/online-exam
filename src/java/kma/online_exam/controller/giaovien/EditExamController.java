/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.giaovien;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import kma.online_exam.dao.MonhocDao;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Monhoc;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "EditExamController", urlPatterns = {"/EditExam"})
public class EditExamController extends HttpServlet {

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int examid = Integer.parseInt(request.getParameter("examID"));
            DethiDao dedao = new DethiDao();
            Dethi de = dedao.findDethiById(examid);
            request.setAttribute("de", de);
            
            MonhocDao mhdao = new MonhocDao();
            List<Monhoc> listMon = mhdao.listAllMonhoc();
            request.setAttribute("listMonhoc", listMon);
            
            RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/editExam.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        DethiDao dedao = new DethiDao();
        Dethi dethi = new Dethi();
        
        try {
            int idMon = Integer.parseInt(request.getParameter("idMon"));
            
            int examid = Integer.parseInt(request.getParameter("examID"));
            String examName = request.getParameter("examName");
            int timelambai = Integer.parseInt(request.getParameter("time"));
            String time1 = request.getParameter("starttime");
            String time2 = request.getParameter("endtime");
            boolean type = Boolean.parseBoolean(request.getParameter("type"));
            
            Monhoc mon = new Monhoc();
            mon.setId(idMon);
            Nhanvien gv = new Nhanvien();
            gv.setUsername(usnameLogined);
            
            dethi.setId(examid);
            dethi.setMonhoc(mon);
            dethi.setNhanvien(gv);
            dethi.setName(examName);
            dethi.setTime(timelambai);
            dethi.setType(type);
            
            if(!time1.equals("")){
                Date starttime  = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(time1);
                dethi.setStarttime(starttime);
            }
            if(!time2.equals("")){
                Date endtime  = new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(time2);
            dethi.setEndtime(endtime);
            }
            
            if(dedao.updateDethi(dethi)){
                System.out.println("Da chinh sua 1 de thi");
            }else{
                System.out.println("Chinh sua de thi that bai");
            }
            
            response.sendRedirect("ListExams");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 
}
