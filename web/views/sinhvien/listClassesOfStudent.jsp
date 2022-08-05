<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Create a stylish landing page for your business startup and get leads for the offered services with this HTML landing page template.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta property="og:type" content="article" />

    <!-- Website Title -->
    <title>Trang chủ - Thi trắc nghiệm trực tuyến</title>
    
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,600,700,700i&amp;subset=latin-ext" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/style-homepage/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/style-homepage/css/fontawesome-all.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/style-homepage/css/swiper.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/style-homepage/css/magnific-popup.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/style-homepage/css/styles.css" rel="stylesheet">
	
    <!-- Favicon  -->
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/common/style-homepage/images/favicon.png">
</head>
<body data-spy="scroll" data-target=".fixed-top">
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Evolo</a> -->

        <!-- Image Logo -->
        <a class="navbar-brand logo-image" href="${pageContext.request.contextPath}"><h3><span class="turquoise">Online Quiz-Exam</span></h3></a>
        
        <!-- Mobile Menu Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-awesome fas fa-bars"></span>
            <span class="navbar-toggler-awesome fas fa-times"></span>
        </button>
        <!-- end of mobile menu toggle button -->

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${pageContext.request.contextPath}">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="active nav-link page-scroll active" href="Classes">Lớp học</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="ExamSchedules">Lịch thi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="ExamHistory">Lịch sử thi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="#">Liên hệ</a>
                </li>
                <li class="nav-item">
                    <c:if test="${loginedUser != null}">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </c:if>
                    <c:if test="${loginedUser == null}">
                        <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    </c:if>
                    
                </li>
            </ul>

            <c:if test="${loginedUser != null}">
                <style>
                    .divavatar:hover {
                        opacity: 0.8;
                    }
                    .divavatar {
                        padding: 2px 5px;
                        background: aliceblue;
                        border-radius: 25px;
                    }
                    img.avatarZ {
                        width: 38px;
                        height: 38px;
                        border-radius: 50%;
                        object-fit: cover;
                        border: solid #00bfd8 2px;
                    }
                    a.usernameZ {
                        text-decoration: none;
                    }
                </style>
                <a href="StudentProfile" class="usernameZ">
                    <div class="divavatar">
                        ${loginedUser.username}
                        <c:if test="${user.image == null || user.image ==''}">
                            <img src="uploads/images/default_avatar.png" alt="" class="avatarZ">
                        </c:if>
                        <c:if test="${user.image != null && user.image !=''}">
                            <img src="uploads/images/${user.image}" alt="" class="avatarZ">
                        </c:if>
                        
                    </div>
                </a>
            </c:if>

        </div>
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

    <style>
        body {
            background: url(${pageContext.request.contextPath}/common/style-homepage/images/ok-background.jpg) center center no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
        .header{
            background: none;
        }
        body, p{
            font-family: inherit;
        }
        .lambaithi{
            background: gold;
            border: gold;
            color: black;
        }
        .lambaithi:hover{
            background: rgb(214, 182, 3);
            border:  rgb(214, 182, 3);
            color: black;
        }
        .btn-success{
            background-color: #00bfd8;
            border-color: #00bfd8;
        }
        .btn-success:hover{
            background-color: #05a6bb;
            border-color: #05a6bb;
        }
        .dsbaithi{
            padding: 0px 5px;
            background: khaki;
        }
        .dsbaithi:hover{
            padding: 0px 5px;
            background: rgb(233, 216, 65);
        }
    </style>

    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h2>
                            <span class="turquoise">Danh sách lớp</span>
                        </h2>
                    </div> <!-- end of col -->

                    <div class="col-lg-6" style="text-align: end;">
                        <a href="${pageContext.request.contextPath}/JoinToClass" > <button class="btn btn-success">Tham gia lớp</button></a> 
                    </div> <!-- end of col -->

                    <div class="col-lg-12">
                    
                        <div class="form-panel">
                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                <tr>
                                    <th> Mã Lớp</th>
                                    <th> Tên lớp</th>
                                    <th> Môn học</th>
                                    <th> Giáo viên</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listLophoc}" var="lop">
                                        <tr>
                                            <td>${lop.classid}</td>
                                            <td>${lop.classname}</td>
                                            <td>${lop.monhoc.name}</td>
                                            <td>${lop.nhanvien.hoten}</td>
                                            <td> 
                                                <a data-toggle="modal" href="#DSdethi${lop.classid}">
                                                    <button class="btn dsbaithi">DS bài thi</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>  
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- end of col -->
                    
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </div> <!-- end of header-content -->
    </header> <!-- end of header -->
    <!-- end of header -->
    
    <!-- Modal Danh sách bài thi -->
    <c:forEach items="${listLophoc}" var="lop">
        <div aria-hidden="true" class="modal fade" id="DSdethi${lop.classid}" tabindex="-1" aria-labelledby="exampleModalXlLabel" style="display: none;" role="dialog">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">

                    <div class="modal-header" style="background: bisque;">
                        <h5 class="modal-title h4" id="exampleModalXlLabel">Danh sách bài thi - Lớp ${lop.classname} </h5>
                        <button type="button" class="btn" data-dismiss="modal" style="border-color: gray; padding: 3px 10px;">X</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-panel">
                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                <tr>
                                    <th> Tên bài thi</th>
                                    <th> Loại </th>
                                    <th> TG mở đề</th>
                                    <th> TG đóng đề</th>
                                    <th> Thời gian</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listKetqua}" var="kq">
                                        <c:if test="${kq.lophoc.classid == lop.classid}">
                                            <form action="doExam" method="POST">
                                                <tr>
                                                    <td>${kq.dethi.name}</td>
                                                    <td>
                                                        <c:if test="${kq.dethi.type == true}"> Chính thức </c:if>
                                                        <c:if test="${kq.dethi.type == false}"> Thi thử </c:if>
                                                    </td>
                                                    <td name="starttime">${kq.dethi.starttime}</td>
                                                    <td name="endtime">${kq.dethi.endtime}</td>
                                                    <td>${kq.dethi.time} phút</td>
                                                    <td> 
                                                        <input type="text" name="resultID" value="${kq.id}" hidden>
                                                        <input type="text" name="examID" value="${kq.dethi.id}" hidden>
                                                        <button type="submit" class="btn lambaithi"> Làm bài thi </button>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:if>
                                    </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- Modal Danh sách bài thi -->

     
    <style>
        .copyright{
            margin-top: 300px;
        }
    </style>

    <!-- Copyright -->
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="p-small"> <a href="https://facebook.com/NgXuanKhuong">Liên hệ với nhóm phát triển</a></p>
                </div> <!-- end of col -->
            </div> <!-- enf of row -->
        </div> <!-- end of container -->
    </div> <!-- end of copyright --> 
    <!-- end of copyright -->
    
    <script>
        //Hiển thị lại ngày tháng cho đẹp
        var startTime = document.getElementsByName("starttime");
        var endTime = document.getElementsByName("endtime");
  
        for(var i = 0; i<startTime.length ; i++)
        {
            var oldStartTime = startTime[i].innerHTML;
            var gio = oldStartTime.slice(11, 16);
            var ngay = oldStartTime.slice(8, 10);
            var thang = oldStartTime.slice(5, 7);
            var nam = oldStartTime.slice(0, 4);
            
            var newStartTime = gio + " - " + ngay + "/" + thang + "/" + nam;
  
            if(oldStartTime == "")
              startTime[i].innerHTML = "";
            else startTime[i].innerHTML = newStartTime;
        }
  
        for(var i = 0; i<endTime.length ; i++)
        {
            var oldEndTime = endTime[i].innerHTML;
            var gio = oldEndTime.slice(11, 16);
            var ngay = oldEndTime.slice(8, 10);
            var thang = oldEndTime.slice(5, 7);
            var nam = oldEndTime.slice(0, 4);
            
            var newEndTime = gio + " - " + ngay + "/" + thang + "/" + nam;
  
            if(oldEndTime == "")
              endTime[i].innerHTML = "";
            else endTime[i].innerHTML = newEndTime;
        }
  
      </script>
    	
    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="${pageContext.request.contextPath}/common/style-homepage/js/scripts.js"></script> <!-- Custom scripts -->

</body>
</html>