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
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-datepicker/css/datepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-timepicker/compiled/timepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-datetimepicker/datertimepicker.css" />
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
            
            <h4><i class="fa fa-angle-right"></i> Thêm đề thi mới</h4>
            <div class="form-panel">
              <div class=" form">
                <form class="cmxform form-horizontal style-form" method="post" action="AddExam" id="addExamForm">
                  <div class="form-group">
                    <label class="control-label col-lg-2">Chọn môn học</label>
                    <div class="col-lg-6">
                      <select name="idMon" id="" class="form-control" required>
                        <option value="" disabled selected>---</option>

                        <c:forEach items="${listMonhoc}" var="mon">
                          <option value="${mon.id}">${mon.name}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </div>

                  <div class="form-group ">
                    <label class="control-label col-lg-2">Tên đề thi </label>
                    <div class="col-lg-6">
                      <input class=" form-control round-form" name="examName" type="text" required="">
                    </div>
                  </div>

                  <div class="form-group ">
                    <label class="control-label col-lg-2">Thời gian làm bài <i>(phút)</i>  </label>
                    <div class="col-lg-2">
                      <input class=" form-control round-form" name="time" type="number" required="">
                    </div>
                  </div>

                  <div class="form-group ">
                    <label class="control-label col-lg-2">Thời gian mở đề </label>
                    <input type="text" name="starttime" id="starttime" value="${de.starttime}" hidden>
                    
                    <div class="col-lg-3">
                      <input class=" form-control round-form" type="date" value="" id="starttimedate" onchange="settime()">
                    </div>
                    <div class="col-lg-2">
                      <input class=" form-control round-form" type="time" value="" id="starttimehour" onchange="settime()">
                    </div>
                  </div>

                  <div class="form-group ">
                    <label class="control-label col-lg-2">Thời gian đóng đề </label>
                    <input type="text" name="endtime" id="endtime" value="${de.endtime}" hidden>

                    <div class="col-lg-3">
                      <input class=" form-control round-form" type="date" value="" id="endtimedate" onchange="settime()">
                    </div>
                    <div class="col-lg-2">
                      <input class=" form-control round-form" type="time" value="" id="endtimehour" onchange="settime()">
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="control-label col-lg-2">Loại đề</label>
                    <div class="col-lg-10">
                      <label class="checkbox-inline col-lg-2">
                        <input type="radio" name="type" value="false" checked> Đề thi thử
                      </label>
                      <label class="checkbox-inline col-lg-2">
                        <input type="radio" name="type" value="true"> Đề chính thức
                      </label>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <a href="ListExams" class="btn btn-default" >Quay lại</a>
                      <button class="btn btn-theme" type="submit">Tạo đề thi</button>
                    </div>
                  </div>

                </form>
              </div>
            </div>

          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

    <style>
      label{
        font-size: 11pt;
        font-weight: bold;
      }
    </style>

    <script>
      function settime(){
        var startDate = document.getElementById("starttimedate").value;
        var startHour = document.getElementById("starttimehour").value;

        var endDate = document.getElementById("endtimedate").value;
        var endHour = document.getElementById("endtimehour").value;

        document.getElementById("starttime").value = startDate + " " + startHour;
        document.getElementById("endtime").value = endDate + " " + endHour;

        if(startDate == "" || startHour =="") document.getElementById("starttime").value = "";
        if(endDate == "" || endHour =="") document.getElementById("endtime").value = "";
      }
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
  <script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/advanced-form-components.js"></script>
  
  
</body>

</html>
