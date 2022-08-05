/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kma.online_exam.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
 
public class SecurityConfig {
 
    public static final String ROLE_SV = "sv";
    public static final String ROLE_GV = "gv";
    public static final String ROLE_AD = "ad";
 
    // String: Role
    // List<String>: urlPatterns.
    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();
 
    static {
        init();
    }
 
    private static void init() {
 
        // Cấu hình cho vai trò Sinh viên
        List<String> urlPatterns1 = new ArrayList<String>();
 
        urlPatterns1.add("/Classes");
        urlPatterns1.add("/JoinToClass");
        urlPatterns1.add("/ExamSchedules");
        urlPatterns1.add("/ExamHistory");
        urlPatterns1.add("/StudentProfile");
        urlPatterns1.add("/finishedExam");
        urlPatterns1.add("/doExam");
 
        mapConfig.put(ROLE_SV, urlPatterns1);
 
        // Cấu hình cho vai trò Giáo viên
        List<String> urlPatterns2 = new ArrayList<String>();
 
        urlPatterns2.add("/Dashboard");
        urlPatterns2.add("/TeacherProfile");
        urlPatterns2.add("/ListClasses");
        urlPatterns2.add("/ClassInfor");
        urlPatterns2.add("/ViewResult");
        urlPatterns2.add("/ExportToExcel");
        urlPatterns2.add("/ListExams");
        urlPatterns2.add("/ListQuestionsOfExam");
        urlPatterns2.add("/AddExam");
        urlPatterns2.add("/EditExam");
        urlPatterns2.add("/ListQuestions");
        urlPatterns2.add("/AddOrEditQuestion");
 
        mapConfig.put(ROLE_GV, urlPatterns2);
        
        // Cấu hình cho vai trò Admin
        List<String> urlPatterns3 = new ArrayList<String>();
 
        urlPatterns3.add("/Dashboard");
        urlPatterns3.add("/AdminProfile");
        urlPatterns3.add("/ClassesManagement");
        urlPatterns3.add("/ClassDetail");
        urlPatterns3.add("/AddTeacherToCLass");
        urlPatterns3.add("/AddStudentsToCLass");
        urlPatterns3.add("/ListStudents");
        urlPatterns3.add("/AddOrEditStudent");
        urlPatterns3.add("/ListTeachers");
        urlPatterns3.add("/AddOrEditTeacher");
 
        mapConfig.put(ROLE_AD, urlPatterns3);
    }
 
    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }
 
    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }
 
}