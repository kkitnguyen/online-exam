/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.Sinhvien;
import kma.online_exam.models.UserAccount;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class UserAccountDao {
    
    public UserAccount findUserByUsername(String username){
        try {
            Session ses = HibernateUtil.getSessionFactory().openSession();
            String hql = "from UserAccount where username = :un";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            List<UserAccount> list = query.list();
            if(list.size() > 0) return list.get(0);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public UserAccount findUser(String username, String pass){
        try {
            Session ses = HibernateUtil.getSessionFactory().openSession();
            String hql = "from UserAccount where username = :un"
                    + " and password = :pass";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("pass", pass);
            List<UserAccount> list = query.list();
            if(list.size() > 0) return list.get(0);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean createStudentAccount(Sinhvien sv, String pass) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        UserAccountDao accdao = new UserAccountDao();
        SinhvienDao svdao = new SinhvienDao();
        UserAccount acc = new UserAccount();
        try{
            trans.begin();
            
            //Tạo mới UserAccount
            acc.setUsername(sv.getMasv());
            acc.setPassword(pass);
            acc.setRole("sv");
            
            if(accdao.insertAccount(acc)){ //Lấy userID
                String hql = "from UserAccount where username = :masv";
                Query query = ses.createQuery(hql);
                query.setParameter("masv", sv.getMasv());
                List<UserAccount> list = query.list();
                if(list.size() > 0)
                    acc = list.get(0);
                sv.setUserid(acc.getUserid());
            }
            //Tạo mới Sinh viên
            svdao.insertSinhvien(sv);
                    
            trans.commit();
            return true;
        }catch(Exception e){
            
            e.printStackTrace();
            trans.rollback();
            return false;
        } finally{
            ses.close();
        }
    }
    
     public boolean createTeacherAccount(Nhanvien nv, String pass) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        UserAccountDao accdao = new UserAccountDao();
        NhanvienDao nvdao = new NhanvienDao();
        UserAccount acc = new UserAccount();
        try{
            trans.begin();
            
            //Tạo mới UserAccount
            acc.setUsername(nv.getUsername());
            acc.setPassword(pass);
            acc.setRole("gv");
            
            if(accdao.insertAccount(acc)){ //Lấy userID
                String hql = "from UserAccount where username = :un";
                Query query = ses.createQuery(hql);
                query.setParameter("un", nv.getUsername());
                List<UserAccount> list = query.list();
                if(list.size() > 0)
                    acc = list.get(0);
                nv.setUserid(acc.getUserid());
            }
            //Tạo mới Sinh viên
            nvdao.insertNhanvien(nv);
                    
            trans.commit();
            return true;
        }catch(Exception e){
            
            e.printStackTrace();
            trans.rollback();
            return false;
        } finally{
            ses.close();
        }
    }
    
    public boolean insertAccount(UserAccount acc) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(acc);
            trans.commit();
            return true;
        }catch(Exception e){
            
            e.printStackTrace();
            trans.rollback();
            return false;
        } finally{
            ses.close();
        }
    }
    
    public UserAccount findAccountById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            UserAccount acc = (UserAccount) ses.load(UserAccount.class, id);
            return acc;
        }catch(Exception e){
            e.printStackTrace();
            throw e;
        }
        
    }
    
}
