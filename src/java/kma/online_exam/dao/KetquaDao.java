/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Ketqua;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class KetquaDao {
    
    public List<Ketqua> listKetquaDethiLop(int examid, int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            String hql = "from Ketqua kq where kq.lophoc.classid = :classid"
                    + " and kq.dethi.id = :examid";
            Query query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            query.setParameter("classid", classid);
            List<Ketqua> list = query.list();

            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public List<Ketqua> listKetquaSV(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            String hql = "from Ketqua kq where kq.sinhvien.masv = :masv";
            Query query = ses.createQuery(hql);
            query.setParameter("masv", masv);
            List<Ketqua> list = query.list();

            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }

    
    public Ketqua findKetquaById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            Ketqua kq = (Ketqua) ses.load(Ketqua.class, id);
            return kq;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
        
    }
    
    public boolean insertKetqua(Ketqua kq) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(kq);
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
    
    public boolean updateKetqua(Ketqua kq) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.update(kq);
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
    
    public boolean deleteKetqua(Ketqua de) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.delete(de);
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
    
    public boolean deleteKetquaByDethiLop(int examid, int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            String hql = "delete from Ketqua where dethi.id = :examid "
                    + "and lophoc.classid = :classid";
            Query query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            query.setParameter("classid", classid);
            
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
    
    public boolean camthi(int id){
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            Ketqua kq = (Ketqua) ses.load(Ketqua.class, id);
            kq.setCamthi(true);
            ses.update(kq);
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
    
    public boolean chothi(int id){
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            Ketqua kq = (Ketqua) ses.load(Ketqua.class, id);
            kq.setCamthi(false);
            ses.update(kq);
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
