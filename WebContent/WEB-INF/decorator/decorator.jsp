<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

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
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/icon-font.css">
        <!-- end -->
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/decorator/decorator.css">
        <decorator:head/>
    </head>

    <body>
    	<c:set var="id" value="${id}" />
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
                            <div class="collapse navbar-collapse">
                                <ul class="nav pull-left">
                                    <li class="active"><a href="/GardenPlatformWeb/home.do">HOME</a></li>
                                    <li><a href="/GardenPlatformWeb/my_apps/index.do">MY APPS</a></li>
                                    <li><a href="/GardenPlatformWeb/store/index.do">STORE</a></li>
                                    <li><a href="/GardenPlatformWeb/developer/index.do">DEVELOPER</a></li>
                                </ul>
                               	<c:if test="${!empty id}">
                                    <a id="signoutBtn" class="navbar-form pull-right" href="/GardenPlatformWeb/signout.do" style="margin-top:10px;"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                               		<a class="navbar-form pull-right" href="#">
                               			<img src="/GardenPlatformWeb/resource/img/mini_user.png" width="40" height="40" alt="">
                               			${id}
                               		</a>
                               	</c:if>
                               	<c:if test="${empty id}">
                                	<form class="navbar-form pull-right">
	                                    <a id="signupModalBtn" class="btn btn-primary" data-toggle="modal" href="#signupModal">SIGN UP</a>
	                                </form>
	                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </header>


    		<decorator:body/>
    	
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
        <script src="/GardenPlatformWeb/resource/js/decorator/decorator.js"></script>
    </body>
</html>