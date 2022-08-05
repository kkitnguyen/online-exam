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
  <title>Quản lý lớp học</title>

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
            <a class="active" href="javascript:;">
              <i class="fa fa-th-large"></i>
              <span>QUẢN LÝ LỚP HỌC</span>
              </a>
            <ul class="sub">
              <li class="active"><a href="${pageContext.request.contextPath}/ClassesManagement">Danh sách lớp học</a></li>
              <li ><a href="${pageContext.request.contextPath}/AddTeacherToCLass">Thêm giáo viên vào lớp</a></li>
              <li><a href="${pageContext.request.contextPath}/AddStudentsToCLass">Thêm sinh viên vào lớp</a></li>
            </ul>
          </li>

          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-users"></i>
              <span>QUẢN LÝ TÀI KHOẢN</span>
              </a>
            <ul class="sub">
              <li><a href="ListStudents">QLTK học sinh</a></li>
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
        <!-- row -->
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="gen-case"> <b>THÔNG TIN CHI TIẾT LỚP HỌC</b> </h4>

              <form action="ClassDetail" class="form-horizontal style-form" id="chooseClass">
                <div class="form-group">
                  <div class="col-md-3 col-xs-11">
                    <!--Xử lý submit form (hiển thị thông tin lớp) khi chọn lớp trong select-->
                    <script>
                      function change(){
                          document.getElementById("chooseClass").submit();
                      }
                    </script>
                    <select name="classID" id="" class="form-control" onchange="change()">
                      <option value="" disabled selected>Chọn lớp</option>
                      <c:forEach items="${listLophoc}" var="li">
                        <option value="${li.classid}" <c:if test="${lophoc.classid == li.classid}">selected</c:if>>
                            ${li.classid} --- ${li.classname}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </form>
              
              <c:if test="${lophoc != null}">
                <div class="form-group">
                  <h5 class="gen-case" style="color: darkred;"> <b>Lớp:</b> ${lophoc.classname} </h5>
                  <h5 class="gen-case" style="color: darkred;"> <b>Môn:</b> ${lophoc.monhoc.name} </h5>
                  <h5 class="gen-case" style="color: darkred;"> <b>Giáo viên giảng dạy:</b> ${lophoc.nhanvien.hoten}</h5>
                  <h5 class="gen-case" style="color: darkred;"> <b>Tổng số sinh viên:</b> ${lophoc.siso}</h5>
                  <h5 class="gen-case" style="color: darkred;"> <b>Mật khẩu vào lớp:</b> ${lophoc.matkhau}</h5>
                </div>
                <hr>
                <h4 class="gen-case"> DANH SÁCH SINH VIÊN</h4>
  
                <table class="table table-striped table-advance table-hover">
                  <thead>
                    <tr>
                      <th> Mã SV</th>
                      <th > Họ và tên</th>
                      <th>Ngày sinh</th>
                      <th> Giới tính</th>
                      <th> Số CMND</th>
                      <th> Email</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${listSvLop}" var="sv">
                      <tr>
                        <td> ${sv.sinhvien.masv} </td>
                        <td> ${sv.sinhvien.hoten} </td>
                        <td> ${sv.sinhvien.ngaysinh} </td>
                        <td>
                          <c:if test="${sv.sinhvien.gioitinh == true}"> Nam </c:if>
                          <c:if test="${sv.sinhvien.gioitinh == false}"> Nữ </c:if>
                        </td>
                        <td> ${sv.sinhvien.cmnd} </td>
                        <td>${sv.sinhvien.email}</td>
                      </tr>
                    </c:forEach>  
                  </tbody>
                </table>
              </c:if>

              <a typedata-toggle="modal" href="ClassesManagement" class="btn btn-theme start">
                <i class="glyphicon glyphicon-upload"></i>
                <span>Quay lại</span>
              </a>

            </div>
            <!-- /form-panel -->
          </div>
          <!-- col-lg-12 -->
        </div>
        <!-- /row -->
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
