/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.DethiLop;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class DethiLopDao {
    
    public DethiLop findDethiLop(int classid, int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            String hql = "from DethiLop de where de.lophoc.classid = :classid"
                    + " and de.dethi.id = :examid";
            Query query = ses.createQuery(hql);
            query.setParameter("classid", classid);
            query.setParameter("examid", examid);
            List<DethiLop> list = query.list();

            if(list.size() >0) {
                DethiLop dethi = list.get(0);
                return dethi;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            ses.close();
        }
        return null;
    }
    
    public List<DethiLop> listAllDethiLops() throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        List<DethiLop> list = null;
        try{
            String hql = "from DethiLop";
            Query query = ses.createQuery(hql);
            list = query.list();
           // return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ses.close();
        }
        return list;
    }
    
    public boolean insertDethiLop(DethiLop de) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(de);
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
    
    public boolean deleteDethiLop(DethiLop de) throws Exception{
        Session ses = null; 
        ses = HibernateUtil.getSessionFactory().openSession();
 
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
    
     //Lấy ds đề thi theo username giáo viên và lớp
    public List<DethiLop> locDethiGVtheoLop(String username, int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();

        
        List<DethiLop> list = null;
        try{
            String hql = "select de from DethiLop de where de.dethi.nhanvien.username = :un"
                    + " and de.lophoc.classid = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("id", classid);
            list = query.list();

           // return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            ses.close();
        }
        return list;
    }
    
    public boolean isExistDethiTrongLop(int classid, int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from DethiLop delop where delop.dethi.id = :examid"
                    + " and delop.lophoc.classid = :classid";
            Query query = ses.createQuery(hql);
            query.setParameter("classid", classid);
            query.setParameter("examid", examid);
            List<DethiLop> delop = query.list();
            if(delop.size() >0) return true;
            return false;

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            ses.close();
        }
        return false;
        
    }
}
