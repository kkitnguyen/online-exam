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
  <title>Ngân hàng câu hỏi</title>

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
            <a href="ListExams">
              <i class="fa fa-file-text"></i>
              <span>QUẢN LÝ ĐỀ THI</span>
              </a>
          </li>

          <li>
            <a class="active" href="ListQuestions">
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

            <!-- Thêm câu hỏi -->
            <c:if test="${cauhoi == null}">
              <div class="col-lg-3">
                <h4><i class="fa fa-angle-right"></i> Import câu hỏi từ file Excel</h4>
                <div class="form-panel">
                  <form action="AddOrEditQuestion" method="POST" class="form-horizontal style-form" enctype="multipart/form-data">
                    <div class="form-group">
                      <label class="control-label col-lg-12">Chọn môn học</label>
                      <div class="col-lg-12">
                        <select name="idMon" id="" class="form-control" required>
                          <option value="" disabled selected>---</option>

                          <c:forEach items="${listMonhoc}" var="mon">
                            <option value="${mon.id}">${mon.name}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label">Chọn file Excel (.xls)</label>
                      <div class="col-sm-12">
                        <input class="form-control" type="file" name="file" required>
                      </div>
                    </div>
    
                    <div class="form-group">
                      <label class="col-sm-4 control-label"></label>
                      <div class="col-sm-8">
                        <button class="btn btn-theme" type="submit">Upload</button>
                      </div>
                    </div>

                    <input name="action" type="text" value="AddQuestionFromExcel" hidden>
                  </form>
                </div>
              </div>
              
              <div class="col-lg-9">
                <h4><i class="fa fa-angle-right"></i> Nhập câu hỏi</h4>
                <div class="form-panel">
                  <div class=" form">
                    <form class="cmxform form-horizontal style-form" id="nhapcauhoi" method="post" action="AddOrEditQuestion">
                      <div class="form-group">
                        <label class="control-label col-lg-2">Chọn môn học</label>
                        <div class="col-lg-10">
                          <select name="idMon" id="" class="form-control" required>
                            <option value="" disabled selected>---</option>

                            <c:forEach items="${listMonhoc}" var="mon">
                              <option value="${mon.id}">${mon.name}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-lg-2">Mức độ</label>
                        <div class="col-lg-10">
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dokho" value="de" required> &nbsp; Dễ
                          </label>
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dokho" value="tb"> &nbsp; Trung bình
                          </label>
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dokho" value="kho"> &nbsp; Khó
                          </label>
                        </div>
                      </div>

                      <div class="form-group ">
                        <label  class="control-label col-lg-2">Nội dung</label>
                        <div class="col-lg-10">
                          <textarea class="form-control " name="noidung" required=""></textarea>
                        </div>
                      </div>

                      <div class="form-group ">
                        <label for="cname" class="control-label col-lg-2">Phương án A </label>
                        <div class="col-lg-10">
                          <input class=" form-control round-form" name="A" type="text" required="">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label for="cname" class="control-label col-lg-2">Phương án B </label>
                        <div class="col-lg-10">
                          <input class=" form-control round-form" name="B" type="text" required="">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label for="cname" class="control-label col-lg-2">Phương án C </label>
                        <div class="col-lg-10">
                          <input class=" form-control round-form" name="C" type="text" required="">
                        </div>
                      </div>
                      <div class="form-group ">
                        <label for="cname" class="control-label col-lg-2">Phương án D </label>
                        <div class="col-lg-10">
                          <input class=" form-control round-form" name="D" type="text" required="">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-lg-2">Đáp án</label>
                        <div class="col-lg-10">
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dapan" value="A" required> &nbsp; A
                          </label>
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dapan" value="B"> &nbsp; B
                          </label>
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dapan" value="C"> &nbsp; C
                          </label>
                          <label class="checkbox-inline col-lg-2">
                            <input type="radio" name="dapan" value="D"> &nbsp; D
                          </label>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                          <a href="ListQuestions" class="btn btn-default" >Quay lại</a>
                          <button class="btn btn-theme" type="submit">Thêm câu hỏi</button>
                        </div>
                      </div>

                      <input name="action" type="text" value="AddQuestion" hidden>
                    </form>
                  </div>
                </div>
              </div>

              
            </c:if>
            <!-- Thêm câu hỏi -->
            
            <!-- Chỉnh sửa câu hỏi -->
            <c:if test="${cauhoi != null}">
              <h4><i class="fa fa-angle-right"></i> Chỉnh sửa câu hỏi</h4>
              <div class="form-panel">
                <div class=" form">
                  <form class="cmxform form-horizontal style-form" method="post" action="AddOrEditQuestion">
                    <div class="form-group">
                      <label class="control-label col-lg-2">Môn học</label>
                      <div class="col-lg-10">
                        <input name="idMon" type="text" value="${cauhoi.monhoc.id}" hidden>
                        <input class=" form-control round-form" name="tenmon" type="text" value="${cauhoi.monhoc.name}" readonly>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="control-label col-lg-2">Mức độ</label>
                      <div class="col-lg-10">
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dokho" value="de" <c:if test="${cauhoi.dokho == 'de'}">checked</c:if>> &nbsp; Dễ
                        </label>
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dokho" value="tb" <c:if test="${cauhoi.dokho == 'tb'}">checked</c:if>> &nbsp; Trung bình
                        </label>
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dokho" value="kho" <c:if test="${cauhoi.dokho == 'kho'}">checked</c:if>> &nbsp; Khó
                        </label>
                      </div>
                    </div>

                    <div class="form-group ">
                      <label  class="control-label col-lg-2">Nội dung</label>
                      <div class="col-lg-10">
                        <textarea class="form-control " name="noidung" required>${cauhoi.debai}</textarea>
                      </div>
                    </div>

                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Phương án A </label>
                      <div class="col-lg-10">
                        <input class=" form-control round-form" name="A" type="text" value="${cauhoi.a}" required>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Phương án B </label>
                      <div class="col-lg-10">
                        <input class=" form-control round-form" name="B" type="text" value="${cauhoi.b}" required>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Phương án C </label>
                      <div class="col-lg-10">
                        <input class=" form-control round-form" name="C" type="text" value="${cauhoi.c}" required>
                      </div>
                    </div>
                    <div class="form-group ">
                      <label for="cname" class="control-label col-lg-2">Phương án D </label>
                      <div class="col-lg-10">
                        <input class=" form-control round-form" name="D" type="text" value="${cauhoi.d}" required>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="control-label col-lg-2">Đáp án</label>
                      <div class="col-lg-10">
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dapan" value="A" <c:if test="${cauhoi.dapan == 'A'}">checked</c:if>> &nbsp; A
                        </label>
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dapan" value="B" <c:if test="${cauhoi.dapan == 'B'}">checked</c:if>> &nbsp; B
                        </label>
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dapan" value="C" <c:if test="${cauhoi.dapan == 'C'}">checked</c:if>> &nbsp; C
                        </label>
                        <label class="checkbox-inline col-lg-2">
                          <input type="radio" name="dapan" value="D" <c:if test="${cauhoi.dapan == 'D'}">checked</c:if>> &nbsp; D
                        </label>
                      </div>
                    </div>

                    <div class="form-group">
                      <div class="col-lg-offset-2 col-lg-10">
                        <a href="ListQuestions" class="btn btn-default" >Quay lại</a>
                        <button class="btn btn-theme" type="submit">Lưu</button>
                      </div>
                    </div>

                    <input name="questionID" type="text" value="${cauhoi.id}" hidden>
                    <input name="action" type="text" value="EditQuestion" hidden>
                  </form>
                </div>
              </div>
            </c:if>
            <!-- Chỉnh sửa câu hỏi -->

          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

    <span id="mess" hidden>${message}</span>
    <script>
        function thongbao(){
            var message = document.getElementById("mess").innerHTML;
            if(message != "") alert(message);
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
  
</body>

</html>
