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
import kma.online_exam.dao.DethiDao;
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.dao.LophocDao;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lophoc;

/**
 *
 * @author KK
 */
@WebServlet(name = "ViewResultController", urlPatterns = {"/ViewResult"})
public class ViewResultController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int classid = Integer.parseInt(request.getParameter("classID"));
            int examid = Integer.parseInt(request.getParameter("examID"));
            String action = request.getParameter("action");
            RequestDispatcher rd = request.getRequestDispatcher("views/giaovien/viewResult.jsp");
            
            KetquaDao dao = new KetquaDao();
            DethiDao dedao = new DethiDao();
            LophocDao lopdao = new LophocDao();
            
            if(action != null){ //Cấm thi hoặc cho thi
                int idKQ = Integer.parseInt(request.getParameter("idKQ"));
                if(action.equals("camthi")){
                    if(dao.camthi(idKQ))
                        System.out.println("Da cam thi 1 sinh vien");
                    else System.out.println("Cam thi that bai");
                }else if(action.equals("chothi")){
                    if(dao.chothi(idKQ))
                        System.out.println("Da bo cam thi 1 sinh vien");
                    else System.out.println("Cho thi that bai");
                }
                response.sendRedirect("ViewResult?classID="+ classid + "&examID="+ examid);
                return;
            }
            //Lấy danh sách kết quả
            List<Ketqua> list = dao.listKetquaDethiLop(examid, classid);
            request.setAttribute("listKetqua", list);
            
            //Lấy thông tin đề thi
            Dethi de = dedao.findDethiById(examid);
            request.setAttribute("dethi", de);
            
            //Lấy thông tin lớp
            Lophoc lop = lopdao.findLophocById(classid);
            request.setAttribute("lophoc", lop);
            
            rd.forward(request, response);
            
                 
        } catch (Exception e) {
            e.printStackTrace();
        }        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
        
    }
   
}
