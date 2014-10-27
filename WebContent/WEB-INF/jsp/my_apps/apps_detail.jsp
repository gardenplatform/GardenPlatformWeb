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
					<li><a href="/GardenPlatformWeb/my_apps/roles.do"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>
			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">App info</h4></div>
				  <ul class="list-group">
				    <li class="list-group-item">
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
				  <div class="panel-footer">
					<button type="button" class="btn btn-primary btn-sm" id="update_detail">수정</button>
				  	<button type="button" class="btn btn-default btn-sm">취소</button>
				  </div>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>