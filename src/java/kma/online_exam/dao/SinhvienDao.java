/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Sinhvien;
import kma.online_exam.models.SinhvienLop;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class SinhvienDao {
    public Sinhvien findSinhvienByMaSV(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            Sinhvien sv = (Sinhvien) ses.load(Sinhvien.class, masv);

            return sv;
        }catch(Exception e){

            throw e;
        }
    }
    
    public List<Sinhvien> listAllSinhvien() throws Exception{
        try {
            Session ses = HibernateUtil.getSessionFactory().openSession();
            String hql = "from Sinhvien";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<SinhvienLop> listSvLopByLop(int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        List<SinhvienLop> list = null;
        try {
            
            String hql = "from SinhvienLop where lophoc.classid = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("id", classid);
            
            list = query.list();

           // return list;
        }catch(Exception e){
            throw e;
        }
        finally{
            //ses.close();
        }
        return list;
    }
    
    public boolean insertSinhvien(Sinhvien sv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(sv);
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
    
    public boolean updateSinhvien(Sinhvien sv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.update(sv);
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
    
    public boolean deleteSinhvienById(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        Query query;
        try{
            trans.begin();
            String hql = "delete from Sinhvien where masv = :masv";
            query = ses.createQuery(hql);
            query.setParameter("masv", masv);
            
            query.executeUpdate();
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
}
