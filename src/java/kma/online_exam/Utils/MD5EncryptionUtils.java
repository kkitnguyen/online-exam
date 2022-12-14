/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.Utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Dinh Nguyen
 */
public class MD5EncryptionUtils {
    
    public String getMD5(String input) {
        try {
          MessageDigest md = MessageDigest.getInstance("MD5");
          byte[] messageDigest = md.digest(input.getBytes());
            
          return convertByteToHex(messageDigest);
        } catch (NoSuchAlgorithmException e) {
          throw new RuntimeException(e);
        }
      }
    
    public String convertByteToHex(byte[] data) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < data.length; i++) {
          sb.append(Integer.toString((data[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
}
