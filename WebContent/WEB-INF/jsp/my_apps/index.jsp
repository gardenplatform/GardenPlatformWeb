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
			<div class="col-xs-5 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
				<h4>MY Apps</h4>
				<ul class="snb nav">
					<li class="active"><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">Dashboard</h4></div>
				  <ul class="list-group">
				    <li class="list-group-item">
				    	<div class="form-group">
					    	<div class="media">
								<a class="pull-left" href="#"> 
									<img class="media-object myapps-img" src="https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-xpa1/t39.2081-0/p128x128/851578_455087414601994_1601110696_n.png">
								</a>
								<div class="media-body">
									<h2 class="media-heading">${appName}</h2>
									<h4>
										<small>This app is public and available to all users.</small>
									</h4>
									<div class="row">
										<div class="col-md-5">
											<label class="control-label">App ID</label>
											<input id="app_id" type="text" class="form-control" disabled="disabled" value="${appID}">
										</div>
										<div class="col-md-7">
											<label class="control-label">App Secret</label>
											<div class="input-group">
												<input id="app_secret" type="password" class="form-control" disabled="disabled" value="${appSecret}">
												<span class="input-group-btn">
													<button class="btn btn-default" type="button" id="app_secret_show">Show</button>
											    </span>
											</div>
										</div>
											
									</div>
								</div>
							</div>
					    </div>
					    <div class="form-group">
					    	<label class="control-label">URL</label>
					    	<input id="app_url" type="text" class="form-control" value="${appUrl}">
						</div>
					    <div class="form-group">
					    	<label class="control-label">Redirect URL</label>
					    	<input id="app_redirecturl" type="text" class="form-control" value="${appRedirectUrl}">
						</div>
				    </li>
				  </ul>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.row-->
	
	<!--
					<li><a href="#" data-toggle="collapse" data-target="#sub1"> Dropdown <span class="caret"></span></a>
						<ul class="nav collapse" id="sub1">
							<li><a href="#">Sub Link 1</a></li>
							<li><a href="#">Sub Link 2</a></li>
							<li><a href="#">Sub Link 3</a></li>
						</ul>
					</li>
					 -->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>