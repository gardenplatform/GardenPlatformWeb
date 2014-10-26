<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-5 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
				<h4>MY Apps</h4>
				<ul class="snb nav">
					<li><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/apps_detail.do"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>
			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
				  <div class="panel-heading">App info</div>
				  <ul class="list-group">
				    <li class="list-group-item">App Center.</li>
				    <li class="list-group-item">
				    	<div class="row">
				    		<div class="col-xs-6 col-md-6">
				    		<label class="control-label">Short Description</label>
				    			<input type="text" class="form-control">
				    		</div>
				    		<div class="col-xs-6 col-md-6">
				    		<label class="control-label">라벨</label>
				    			<input type="text" class="form-control">
				    		</div>
				    	</div>
				    </li>
				  </ul>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>