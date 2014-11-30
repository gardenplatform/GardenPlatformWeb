<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/deceloper.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/docs.css">
</head>

<body>
	<div class="container">

		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3 role="navigation">
				<div class="well">
					<h4>Developers</h4>
				</div>
				<div class="well">
					<div class="bs-sidebar" data-spy="affix" data-offset-top="60" data-offset-bottom="200">
						<ul class="nav bs-sidenav manualmenu">
							<li class="active"><a href="#registapp">앱 등록</a>
							<ul class="nav">
								<li><a href="#do_registapp">앱 등록하기</a></li>
								<li><a href="#dashboard">Dashboard</a></li>
								<li><a href="#appdetail">App Detail</a></li>
								<li><a href="#roles">Roles</a></li>
								<li><a href="#setting">Setting</a></li>
							</ul></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				<div class="jumbotron">
				  <h1>Getting Start!</h1>
				  <p>밥줘영</p>
				  <p><a class="btn btn-primary btn-lg" href="/GardenPlatformWeb/downloadSDK.do" role="button">SDK Download</a></p>
				</div>
				
				<h2 id="registapp">앱 등록</h2>
				
				<h3 id="do_registapp">앱 등록하기</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/registapp.png"/>
					<p>상단의 탭을 통하여 앱 등록을 선택하면 다음과 같은 모달을 볼 수 있습니다.</p>
				</div>
				<h3 id="dashboard">Dashboard</h3>
				<div class="well"></div>
				<h3 id="appdetail">App Detail</h3>
				<div class="well"></div>
				<h3 id="roles">Roles</h3>
				<div class="well"></div>
				<h3 id="setting">Setting</h3>
			
			<div class="bs-callout bs-callout-danger"><h5>분실 신고는 도서가 대여 가능한 상태에서만 가능합니다. 도서 대여 신청 후 분실됨을 알았을 때는 반납 후 분실 신고를 해주세요.</h5></div>
			
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div>


	<script src="/GardenPlatformWeb/resource/js/developer/developer.js"></script>

</body>
</html>