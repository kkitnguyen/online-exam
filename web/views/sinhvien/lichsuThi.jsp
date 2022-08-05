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
                    <a class="nav-link page-scroll" href="Classes">Lớp học</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="ExamSchedules">Lịch thi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll active" href="ExamHistory">Lịch sử thi</a>
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
    </style>

    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                       
                        <h2><span class="turquoise">Lịch sử làm bài thi - kiểm tra</span></h2>
                       
                    </div> <!-- end of col -->
                    <div class="col-lg-12">
                    
                        <div class="form-panel">
                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                <tr>
                                    <th> Tên bài thi</th>
                                    <th> Ngày thi </th>
                                    <th> Môn học</th>
                                    <th> TG làm bài</th>
                                    <th> Điểm</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listLichsuthi}" var="ls">
                                        <tr>
                                            <td>${ls.examname}</td>
                                            <td name="ngaythi">${ls.ngaythi}</td>
                                            <td>${ls.mon}</td>
                                            <td name="tglambai">${ls.tglambai}</td>
                                            <td style="color: forestgreen; font-weight: bold;">${ls.diem}</td>
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
            ngaythi[i].innerHTML = newngaythi;
        }

    </script>

     
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