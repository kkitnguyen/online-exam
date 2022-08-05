<%@page import="kma.online_exam.models.Cauhoi"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- 
    More Templates Visit ==> ProBootstrap.com
    Free Template by ProBootstrap.com under the License Creative Commons 3.0 ==> (probootstrap.com/license)

    IMPORTANT: You can do whatever you want with this template but you need to keep the footer link back to ProBootstrap.com
    -->
    <title>Làm bài trắc nghiệm</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Free HTML5 Website Template by ProBootstrap.com" />
    <meta name="keywords" content="free bootstrap 4, free bootstrap 4 template, free website templates, free html5, free template, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="ProBootstrap.com" />
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet"> -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/open-iconic-bootstrap.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/style-lambaithi/css/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/lambaithi.css">
  
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/jquery.min.js"></script>
  </head>
  <body>

    <c:if test="${message != null}">
      <div class="exam-header" style="margin-top: 50px;">
        <span class="exam-title" style="text-transform: uppercase;">${message}</span>
        <br>
        <br>
        <br>
        <a href="${pageContext.request.contextPath}" class="mb-2 d-block probootstrap-logo"><b>TRANG CHỦ</b></a>
        <br>
        <a href="${pageContext.request.contextPath}/Classes" class="mb-2 d-block probootstrap-logo"><b>LỚP HỌC</b></a>
        <br>
        <a href="${pageContext.request.contextPath}/ExamSchedules" class="mb-2 d-block probootstrap-logo"><b>LỊCH THI</b></a>
      </div>
    </c:if>

    <c:if test="${message == null}">
      <aside class="probootstrap-aside js-probootstrap-aside" style="background-color: rgb(248, 242, 192);">
        <a href="#" class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span class="oi oi-arrow-left"></span> Close</a>
        <div class="probootstrap-site-logo probootstrap-animate" data-animate-effect="fadeInLeft">
          
          <a href="${pageContext.request.contextPath}" class="mb-2 d-block probootstrap-logo"><b>TRANG CHỦ</b></a>
          
          <div class="exam-time">
            <p>Thời gian: ${de.time} phút </p>

            <div class="btn time-remaining">
              <span id="phut">${de.time}</span> :
              <span id="giay">00</span>
            </div>
            
              <button  class="btn btn-nopbai" onclick="checkNopbai()">Nộp bài</button>  

          </div>

        </div>

        <hr>

        <div class="listCauhoi probootstrap-nav probootstrap-animate">
          <% 
              List<Cauhoi> list = (List<Cauhoi>) request.getAttribute("listCauhoi");
              for(int i =1 ; i<= list.size() ; i++){
                  %>
                  <a href="#cau<%= i%>" class="btn choncauhoi" id="choncau<%= i%>"><%= i%></a>
                  <%
              }
          %>
      
        </div>
        <div class="listCauhoi probootstrap-nav probootstrap-animate">
          * Lưu ý: Nếu hết thời gian mà sinh viên chưa ấn nộp bài, hệ thống sẽ tự động nộp bài.
        </div>
        
      </aside>

      <!--Giao diện làm bài thi-->
      <main role="main" class="probootstrap-main js-probootstrap-main">
        <div class="probootstrap-bar">
          <a href="#" class="probootstrap-toggle js-probootstrap-toggle"><span class="oi oi-menu"></span></a>
        </div>

        <div class="exam-header" style="margin-top: 10px;">
          <span class="exam-title" style="text-transform: uppercase;">${de.name}</span>
          <br>
          <span class="exam-infor">
            Môn: ${de.monhoc.name} <br>
          </span>
          <span class="exam-infor">
            Môn: ${lop.classname} <br>
          </span>
          
        </div>
        
        <hr>
        <div id="clickStartOK">
          Click "Start" để bắt đầu làm bài  <br>
          <button class="btn btn-primary" onclick="startExam()">Start</button>
        </div>
        
        <div class="exam-content" style="display: none;" id="exam-content">
          <form action="finishedExam" id="bailam" method ="post" onchange="checkLuachon()">
              
              <%
                  for(int i = 1 ; i<= list.size() ; i++){
                      Cauhoi cau = list.get(i-1);
                      %>
                          <div class="cauhoi" id="cau<%= i %>">
                            <span class="cauhoi-noidung">
                              Câu <%= i %>: <%= cau.getDebai() %>
                            </span>
                            <div class="cauhoi-traloi" >
                              <div>
                                <input type="radio" name ="cau<%= cau.getId()%>" id="cau<%= i %>a" value="A">
                                <label for="cau<%= i %>a"><b>A.</b> <%= cau.getA()%></label>
                              </div>

                              <div>
                                <input type="radio" name ="cau<%= cau.getId()%>" id="cau<%= i%>b" value="B">
                                <label for="cau<%= i %>b"><b>B.</b> <%= cau.getB()%></label> 
                              </div>

                              <div>
                                <input type="radio" name ="cau<%= cau.getId()%>" id="cau<%= i%>c" value="C">
                                <label for="cau<%= i %>c"><b>C.</b> <%= cau.getC()%></label>
                              </div>

                              <div>
                                <input type="radio" name ="cau<%= cau.getId()%>" id="cau<%= i%>d" value="D">
                                <label for="cau<%= i %>d"><b>D.</b> <%= cau.getD()%></label>
                              </div>

                            </div>
                          </div>
                          <hr style="opacity: 0.5; margin: 5px;">
                      <%
                  }
              %>
                  
              <input type="text" name="resultID" value="${idKQ}" hidden>
              <input type="text" name="examID" value="${de.id}" hidden>
              <input type="text" name="timelambai" value="" id="timelambai" hidden>
              <input type="text" name="classID" value="${lop.classid}"  hidden>
          </form>
          <button  class="btn btn-nopbai" onclick="checkNopbai()">Nộp bài</button>
        </div>

      </main>
    
      <!-- Modal Thêm câu hỏi -->
      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirmNopbai" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header" style="justify-content: center;">
              <h4 class="modal-title" id="hoixacnhan">Thêm Câu hỏi vào đề thi </h4>
            </div>

            <div class="modal-footer centered" style="justify-content: center;">
              <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Quay lại</button>
              <button data-toggle="modal" class="btn btn-round btn-theme03" type="submit" onclick="nopbai()">Nộp bài</button>
            </div>
            <!--Form -->
          </div>
        </div>
      </div>
      <!-- modal Thêm câu hỏi -->

      <!--Xử lý javascript trong trang-->
      <script>
          //Thông báo khi thí sinh ấn nộp bài
          function checkNopbai(){
            // Đếm số câu chưa chọn để thông báo
            var notselected = 0;
            var SLcau = <%= list.size()%>;

            for(var i = 1; i<= SLcau; i++){
              var A = document.getElementById("cau" +i+"a").checked;
              var B = document.getElementById("cau" +i+"b").checked;
              var C = document.getElementById("cau" +i+"c").checked;
              var D = document.getElementById("cau" +i+"d").checked;

              if(A == false && B == false && C == false && D == false)
                notselected++;
            }

            if(notselected > 0){
              document.getElementById("hoixacnhan").innerHTML= "Bạn còn " + notselected + " câu chưa lựa chọn. <br> Bạn chắc chắn muốn nộp bài chứ?"
            }else{
              var m = parseInt(document.getElementById("phut").innerHTML);
              if(m == 0) { nopbai();}
              else{
                document.getElementById("hoixacnhan").innerHTML="Bạn còn " + m + " phút làm bài. <br> Bạn chắc chắn muốn nộp bài chứ?";
              }
            }

            $("#confirmNopbai").modal(); //Mở modal confirmNopbai
          }

          //Nộp bài
          function nopbai(){
            var total = ${de.time};
            var m = parseInt(document.getElementById("phut").innerHTML);
            var s = parseInt(document.getElementById("giay").innerHTML);
            
            var time = total*60 - (m*60 +s);
            document.getElementById("timelambai").value = time;
            document.getElementById("bailam").submit();
          }

        //Click nút bắt đầu làm bài thi, đồng hồ bắt đầu đếm ngược

        function startExam(){
          console.log("Bắt đầu làm bài thi");
          document.getElementById("clickStartOK").style.display ="none";
          document.getElementById("exam-content").style.display ="block";

          startDemnguoc();

          function startDemnguoc(){
            var m = null; //phut
            var s = null; //giay
            var timeout = null;
            m = parseInt(document.getElementById("phut").innerHTML);
            s = parseInt(document.getElementById("giay").innerHTML);
            s--;
            if (s === -1){
              m -= 1;
              s = 59;
            }
            if (m === -1){ 
              nopbai();
              return false;
              }

            document.getElementById('phut').innerText = m.toString();
            document.getElementById('giay').innerText = s.toString();

            timeout = setTimeout(function(){
              startDemnguoc();
            }, 1000);
          }
        }

        //Kiểm tra nếu câu nào đã chọn thì câu đó sẽ đổi màu để đánh dấu (danh sách câu bên trái)
        function checkLuachon(){
          var SLcau = <%= list.size()%>;

          for(var i = 1; i<= SLcau; i++){
            var abc =  document.getElementById("choncau" +i).style.background;
            if(document.getElementById("choncau" +i).style.background == "#25c2b7") {continue;}

            var A = document.getElementById("cau" +i+"a").checked;
            var B = document.getElementById("cau" +i+"b").checked;
            var C = document.getElementById("cau" +i+"c").checked;
            var D = document.getElementById("cau" +i+"d").checked;
            if(A == true || B == true || C == true || D == true){
              document.getElementById("choncau" +i).style.background = "#25c2b7";
              document.getElementById("choncau" +i).style.color = "white";
            }
          }
        }
        
      </script>
    </c:if>
    
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/jquery-3.2.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/imagesloaded.pkgd.min.js"></script>

    <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/main.js"></script>
    
    
  </body>
</html>