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
                    <a class="nav-link page-scroll active" href="${pageContext.request.contextPath}">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="Classes">Lớp học</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="ExamSchedules">Lịch thi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="ExamHistory">Lịch sử thi</a>
                </li>
                <li class="nav-item">
                    <c:if test="${loginedUser.role == 'gv' || loginedUser.role == 'ad'}">
                        <a class="nav-link page-scroll" href="Dashboard">Quản lý</a>
                    </c:if>
                    
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

                    <c:if test="${loginedUser.role == 'gv'}">
                <a href="TeacherProfile" class="usernameZ">
                    </c:if>
                    <c:if test="${loginedUser.role == 'ad'}">
                <a href="AdminProfile" class="usernameZ">
                    </c:if>
                    <c:if test="${loginedUser.role == 'sv'}">
                <a href="StudentProfile" class="usernameZ">
                    </c:if>
                
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


    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="text-container">
                            <h1><span class="turquoise">Thi trắc nghiệm</span> <br> Trực tuyến</h1>
                            <p class="p-large">Website thi trắc nghiệm trực tuyến dành cho sinh viên đại học</p>
                            <a class="btn-solid-lg page-scroll" href="#">TÌM HIỂU THÊM</a>
                        </div> <!-- end of text-container -->
                    </div> <!-- end of col -->
                    
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </div> <!-- end of header-content -->
    </header> <!-- end of header -->
    <!-- end of header -->


     <!-- Footer -->
     <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="footer-col">
                        <h4>About</h4>
                        <p>Website thi trắc nghiệm trực tuyến ứng dụng công nghệ lập trình Java web</p>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col middle">
                        <h4>Hướng dẫn</h4>
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Hướng dẫn cho giáo viên <a class="turquoise" href="#">Xem tại đây</a></div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Hướng dẫn cho sinh viên <a class="turquoise" href="#">Xem tại đây</a></div>
                            </li>
                        </ul>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col last">
                        <h4>Liên hệ</h4>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-facebook-f fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-twitter fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-google-plus-g fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-instagram fa-stack-1x"></i>
                            </a>
                        </span>
                        <span class="fa-stack">
                            <a href="#your-link">
                                <i class="fas fa-circle fa-stack-2x"></i>
                                <i class="fab fa-linkedin-in fa-stack-1x"></i>
                            </a>
                        </span>
                    </div> 
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of footer -->  
    <!-- end of footer -->

    <style>
        .footer{
            margin-top: 80px;
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