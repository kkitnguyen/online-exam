/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.giaovien;

import java.io.IOException;
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
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListExamsController", urlPatterns = {"/ListExams"})
public class ListExamsController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/listExams.jsp");
        DethiDao dao = new DethiDao();
        try {
            String examid = request.getParameter("deleteExamID");
            if(examid != null){
                if(dao.deleteDethiById(Integer.parseInt(examid)))
                    System.out.println("Da xoa 1 de thi");
                else{
                    String message = "Không thể xóa đề thi đã có câu hỏi hoặc đã được thêm vào lớp";
                    request.setAttribute("message", message);
                    System.out.println("Xoa de thi that bai");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            String id = request.getParameter("subjectID");
            MonhocDao mhdao = new MonhocDao();
            List<Monhoc> listMon = mhdao.listAllMonhoc();
            request.setAttribute("listMonhoc", listMon);
            
            if(id == null || id.equals("")){ //Lấy tất cả đề thi của GV đang login
                List<Dethi> list = dao.listDethiGV(usnameLogined);
                request.setAttribute("listDethi", list);
                rd.forward(request, response);
            }
            else{ //Lọc đề thi theo môn học
                List<Dethi> list = dao.locDethiGVtheoMon(usnameLogined, Integer.parseInt(id));
                request.setAttribute("idMon", id);
                request.setAttribute("listDethi", list);
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
