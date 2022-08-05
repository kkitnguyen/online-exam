/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.Monhoc;
import kma.online_exam.models.Nhanvien;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author KK
 */
public class NewClass {
    public static void main(String[] args) throws Exception {
        
        //for(int i =0; i<500 ; i++)
        get(1);
        
        return;
    }
    
    public static void get(int count) throws Exception{
        NewClass dao = new NewClass();
        
        List<Dethi> list = dao.listDethiGV("vana123");
        
        for(Dethi de : list)
            System.out.println(de.getId() + " | " + de.getName());
        
        System.out.println("---------");
        System.out.println("Giao vien: " + list.get(0).getNhanvien().getHoten());
        System.out.println("Giao vien: " + list.get(1).getNhanvien().getHoten());

        System.out.println("---------" + (count+ 1));
    }
    
    public List<Dethi> listDethiGV( String username) throws Exception{
        Session ses;
        try {
            ses = HibernateUtil.getSessionFactory().getCurrentSession();
        } catch (Exception e) {
            System.out.println("Current session isn't exist: " + e.getMessage());
            System.out.println("Current session isn't exist print e: " + e);
            //e.printStackTrace();
            ses = HibernateUtil.getSessionFactory().openSession();
        }
        
        try {
           // ses.getTransaction().begin();
           
           
            String hql = "from Dethi de where de.nhanvien.username = '" + username + "'";
            Query query = ses.createQuery(hql);
            List<Dethi> list = query.list();
            
            //Monhoc mon = list.get(0).getMonhoc();
            //System.out.println("Mon: " + mon.getName());
            
            list.get(0).getNhanvien().getEmail();
            
            
           // ses.getTransaction().commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            ses.getTransaction().rollback();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public static void update(int count){
        DethiDao dedao = new DethiDao();
        Dethi dethi = new Dethi();
        
        Monhoc mon = new Monhoc();
        mon.setId(10);
        Nhanvien gv = new Nhanvien();
        gv.setUsername("vana123");

        dethi.setId(5);
        dethi.setMonhoc(mon);
        dethi.setNhanvien(gv);
        
        dethi.setName("Kiểm tra 15p Toán rời rạc");
        dethi.setTime(15);
        dethi.setType(false);

        dethi.setStarttime(null);

        dethi.setEndtime(null);
        
        try {
            if(dedao.updateDethi(dethi)){
                System.out.println("Update lan: " + count);
            }else{
                System.out.println("Chinh sua de thi that bai");
            }
        } catch (Exception ex) {
            Logger.getLogger(NewClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
