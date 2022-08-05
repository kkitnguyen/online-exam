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
            <a data-toggle="modal" href="#addQuestionsToExam" class="btn btn-theme start">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Thêm câu hỏi</span>
            </a>
            <a data-toggle="modal" href="#addRandomQuestions" class="btn btn-success">
              <i class="glyphicon glyphicon-upload"></i>
              <span>Thêm ngẫu nhiên</span>
            </a>
            <a data-toggle="modal" href="#confirmDelete" class="btn btn-danger">
              <i class="fa fa-trash-o "></i>
              <span>Xóa tất cả</span>
            </a>
            <a href="ListExams" class="btn btn-default" >Quay lại</a>
            <br> <br>
            <!-- Modal Xác nhận xóa -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="confirmDelete" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Bạn chắc chắn muốn xóa toàn bộ câu hỏi khỏi đề thi này?</h4>
                  </div>
                  <!--Form -->
                  <form action="ListQuestionsOfExam" method="post">
                    <input type="text" value="deleteAllQuestions" name="action" hidden>
                    <input type="text" value="${de.id}" name="examID" hidden>

                    <div class="modal-footer centered">
                      <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                      <button data-toggle="modal" class="btn btn-round btn-warning" type="submit">Xác nhận</button>
                    </div>
                  </form>
                  <!--Form -->
                </div>
              </div>
            </div>
            <!-- Modal Xác nhận xóa -->

            <style>
              .listCau {
                  width: 900px;
              }
            </style>

            <!-- Modal Thêm câu hỏi -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addQuestionsToExam" class="modal fade">
              <div class="modal-dialog listCau">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Thêm Câu hỏi vào đề thi </h4>
                  </div>
                  <!--Form -->
                  <form action="ListQuestionsOfExam" method="post">
                    <div class="modal-body">
                      <h4> Danh sách câu hỏi môn <b>${de.monhoc.name}</b> 
                        <div class="pull-right mail-src-position">
                          <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                          <button data-toggle="modal" class="btn btn-round btn-primary" type="submit">Thêm câu hỏi đã chọn</button>
                        </div>
                      </h4> 

                          <table class="table table-striped table-advance table-hover">
                            <thead>
                              <tr>
                                <th> Mã </th>
                                <th> Mức độ</th>
                                <th> Nội dung câu hỏi</th>
                                <th> Phương án</th>
                                <th> Đáp án</th>
                                <th> Chọn</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${listCauhoi2}" var="cau">
                                <tr>
                                  <td style="vertical-align: middle;"> &nbsp; ${cau.id} </td>
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
                                    A. ${cau.a}  <br> 
                                    B. ${cau.b}  <br> 
                                    C. ${cau.c}  <br> 
                                    D. ${cau.d} 
                                  </td>
                                  <td style="vertical-align: middle;">&nbsp; &nbsp;<span class="label label-success label-mini">${cau.dapan} </span></td>
                                  <td style="vertical-align: middle;">
                                    <input type="checkbox" value="${cau.id}" name="listCauThem" id="cau${cau.id}" >
                                  </td>
                                </tr>
                              </c:forEach>
                              
                            </tbody>
                          </table> 

                          <input type="text" value="addQuestions" name="action" hidden>
                          <input type="text" value="${de.id}" name="examID" hidden>
                    </div>
                    <!-- <div class="modal-footer centered">
                      <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                      <button data-toggle="modal" class="btn btn-round btn-theme03" type="submit">Thêm</button>
                    </div> -->
                  </form>
                  <!--Form -->
                </div>
              </div>
            </div>
            <!-- modal Thêm câu hỏi -->

             <!-- modal Thêm câu hỏi ngẫu nhiên -->
             <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="addRandomQuestions" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header" style="text-align: center;">
                    <h4 class="modal-title">Thêm câu hỏi ngẫu nhiên</h4>
                  </div>
                  <!--Form -->
                  <form action="ListQuestionsOfExam" method="post">
                    <div class="modal-body">
                      <h4> * Nếu không đủ số lượng câu, hệ thống tự động lấy số câu tối đa </h4> 
                      
                      <div class="form-group ">
                        <label class="control-label col-lg-4">Số lượng câu dễ </label>
                        <div class="col-lg-6">
                          <input class=" form-control round-form" name="de" id="de" type="number" value="0" onchange="showTongSoCau()">
                        </div>
                      </div>
                      <br><br>
                      <div class="form-group ">
                        <label class="control-label col-lg-4">Số lượng câu TB </label>
                        <div class="col-lg-6">
                          <input class=" form-control round-form" name="tb" id="tb" type="number" value="0" onchange="showTongSoCau()">
                        </div>
                      </div>
                      <br><br>
                      <div class="form-group ">
                        <label class="control-label col-lg-4">Số lượng câu khó </label>
                        <div class="col-lg-6">
                          <input class=" form-control round-form" name="kho" id="kho" type="number" value="0" onchange="showTongSoCau()">
                        </div>
                      </div>

                      <br><br>
                      <div class="form-group ">
                        <label class="control-label col-lg-4">Tổng số câu </label>
                        <div class="col-lg-6">
                          <input class=" form-control round-form" id="tongsocau" type="number" value="0" readonly>
                        </div>
                      </div>
                    </div>
                    <br>

                      <input type="text" value="RandomQuestions" name="action" hidden>
                      <input type="text" value="${de.id}" name="examID" hidden>

                    <div class="modal-footer centered">
                      <button data-dismiss="modal" class="btn btn-round btn-default" type="button">Cancel</button>
                      <button data-toggle="modal" class="btn btn-round btn-theme03" type="submit">Thêm ngẫu nhiên</button>
                    </div>
                  </form>
                  <!--Form -->
                  
                </div>
              </div>
            </div>
            <!-- modal Thêm câu hỏi ngẫu nhiên -->

            <span id="mess" hidden>${message}</span>
            <script>
              var message = document.getElementById("mess").innerHTML;
              if(message != "") alert(message);

              function showTongSoCau(){
                var de = parseInt(document.getElementById("de").value);
                var tb = parseInt(document.getElementById("tb").value);
                var kho = parseInt(document.getElementById("kho").value);
                document.getElementById("tongsocau").value = de+tb+kho;
              }
              
            </script>

            <div class="content-panel">

              <header class="panel-heading wht-bg">
                <h4 class="gen-case">
                    DANH SÁCH CÂU HỎI - ${de.name}
                    <form action="ListClasses" class="pull-right mail-src-position">
                      <div class="input-append">
                        <input type="text" name="searchClass" class="form-control " placeholder="Search Question">
                      </div>
                    </form>
                    
                    <div class="form-group">
                      <h5 class="gen-case" style="color: navy;"> <b>Tổng số câu:</b> ${de.tong} </h5>
                      <h5 class="gen-case" > 
                        <b style="color: darkgreen;">Dễ: ${de.de} </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <b style="color: darkorange;">Trung bình: ${de.tb}</b>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <b style="color: darkred;">Khó: ${de.kho}</b> 
                      </h5>
                    </div>
                </h4>

              </header>

              <form action="ListQuestionsOfExam" method="post">
                <input type="text" value="deleteQuestion" name="action" hidden>
                <input type="text" value="${de.id}" name="examID" hidden>

                <table class="table table-striped table-advance table-hover">
                
                  <thead>
                    <tr>
                      <th> Mã </th>
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
                          A. ${cau.a}  <br> 
                          B. ${cau.b}  <br> 
                          C. ${cau.c}  <br> 
                          D. ${cau.d} 
                        </td>
                        <td style="vertical-align: middle;">&nbsp; &nbsp;<span class="label label-success label-mini">${cau.dapan} </span></td>
                        <td style="vertical-align: middle;">
                          <input type="text" value="${cau.id}" name="questionID" hidden>
                          <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-trash-o "></i> Xóa</button>
                        </td>
                      </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>

              </form>
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
