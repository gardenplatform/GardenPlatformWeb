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
                                <a class="brand" href="#"><img src="/GardenPlatformWeb/resource/img/logo.png" width="50" height="50" alt="">Garden</a>
                            </div>
                            <div class="collapse navbar-collapse pull-right">
                                <ul class="nav pull-left">
                                    <li class="active"><a href="#">HOME</a></li>
                                    <li><a href="/GardenPlatformWeb/my_apps/index.do">MY APPS</a></li>
                                    <li><a href="/GardenPlatformWeb/store/index.do">STORE</a></li>
                                    <li><a href="/GardenPlatformWeb/developer/index.do">DEVELOPER</a></li>
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

	<!-- content23 -->
            <section class="content-23 v-center">
            	<div class="container" >
	                <div id="bgVideo" class="background" ></div>
	                <div id="formBox" class="col-sm-5 pull-right">
						<h1 style="color:#1ABC9C">Garden Platform</h1>
			            <p style="color:#555;">
							You have the design, you have the code. We’ve created the product that will help your startup to look even better.
			            </p>
	                    <div class="signin-form">
                            <div class="form-group">
                                <input class="form-control" id="signinId" type="text" placeholder="ID">
                            </div>
                            <div class="form-group">
                                <div>
                                    <input type="password" id="signinPwd" class="form-control" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" id="signinBtn" class="btn btn-block btn-info">Sign in</button>
                            </div>
	                    </div>
	                    <div class="additional-links" style="color:#555; margin-bottom:30px;">
	                        By signing up you agree to <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>
	                    </div>
	                </div>
                </div>
            </section>

	
            <section class="price-1">
                <div class="container" >
                    <h3>Take a look to our Plans</h3>
                    <p class="lead">
                        This is a probably the best plans ever born
                    </p>
                    <div class="row plans">
                        <div class="col-sm-4">
                            <div class="plan">
                            	<img src="/GardenPlatformWeb/resource/img/icons/iPhone@2x.png" alt="Compas">
                                <div class="title">MY APPS</div>
                                <div class="description">
                                	샬라샬라 설명
                                </div>
                                <a class="btn btn-primary" href="#">Go to MY APPS page</a>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="plan">
                            	<img src="/GardenPlatformWeb/resource/img/icons/Pocket@2x.png" alt="Compas">
                                <div class="title">APP STORE</div>
                                <div class="description">
                                	샬라샬라 설명
                                </div>
                                <a class="btn btn-primary" href="#">Go to STORE page</a>
                            </div>
                        </div>
                       	<div class="col-sm-4">
                            <div class="plan">
                            	<img src="/GardenPlatformWeb/resource/img/icons/Settings@2x.png" alt="Compas">
                                <div class="title">DEVELOPER</div>
                                <div class="description">
                                	샬라샬라 설명
                                </div>
                                <a class="btn btn-primary" href="#">Go to DEVELOPER page</a>
                            </div>
                        	<div class="ribbon">NEW</div>
                        </div>
                    </div>
                </div>
            </section>


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
		
		<!-- Modal -->
		<div aria-hidden="true" aria-labelledby="signupLabel" role="dialog" tabindex="-1" id="signupModal" class="modal fade">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">Sign up</h4>
		            </div>
		            <div class="modal-body">
		                <input type="text" id="signupId" name="id" placeholder="ID" autocomplete="off" class="form-control placeholder-no-fix" autofocus>
		                <input type="password" id="signupPwd1" name="pwd1" placeholder="Password (6 or more characters)" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="password" id="signupPwd2" name="pwd2" placeholder="Password Confirm" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="text" id="signupEmail" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="text" id="signupPhone" name="phone" placeholder="Phone Number" autocomplete="off" class="form-control placeholder-no-fix">
		            </div>
		            <div class="modal-footer">
		            	<span id="signupMsg" class="pull-left"></span>
		                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                <button class="btn btn-primary" type="button" id="signupBtn">Submit</button>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- modal -->

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.10.2.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/modernizr.custom.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/startup-kit.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/jquery.backgroundvideo.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
    </body>
</html>