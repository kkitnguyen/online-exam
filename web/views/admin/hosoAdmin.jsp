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
  <title>Hồ sơ cá nhân</title>

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
            <a class="active" href="AdminProfile">
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
     <section id="main-content">
      <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12">
            <div class="row content-panel">
              <div class="col-md-2 profile-text mt mb centered">
                <div class="profile-pic">
                  <c:if test="${user.image == null || user.image ==''}">
                    <p><img src="uploads/images/default_avatar.png" class="img-circle"></p>
                  </c:if>
                  <c:if test="${user.image != null && user.image !=''}">
                    <p><img src="uploads/images/${user.image}" class="img-circle"></p>
                  </c:if>
                  
                </div>
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text">
                <h3>${nv.hoten}</h3>
                <p>${nv.gioithieu}</p>
                <br>
                <p><button class="btn btn-theme" onclick="editProfile()"><i class="fa fa-edit"></i> SỬA THÔNG TIN</button></p>
              </div>
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>

          <!-- /col-lg-12 -->
          <div class="col-lg-12" id="hoso">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> THÔNG TIN CÁ NHÂN</h4>
              <form class="form-horizontal style-form" method="get">
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Username</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" value="${nv.username}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Họ và tên</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" value="${nv.hoten}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Email</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" value="${nv.email}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Số điện thoại</label>
                  <div class="col-sm-10">
                    <input class="form-control"  type="text" value="${nv.phone}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Phòng</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" value="${nv.phongKhoa}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Chức vụ</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" value="${nv.chucvu}" readonly>
                  </div>
                </div>
                
              </form>
            </div>
          </div>

          <!-- /col-lg-12 -->
          <div class="col-lg-12" id="suahoso" hidden>
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> CHỈNH SỬA THÔNG TIN</h4>
              <form action="AdminProfile" method="POST" class="form-horizontal style-form" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Username</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" name="username" value="${nv.username}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Họ và tên</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" name="hoten" value="${nv.hoten}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Email</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" name="email" value="${nv.email}" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Số điện thoại</label>
                  <div class="col-sm-10">
                    <input class="form-control"  type="text" name="phone" value="${nv.phone}" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Phòng</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" name="phong" value="${nv.phongKhoa}" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Chức vụ</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="text" name="chucvu" value="${nv.chucvu}" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Giới thiệu</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" type="text" name="gioithieu">${nv.gioithieu}</textarea>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Ảnh đại diện</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" name="file">
                  </div>
                </div>

                <input type="text" name="userid" value="${nv.userid}" hidden>

                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label"></label>
                  <div class="col-sm-10">
                    <a class="btn btn-default" onclick="cancelEdit()" >Hủy bỏ</a>
                    <button class="btn btn-theme" type="submit">Lưu</button>
                  </div>
                </div>
                
              </form>
            </div>
          </div>

          <!-- /row -->
        </div>
        <!-- /container -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

    <script>
      function editProfile(){
         document.getElementById("hoso").hidden = true;
         document.getElementById("suahoso").hidden = false;
      }
      function cancelEdit(){
         document.getElementById("hoso").hidden = false;
         document.getElementById("suahoso").hidden = true;
      }
    </script>
    
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
