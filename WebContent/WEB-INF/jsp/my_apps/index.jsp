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
		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3" role="navigation">
				<div class="well">
				<ul class="snb nav">
					<li><a href="#" data-toggle="collapse" data-target="#sub1" id="appName"><b class="ellipsis"><span class="glyphicon glyphicon-list-alt"></span> ${appName}<span class="caret"></span></b></a>
						<ul class="nav collapse" id="sub1">
							<c:forEach var="item" items="${sessionScope.appList}">
                            	<li><a class="ellipsis-suv" href="/GardenPlatformWeb/my_apps/index.do?appName=${item}"> ${item}</a></li>
						    </c:forEach>
						</ul>
					</li>
				</ul>
				</div>
				<div class="well">
				<ul class="snb nav">
					<li class="active"><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
				</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				<div class="panel panel-default">
				  <div class="panel-heading">
				  	<h4 class="no_margin">Dashboard</h4>
				  </div>
					<div class="panel-body">
						<div class="media">
							<a class="pull-left" href="#"> <img
								class="media-object myapps-img"
								src="/GardenPlatformWeb/resource/img/dashboard_default_img.png">
							</a>
							<div class="media-body">
								<h2 class="media-heading">${appName}</h2>
								<h4>
									<small>This app is public and available to all users.</small>
								</h4>
								<div class="row">
									<div class="col-md-5">
										<label class="control-label">App ID</label> <input id="app_id"
											type="text" class="form-control" disabled="disabled"
											value="${appID}">
									</div>
									<div class="col-md-7">
										<label class="control-label">App Secret</label>
										<div class="input-group">
											<input id="app_secret" type="password" class="form-control"
												disabled="disabled" value="${appSecret}"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button"
													id="app_secret_show">Show</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="panel-body">
					
					<!-- 
				    	<div class="form-group">
					    	<label class="control-label">URL</label>
					    	<input id="app_url" type="text" class="form-control" value="${appUrl}">
						</div>
					 -->
						
						<div id="index_appurl_div" class="form-group has-feedback">
							<label class="control-label">URL</label>
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="index_type">http://</button>
							        <ul class="dropdown-menu" id="index_typedropdown">
							          <li><a href="#">http://</a></li>
							          <li><a href="#">https://</a></li>
							        </ul>
								</div>
								<input id="index_app_url" class="form-control" value="${appUrl}"></input>
							</div>
							<span id="index_appurl_success" class="glyphicon glyphicon-ok form-control-feedback hidden"></span>
							<span id="index_appurl_fail" class="glyphicon glyphicon-remove form-control-feedback hidden"></span>
						</div>

						<!-- 
					    <div class="form-group">
					    	<label class="control-label">Redirect URL</label>
					    	<input id="app_redirecturl" type="text" class="form-control" value="${appRedirectUrl}">
						</div>
						 -->
						
						<div id="index_reurl_div" class="form-group has-feedback">
							<label class="control-label">Redirect URL </label>
							<div class="input-group">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="index_re_type">http://</button>
							        <ul class="dropdown-menu" id="index_re_typedropdown">
							          <li><a href="#">http://</a></li>
							          <li><a href="#">https://</a></li>
							        </ul>
								</div>
								<input id="index_app_redirecturl" class="form-control" value="${appRedirectUrl}"></input>
							</div>
							<span id="index_reurl_success" class="glyphicon glyphicon-ok form-control-feedback hidden"></span>
							<span id="index_reurl_fail" class="glyphicon glyphicon-remove form-control-feedback hidden"></span>
						</div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-pull-right">
							<button class="btn btn-primary btn-sm" id="index_update" >수정</button>
							<a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><button class="btn btn-default btn-sm" >취소</button></a>
						</div>
					</div>
				</div>
				<!-- 
				<div class="panel panel-default">
					<div class="panel-body">
				   	 <h3 class="no_margin">Getting Start</h3>
				   	 <button class="btn btn-default pull-right">Getting Started</button>
				  	</div>
				</div>
				 -->
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.row-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/index.js"></script>
</body>
</html>