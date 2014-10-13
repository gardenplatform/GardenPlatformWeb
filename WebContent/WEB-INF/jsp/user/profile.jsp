<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/user/user.css">
</head>

<body>
	<div class="container">
	
	<h3>개인 정보</h3>
	<h4><small>비밀번호를 변경하지 않으시려면 칸을 비워두세요</small></h4>
	
	<div class="form center-block">
		<div class="form-group row">
			<h5 class="col-xs-4">ID</h5>
			<h5 id="userid" class="col-xs-8"></h5>
		</div>
		<div class="form-group row">
			<h5 class="col-xs-4">이름</h5>
			<h5 id="username" class="col-xs-8"></h5>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">기존 비밀번호</h5>
			<div class="col-xs-8">
				<input id="password" class="form-control" type="password" placeholder="기존 비밀번호"></input>
			</div>
		</div> 
		
		<div class="form-group row">
			<h5 class="col-xs-4">새 비밀번호</h5>
			<div class="col-xs-8">
				<input id="newpassword" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호"></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">비밀번호 확인</h5>
			<div class="col-xs-8">
				<input id="newpasswordconfirm" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호 확인"></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">기수</h5>
			<div class="col-xs-8">
				<input id="classnum" class="form-control" placeholder="23-2"></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">이메일</h5>
			<div class="col-xs-8">
				<input id="email" class="form-control" placeholder="email@gmail.com"></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">핸드폰 번호</h5>
			<div class="col-xs-8">
				<input id="phonenum" class="form-control" type="tel" placeholder="010-1234-5678"></input>
			</div>
		</div>
		
		<button id="modify" type="button" class="btn btn-primary btn-block">수정</button>
	</div>
		
	</div>

	<script src="/GardenPlatformWeb/resource/js/user/user.js"></script>
</body>
</html>