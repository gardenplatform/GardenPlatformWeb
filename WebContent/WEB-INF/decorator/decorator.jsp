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
                <a class="navbar-brand" href="/GardenPlatformWeb/home.do"><img src="/GardenPlatformWeb/resource/img/logo.png">Garden</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                	<li class="dropdown" id="nav-myapps">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Apps <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a id="app" data-toggle="modal" data-target="#app_modal">앱 등록</a></li>
                            <li class="divider"></li>
                            <li id="nav-myapps"><a href="/GardenPlatformWeb/my_apps/index.do">Sample App1</a></li>
                        </ul>
                    </li>
               		<li id="nav-store"><a href="/GardenPlatformWeb/store/index.do">Store</a></li>
               		<li id="nav-developer"><a href="/GardenPlatformWeb/developer/index.do">Developer</a></li>
                </ul>
                
                <ul class="nav navbar-nav navbar-right">
                	<li class="dropdown" id="nav-userinfo">
                		<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="name" style="padding: 0px 0px 0px 0px;">
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
			
			<div class="modal fade" id="signupModal">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h4 class="modal-title">회원가입</h4>
			            </div>
			            <div class="modal-body">
			            	<form class="form-join form-horizontal" role="form">
				                <div class="form-group" id="groupid">
				                    <label class="control-label col-sm-3">ID</label>
				                    <div class="col-xs-12 col-sm-9">
				                        <input type="text" id="signupId" class="form-control" maxlength="30" placeholder="swssm" autofocus="">
				                    </div> 
				                    <label id="errorid" class="col-sm-offset-3 control-label hidden"></label>
				                </div>
				                <div class="form-group" id="passwordgroup">
				                    <label class="control-label col-sm-3">비밀번호</label>
				                    <div class="col-xs-12 col-sm-9">
				                        <input type="password" id="signupPwd1" class="form-control" maxlength="100" placeholder="********" />
				                    </div>
				                    <label id="errorpassword" class="col-sm-offset-3 control-label hidden"></label>
				                </div>
				                <div class="form-group" id="passwordgroup">
				                    <label class="control-label col-sm-3">비밀번호 확인</label>
				                    <div class="col-xs-12 col-sm-9">
				                        <input type="password" id="signupPwd2" class="form-control" maxlength="100" placeholder="********" />
				                    </div>
				                    <label id="errorpasswordconfirm" class="col-sm-offset-3 control-label hidden"></label>
				                </div>
				                <div class="form-group" id="namegroup">
				                    <label class="control-label col-xs-12 col-sm-3">이름</label>
				                    <div class="col-xs-12 col-sm-9">
				                        <input type="text" id="signupName" maxlength="5" class="form-control" placeholder="김창렬" />
				                    </div> 
				                    
				                    <label id="errorname" class="col-sm-offset-3 control-label hidden"></label>
				                </div>
				                
				                <div class="form-group" id="emailgroup">
				                	<label class="control-label col-xs-12 col-sm-3">이메일</label>
				                	<div class="col-xs-12 col-sm-9">
				                		<input type="text" id="signupEmail" class="form-control" placeholder="email@gmail.com" />
				                	</div>
				                	<label id="erroremail" class="col-sm-offset-3 control-label hidden text-danger"></label>
				                </div>
				                
				                <div class="form-group" id="phonegroup">
				                	<label class="control-label col-xs-12 col-sm-3">핸드폰</label>
				                	<div class="col-xs-12 col-sm-9">
				                		<input type="text" id="signupPhone" class="form-control" placeholder="010-1234-5678" />
				                	</div>
				                	<label id="errorphone" class="col-sm-offset-3 control-label hidden text-danger"></label>
				                </div>
				                
				                <div class="form-group" id="nameclass">
				                    <label class="control-label col-xs-12 col-sm-3">기수</label>
				                    <div class="col-xs-12 col-sm-9">
				                        <input type="text" id="signupClass" class="form-control" placeholder="23-1" />
				                    </div>
				                    
				                    <label id="errorclass" class="col-sm-offset-3 control-label hidden text-danger"></label>
				                </div>
				                
				                <div class="form-group" id="gender">
				                	<label class="control-label col-xs-12 col-sm-3">성별</label>
									<div class="col-xs-12 col-sm-9">
										<button type="button" class="btn btn-default dropdown-toggle" id="inputgender" data-toggle="dropdown" style="width: 100%">Male</button>
										<ul class="dropdown-menu" id="genderdropdown">
											<li><a href="#">Male</a></li>
											<li><a href="#">Female</a></li>
										</ul>
									</div>
									
									<label id="errorgender" class="col-sm-offset-3 control-label hidden text-danger"></label>
				                </div>
				                
            				</form>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			                <!-- 아이디쪽 서버확인 끝나면 disabled 사라질거임. -->
		                	<button class="btn btn-mint" type="button" id="signupBtn" disabled="disabled">가입</button>  
			            </div>
			        </div>
			    </div>
			</div>
			
			<div class="modal fade" id="app_modal">
			    <div class="modal-dialog modal-vertical-centered">
			        <div class="modal-content">
			            <div class="modal-body">
			            	<div class="row">
								<div class="col-md-6">
									<a href="/GardenPlatformWeb/my_apps/web_register.do" class="thumbnail"> 
										<img src="/GardenPlatformWeb/resource/img/icons/iMac@2x.png">
									</a>
								</div>
								<div class="col-md-6">
									<a href="/GardenPlatformWeb/my_apps/native_register.do" class="thumbnail"> 
										<img src="/GardenPlatformWeb/resource/img/icons/iMac@2x.png">
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
			
        <!-- Placed at the end of the document so the pages load faster -->
        
        <script src="/GardenPlatformWeb/resource/js/decorator/decorator.js"></script>
        <script src="/GardenPlatformWeb/resource/js/decorator/bootstrap.min.js"></script>
    </body>
</html>