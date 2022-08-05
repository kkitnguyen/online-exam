
import java.text.SimpleDateFormat;
import java.util.*;
import kma.online_exam.Utils.MD5EncryptionUtils;



public class abc {
    public static void main(String[] args){
        System.out.println(new MD5EncryptionUtils().getMD5("khuongit"));
        
        Date now = new Date();
        String date = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date());
        System.out.println(date);
        
        System.out.print("asááà");
        System.out.print("\t");
        System.out.print("Nguyen Xuan Khuong");
        System.out.print("\t");
        System.out.print("Bac Giang");
        System.out.print("\t");
        System.out.println();
        System.out.print("123");
        System.out.print("\t");
        System.out.print(" Khuong");
        System.out.print("\t");
        System.out.print("Ha Noi");
        System.out.print("\t");
        
    }
  
}
