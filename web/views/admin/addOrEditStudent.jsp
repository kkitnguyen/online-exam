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
  <title>Quản lý tài khoản học sinh</title>

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
            <a class="active" href="javascript:;">
              <i class="fa fa-users"></i>
              <span>QUẢN LÝ TÀI KHOẢN</span>
              </a>
            <ul class="sub">
              <li class="active"><a href="ListStudents">QLTK học sinh</a></li>
              <li><a href="ListTeachers">QLTK giáo viên</a></li>
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
    
    <section id="main-content">
      <section class="wrapper site-min-height">
        
        <c:if test="${sv != null}">
          <!-- row -->
          <div class="row mt">  
            <!-- /col-lg-12 -->
            <div class="col-lg-12">
              <div class="form-panel">
                <h4 class="mb"><i class="fa fa-angle-right"></i> CHỈNH SỬA THÔNG TIN SINH VIÊN</h4>
                <form action="AddOrEditStudent" method="POST" class="form-horizontal style-form" >
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Mã sinh viên *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="masv" value="${sv.masv}" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Họ và tên *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="hoten" value="${sv.hoten}" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Ngày sinh *</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" name="ngaysinh" value="${sv.ngaysinh}" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Giới tính *</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="gioitinh" >
                        <option value="nam" <c:if test="${sv.gioitinh == true}">selected</c:if>>Nam</option>
                        <option value="nu" <c:if test="${sv.gioitinh == false}">selected</c:if>>Nữ</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Email *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="email" value="${sv.email}" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Số điện thoại</label>
                    <div class="col-sm-6">
                      <input class="form-control"  type="text" name="phone" value="${sv.phone}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Số CMND *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="cmnd" value="${sv.cmnd}" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Quê quán</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="quequan" value="${sv.quequan}" >
                    </div>
                  </div>

                  <input type="text" name="userid" value="${sv.userid}" hidden>
                  <input type="text" name="action" value="editStudent" hidden>

                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                      <a class="btn btn-default" href="ListStudents" >Hủy bỏ</a>
                      <button class="btn btn-theme" type="submit">Lưu</button>
                    </div>
                  </div>
                  
                </form>
              </div>
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </c:if>


        <c:if test="${sv == null}">
          <!-- row -->
          <div class="row mt">  
            <!-- /col-lg-12 -->
            <div class="col-lg-12">
              <div class="form-panel">
                <h4 class="mb"><i class="fa fa-angle-right"></i> TẠO TÀI KHOẢN SINH VIÊN</h4>
                <form action="AddOrEditStudent" method="POST" class="form-horizontal style-form" >
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Mã sinh viên *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="masv" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Mật khẩu *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="password" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Họ và tên *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="hoten" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Ngày sinh *</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" name="ngaysinh" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Giới tính *</label>
                    <div class="col-sm-2">
                      <select class="form-control" name="gioitinh" >
                        <option value="nam" >Nam</option>
                        <option value="nu" >Nữ</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Email *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="email" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Số điện thoại</label>
                    <div class="col-sm-6">
                      <input class="form-control"  type="text" name="phone" value="">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Số CMND *</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="cmnd" value="" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Quê quán</label>
                    <div class="col-sm-6">
                      <input class="form-control" type="text" name="quequan" value="" >
                    </div>
                  </div>

                  <input type="text" name="action" value="addStudent" hidden>

                  <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                      <a class="btn btn-default" href="ListStudents" >Hủy bỏ</a>
                      <button class="btn btn-theme" type="submit">Tạo tài khoản</button>
                    </div>
                  </div>
                  
                </form>
              </div>
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </c:if>


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
