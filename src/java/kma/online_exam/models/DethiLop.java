package kma.online_exam.models;
// Generated Oct 9, 2020 11:19:13 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DethiLop generated by hbm2java
 */
@Entity
@Table(name="dethilop"
    ,catalog="onlineexam"
)
public class DethiLop  implements java.io.Serializable {


     private int id;
     private Dethi dethi;
     private Lophoc lophoc;

    public DethiLop() {
    }

    public DethiLop(Dethi dethi, Lophoc lophoc) {
       this.dethi = dethi;
       this.lophoc = lophoc;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="examid")
    public Dethi getDethi() {
        return this.dethi;
    }
    
    public void setDethi(Dethi dethi) {
        this.dethi = dethi;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="classid")
    public Lophoc getLophoc() {
        return this.lophoc;
    }
    
    public void setLophoc(Lophoc lophoc) {
        this.lophoc = lophoc;
    }




}


