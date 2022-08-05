package kma.online_exam.models;
// Generated Oct 9, 2020 11:19:13 AM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Ketqua generated by hbm2java
 */
@Entity
@Table(name="ketqua"
    ,catalog="onlineexam"
)
public class Ketqua  implements java.io.Serializable {


     private int id;
     private Dethi dethi;
     private Lophoc lophoc;
     private Sinhvien sinhvien;
     private Date ngaythi;
     private Integer tglambai;
     private Double diem;
     private boolean camthi;

    public Ketqua() {
    }

	
    public Ketqua(int id, Dethi dethi, Lophoc lophoc, Sinhvien sinhvien, boolean camthi) {
        this.id = id;
        this.dethi = dethi;
        this.lophoc = lophoc;
        this.sinhvien = sinhvien;
        this.camthi = camthi;
    }
    public Ketqua(int id, Dethi dethi, Lophoc lophoc, Sinhvien sinhvien, Date ngaythi, Integer tglambai, Double diem, boolean camthi) {
       this.id = id;
       this.dethi = dethi;
       this.lophoc = lophoc;
       this.sinhvien = sinhvien;
       this.ngaythi = ngaythi;
       this.tglambai = tglambai;
       this.diem = diem;
       this.camthi = camthi;
    }
   
     @Id 
     @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="examid", nullable=false)
    public Dethi getDethi() {
        return this.dethi;
    }
    
    public void setDethi(Dethi dethi) {
        this.dethi = dethi;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="classid", nullable=false)
    public Lophoc getLophoc() {
        return this.lophoc;
    }
    
    public void setLophoc(Lophoc lophoc) {
        this.lophoc = lophoc;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="masv", nullable=false)
    public Sinhvien getSinhvien() {
        return this.sinhvien;
    }
    
    public void setSinhvien(Sinhvien sinhvien) {
        this.sinhvien = sinhvien;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="ngaythi", length=16)
    public Date getNgaythi() {
        return this.ngaythi;
    }
    
    public void setNgaythi(Date ngaythi) {
        this.ngaythi = ngaythi;
    }

    
    @Column(name="tglambai")
    public Integer getTglambai() {
        return this.tglambai;
    }
    
    public void setTglambai(Integer tglambai) {
        this.tglambai = tglambai;
    }

    
    @Column(name="diem", precision=53, scale=0)
    public Double getDiem() {
        return this.diem;
    }
    
    public void setDiem(Double diem) {
        this.diem = diem;
    }

    
    @Column(name="camthi", nullable=false)
    public boolean isCamthi() {
        return this.camthi;
    }
    
    public void setCamthi(boolean camthi) {
        this.camthi = camthi;
    }




}


