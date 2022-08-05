/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.controller.giaovien;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kma.online_exam.Utils.AppUtils;
import kma.online_exam.dao.CauhoiDao;
import kma.online_exam.dao.MonhocDao;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Monhoc;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListQuestionsController", urlPatterns = {"/ListQuestions"})
public class ListQuestionsController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        String id = request.getParameter("subjectID");
        String page = request.getParameter("page");
        
        RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/listQuestions.jsp");
        try {
            MonhocDao mhdao = new MonhocDao();
            List<Monhoc> listMon = mhdao.listAllMonhoc();
            request.setAttribute("listMonhoc", listMon);
            
            CauhoiDao dao = new CauhoiDao();
            if(id == null || id.equals("")){ //Lấy tất cả câu hỏi của GV đang login
                
                if(page == null){
                    List<Cauhoi> list = dao.listCauhoiGVpagination(usnameLogined, 0, 10);
                    request.setAttribute("listCauhoi", list);
                    request.setAttribute("page", 1);
                }else{
                    int position = (Integer.parseInt(page) - 1)*10;
                    List<Cauhoi> list = dao.listCauhoiGVpagination(usnameLogined, position, 10);
                    request.setAttribute("listCauhoi", list);
                    request.setAttribute("page", Integer.parseInt(page));
                }
                //đếm số bản ghi
                int total = dao.countListCauhoiGV(usnameLogined);
                List<Integer> listPages = new ArrayList<Integer>();
                for(int i = 1 ; i<= total/10+1 ; i++){
                    listPages.add(i);
                }
                request.setAttribute("listPages", listPages);
                request.setAttribute("totalPages", total/10 +1);
                
                rd.forward(request, response);
            }
            else{ //Lọc câu hỏi theo môn học
                List<Cauhoi> list = dao.listCauhoiGVtheoMon(usnameLogined, Integer.parseInt(id));
                request.setAttribute("idMon", id);
                request.setAttribute("listCauhoi", list);
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
