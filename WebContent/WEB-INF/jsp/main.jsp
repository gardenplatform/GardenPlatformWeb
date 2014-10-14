<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/main.css">
    </head>

    <body>
    	<c:set var="id" value="${id}" />
        	<div class="container">
		<div class="main_container">
		<div class="row vertical-center">
			<div class="col-md-6" style="text-align:center;">
				<img src="https://dt8kf6553cww8.cloudfront.net/static/images/empty_states/sign-in@2x-vflrhf4zv.png" style="width: 288px; height: 305px;">
			</div>
			<div class="col-md-5">
				<div id="formBox">
					<h1 style="color: #1ABC9C">Garden Platform</h1>
					<p style="color: #555;">하나의 통합된 계정으로 쉽게 시스템을 이용하세요!!</p>
					<div class="signin-form">
						<div class="form-group">
							<input class="form-control" id="signinId" type="text" placeholder="아이디">
						</div>
						<div class="form-group">
							<div>
								<input type="password" id="signinPwd" class="form-control"
									placeholder="비밀번호">
							</div>
						</div>
						<div class="form-group">
							<button type="submit" id="signinBtn" class="btn btn-block btn-info">로그인</button>
							<button id="signupModalBtn" class="btn btn-block btn-mint" data-toggle="modal" data-target="#signupModal">회원가입</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		</div>
	</div>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
    </body>
</html>