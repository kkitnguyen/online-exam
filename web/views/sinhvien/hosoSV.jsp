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
        .btn-success{
            background-color: #00bfd8;
            border-color: #00bfd8;
        }
        .btn-success:hover{
            background-color: #05a6bb;
            border-color: #05a6bb;
        }

        .divAnhdaidien{
            text-align: center;
        }
        .anhdaidien {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: solid #ececec 7px;
        }
    </style>

    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row" id="hoso">
                    <div class="col-lg-6">
                        <h2>
                            <span class="turquoise">Hồ sơ cá nhân</span>
                        </h2>
                    </div> <!-- end of col -->
                    <div class="col-lg-6" style="text-align: end;">
                        <button class="btn btn-success" onclick="editProfile()">Chỉnh sửa hồ sơ</button>
                    </div>

                    <div class="col-lg-12 divAnhdaidien" >
                        <c:if test="${user.image == null || user.image ==''}">
                            <img src="uploads/images/default_avatar.png" class="anhdaidien">
                        </c:if>
                        <c:if test="${user.image != null && user.image !=''}">
                            <img src="uploads/images/${user.image}" class="anhdaidien">
                        </c:if>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-panel">
                                <input type="text" value="editHoso" name="action" hidden>
                                Mã sinh viên
                                <input type="text" name="masv" value="${sv.masv}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Họ và tên
                                <input type="text" name="hoten" value="${sv.hoten}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Ngày sinh
                                <input type="date" name="ngaysinh" value="${sv.ngaysinh}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Giới tính
                                <input type="text" name="gioitinh" value="<c:if test="${sv.gioitinh == true}">Nam</c:if>
                                    <c:if test="${sv.gioitinh == false}">Nữ</c:if>" 
                                    autocomplete="off" class="form-control placeholder-no-fix" disabled>
                                <br>
                                Số CMND
                                <input type="text" name="cmnd" value="${sv.cmnd}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Địa chỉ email
                                <input type="text" name="email" value="${sv.email}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Số điện thoại
                                <input type="text" name="phone" value="${sv.phone}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Quê quán
                                <input type="text" name="quequan" value="${sv.quequan}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                        </div>    
                    </div> <!-- end of col -->
                    
                </div> <!-- end of row -->

                <div class="row" id="suahoso" hidden>
                    <div class="col-lg-6">
                        <h2>
                            <span class="turquoise">Chỉnh sửa hồ sơ</span>
                        </h2>
                    </div> <!-- end of col -->
                    
                    <div class="col-lg-12 divAnhdaidien" >
                        <c:if test="${user.image == null || user.image ==''}">
                            <img src="uploads/images/default_avatar.png" class="anhdaidien">
                        </c:if>
                        <c:if test="${user.image != null && user.image !=''}">
                            <img src="uploads/images/${user.image}" class="anhdaidien">
                        </c:if>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-panel">
                            <form action="StudentProfile" method="POST" id="editProfile" enctype="multipart/form-data">
                                <input type="text" value="editHoso" name="action" hidden>
                                Mã sinh viên
                                <input type="text" name="masv" value="${sv.masv}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Họ và tên
                                <input type="text" name="hoten" value="${sv.hoten}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Ngày sinh
                                <input type="date" name="ngaysinh" value="${sv.ngaysinh}" autocomplete="off" class="form-control placeholder-no-fix" >
                                <br>
                                Giới tính
                                <select name="gioitinh" class="form-control placeholder-no-fix">
                                    <option value="nam" <c:if test="${sv.gioitinh == true}">selected</c:if> >Nam</option>
                                    <option value="nu" <c:if test="${sv.gioitinh == false}">selected</c:if>>Nữ</option>
                                </select>
                                <br>
                                Số CMND
                                <input type="text" name="cmnd" value="${sv.cmnd}" autocomplete="off" class="form-control placeholder-no-fix" readonly>
                                <br>
                                Địa chỉ email
                                <input type="text" name="email" placeholder="Nhập địa chỉ email (Bắt buộc)" value="${sv.email}" autocomplete="off" class="form-control placeholder-no-fix" required>
                                <br>
                                Số điện thoại
                                <input type="text" name="phone" placeholder="Nhập số điện thoại" value="${sv.phone}" autocomplete="off" class="form-control placeholder-no-fix" >
                                <br>
                                Quê quán
                                <input type="text" name="quequan" placeholder="Nhập quê quán" value="${sv.quequan}" autocomplete="off" class="form-control placeholder-no-fix" >
                                <br>
                                Ảnh đại diện
                                <input type="file" name="file" class="form-control placeholder-no-fix" >
                                <br>
                                <input type="text" name="userid" value="${sv.userid}" hidden>
                                <input class="btn btn-secondary" type="button" onclick="cancelEdit()" value="Hủy bỏ">
                                <input class="btn btn-success" type="submit" value="Lưu">
                                
                            </form>
                        </div>    
                    </div> <!-- end of col -->
                   
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </div> <!-- end of header-content -->
    </header> <!-- end of header -->
    <!-- end of header -->

     <script>
         function editProfile(){
            document.getElementById("hoso").hidden = true;
            document.getElementById("suahoso").hidden = false;
         }
         function cancelEdit(){
            document.getElementById("hoso").hidden = false;
            document.getElementById("suahoso").hidden = true;
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