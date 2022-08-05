/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Lichsuthi;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class LichsuthiDao {
    public List<Lichsuthi> listLichsuthiSV(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Lichsuthi ls where ls.sinhvien.masv = '" + masv + "'";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public boolean insertLichsuthi(Lichsuthi ls) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(ls);
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
