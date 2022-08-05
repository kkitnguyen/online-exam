/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Nhanvien;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class NhanvienDao {
    public Nhanvien findNhanvienByUsername(String username) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            Nhanvien nv = (Nhanvien) ses.load(Nhanvien.class, username);

            return nv;
        }catch(Exception e){

            throw e;
        }
        
    }
    public List<Nhanvien> listAllGiaovien() throws Exception{
        try {
            Session ses = HibernateUtil.getSessionFactory().openSession();
            String hql = "from Nhanvien where loaitk like 'gv'";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertNhanvien(Nhanvien nv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(nv);
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
    
    public boolean updateNhanvien(Nhanvien nv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.update(nv);
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
