<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/user/user.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/jasny-bootstrap.css">
</head>

<body>
	<div class="container">
	
	<h3>개인 정보</h3>
	<h4><small>개인 정보를 수정할 수 있습니다.</small></h4>

	<div class="form center-block">
	
		<div class="form-group row">
			<h5 class="col-xs-4">프로필 사진</h5>
				<div class="fileinput fileinput-new" data-provides="fileinput">
				  <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
				    <img src="/GardenPlatformWeb/resource/img/no_profile_img.jpg" alt="...">
				  </div>
				  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 150px;"></div>
				  <div>
				    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
				    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
				  </div>
				</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">ID</h5>
			<h5 id="userid" class="col-xs-8">${id}</h5>
		</div>
		<div class="form-group row">
			<h5 class="col-xs-4">이름</h5>
			<h5 id="username" class="col-xs-8">${name}</h5>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">기수</h5>
			<h5 id="classnum" class="col-xs-8">${class_num}</h5>
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
			<h5 class="col-xs-4">이메일</h5>
			<div class="col-xs-8">
				<input id="email" class="form-control" placeholder="email@gmail.com" value=${email}></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">핸드폰 번호</h5>
			<div class="col-xs-8">
				<input id="phonenum" class="form-control" type="tel" placeholder="010-1234-5678" value=${phone}></input>
			</div>
		</div>
		
		<button id="modify" type="button" class="btn btn-primary btn-block" disabled="disabled">수정</button>
	</div>
		
	</div>

	<script src="/GardenPlatformWeb/resource/js/user/user.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/jasny-bootstrap.js"></script>
</body>
</html>