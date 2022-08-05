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

<body onload="thongbao()">
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
            <a class="active" href="javascript:;">
              <i class="fa fa-th-large"></i>
              <span>LỚP HỌC</span>
              </a>
            <ul class="sub">
              <li ><a href="${pageContext.request.contextPath}/ListClasses">Danh sách lớp học</a></li>
              <li class="active"><a href="${pageContext.request.contextPath}/ClassInfor">Thông tin lớp học</a></li>
            </ul>
          </li>

          <li>
            <a href="ListExams">
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
          <div class="col-lg-12">
            <div class="form-panel">
              <h4 class="gen-case"> <b>THÔNG TIN CHI TIẾT LỚP HỌC</b> </h4>

              <form action="ClassInfor" class="form-horizontal style-form" id="chooseClass">
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
                  <h5 class="gen-case" style="color: darkred;"> <b>Tổng số sinh viên:</b> ${lophoc.siso}</h5>
                  <h5 class="gen-case" style="color: darkred;"> <b>Mật khẩu vào lớp:</b> ${lophoc.matkhau}</h5>
                </div>
                
              </c:if>
            </div>
            <!-- /form-panel -->

            <c:if test="${lophoc != null}">
              <div class="form-panel">

                <!-- Modal Thêm đề thi -->
                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addExamToClass" class="modal fade">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header" style="text-align: center;">
                        <h4 class="modal-title">Thêm đề thi vào lớp: ${lophoc.classname} </h4>
                      </div>
                      <!--Form -->
                      <form action="ClassInfor?classID=${lophoc.classid}" method="post">
                        <div class="modal-body">
                          <input type="text" name="action" value="addExamToClass" hidden>

                          <b>Danh sách đề thi môn ${lophoc.monhoc.name}</b> 
                          <select name="examID" class="form-control placeholder-no-fix" required>
                              <option value="" disabled selected>Chọn đề </option>
                            <c:forEach items="${listDeGV}" var="de">
                              <option value="${de.id}">${de.name} --- ${de.tong} câu --- ${de.time} phút</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div class="modal-footer centered">
                          <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                          <button data-toggle="modal" class="btn btn-round btn-theme03" type="submit">Thêm</button>
                        </div>
                      </form>
                      <!--Form -->
                    </div>
                  </div>
                </div>
                <!-- modal Thêm đề thi -->

                <!--Bảng danh sách đề thi-->
                <h4 class="gen-case" style="color: darkcyan;"> 
                  <b>DANH SÁCH BÀI THI - KIỂM TRA</b> 

                  <form action="#" class="pull-right mail-src-position">
                    <div class="input-append">
                      <input type="text" name="searchExam" class="form-control " placeholder="Search Exam">
                    </div>
                  </form>
                </h4>
                <a data-toggle="modal" href="#addExamToClass" class="btn btn-success btn-xs">Thêm đề thi</i></a>

                <c:if test="${listDethi == null}">
                  Lớp này chưa có đề thi nào
                </c:if>

                <table class="table table-striped table-advance table-hover" >
                  <thead>
                    <tr>
                      <th> Mã đề </th>
                      <th> Tên bài thi</th>
                      <th> Loại</th>
                      <th> TG làm bài</th>
                      <th> Tổng số câu</th>
                      <th> Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${listDethi}" var="de">
                      <tr>
                        <td> &nbsp;&nbsp;&nbsp; ${de.dethi.id} </td>
                        <td>${de.dethi.name} </td>
                        <td>
                          <c:if test="${de.dethi.type == true}"> Chính thức </c:if>
                          <c:if test="${de.dethi.type == false}"> Thi thử </c:if>
                        </td>
                        <td>${de.dethi.time} phút </td>
                        <td><span class="label label-info label-mini">${de.dethi.tong} </span></td>
                        
                        <td style="vertical-align: middle;">
                          <a href="ViewResult?classID=${lophoc.classid}&examID=${de.dethi.id}" class="btn btn-success btn-xs">Xem điểm</i></a>
                          <a href="ClassInfor?classID=${lophoc.classid}&delExamClassID=${de.id}&examID=${de.dethi.id}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
                        </td>
                      </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
              </div>
              <!-- /form-panel -->

              <div class="form-panel">
                <!--Bảng danh sách sinh viên-->
                <h4 class="gen-case" style="color: indianred;"> 
                  <b>DANH SÁCH SINH VIÊN TRONG LỚP</b> 

                  <form action="#" class="pull-right mail-src-position">
                    <div class="input-append">
                      <input type="text" name="searchSV" class="form-control " placeholder="Search Student">
                    </div>
                  </form>
                </h4>

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
              </div>
              <!-- /form-panel -->
            </c:if>
            
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

    <span id="mess" hidden>${message}</span>
    <script>
        function thongbao(){
            var message = document.getElementById("mess").innerHTML;
            if(message != "") alert(message);
        }
    </script>

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
