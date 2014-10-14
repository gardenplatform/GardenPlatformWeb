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
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-5 col-sm-2 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<h4>MY Apps</h4>
				<ul class="snb nav">
					<li class="active"><a href="#">Dashboard</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do">Apps Detail</a></li>
					<li><a href="#" data-toggle="collapse" data-target="#sub1"> Dropdown <span class="caret"></span></a>
						<ul class="nav collapse" id="sub1">
							<li><a href="#">Sub Link 1</a></li>
							<li><a href="#">Sub Link 2</a></li>
							<li><a href="#">Sub Link 3</a></li>
						</ul>
					</li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">

				<div class="media">
					<a class="pull-left" href="#"> 
						<img class="media-object myapps-img" src="/GardenPlatformWeb/resource/img/my_app_sample2.png">
					</a>
					<div class="media-body">
						<h4 class="media-heading">Sample App 1</h4>
						<h5>
							<small>This app is public and available to all users.</small>
						</h5>
						<div class="row">
							<div class="col-md-4">App ID</div>
							<div class="col-md-8">App Secret</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input type="text" class="form-control" placeholder="Username">
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Username">
									<span class="input-group-addon">Show</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.row-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>