<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/my_apps/my_apps.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/jasny-bootstrap.css">
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
							<c:forEach var="item" items="${sessionScope.myAppList}">
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
							<a href="#" class="pull-left" data-toggle="modal" data-target="#appIconModal"> 
								<img class="media-object myapps-img thumbnail" src="${appImgUrl}" style="width:128px; height:128px">
							</a>
							<div class="media-body">
								<h2 class="media-heading">${appName}</h2>
							    <c:choose>
									<c:when test="${appPublish}">
										<h4 id="launch_status"><small>출시 중인 상태입니다.</small></h4>
								    </c:when>
								    <c:otherwise>
										<h4 id="launch_status"><small>아직 출시되지 않은 상태입니다.</small></h4>
								    </c:otherwise>
							    </c:choose>
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
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.row-->
	
	<div class="modal fade" id="appIconModal">
	    <div class="modal-dialog-short modal-vertical-centered">
	        <div class="modal-content">
	          	<form action="/GardenPlatformWeb/postAppIcon.do" method="POST" enctype="multipart/form-data">
	        	<div class="modal-header">
	                <h4 class="modal-title">App Icon 업로드</h4>
	            </div>
	            <div class="modal-body">
		             <div class="text-center">
		             <div class="fileinput fileinput-new" data-provides="fileinput">
					  <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
					  	<img src="${appImgUrl}" style="width: 150px; height: 150px;">
					  </div>
					  <div class="fileinput-preview fileinput-exists thumbnail" style="width: 150px; height: 150px;"></div>
					  <div>
					    <input type="hidden" name="appName" id="formAppName" value="${appName}" />
					    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span>
					    <span class="fileinput-exists">Change</span>
					    <input type="file" name="imgFile" id="imgFile" accept="image/x-png, image/jpeg"/></span>
					    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
					  </div>
		             </div>
					</div>
	            </div>
	            <div class="modal-footer">
                	<input id="imgSubmit" class="btn btn-mint hidden" type="submit" value="등록">
	                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	            </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	
	<script src="/GardenPlatformWeb/resource/js/lib/jasny-bootstrap.js"></script>
	<script src="/GardenPlatformWeb/resource/js/my_apps/index.js"></script>
</body>
</html>