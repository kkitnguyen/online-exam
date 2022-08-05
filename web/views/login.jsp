<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Đăng nhập</title>

  <!-- Favicons -->
  <link rel="shortcut icon" type="image/png" href="style-quanly/img/favicon.png"/>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/common/style-quanly/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/common/style-quanly/css/style-responsive.css" rel="stylesheet">
  
</head>

<body>
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="${pageContext.request.contextPath}/login" method="POST">
        <h2 class="form-login-heading">Đăng NHẬP</h2>
        
        <div class="login-wrap">
          <div style="margin-bottom: 10px; font-weight: bold; color: red; margin-left: 10px;">
            <span>${errorMessage}</span>
          </div>

          <input name="redirectId" value="${param.redirectId}" hidden>
          <input type="text" name="username" class="form-control" placeholder="Username" autofocus required>
          <br>
          <input type="password" name="password" class="form-control" placeholder="Password" required>
          <label class="checkbox">
            <input type="checkbox" value="remember-me"> Nhớ mật khẩu
            <span class="pull-right">
            <a data-toggle="modal" href="login.html#myModal"> Quên mật khẩu??</a>
            </span>
            </label>
          <button class="btn btn-theme btn-block" href="/" type="submit"><i class="fa fa-lock"></i> ĐĂNG NHẬP</button>
          <hr>
          <div class="registration">
            <a class="" href="#">
              Liên hệ
              </a>
          </div>
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Quên mật khẩu?</h4>
              </div>
              <div class="modal-body">
                <p>Điền email của bạn để thay đổi mật khẩu.</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Bỏ qua</button>
                <button class="btn btn-theme" type="button">Tiếp tục</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/common/style-quanly/lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/common/style-quanly/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("${pageContext.request.contextPath}/common/images/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>
