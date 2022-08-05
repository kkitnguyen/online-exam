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
  <title>Dashboard</title>

  <!-- Favicons -->
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/common/style-quanly/img/favicon.png"/>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style-responsive.css" rel="stylesheet">
  
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
            <a href="AdminProfile">
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
            <a class="active" href="Dashboard">
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
            <a href="AdminProfile">
              <i class="fa fa-user"></i>
              <span>HỒ SƠ CÁ NHÂN</span>
              </a>
          </li>

          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-th-large"></i>
              <span>QUẢN LÝ LỚP HỌC</span>
              </a>
            <ul class="sub">
              <li ><a href="${pageContext.request.contextPath}/ClassesManagement">Danh sách lớp học</a></li>
              <li><a href="${pageContext.request.contextPath}/AddTeacherToCLass">Thêm giáo viên vào lớp</a></li>
              <li><a href="${pageContext.request.contextPath}/AddStudentsToCLass">Thêm sinh viên vào lớp</a></li>
            </ul>
          </li>

          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-users"></i>
              <span>QUẢN LÝ TÀI KHOẢN</span>
              </a>
            <ul class="sub">
              <li ><a href="ListStudents">QLTK học sinh</a></li>
              <li ><a href="ListTeachers">QLTK giáo viên</a></li>
            </ul>
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

    <style>
      .pn{
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 20px;
      }
      .pn:hover{
        opacity: 0.8;
      }
      .chooseFunction {
        text-align: center;
        font-weight: bold;
        font-size: 46px;
        color: #4ECDC4;
      }
    </style>
    <section id="main-content">
      <section class="wrapper site-min-height">
        <div class="row mt">
          <div>
            <h1 class="chooseFunction">CHỌN CHỨC NĂNG</h1>
          </div>
        </div>
        <div class="row mt">
          <!-- SERVER STATUS PANELS -->
          <div class="col-md-4 col-sm-4 mb">
            <a href="ClassesManagement">
              <div class="twitter-panel pn">
                  <h1 style="color: white;">QUẢN LÝ LỚP HỌC</h1>
              </div>
              <!-- /grey-panel -->
            </a>
          </div>
          <!-- /col-md-4-->
          <div class="col-md-4 col-sm-4 mb">
            <a href="ListStudents">
              <div class="product-panel-2 pn">
                <h1 style="color: black;">QUẢN LÝ <br> TÀI KHOẢN HỌC SINH</h1>
              </div>
              <!--  /darkblue panel -->
            </a>
          </div>
          <!-- /col-md-4 -->
          <div class="col-md-4 col-sm-4 mb">
            <a href="ListTeachers">
              <!-- REVENUE PANEL -->
              <div class="green-panel pn">
                <h1 style="color: white;">QUẢN LÝ <br> TÀI KHOẢN GIÁO VIÊN</h1>
              </div>
            </a>
          </div>
          <!-- /col-md-4 -->
        </div>
        <!-- /container -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->


    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          Thực tập cơ sở ngành AT14 - &copy; <strong>Nhóm 108</strong>
          - Website thi trắc nghiệm online
        </p>
        <a href="profile.html#" class="go-top">
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
