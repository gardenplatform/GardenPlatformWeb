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
				<ul class="snb nav">
					<li><a href="#" data-toggle="collapse" data-target="#sub1" id="appName"><b class="ellipsis"><span class="glyphicon glyphicon-list-alt"></span>${appName}<span class="caret"></span></b></a>
						<ul class="nav collapse" id="sub1">
							<c:forEach var="item" items="${sessionScope.appList}">
                            	<li><a class="ellipsis-suv" href="/GardenPlatformWeb/my_apps/index.do?appName=${item}">${item}</a></li>
						    </c:forEach>
						</ul>
					</li>
				</ul>
				<ul class="snb nav">
					<li><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>
			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">App info</h4></div>
				  <div class="panel-body">
				  <div class="form-group">
				  	<div class="row">
				  		<div class="col-md-4">
				  			<label class="control-label">Tag1</label>
					    	<input id="tag1" type="text" class="form-control" value="${tag1}">
				  		</div>
				  		<div class="col-md-4">
				  			<label class="control-label">Tag2</label>
					    	<input id="tag2" type="text" class="form-control" value="${tag2}">
				  		</div>
				  		<div class="col-md-4">
				  			<label class="control-label">Tag3</label>
					    	<input id="tag3" type="text" class="form-control" value="${tag3}">
				  		</div>
				  	</div>
				  </div>	
				  
				  <div class="form-group">
				  	<div class="row">
				  		<div class="col-md-6">
				  			<label class="control-label">Short Description</label>
					    	<input id="short_desc" type="text" class="form-control" value="${short_description}">
					    	
					    	<label class="control-label">Category</label>
						    	<select class="form-control" id="category">
						    	  <option>카테고리를 선택하세요</option>
								  <option>Apps for Pages</option>
								  <option>Books</option>
								  <option>Business</option>
								  <option>Communication</option>
								  <option>Education</option>
								  <option>Entertainment</option>
								  <option>기타</option>
								</select>
				  		</div>
				  		
				  		<div class="col-md-6">
				  			<label class="control-label">Long Description</label>
					    	<textarea id="long_desc" class="form-control" rows="4">${long_description}</textarea>
				  		</div>
				  		
				  	</div>
				  </div>
				  
				  <div class="form-group">
				  	<label class="control-label">Explanation for Permissions</label>
					<textarea id="permissions" class="form-control" rows="4">${permission_explanation}</textarea>
				  </div>
				  
				  </div>
				  
				</div>
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-pull-right">
							<button class="btn btn-primary btn-sm" id="detail_update">수정</button>
							<a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><button class="btn btn-default btn-sm" >취소</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>