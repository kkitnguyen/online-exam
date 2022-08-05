/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Monhoc;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class MonhocDao {
    
    public List<Monhoc> listAllMonhoc() throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Monhoc";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
        
    }
    
    public Monhoc findMonhocById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            Monhoc entity = (Monhoc) ses.load(Monhoc.class, id);

            return entity;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public boolean insertMonhoc(Monhoc mon) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(mon);
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
