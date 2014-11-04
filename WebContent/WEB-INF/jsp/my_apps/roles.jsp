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
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">Project Leader</h4></div>
				  <div class="panel-body">
				  	<div class="media">
					      <a class="pull-left" href="#">
					        <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p50x50/10641274_727231190703971_7622922369219706929_n.jpg?oh=be0fa48dec6ea450bb12670ae01438b2&amp;oe=54AFFF2F&amp;__gda__=1423917107_a57e6875d154889b3a00d7ebaee7f3ad" style="width: 64px; height: 64px;">
					      </a>
					      <div class="media-body">
					        <h4 class="media-heading" id="pl_name">${owner}</h4>
					      </div>
					    </div>
				  </div>
				  
				</div>
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">Developers<button class="btn btn-default btn-xs pull-right" type="button" data-toggle="modal" data-target="#add_developer_modal">Add Developers</button></h4></div>
				  <div class="panel-body">
				  	<c:if test="${empty developerList}">
						빡호 없다
				  	</c:if>
				  	<c:forEach var="item" items="${developerList}">
                        <div class="media">
					      <a class="pull-left" href="#">
					        <img class="media-object" data-src="holder.js/64x64" alt="64x64" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xpa1/v/t1.0-1/p50x50/10641274_727231190703971_7622922369219706929_n.jpg?oh=be0fa48dec6ea450bb12670ae01438b2&amp;oe=54AFFF2F&amp;__gda__=1423917107_a57e6875d154889b3a00d7ebaee7f3ad" style="width: 64px; height: 64px;">
					      </a>
					      <div class="media-body">
					        <h4 class="media-heading" id="pl_name">${item}</h4>
					      </div>
					    </div>
					</c:forEach>
				  </div>
				</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.row-->

		<div class="modal fade" id="add_developer_modal">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">Add Developers</h4>
		            </div>
		            <div class="modal-body">
						<input class="form-control" id="findid" type="text" placeholder="user id">
		            </div>
		            <div class="modal-footer">
	                	<button class="btn btn-mint" type="button" id="add_developer">추가</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		            </div>
		        </div>
		    </div>
		</div>

	<script src="/GardenPlatformWeb/resource/js/my_apps/roles.js"></script>
</body>
</html>