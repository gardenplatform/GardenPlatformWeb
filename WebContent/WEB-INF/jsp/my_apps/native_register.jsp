<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/my_apps/my_apps.css">
</head>

<body>
	<div class="container">
		<div class="form center-block">
			<h2>임시 Native Front-End 디자인은 나중에.</h2>
			<div class="form-group row">
				<h5 class="col-xs-4">App Name</h5>
				<div class="col-xs-8">
					<input id="appName" class="form-control" type="tel" placeholder="Snac"></input>
				</div>
			</div>
			
			<div class="form-group row">
				<h5 class="col-xs-4">URL</h5>
				<div class="col-xs-8">
					<input id="appUrl" class="form-control" type="tel" placeholder="www.snac.org"></input>
				</div>
			</div>
			
			<div class="form-group row">
				<h5 class="col-xs-4">Redirect URL</h5>
				<div class="col-xs-8">
					<input id="reUrl" class="form-control" type="tel" placeholder="Re..."></input>
				</div>
			</div>
			
			<button id="register" type="button" class="btn btn-mint btn-block">등록</button>
		</div>
	</div>

	<script src="/GardenPlatformWeb/resource/js/my_apps/native_register.js"></script>
</body>
</html>