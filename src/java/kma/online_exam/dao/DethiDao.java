/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.DethiCauhoi;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class DethiDao {
    public List<Dethi> listDethiGV( String username) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Dethi de where de.nhanvien.username = '" + username + "'";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            ses.close();
        }
    }
    
    //Lấy ds đề thi theo username giáo viên và lớp
    public List<Dethi> locDethiGVtheoLop(String username, int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        List<Dethi> list = null;
        try{
            String hql = "select de from Dethi de, DethiLop delop where de.nhanvien.username = :un"
                    + " and delop.lophoc.classid = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("id", classid);
            list = query.list();

           // return list;
        }catch(Exception e){
            e.printStackTrace();
        } finally{
           ses.close();
        }
        return list;
    }
    
    
    public List<Dethi> locDethiGVtheoMon(String username, int idMon) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "from Dethi de where de.nhanvien.username = :un"
                    + " and de.monhoc.id = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("id", idMon);
            List<Dethi> list = query.list();

            return list;
        }catch(Exception e){
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Dethi> listDethiSV(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "select de from Dethi de, DethiLop delop, SinhvienLop s "
                    + "where de.id = delop.dethi.id "
                    + "and delop.lophoc.classid = s.lophoc.classid"
                    + " and s.sinhvien.masv = :masv";
            Query query = ses.createQuery(hql);
            query.setParameter("masv", masv);
            List<Dethi> list = query.list();
            
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public Dethi findDethiById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            Dethi de = (Dethi) ses.load(Dethi.class, id);
            return de;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listQuestionOfDethi(int idExam) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "select c from Cauhoi c, DethiCauhoi de "
                    + "where de.dethi.id = :id and de.cauhoi.id = c.id";
            Query query = ses.createQuery(hql);
            query.setParameter("id", idExam);
            List<Cauhoi> list = query.list();

            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listQuestionRandomOfDethi(int idExam) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            String hql = "select c from Cauhoi c, DethiCauhoi de "
                    + "where de.dethi.id = :id and de.cauhoi.id = c.id";
            Query query = ses.createQuery(hql);
            query.setParameter("id", idExam);
            
            List<Cauhoi> list = query.list(); //List câu hỏi gốc
            //Khởi tạo list mới chứa các câu hỏi được xáo trộn
            List<Cauhoi> listRandom = new ArrayList<>(); 
  
            Random random = new Random();
            int randNum; 
            Cauhoi cau;
            while(list.size() > 0){
                randNum = random.nextInt(list.size()); //Tạo số ngẫu nhiên
                
                cau = list.get(randNum); // Lấy câu hỏi bất kỳ trong list gốc
                listRandom.add(cau);     // Thêm câu vào list mới
                list.remove(randNum);    // Xóa câu hỏi đã lấy khỏi list
            }
            return listRandom;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            ses.close();
        } 
    }
    
    public boolean insertDethi(Dethi de) throws Exception{
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
    
    public boolean updateDethi(Dethi de) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.update(de);
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
    
    public boolean updateSLcauDethi(int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            String hql = "from DethiCauhoi where dethi.id = :examid";
            Query query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            List<DethiCauhoi> list = query.list();
            
            int de = 0;
            int tb = 0;
            int kho = 0;
            int tong = list.size();

            for(DethiCauhoi decau : list){
                if(decau.getCauhoi().getDokho().equals("de")) de++;
                else if(decau.getCauhoi().getDokho().equals("tb")) tb++;
                else if(decau.getCauhoi().getDokho().equals("kho")) kho++;
            }
            Dethi dethi = (Dethi) ses.load(Dethi.class, examid);
            dethi.setTong(tong);
            dethi.setDe(de);
            dethi.setTb(tb);
            dethi.setKho(kho);
            
            ses.update(dethi);
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
    
    public boolean deleteDethiById(int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        Query query;
        try{
            trans.begin();
            String hql = "delete from Dethi where id = :examid";
            query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            
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
