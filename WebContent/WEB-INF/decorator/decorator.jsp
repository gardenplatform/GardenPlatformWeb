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
        
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.11.0.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        
        <decorator:head/>
    </head>

    <body>
        <header class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/GardenPlatformWeb/home.do"><img src="/GardenPlatformWeb/resource/img/logo.png">Garden</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                	<li class="dropdown" id="nav-myapps">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Apps <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a id="app" data-toggle="modal" data-target="#app_modal">앱 등록</a></li>
                            <li class="divider"></li>
						    <c:forEach var="item" items="${sessionScope.appList}">
                            	<li id="nav-myapps"><a href="/GardenPlatformWeb/my_apps/index.do?appName=${item}">${item}</a></li>
						    </c:forEach>
                        </ul>
                    </li>
               		<li id="nav-store"><a href="/GardenPlatformWeb/store/index.do">Store</a></li>
               		<li id="nav-developer"><a href="/GardenPlatformWeb/developer/index.do">Developer</a></li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown" id="nav-userinfo">
                		<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="name" style="padding: 0px 0px 0px 0px;">
                		<span style="margin:20px;">${sessionScope.userID}</span>
                		<img class="img" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/p50x50/10565031_677986682295089_5741239171452330999_n.jpg?oh=faa04656774966b37e0299b613620304&amp;oe=54CA4714&amp;__gda__=1420806770_6480a830c55fb7891ca0298622dee634" alt="">
                		</a>
                		<ul class="dropdown-menu">
                			<li><a href="/GardenPlatformWeb/user/profile.do">내 정보</a>
                			</li><li><a href="/GardenPlatformWeb/signout.do">로그아웃</a>
                		</ul>
                	</li>
                </ul> 
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
		
		<div class="modal fade" id="app_modal">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		            <div class="modal-body">
		            	<div class="row">
							<div class="col-md-6">
								<a href="#" class="thumbnail" data-toggle="modal" data-target="#web_register" data-dismiss="modal"> 
									<img src="/GardenPlatformWeb/resource/img/www.png" style="width:200px; height:200px">
								</a>
							</div>
							<div class="col-md-6">
								<a href="#" class="thumbnail" data-toggle="modal" data-target="#native_register" data-dismiss="modal">
									<img src="/GardenPlatformWeb/resource/img/icons/iMac@2x.png" style="width:200px; height:200px">
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<h4 style="text-align:center;">Web App</h4>
							</div>
							<div class="col-md-6">
								<h4 style="text-align:center;">Native App</h4>
							</div>
						</div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="modal fade" id="web_register">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">WebApp 등록</h4>
		            </div>
		            <div class="modal-body">
		            	
		            	<div id="appname_div" class="form-group has-feedback">
							<label class="control-label">App Name <span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="" data-original-title="사용할 App의 이름"></span></label>
							<input id="appName" class="form-control" placeholder="Snac"></input>
							<span id="appname_success" class="glyphicon glyphicon-ok form-control-feedback hidden"></span>
							<span id="appname_fail" class="glyphicon glyphicon-remove form-control-feedback hidden"></span>
						</div>
						 
						<div id="appurl_div" class="form-group has-feedback">
							<label class="control-label">URL <span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="" data-original-title="사용할 App의 이름"></span></label>
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="type">http://</button>
							        <ul class="dropdown-menu" id="typedropdown">
							          <li><a href="#">http://</a></li>
							          <li><a href="#">https://</a></li>
							        </ul>
								</div>
								<input id="appUrl" class="form-control" type="tel" placeholder="www.snac.org"></input>
							</div>
							<span id="appurl_success" class="glyphicon glyphicon-ok form-control-feedback hidden"></span>
							<span id="appurl_fail" class="glyphicon glyphicon-remove form-control-feedback hidden"></span>
						</div>
						
						<div id="reurl_div" class="form-group has-feedback">
							<label class="control-label">Redirect URL <span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="top" title="" data-original-title="사용할 App의 이름"></span></label>
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="re_type">http://</button>
							        <ul class="dropdown-menu" id="re_typedropdown">
							          <li><a href="#">http://</a></li>
							          <li><a href="#">https://</a></li>
							        </ul>
								</div>
								<input id="reUrl" class="form-control" type="tel" placeholder="redirect URL"></input>
							</div>
							<span id="reurl_success" class="glyphicon glyphicon-ok form-control-feedback hidden"></span>
							<span id="reurl_fail" class="glyphicon glyphicon-remove form-control-feedback hidden"></span>
						</div>
						
		            </div>
		            <div class="modal-footer">
	                	<button class="btn btn-mint" type="button" id="btn_web_register" disabled="disabled">등록</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="modal fade" id="native_register">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">NativeApp 등록</h4>
		            </div>
		            <div class="modal-body">
		            	<div class="form-group row">
							<h5 class="col-xs-4">App Name<span class="glyphicon glyphicon-info-sign"></span></h5>
							<div class="col-xs-8">
								<input id="appName" class="form-control" type="tel" placeholder="Snac"></input>
							</div>
						</div>
						
						<div class="form-group row">
							<h5 class="col-xs-4">URL<span class="glyphicon glyphicon-info-sign"></span></h5>
							<div class="col-xs-8">
								<input id="appUrl" class="form-control" type="tel" placeholder="www.snac.org"></input>
							</div>
						</div>
						
						<div class="form-group row">
							<h5 class="col-xs-4">Redirect URL<span class="glyphicon glyphicon-info-sign"></span></h5>
							<div class="col-xs-8">
								<input id="reUrl" class="form-control" type="tel" placeholder="Re..."></input>
							</div>
						</div>
		            </div>
		            <div class="modal-footer">
	                	<button class="btn btn-mint" type="button" id="btn_native_register">등록</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		            </div>
		        </div>
		    </div>
		</div>
			
		<!-- script -->
        <script src="/GardenPlatformWeb/resource/js/decorator/decorator.js"></script>
    </body>
</html>