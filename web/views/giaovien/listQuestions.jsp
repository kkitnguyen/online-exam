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
  <link rel="shortcut icon" type="image/png"
    href="${pageContext.request.contextPath}/common/style-quanly/img/favicon.png" />

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/css/bootstrap.min.css"
    rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/font-awesome/css/font-awesome.css"
    rel="stylesheet" />
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
            <a href="TeacherProfile">
              <c:if test="${user.image == null || user.image ==''}">
                <img src="uploads/images/default_avatar.png" class="img-circle" width="80" height="80"
                  style="object-fit: cover;">
              </c:if>
              <c:if test="${user.image != null && user.image !=''}">
                <img src="uploads/images/${user.image}" class="img-circle" width="80" height="80"
                  style="object-fit: cover;">
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
            <a href="javascript:;">
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
            <a href="AddOrEditQuestion" class="btn btn-theme start">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Thêm câu hỏi</span>
            </a>
            <br> <br>

            <div class="content-panel">

              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                  DANH SÁCH CÂU HỎI
                  <form action="ListClasses" class="pull-right mail-src-position">
                    <div class="input-append">
                      <input type="text" name="searchClass" class="form-control " placeholder="Search Question">
                    </div>
                  </form>
                </h4>
              </header>

              <div class="col-md-12">
                <form action="ListQuestions" class="form-horizontal style-form" id="chooseClass">
                  <div class="form-group">
                    <div class="col-md-3 col-xs-11">
                      <!--Xử lý submit form tìm câu hỏi theo môn-->
                      <script>
                        function change() {
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
                    <th> Mã </th>
                    <th> Môn</th>
                    <th> Mức độ</th>
                    <th> Nội dung câu hỏi</th>
                    <th> Phương án</th>
                    <th> Đáp án</th>
                    <th> Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${listCauhoi}" var="cau">
                    <tr>
                      <td style="vertical-align: middle;"> &nbsp; ${cau.id} </td>
                      <td style="vertical-align: middle;">${cau.monhoc.name} </td>
                      <td style="vertical-align: middle;">
                        <c:choose>
                          <c:when test="${cau.dokho == 'de'}">
                            Dễ
                          </c:when>
                          <c:when test="${cau.dokho == 'tb'}">
                            Trung bình
                          </c:when>
                          <c:when test="${cau.dokho == 'kho'}">
                            Khó
                          </c:when>
                        </c:choose>
                      </td>
                      <td style="vertical-align: middle;">${cau.debai} </td>
                      <td style="vertical-align: middle;">
                        A. ${cau.a} <br>
                        B. ${cau.b} <br>
                        C. ${cau.c} <br>
                        D. ${cau.d}
                      </td>
                      <td style="vertical-align: middle;">&nbsp; &nbsp;<span
                          class="label label-success label-mini">${cau.dapan} </span></td>
                      <td style="vertical-align: middle;">
                        <a href="AddOrEditQuestion?editQuestionID=${cau.id}" class="btn btn-primary btn-xs"><i
                            class="fa fa-pencil"></i></a>
                        <a href="ListQuestions?deleteQuestionID=${cau.id}" class="btn btn-danger btn-xs"><i
                            class="fa fa-trash-o "></i></a>
                      </td>
                    </tr>
                  </c:forEach>

                </tbody>
              </table>

            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->

            <div class="row-fluid">
              <div class="span6">
                <div class="dataTables_paginate paging_bootstrap pagination">
                  <ul>
                    <c:if test="${page > 1}">
                      <li class="prev disabled"><a href="ListQuestions?page=${(page -1)}">← Previous</a></li>
                    </c:if>
                    <c:forEach items="${listPages}" var = "pg">
                      <li class="<c:if test='${pg == page}'>active</c:if>"><a href="ListQuestions?page=${pg}">${pg}</a></li>
                    </c:forEach>
                    <c:if test="${page < totalPages}">
                      <li class="next"><a href="ListQuestions?page=${(page +1)}">Next → </a></li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>

        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->

    <span id="warning">${warning}</span>

    <script>
      var warning = document.getElementById("warningcontent").innerHTML;
      if (warning != "") alert(warning);
    </script>


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
  <script class="include" type="text/javascript"
    src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.scrollTo.min.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.nicescroll.js"
    type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/common-scripts.js"></script>
  <!--script for this page-->

</body>

</html>