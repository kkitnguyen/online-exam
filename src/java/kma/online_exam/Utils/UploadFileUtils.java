/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.Utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import kma.online_exam.models.UserAccount;

/**
 *
 * @author KK
 */

public class UploadFileUtils {
    public String UploadAvatarAndRename(HttpServletRequest request, String username){
        try {
           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
           String appPath = request.getServletContext().getRealPath("");
           appPath = appPath.replace('\\', '/');
  
           // Thư mục để save file tải lên.
           String fullSavePath = null;
           if (appPath.endsWith("/")) {
               fullSavePath = appPath + "uploads/images";
           } else {
               fullSavePath = appPath + "/" + "uploads/images";
           }
  
           // Upload
           for (Part part : request.getParts()) {
               String content = part.getHeader("content-disposition");
                if(content.contains("filename")){
                    String ex = extractFileExtension(part);
                    String filename = "avatar" +username +ex;
                    String filePath = fullSavePath + File.separator + filename;
                    System.out.println("Write attachment to file: " + filePath);

                    // Ghi vào file.
                    part.write(filePath);
                    return filename;
                }
           }
  
       } catch (Exception e) {
           e.printStackTrace();
       }
        return "";
    }
    
    public String UploadExcelQuestion(HttpServletRequest request){
        try {
           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
           String appPath = request.getServletContext().getRealPath("");
           appPath = appPath.replace('\\', '/');
  
           // Thư mục để save file tải lên.
           String fullSavePath = null;
           if (appPath.endsWith("/")) {
               fullSavePath = appPath + "uploads/files";
           } else {
               fullSavePath = appPath + "/" + "uploads/files";
           }
            //Luu username giao vien va ngay hien tai vao ten file
            UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());
            String date = new SimpleDateFormat("yyyy-MM-dd-HH-mm").format(new Date());
            String username = loginedUser.getUsername();
            
           // Upload
           for (Part part : request.getParts()) {
               String fileName = extractFileName(part);
               if (fileName != null && fileName.length() > 0) {
                   String filePath = fullSavePath + File.separator + username + "_" + date + "_" + fileName;
                   System.out.println("Write attachment to file: " + filePath);
  
                   // Ghi vào file.
                   part.write(filePath);
                   return filePath;
               }
           }
  
       } catch (Exception e) {
           e.printStackTrace();
       }
        return "";
    }
    
    public void Upload(HttpServletRequest request){
        try {
           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
           String appPath = request.getServletContext().getRealPath("");
           appPath = appPath.replace('\\', '/');
  
           // Thư mục để save file tải lên.
           String fullSavePath = null;
           if (appPath.endsWith("/")) {
               fullSavePath = appPath + "uploads/images";
           } else {
               fullSavePath = appPath + "/" + "uploads/images";
           }
  
           // Upload
           for (Part part : request.getParts()) {
               String fileName = extractFileName(part);
               if (fileName != null && fileName.length() > 0) {
                   String filePath = fullSavePath + File.separator + fileName;
                   System.out.println("Write attachment to file: " + filePath);
  
                   // Ghi vào file.
                   part.write(filePath);
               }
           }
  
       } catch (Exception e) {
           e.printStackTrace();
       }
    }
    
    public String extractFileName(Part part) {
       // form-data; name="file"; filename="C:\file1.zip"
       // form-data; name="file"; filename="C:\Note\file2.zip"
       String contentDisp = part.getHeader("content-disposition");
       String[] items = contentDisp.split(";");
       for (String s : items) {
           if (s.trim().startsWith("filename")) {
               // C:\file1.zip
               // C:\Note\file2.zip
               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
               clientFileName = clientFileName.replace("\\", "/");
               int i = clientFileName.lastIndexOf('/');
               // file1.zip
               // file2.zip
               return clientFileName.substring(i + 1);
           }
       }
       return null;
   }
    public String extractFileExtension(Part part) {
       // form-data; name="file"; filename="C:\file1.zip"
       // form-data; name="file"; filename="C:\Note\file2.zip"
       String contentDisp = part.getHeader("content-disposition");
       contentDisp = contentDisp.substring(contentDisp.lastIndexOf("."), contentDisp.length() -1);
       
       return contentDisp.toLowerCase();
   }
}
