/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.Utils;

import java.util.HashMap;
import java.util.Map;
 
import javax.servlet.http.HttpSession;
import kma.online_exam.dao.NhanvienDao;
import kma.online_exam.dao.SinhvienDao;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.Sinhvien;
 
import kma.online_exam.models.UserAccount;
 
public class AppUtils {
 
    private static int REDIRECT_ID = 0;
 
    private static final Map<Integer, String> id_uri_map = new HashMap<Integer, String>();
    private static final Map<String, Integer> uri_id_map = new HashMap<String, Integer>();
 
    // Lưu trữ thông tin người dùng vào Session.
    public static void storeLoginedUser(HttpSession session, UserAccount loginedUser) {
        // Trên JSP có thể truy cập thông qua ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
        
        try { //Lưu profile user vào session
            if(loginedUser != null){
                if(loginedUser.getRole().equals("gv") || loginedUser.getRole().equals("ad")){
                    Nhanvien nv = new NhanvienDao().findNhanvienByUsername(loginedUser.getUsername());
                    session.setAttribute("user", nv);
                }
                if(loginedUser.getRole().equals("sv")){
                    Sinhvien sv = new SinhvienDao().findSinhvienByMaSV(loginedUser.getUsername());
                    session.setAttribute("user", sv);
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }
 
    // Lấy thông tin người dùng lưu trữ trong Session.
    public static UserAccount getLoginedUser(HttpSession session) {
        UserAccount loginedUser = (UserAccount) session.getAttribute("loginedUser");
        return loginedUser;
    }
 
    public static int storeRedirectAfterLoginUrl(HttpSession session, String requestUri) {
        Integer id = uri_id_map.get(requestUri);
 
        if (id == null) {
            id = REDIRECT_ID++;
 
            uri_id_map.put(requestUri, id);
            id_uri_map.put(id, requestUri);
            return id;
        }
 
        return id;
    }
 
    public static String getRedirectAfterLoginUrl(HttpSession session, int redirectId) {
        String url = id_uri_map.get(redirectId);
        if (url != null) {
            return url;
        }
        return null;
    }
 
}