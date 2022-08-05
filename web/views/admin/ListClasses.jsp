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
          <div class="col-md-12" style="margin-bottom: 15px;">
            <a data-toggle="modal" href="#addClass" class="btn btn-theme start">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Tạo lớp học mới</span>
            </a>
            <a data-toggle="modal" href="#listSubjects" class="btn btn-theme02 cancel">
              <i class="glyphicon glyphicon-ban-circle"></i>
              <span>Danh sách môn học</span>
            </a>
            <a data-toggle="modal" href="#addSubject" class="btn btn-theme04 delete">
              <i class="glyphicon glyphicon-trash"></i>
              <span>Thêm môn học</span>
            </a>

            <!-- Modal Tạo lớp học -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addClass" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Tạo lớp học mới</h4>
                  </div>
                  <!--Form -->
                  <form action="ClassesManagement" method="post">
                    <div class="modal-body">
                      <input type="text" name="action" value="addClass" hidden>
                      <input type="text" name="className" placeholder="Nhập tên lớp" autocomplete="off" class="form-control placeholder-no-fix" required>
                      <br>
                      <input type="text" name="matkhau" placeholder="Nhập mật khẩu vào lớp" autocomplete="off" class="form-control placeholder-no-fix" required>
                      <br>
                      <select name="idMon" class="form-control placeholder-no-fix" required>
                          <option value="" disabled selected>Chọn môn</option>
                        <c:forEach items="${listMonhoc}" var="mon">
                          <option value="${mon.id}">${mon.name}</option>
                        </c:forEach>
                      </select>
                      <br>
                      <a data-toggle="modal" href="#addSubject" type="button" class="btn btn-info btn-xs">Thêm môn học khác</a>
                    </div>
                    <div class="modal-footer centered">
                      <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                      <button data-toggle="modal" class="btn btn-round btn-theme03" type="submit">Mở lớp</button>
                    </div>
                  </form>
                  <!--Form -->
                </div>
              </div>
            </div>
            <!-- modal tạo lớp học-->
               
             <!-- Modal Danh sách môn học-->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="listSubjects" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Danh sách môn học</h4>
                  </div>
                  <div class="modal-body">
                    <table class="table table-striped table-advance table-hover">
                      <thead>
                        <tr>
                          <th>Mã môn học</th>
                          <th> Tên môn học</th>
                          <th></th>
                        </tr>
                      </thead>
      
                      <tbody>
                        <c:forEach items="${listMonhoc}" var="mon">
                          <tr>
                            <td> &nbsp;&nbsp;&nbsp;&nbsp; ${mon.id} </td>
                            <td>${mon.name}</td>
                          </tr>
                        </c:forEach>
                        
                      </tbody>
                    </table>
                  </div>
                  <div class="modal-footer centered">
                    <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                    <a data-toggle="modal" href="#addSubject" class="btn btn-round btn-theme03" type="button">Thêm môn học khác</a>
                  </div>
                </div>
              </div>
            </div>
            <!-- modal Danh sách môn học-->

             <!-- Modal thêm môn học-->
             <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addSubject" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Thêm môn học</h4>
                  </div>
                  <form action="ClassesManagement" method="post">
                    <div class="modal-body">
                      <input type="text" name="action" value="addSubject" hidden>
                      <input type="text" name="tenMon" placeholder="Nhập tên môn học" autocomplete="off" class="form-control placeholder-no-fix" required>
                    </div>
                    <div class="modal-footer centered">
                      <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                      <button class="btn btn-theme03 btn-round" type="submit">Thêm</button>
                    </div>
                  </form>
                  
                </div>
              </div>
            </div>
            <!-- modal thêm môn học-->

          </div>
          
          <div class="col-md-12">
            <div class="content-panel">

              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    DANH SÁCH LỚP HỌC
                    <form action="ClassesManagement" class="pull-right mail-src-position">
                      
                      <div class="input-append">
                        <input type="text" name="searchClass" class="form-control " placeholder="Search Class">
                      </div>
                    </form>
                  </h4>
              </header>
              <table class="table table-striped table-advance table-hover">
                
                <hr>
                <thead>
                  <tr>
                    <th>Mã lớp</th>
                    <th>Tên lớp</th>
                    <th> Môn học</th>
                    <th> Giáo viên phụ trách</th>
                    <th> Sĩ số</th>
                    <th>Thao tác</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${listLophoc}" var="lop">
                    <tr>
                      <td> &nbsp;&nbsp;&nbsp;&nbsp; ${lop.classid} </td>
                      <td>${lop.classname}</td>
                      <td>${lop.monhoc.name}</td>
                      <td>${lop.nhanvien.hoten}</td>
                      <td><span class="label label-info label-mini"> ${lop.siso}</span></td>
                      <td>
                        <div class="btn-group open">
                          <button type="button" class="btn btn-theme btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            Chọn <span class="caret"></span>
                          </button>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="ClassDetail?classID=${lop.classid}">Chi tiết lớp</a></li>
                            <c:if test="${lop.nhanvien.hoten == null}">
                              <li><a href="AddTeacherToCLass?classID=${lop.classid}">Thêm giáo viên</a></li>
                            </c:if>
                            <li><a href="#">Thêm sinh viên</a></li>
                          </ul>
                        </div>
                        <a href="ClassesManagement?action=deleteClass&classID=${lop.classid}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i> Xóa lớp </a>
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
