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
import kma.online_exam.dao.KetquaDao;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */
@WebServlet(name = "ExamSchedulesController", urlPatterns = {"/ExamSchedules"})
public class ExamSchedulesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
        String usnameLogined = "";
        if(loginedUser != null) usnameLogined = loginedUser.getUsername();
        
        try {
            KetquaDao kqdao = new KetquaDao();
            
            //Lấy danh sách đề thi của SV đang đăng nhập (thông qua bảng Kết quả)
            List<Ketqua> listKQ = kqdao.listKetquaSV(usnameLogined);
            
            
            // Lọc bỏ đề thi ko có thời gian bắt đầu hoặc quá hạn
            Date now = new Date();
            
            for(int i = 0 ; i<listKQ.size() ; i++){
                Ketqua kq = listKQ.get(i);
                if(kq.getDethi().getStarttime() == null) {
                    listKQ.remove(kq);
                    i--;
                }
                else if(kq.getDethi().getEndtime().before(now)){
                    listKQ.remove(kq);
                    i--;
                }
            }
            request.setAttribute("listKetqua", listKQ);
            RequestDispatcher rd = request.getRequestDispatcher("views/sinhvien/lichthiSV.jsp");
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
