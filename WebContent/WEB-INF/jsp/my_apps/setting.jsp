<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/my_apps/my_apps.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/bootstrap-switch.min.css">
	
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-5 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="snb nav">
					<li><a href="#" data-toggle="collapse" data-target="#sub1"><b class="ellipsis"><span class="glyphicon glyphicon-list-alt"></span> ${appName} <span class="caret"></span></b></a>
						<ul class="nav collapse" id="sub1">
							<c:forEach var="item" items="${sessionScope.appList}">
                            	<li><a class="ellipsis-suv" href="/GardenPlatformWeb/my_apps/index.do?appName=${item}">${item}</a></li>
						    </c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="snb nav">
					<li><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>
			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">

				  <div class="panel-heading">
				  		<h4 class="no_margin">Setting</h4>
				  </div>
				 
				  <div class="panel-body">
				  
				  	<div class="form-group">
					    <label class="control-label">Display Name</label>
					    <input type="text" class="form-control">
					</div>
					
					<div class="form-group">
					    <label class="control-label">Contact Email</label>
					    <input type="text" class="form-control">
					</div>
					
					<div class="form-group">
					    <label class="control-label">출시(이건 아직 하는중 script 짜서 해놈 ㄱㄷ)</label>
					    <p>
					    <input id="switch-state" type="checkbox" checked>
					    </p>
					    <button type="button" data-get="state" class="btn btn-default">Switch 상태 보기</button>
					</div>
				  </div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-body">
						<button class="btn btn-danger btn-sm pull-left" id="deleteApp">Delete App</button>
						<div class="btn-pull-right">
							<button class="btn btn-primary btn-sm" id="setting_update">수정</button>
							<a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><button class="btn btn-default btn-sm" >취소</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/bootstrap-switch.min.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/highlight.js"></script>
</body>
</html>