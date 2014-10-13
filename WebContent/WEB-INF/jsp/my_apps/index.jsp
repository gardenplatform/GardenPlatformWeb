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

		<div class="snb">

			<h4>MY Apps</h4>

			<ul class="nav nav-pills nav-stacked">
			  <li class="active"><a href="#">Dashboard</a></li>
			  <li><a href="/GardenPlatformWeb/my_apps/apps_detail.do">Apps Detail</a></li>
			  <li><a href="#">Messages</a></li>
			  <li class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
			    </a>
			    <ul class="dropdown-menu" role="menu">
			    	<li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
			    </ul>
			  </li>
			</ul>
		</div>
		
		<div class="content">
			<div class="media">
			  <a class="pull-left" href="#">
			    <img class="media-object myapps-img" src="/GardenPlatformWeb/resource/img/my_app_sample2.png">
			  </a>
			  <div class="media-body">
			    <h4 class="media-heading">Sample App 1</h4>
			    <h5><small>This app is public and available to all users.</small></h5>
			    <div class="row">
			    	<div class="col-md-4">
			    	App ID
			    	</div>
			    	<div class="col-md-8">
			    	App Secret
			    	</div>
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

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>