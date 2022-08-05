<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Quản lý đề thi</title>

  <!-- Favicons -->
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/common/style-quanly/img/favicon.png"/>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style-responsive.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/common/style-lambaithi/js/jquery.min.js"></script>
  
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="MENU"></div>
      </div>
      <!--logo start-->
      <a href="${pageContext.request.contextPath}" class="logo"><b>Online<span>Exam</span></b></a>
      <!--logo end-->
      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered">
            <a href="TeacherProfile">
              <c:if test="${user.image == null || user.image ==''}">
                <img src="uploads/images/default_avatar.png" class="img-circle" width="80" height="80" style="object-fit: cover;">
              </c:if>
              <c:if test="${user.image != null && user.image !=''}">
                <img src="uploads/images/${user.image}" class="img-circle" width="80" height="80" style="object-fit: cover;">
              </c:if>
            </a>
          </p>
          <h5 class="centered">${user.hoten}</h5>
          <li>
            <a href="Dashboard">
              <i class="fa fa-windows"></i>
              <span>DASHBOARD</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fa fa-bell-o"></i>
              <span>THÔNG BÁO</span>
              </a>
          </li>
          <li>
            <a href="TeacherProfile">
              <i class="fa fa-user"></i>
              <span>HỒ SƠ CÁ NHÂN</span>
              </a>
          </li>

          <li class="sub-menu">
            <a  href="javascript:;">
              <i class="fa fa-th-large"></i>
              <span>LỚP HỌC</span>
              </a>
            <ul class="sub">
              <li><a href="${pageContext.request.contextPath}/ListClasses">Danh sách lớp học</a></li>
              <li><a href="${pageContext.request.contextPath}/ClassInfor">Thông tin lớp học</a></li>
            </ul>
          </li>

          <li>
            <a class="active" href="ListExams">
              <i class="fa fa-file-text"></i>
              <span>QUẢN LÝ ĐỀ THI</span>
              </a>
          </li>

          <li>
            <a href="ListQuestions">
              <i class="fa fa-list-ul"></i>
              <span>NGÂN HÀNG CÂU HỎI</span>
              </a>
          </li>

          

        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    
    <section id="main-content">
      <section class="wrapper site-min-height">
        <!-- row -->
        <div class="row mt">
          <!-- /col-md-12 -->
          <div class="col-md-12">
            <a  href="AddExam" class="btn btn-theme start">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Tạo đề thi</span>
            </a>
            <br> <br>

            <div class="content-panel">

              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    DANH SÁCH ĐỀ THI
                    <form action="ListClasses" class="pull-right mail-src-position">
                      <div class="input-append">
                        <input type="text" name="searchClass" class="form-control " placeholder="Search Question">
                      </div>
                    </form>
                </h4>
              </header>

              <div class="col-md-12">
                <form action="ListExams" class="form-horizontal style-form" id="chooseClass">
                  <div class="form-group">
                    <div class="col-md-3 col-xs-11">
                      <!--Xử lý submit form tìm câu hỏi theo môn-->
                      <script>
                        function change(){
                            document.getElementById("chooseClass").submit();
                        }
                      </script>
                      <select name="subjectID" id="" class="form-control" onchange="change()">
                        <option value="">--- Chọn môn ---</option>
                        <c:forEach items="${listMonhoc}" var="mon">
                          <option value="${mon.id}" <c:if test="${mon.id == idMon}">selected</c:if>>${mon.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>
                </form>
              </div>

              <table class="table table-striped table-advance table-hover">
                
                <thead>
                  <tr>
                    <th> Mã đề</th>
                    <th> Tên đề</th>
                    <th> Môn học</th>
                    <th> Loại đề</th>
                    <th> Số câu hỏi</th>
                    <th> TG làm bài</th>
                    <th> TG mở đề</th>
                    <th> TG đóng đề</th>
                    <th> Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${listDethi}" var="de">
                    <tr>
                      <td> &nbsp;&nbsp;&nbsp; ${de.id} </td>
                      <td>${de.name} </td>
                      <td>${de.monhoc.name} </td>
                      <td>
                        <c:if test="${de.type == true}">Chính thức</c:if>
                        <c:if test="${de.type == false}">Thi thử</c:if>
                      </td>
                      <td><span class="label label-info label-mini">${de.tong} </span></td>
                      <td>${de.time} phút </td>
                      <td name="starttime">${de.starttime}</td>
                      <td name="endtime">${de.endtime}</td>
                      <td style="vertical-align: middle;">
                        <a href="ListQuestionsOfExam?examID=${de.id} "><button class="btn btn-success btn-xs"> DS câu hỏi</button></a>
                        <a href="EditExam?examID=${de.id}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                        <a href="ListExams?deleteExamID=${de.id}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
                      </td>
                    </tr>
                  </c:forEach>
                  
                </tbody>
              </table>
              
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

    <!-- Modal Thêm câu hỏi -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="warning" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="text-align: center;">
            <h4 class="modal-title"> Cảnh báo </h4>
          </div>
          <div class="modal-body">
            <span id="warningcontent">${message}</span>
          </div>
          <div class="modal-footer centered">
            <button data-dismiss="modal" class="btn btn-round btn-theme03" type="button">Đóng</button>
          </div>
          <!--Form -->
        </div>
      </div>
    </div>
    <!-- modal Thêm câu hỏi -->

    
    <script>
      //Hiển thị lại ngày tháng cho đẹp
      var startTime = document.getElementsByName("starttime");
      var endTime = document.getElementsByName("endtime");

      for(var i = 0; i<startTime.length ; i++)
      {
          var oldStartTime = startTime[i].innerHTML;
          var gio = oldStartTime.slice(11, 16);
          var ngay = oldStartTime.slice(8, 10);
          var thang = oldStartTime.slice(5, 7);
          var nam = oldStartTime.slice(0, 4);
          
          var newStartTime = gio + " - " + ngay + "/" + thang + "/" + nam;

          if(oldStartTime == "")
            startTime[i].innerHTML = "";
          else startTime[i].innerHTML = newStartTime;
      }

      for(var i = 0; i<endTime.length ; i++)
      {
          var oldEndTime = endTime[i].innerHTML;
          var gio = oldEndTime.slice(11, 16);
          var ngay = oldEndTime.slice(8, 10);
          var thang = oldEndTime.slice(5, 7);
          var nam = oldEndTime.slice(0, 4);
          
          var newEndTime = gio + " - " + ngay + "/" + thang + "/" + nam;

          if(oldEndTime == "")
            endTime[i].innerHTML = "";
          else endTime[i].innerHTML = newEndTime;
      }

      var warning = document.getElementById("warningcontent").innerHTML;
      if(warning != "") alert(warning); //Mở modal cảnh báo
    </script>
    
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          Thực tập cơ sở ngành AT14 - &copy; <strong>Nhóm 108</strong>
          - Website thi trắc nghiệm online
        </p>
        <a href="#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.scrollTo.min.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/common-scripts.js"></script>
  <!--script for this page-->
  
</body>

</html>
