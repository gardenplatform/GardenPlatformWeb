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
        <link rel="shortcut icon" href="/GardenPlatformWeb/resource/img/favicon.png">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/bootstrap.css">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/decorator/decorator.css">
        <!-- jquery.js가 맨 처음에 와야 기능이 정상동작함. -->
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.11.0.min.js"></script>
        
        <decorator:head/>
    </head>

    <body>
    	<c:set var="id" value="${id}" />
        <header class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/GardenPlatformWeb/main.do"><img src="/GardenPlatformWeb/resource/img/logo.png">Garden</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
               		<li id="nav-myapps"><a href="/GardenPlatformWeb/my_apps/index.do">My Apps</a></li>
               		<li id="nav-store"><a href="/GardenPlatformWeb/store/index.do">Store</a></li>
               		<li id="nav-developer"><a href="/GardenPlatformWeb/developer/index.do">Developer</a></li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown" id="nav-userinfo">
                		<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="name" style="padding: 0px 0px 0px 0px;">
                		<img class="img" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/p50x50/10565031_677986682295089_5741239171452330999_n.jpg?oh=faa04656774966b37e0299b613620304&amp;oe=54CA4714&amp;__gda__=1420806770_6480a830c55fb7891ca0298622dee634" alt="">
                		</a>
                		<ul class="dropdown-menu">
                			<li><a href="/info/userinfo">내 정보</a>
                			</li><li><a href="#">로그아웃</a>
                		</ul>
                	</li>
                </ul> 
                <form class="navbar-form navbar-right">
			  	<a id="signupModalBtn" class="btn btn-primary" data-toggle="modal" href="#signupModal">SIGN UP</a>
			  </form>
               <form class="navbar-form navbar-right" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>
		      
            </div><!--/.nav-collapse -->
        </div>
    </header>
			<div class="wrapper">
    			<decorator:body/>
    		</div>
			<!-- footer -->
			<div class="undermargin"></div>
			
			<div class="footer">
				<div class="container">
					<h5 class="text-right"><small>Copyright 2014 Samsung Software Membership, All Rights Reserved.</small></h5>
					<h6 class="text-right"><small>Developed by Sungjin Park, Juyoung Park, Sungho Park, Sangwoo Jun</small></h6>
				</div>
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
		                <input type="text" id="signupName" name="name" placeholder="Name" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="text" id="signupEmail" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="text" id="signupPhone" name="phone" placeholder="Phone Number" autocomplete="off" class="form-control placeholder-no-fix">
		                <input type="text" id="signupClass" name="class" placeholder="Class (ex:23-1)" autocomplete="off" class="form-control placeholder-no-fix">
		                <span class="col-sm-2">
		                	<input type="radio" name="gender" id="signupMale" value="Male" data-toggle="radio" checked> <strong>Male</strong>
		                </span>
		                <span class="col-sm-3">
		                	<input type="radio" name="gender" id="signupFemale" value="Female" data-toggle="radio"> <strong>Female</strong>
		                </span>
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
        
        <script src="/GardenPlatformWeb/resource/js/decorator/decorator.js"></script>
        <script src="/GardenPlatformWeb/resource/js/decorator/bootstrap.min.js"></script>
    </body>
</html>