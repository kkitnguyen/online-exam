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
public class CauhoiDao {
    
    public boolean insertListCauhoi(List<Cauhoi> list){
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            for(Cauhoi cau : list) ses.persist(cau);
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
    public int countListCauhoiGV( String username) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Cauhoi c where c.nhanvien.username = '" + username + "'";
            Query query = ses.createQuery(hql);
            return query.list().size();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listCauhoiGVpagination(String username, int position, int pageSize) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Cauhoi c where c.nhanvien.username = '" + username + "'";
            Query query = ses.createQuery(hql);
            
            query.setFirstResult(position);
            query.setMaxResults(pageSize);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listCauhoiGV( String username) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Cauhoi c where c.nhanvien.username = '" + username + "'";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listCauhoiByExamID(int examid) throws Exception{
        CauhoiDao dao = new CauhoiDao();
        try{
            //trung gian
            List<DethiCauhoi> list1 = dao.listDethiCauhoiDethi(examid); //Lấy ds Đề thi Câu hỏi theo id đề thi
            
            //lấy DS câu hỏi theo đề thi
            List<Cauhoi> list = new ArrayList<Cauhoi>();
            int id;
            for(DethiCauhoi dc : list1){
                id = dc.getCauhoi().getId();
                list.add(dao.findCauhoiById(id));
            }

            return list;
        }catch(Exception e){
            return null;
        } 
    }
    
    public List<Cauhoi> listCauhoiGVtheoMon(String username, int idMon) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "from Cauhoi c where c.nhanvien.username = :un"
                    + " and c.monhoc.id = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("id", idMon);
            List<Cauhoi> list = query.list();

            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listCauhoiGVtheoMonChuaCoTrongDethi(String username, int idMon, int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Query query;
        try{
            String hql = "from Cauhoi c where c.nhanvien.username = :un"
                    + " and c.monhoc.id = :id";
            query = ses.createQuery(hql);
            query.setParameter("un", username);
            query.setParameter("id", idMon);
            List<Cauhoi> list1 = query.list(); //Lấy DS câu hỏi GV theo môn
            
            CauhoiDao dao = new CauhoiDao();
            List<DethiCauhoi> list2 = dao.listDethiCauhoiDethi(examid); //Lấy ds Đề thi Câu hỏi theo id đề thi
            
            List<Cauhoi> listResult = new ArrayList<Cauhoi>(); //List chứa câu hỏi ko có trong đề
            
            for(Cauhoi cau : list1){
                boolean exist = false;
                for(DethiCauhoi de : list2){
                    if(de.getCauhoi().getId() == cau.getId()) exist = true;
                }
                if(!exist) listResult.add(cau);  //Nếu câu chưa có trong đề thì add câu vào list kết quả
            }
            
            return listResult;
        }catch(Exception e){
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Cauhoi> listCauhoiDethi(int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Cauhoi c inner join DethiCauhoi dc with  dc.dethi.id = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("id", examid);
            
            List<Object[]> listResult = query.list();
            List<Cauhoi> list = new ArrayList<>();
            for (Object[] aRow : listResult) {
                Cauhoi cau = (Cauhoi) aRow[0];
                list.add(cau);
               // DethiCauhoi de = (DethiCauhoi) aRow[1];
            }
            
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<DethiCauhoi> listDethiCauhoiDethi(int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from DethiCauhoi dc where dc.dethi.id = :id";
            Query query = ses.createQuery(hql);
            query.setParameter("id", examid);
            
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public Cauhoi findCauhoiById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        
        try{
            Cauhoi cau = (Cauhoi) ses.load(Cauhoi.class, id);
            return cau;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
        
    }
    
    public boolean insertCauhoi(Cauhoi cau) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(cau);
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
    
    public boolean updateCauhoi(Cauhoi cau) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.update(cau);
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
    
    public boolean deleteCauhoi(Cauhoi cau) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.delete(cau);
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
    
    public boolean insertDethiCauhoi(DethiCauhoi cau) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(cau);
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
    
    
    public boolean insertRandomQuestions(int examid, int de, int tb, int kho) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        Random rand = new Random();
        try{
            trans.begin();
            Dethi dethi = (Dethi) ses.load(Dethi.class, examid);
            
            List<Cauhoi> list = listCauhoiGVtheoMonChuaCoTrongDethi(dethi.getNhanvien().getUsername(), dethi.getMonhoc().getId(), examid);
            
            int i = 0;
            for(Cauhoi cau : list){
                DethiCauhoi decau = new DethiCauhoi();
                if(i==de) break;
                if(cau.getDokho().equals("de")){
                    decau.setCauhoi(cau);
                    decau.setDethi(dethi);
                    ses.persist(decau);
                    i++;
                }
            }
            i = 0;
            for(Cauhoi cau : list){
                DethiCauhoi decau = new DethiCauhoi();
                if(i==tb) break;
                if(cau.getDokho().equals("tb")){
                    decau.setCauhoi(cau);
                    decau.setDethi(dethi);
                    ses.persist(decau);
                    i++;
                }
            }
            i = 0;
            for(Cauhoi cau : list){
                DethiCauhoi decau = new DethiCauhoi();
                if(i==kho) break;
                if(cau.getDokho().equals("kho")){
                    decau.setCauhoi(cau);
                    decau.setDethi(dethi);
                    ses.persist(decau);
                    i++;
                }
            }
            
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
    
    public boolean deleteDeCauByFKid(int examid, int questionid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            String hql = "delete from DethiCauhoi where dethi.id = :examid "
                    + "and cauhoi.id = :questionid";
            Query query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            query.setParameter("questionid", questionid);
            
            query.executeUpdate();
            trans.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally{
            ses.close();
        }
        return false;
    }
    
    public boolean deleteDeCauByExamID(int examid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            String hql = "delete from DethiCauhoi where dethi.id = :examid";
            Query query = ses.createQuery(hql);
            query.setParameter("examid", examid);
            
            int deletedRow = query.executeUpdate();
            if(deletedRow > 0)
                System.out.println("Deleted " + deletedRow + " rows");
            trans.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally{
            ses.close();
        }
        return false;
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
}
