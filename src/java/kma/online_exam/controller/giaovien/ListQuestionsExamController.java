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
import kma.online_exam.dao.CauhoiDao;
import kma.online_exam.dao.DethiDao;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.DethiCauhoi;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ListQuestionsExamController", urlPatterns = {"/ListQuestionsOfExam"})
public class ListQuestionsExamController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        int examid = Integer.parseInt( request.getParameter("examID"));
        RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/listQuestionsOfExam.jsp");
        try {
            DethiDao dedao = new DethiDao();
            CauhoiDao dao = new CauhoiDao();

            Dethi dethi = dedao.findDethiById(examid);

            //lấy DS câu hỏi theo đề thi
            List<Cauhoi> list = dao.listCauhoiByExamID(examid);

            //Lấy danh sách câu hỏi chưa thêm vào đề
            List<Cauhoi> list2 = dao.listCauhoiGVtheoMonChuaCoTrongDethi(usnameLogined, dethi.getMonhoc().getId(), examid);
            
            request.setAttribute("de", dethi);
            request.setAttribute("mon", dethi.getMonhoc());
            request.setAttribute("listCauhoi", list);
            request.setAttribute("listCauhoi2", list2);
            rd.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int examid = Integer.parseInt(request.getParameter("examID"));
            String action = request.getParameter("action");
            
            CauhoiDao dao = new CauhoiDao();
            if(action.equals("addQuestions")){
                String[] arrS = request.getParameterValues("listCauThem");
                if(arrS != null){
                    Dethi de = new Dethi();
                    de.setId(examid);
                    Cauhoi cau = new Cauhoi();

                    int ok =0;
                    for(String s : arrS){
                        int id = Integer.parseInt(s);
                        cau.setId(id);

                        DethiCauhoi decau = new DethiCauhoi();
                        decau.setCauhoi(cau);
                        decau.setDethi(de);
                        if(dao.insertDethiCauhoi(decau)) ok++;
                    }
                    System.out.println("Da them " + ok + " cau hoi vao de thi");
                }
                else{
                    response.sendRedirect("ListQuestionsOfExam?examID=" + examid);
                    return;
                }
                
            }
            else if(action.equals("RandomQuestions")){
                int easy = Integer.parseInt(request.getParameter("de"));
                int tb = Integer.parseInt(request.getParameter("tb"));
                int kho = Integer.parseInt(request.getParameter("kho"));
                
                if(easy+tb+kho == 0){
                    response.sendRedirect("ListQuestionsOfExam?examID=" + examid);
                    return;
                }
                if(dao.insertRandomQuestions(examid, easy, tb, kho))
                    System.out.println("Them cau hoi ngau nhien thanh cong");
            }
            else if(action.equals("deleteQuestion")){
                int questionID = Integer.parseInt(request.getParameter("questionID"));
                if(dao.deleteDeCauByFKid(examid, questionID)){
                    System.out.println("Da xoa 1 cau hoi khoi de thi");
                    
                }
            }
            else if(action.equals("deleteAllQuestions")){
                if(dao.deleteDeCauByExamID(examid))
                    System.out.println("Da xoa tat ca cau hoi khoi de thi");
            }
            
            DethiDao dedao = new DethiDao();
            if(dedao.updateSLcauDethi(examid))
                System.out.println("Da cap nhat so luong cau hoi cho de thi");;
                
            response.sendRedirect("ListQuestionsOfExam?examID=" + examid);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        
        
    }

}
