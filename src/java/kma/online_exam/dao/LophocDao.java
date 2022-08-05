/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.dao;

import java.util.List;
import kma.online_exam.Utils.HibernateUtil;
import kma.online_exam.models.Dethi;
import kma.online_exam.models.DethiLop;
import kma.online_exam.models.Ketqua;
import kma.online_exam.models.Lophoc;
import kma.online_exam.models.Nhanvien;
import kma.online_exam.models.SinhvienLop;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author KK
 */
public class LophocDao {
    
    public List<Lophoc> listAllLophoc() throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Lophoc";
            Query query = ses.createQuery(hql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
        
    }
    
    public List<Lophoc> listLophocGV(String usernameGV) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Lophoc lop where lop.nhanvien.username = :un";
            Query query = ses.createQuery(hql);
            query.setParameter("un", usernameGV);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public List<Lophoc> listLophocSV(String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "select lop from Lophoc lop, SinhvienLop s "
                    + "where lop.classid = s.lophoc.classid and s.sinhvien.masv = :ma";
            Query query = ses.createQuery(hql);
            query.setParameter("ma", masv);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public Lophoc findLophocById(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            Lophoc lop = (Lophoc) ses.load(Lophoc.class, id);
            return lop;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
        
    }
    
    public List<Lophoc> findLophocByName(String name) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Lophoc where classname like :name";
            Query query = ses.createQuery(hql);
            query.setParameter("name", "%" + name + "%");
            
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally{
            ses.close();
        }
    }
    
    public boolean checkJoin(int classid, String pass){
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try{
            Lophoc lop = (Lophoc) ses.load(Lophoc.class, classid);
            
            try {
                if(!lop.getMatkhau().equals(pass)) return false;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        } finally{
            ses.close();
        }

    }
    
    public boolean insertLophoc(Lophoc lop) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(lop);
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
    
    public boolean insertSvToLophoc(SinhvienLop svlop) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            ses.persist(svlop);
            
            //Tạo dữ liệu cho bảng kết quả
            String hql = "from DethiLop where lophoc.classid = :id";
            Query query = ses.createQuery(hql);

            query.setParameter("id", svlop.getLophoc().getClassid());
            
            List<DethiLop> listDeLop = query.list();
            KetquaDao kqDao = new KetquaDao();

            if(listDeLop.size() > 0){
                for(DethiLop delop : listDeLop){
                    Dethi dethi = new Dethi();
                    dethi.setId(delop.getDethi().getId());

                    Ketqua kq = new Ketqua();
                    kq.setSinhvien(svlop.getSinhvien());
                    kq.setDethi(dethi);
                    kq.setLophoc(svlop.getLophoc());
                    kq.setCamthi(false);
                    kqDao.insertKetqua(kq);
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
    
    public boolean updateSiso(int classid) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            
            String hql = "from SinhvienLop where lophoc.classid = :id";
            Query query = ses.createQuery(hql);

            query.setParameter("id", classid);
            
            List<SinhvienLop> listSvLop = query.list();
            
            Lophoc lop = (Lophoc) ses.load(Lophoc.class, classid);
            lop.setSiso(listSvLop.size());
            ses.update(lop);
            
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
    
    public boolean isExistSvTrongLop(int classid, String masv) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from SinhvienLop svlop where svlop.lophoc.classid = :id"
                    + " and svlop.sinhvien.masv = :masv";
            Query query = ses.createQuery(hql);
            query.setParameter("id", classid);
            query.setParameter("masv", masv);
            List<SinhvienLop> svlop = query.list();
            if(svlop.size() >0) return true;
            return false;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally{
            ses.close();
        }
        
    }
    
    public boolean deleteLophoc(int id) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            Lophoc lop = (Lophoc) ses.load(Lophoc.class, id);
            ses.delete(lop);
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
    
    public boolean addGV(int idLop, String username) throws Exception{
        Session ses = HibernateUtil.getSessionFactory().openSession();
        Transaction trans = ses.getTransaction();
        try{
            trans.begin();
            Lophoc lop = (Lophoc) ses.load(Lophoc.class, idLop);
            Nhanvien gv = new Nhanvien();
            
            gv.setUsername(username);
            lop.setNhanvien(gv);
            
            ses.update(lop);
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
