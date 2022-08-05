/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.Utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kma.online_exam.models.Cauhoi;
import kma.online_exam.models.Monhoc;
import kma.online_exam.models.Nhanvien;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;

/**
 *
 * @author Dinh Nguyen
 */
public class ReadExcelUtils {

    public List<Cauhoi> readListQuestions(int idMon, String username, String filepath) throws FileNotFoundException, IOException {
        List<Cauhoi> list = new ArrayList<Cauhoi>();
        try {
            // Đọc một file XSL.
            FileInputStream inputStream = new FileInputStream(new File(filepath));

            // Đối tượng workbook cho file XSL.
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);

            // Lấy ra sheet đầu tiên từ workbook
            HSSFSheet sheet = workbook.getSheetAt(0);

            // Lấy ra Iterator cho tất cả các dòng của sheet hiện tại.
            Iterator<Row> rowIterator = sheet.iterator();
            
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();

                if (row.getRowNum() == 0) {
                    // Bỏ qua dòng tiêu đề
                    continue;
                }
                // Lấy Iterator cho tất cả các cell của dòng hiện tại.
                Iterator<Cell> cellIterator = row.cellIterator();

                Cauhoi cau = new Cauhoi();
                Monhoc mon = new Monhoc();      mon.setId(idMon); 
                cau.setMonhoc(mon);
                Nhanvien nv = new Nhanvien();   nv.setUsername(username);
                cau.setNhanvien(nv);
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();

                    int columnIndex = cell.getColumnIndex();
                    // Đổi thành getCellType() nếu sử dụng POI 4.x
                    CellType cellType = cell.getCellType();

                    switch (columnIndex) {
                        case 0:
                            String mucdo = cell.getStringCellValue().trim().toLowerCase();
                            if (mucdo.equals("de") || mucdo.equals("tb") || mucdo.equals("kho"))
                                cau.setDokho(mucdo);
                            else return null;
                            break;
                        case 1:
                            String debai = cell.getStringCellValue();
                            cau.setDebai(debai);
                            break;
                        case 2:
                            String A;
                            if (cellType == CellType.NUMERIC) {
                                A = cell.getNumericCellValue() + "";
                                if(A.substring(A.length()-2).equals(".0"))
                                    A = A.substring(0, A.length() -2);
                            } else {
                                A = cell.getStringCellValue();
                            }
                            cau.setA(A);
                            break;
                        case 3:
                            String B;
                            if (cellType == CellType.NUMERIC) {
                                B = cell.getNumericCellValue() + "";
                                if(B.substring(B.length()-2).equals(".0"))
                                    B = B.substring(0, B.length() -2);
                            } else {
                                B = cell.getStringCellValue();
                            }
                            cau.setB(B);
                            break;
                        case 4:
                            String C;
                            if (cellType == CellType.NUMERIC) {
                                C = cell.getNumericCellValue() + "";
                                if(C.substring(C.length()-2).equals(".0"))
                                    C = C.substring(0, C.length() -2);
                            } else {
                                C = cell.getStringCellValue();
                            }
                            cau.setC(C);
                            break;
                        case 5:
                            String D;
                            if (cellType == CellType.NUMERIC) {
                                D = cell.getNumericCellValue() + "";
                                if(D.substring(D.length()-2).equals(".0"))
                                    D = D.substring(0, D.length() -2);
                            } else {
                                D = cell.getStringCellValue();
                            }
                            cau.setD(D);
                            break;
                        case 6:
                            String dapan = cell.getStringCellValue().trim().toUpperCase();
                            if(dapan.equals("A") || dapan.equals("B") || dapan.equals("C") || dapan.equals("D"))
                                cau.setDapan(dapan);
                            else return null;
                            
                            break;
                        default:
                            break;
                    }
                }
                list.add(cau);
            }
            
            return list;
        } catch (Exception e) {
            System.out.println("Loi doc file excel!");
            return null;
        }
    }
}
