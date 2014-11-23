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
		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3" role="navigation">
			<div class="well">
				<ul class="snb nav">
					<li><a href="#" data-toggle="collapse" data-target="#sub1" id="appName"><b class="ellipsis"><span class="glyphicon glyphicon-list-alt"></span>${appName}<span class="caret"></span></b></a>
						<ul class="nav collapse" id="sub1">
							<c:forEach var="item" items="${sessionScope.appList}">
                            	<li><a class="ellipsis-suv" href="/GardenPlatformWeb/my_apps/index.do?appName=${item}">${item}</a></li>
						    </c:forEach>
						</ul>
					</li>
				</ul>
				</div>
				<div class="well">
				<ul class="snb nav">
					<li><a href="/GardenPlatformWeb/my_apps/index.do?appName=${appName}"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do?appName=${appName}"><span class="glyphicon glyphicon-time"></span> App Detail</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
				</div>
			</div>
			<!-- main area -->
			
			<div class="col-md-9">
			
				<div class="panel panel-default">
				  <div class="panel-heading">
				  	<h4 class="no_margin">Launch Status</h4>
				  </div>
					<div class="panel-body">
						<div class="media">
							<a class="pull-left" href="#"> 
								<img class="media-object myapps-img" src="${appImgUrl}" style="width:128px; height:128px">
							</a>
							<div class="media-body">
								<h2 class="media-heading">${appName}</h2>
								<div class="row">
									<div class="col-md-9">
									    <c:choose>
											<c:when test="${publish}">
												<h4 id="launch_status"><small>출시 중인 상태입니다.</small></h4>
										    </c:when>
										    <c:otherwise>
												<h4 id="launch_status"><small>아직 출시되지 않은 상태입니다.</small></h4>
										    </c:otherwise>
									    </c:choose>
									</div>
									<div class="col-md-3">
									    <c:choose>
										    <c:when test="${publish}">
										    	<input id="switch-state" type="checkbox" checked>
										    </c:when>
										    <c:otherwise>
										    	<input id="switch-state" type="checkbox">
										    </c:otherwise>
									    </c:choose>
									    <button type="button" data-get="state" class="btn btn-default hidden"></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="panel panel-default">
				
				  <div class="panel-heading">
				  		<h4 class="no_margin">Setting</h4>
				  </div>
				 
				  <div class="panel-body">
				  	<div class="form-group">
					    <label class="control-label">Display Name</label>
					    <input type="text" class="form-control" id="displayName" value="${displayName}">
					</div>
					
					<div class="form-group">
					    <label class="control-label">Contact Email</label>
					    <input type="text" class="form-control" id="contactEmail" value="${contactEmail}">
					</div>
					<!-- 
					<div class="form-group">
					    <label class="control-label">출시(이건 아직 하는중 script 짜서 해놈 ㄱㄷ)</label>
					    <p>
					    ${publish}
					    <c:choose>
					    
						    <c:when test="${publish}">
						    	<input id="switch-state" type="checkbox" checked>
						    	true
						    </c:when>
						    <c:otherwise>
						    	false
						    	<input id="switch-state" type="checkbox">
						    </c:otherwise>
					    </c:choose>
					    </p>
					    <button type="button" data-get="state" class="btn btn-default">Switch 상태 보기</button>
					</div>
					 -->
				  </div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-body">
						<button class="btn btn-danger btn-sm pull-left" data-toggle="modal" data-target="#delete_modal">Delete App</button>
						<div class="btn-pull-right">
							<button class="btn btn-primary btn-sm" id="setting_update">수정</button>
							<a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><button class="btn btn-default btn-sm" >취소</button></a>
						</div>
					</div>
				</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->
	</div>
	
	<div class="modal fade" id="delete_modal">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">Delete App</h4>
		            </div>
		            <div class="modal-body">
     					<p class="text-danger"><strong>${appName}</strong></p>
     					<p><strong>삭제 후에는 복구할 수 없습니다. 삭제 하시겠습니까? </strong></p>
					</div>

		            <div class="modal-footer">
	                	<button class="btn btn-mint" type="button" id="deleteApp">삭제</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		            </div>
		           </div>
		    </div>
	 </div>

	<script src="/GardenPlatformWeb/resource/js/my_apps/setting.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/bootstrap-switch.min.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/highlight.js"></script>
</body>
</html>