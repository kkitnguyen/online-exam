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
  <title>Bảng điểm</title>

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
                <!--Bảng danh sách đề thi-->
                <h4 class="gen-case" style="color: darkcyan;"> 
                  <b>BẢNG ĐIỂM: ${dethi.name}</b>

                  <form action="#" class="pull-right mail-src-position">
                    <div class="input-append">
                      <input type="text" name="searchExam" class="form-control " placeholder="Search Exam">
                    </div>
                  </form>
                </h4>
                

                <table class="table table-striped table-advance table-hover" >
                  <thead>
                    <tr>
                      <th> Mã SV </th>
                      <th> Họ và tên </th>
                      <th> Ngày thi</th>
                      <th> TG hoàn thành</th>
                      <th> Điểm</th>
                      <th> Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${listKetqua}" var="kq">
                      <tr>
                        <td> ${kq.sinhvien.masv} </td>
                        <td> ${kq.sinhvien.hoten} </td>
                        <td name="ngaythi">${kq.ngaythi}</td>
                        <td name="tglambai">${kq.tglambai}</td>
                        <td><span class="label label-info label-mini"> ${kq.diem} </span></td>
                        <td >
                          <c:if test="${kq.camthi == true}">
                            <a href="ViewResult?action=chothi&classID=${kq.lophoc.classid}&examID=${kq.dethi.id}&idKQ=${kq.id}"
                              class="btn btn-round btn-success btn-xs">Cho thi</a>
                          </c:if>
                          <c:if test="${kq.camthi == false}">
                            <a href="ViewResult?action=camthi&classID=${kq.lophoc.classid}&examID=${kq.dethi.id}&idKQ=${kq.id}" 
                              class="btn btn-round btn-danger btn-xs">Cấm thi</a>
                          </c:if>
                        </td>
                      </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
                <a href="ClassInfor?classID=${lophoc.classid}" class="btn btn-default btn-round"> Quay lại</a>
                <a href="ExportToExcel?classID=${lophoc.classid}&examID=${dethi.id}" class="btn btn-success btn-round"> Xuất Excel</a>
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


  <span id="message">${message}</span>

  <script>
    var message = document.getElementById("message").innerHTML;
    if(message != "") alert(message);
  </script>

  <script>
    //Convert thời gian làm bài: số giây thành phút - giây
    var listTime = document.getElementsByName("tglambai");

    for(var i = 0; i<listTime.length ; i++)
    {
        var time = parseInt(listTime[i].innerHTML) ;
        var phut = Math.floor(time/60);
        var giay = time%60;
        var tglambai = phut + " phút " + giay + " giây"; 

        if(listTime[i].innerHTML=="")
            listTime[i].innerHTML = "";
        else listTime[i].innerHTML = tglambai;
    }

    //Hiển thị lại ngày thi cho đẹp
    var ngaythi = document.getElementsByName("ngaythi");
    for(var i = 0; i<ngaythi.length ; i++)
    {
        var oldngaythi = ngaythi[i].innerHTML;
        var gio = oldngaythi.slice(11, 16);
        var ngay = oldngaythi.slice(8, 10);
        var thang = oldngaythi.slice(5, 7);
        var nam = oldngaythi.slice(0, 4);
        
        var newngaythi = gio + " - " + ngay + "/" + thang + "/" + nam;

        if(oldngaythi == "")
          ngaythi[i].innerHTML = "";
        else ngaythi[i].innerHTML = newngaythi;
    }

  </script>

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
