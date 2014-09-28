<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Garden Platform</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <link rel="shortcut icon" href="/GardenPlatformWeb/resource/img/favicon.ico">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/bootstrap.css">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/flat-ui.css">
        <!-- Using only with Flat-UI (free)-->
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/icon-font.css">
        <!-- end -->
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/global/global.css">
    </head>

    <body>
        <div class="page-wrapper">
            <!-- header-11 -->
            <header class="header-11">
                <div class="container">
                    <div class="row">
                        <div class="navbar col-sm-12" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle"></button>
                                <a class="brand" href="/GardenPlatformWeb/main.do"><img src="/GardenPlatformWeb/resource/img/logo.png" width="50" height="50" alt="">Garden</a>
                            </div>
                            <div class="collapse navbar-collapse pull-right">
                                <ul class="nav pull-left">
                                    <li><a href="/GardenPlatformWeb/main.do">HOME</a></li>
                                    <li><a href="/GardenPlatformWeb/my_apps/index.do"">MY APPS</a></li>
                                    <li><a href="/GardenPlatformWeb/store/index.do">STORE</a></li>
                                    <li class="active"><a href="#">DEVELOPER</a></li>
                                </ul>
                                <form class="navbar-form pull-left">
                                    <a id="signupModalBtn" class="btn btn-primary" data-toggle="modal" href="#signupModal">SIGN UP</a>
                                </form>
                               	<h1>${id}</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <div class="container">
		     <div id="sidebar" class="nav-collapse " tabindex="5000" style="overflow: hidden; outline: none;">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li class="mt">
                      <a class="active" href="#">
                          <i class="fa fa-dashboard"></i>
                          <span>Developer</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>

			<section id="main-content"> 
				<section class="wrapper">
		                  Developer 컨텐츠 
		                  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		                  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		                  <br><br><br><br><br><br><br><br>
				</section> 
			</section>
    	</div>
    	<!-- footer-2 -->
			<footer class="footer-2 bg-midnight-blue">
				<div class="container">
					<nav class="pull-left">
					<ul>
						<li class="active"><a href="/GardenPlatformWeb/main.do">HOME</a></li>
						<li><a href="/GardenPlatformWeb/my_apps/index.do">MY APPS</a></li>
						<li><a href="/GardenPlatformWeb/store/index.do">STORE</a></li>
						<li><a href="/GardenPlatformWeb/developer/index.do">DEVELOPER</a></li>
					</ul>
					</nav>
					<div class="social-btns pull-right">
						<a href="#"><div class="fui-vimeo"></div>
						<div class="fui-vimeo"></div></a> <a href="#"><div
							class="fui-facebook"></div>
						<div class="fui-facebook"></div></a> <a href="#"><div
							class="fui-twitter"></div>
						<div class="fui-twitter"></div></a>
					</div>
					<div class="additional-links">
						Be sure to take a look to our <a href="#">Terms of Use</a> and <a
							href="#">Privacy Policy</a>
					</div>
				</div>
			</footer>
    </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.10.2.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/modernizr.custom.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/startup-kit.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/jquery.backgroundvideo.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
        
        <!-- left slider animation js -->
        <script class="include" type="text/javascript" src="/GardenPlatformWeb/resource/js/global/jquery.dcjqaccordion.2.7.js"></script>
        <script src="/GardenPlatformWeb/resource/js/global/jquery.scrollTo.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/global/global.js"></script>
        <script src="/GardenPlatformWeb/resource/js/global/jquery.nicescroll.js" type="text/javascript"></script>
        
    </body>
</html>