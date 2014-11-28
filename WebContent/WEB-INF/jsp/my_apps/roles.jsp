<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/GardenPlatformWeb/resource/css/lib/common.css" />
	<link rel="stylesheet" type="text/css" href="/GardenPlatformWeb/resource/css/lib/role_hover.css" />
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
					<li class="active"><a href="/GardenPlatformWeb/my_apps/roles.do?appName=${appName}"><span class="glyphicon glyphicon-user"></span> Roles</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/setting.do?appName=${appName}"><span class="glyphicon glyphicon-cog"></span> Setting</a></li>
				</ul>
			</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">Project Leader</h4></div>
				  <div class="panel-body">
				  <div class="text-center">
					  <div class="row">
					    <div class="col-md-12">
					     <ul class="ch-grid">
							<li>
								<div class="ch-item">	
									<div class="ch-info">
										<h3>${ownerName}</h3>
										<p><span id="owner">${ownerID}</span> <a href="#" class="userInfo">View on Userinfo</a></p>
									</div>
									<div class="ch-thumb ch-img-1" style="background-image: url(${ownerProfileImg});"></div>
								</div>
							</li>
						</ul>
					    </div>
					  </div>
				  </div>
				  </div>
				  
				</div>
				<div class="panel panel-default">
				  <div class="panel-heading"><h4 class="no_margin">Developers<button class="btn btn-default btn-xs pull-right" type="button" data-toggle="modal" data-target="#add_developer_modal">Add Developers</button></h4></div>
				  <div class="panel-body">
				  	<c:if test="${empty developerList}">
						<h3 class="text-center"><small>등록된 멤버가 없습니다.</small></h3>
				  	</c:if>
				  	<div class="row">
					  	<div class="text-center">
					  		<c:forEach var="item" items="${developerList}">
						  		<div class="col-md-6">
						  		<!-- 
						  			<a href="#" class="thumbnail-round"><img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="/GardenPlatformWeb/resource/img/testimg.png" data-holder-rendered="true" style="width: 140px; height: 140px;"></a>
						  			<h3 id="pl_name"><small>${item}</small></h3>
						  		 -->
						  		 <ul class="ch-grid">
									<li>
										<div class="ch-item">	
											<div class="ch-info">
												<h3>${item.developerName}</h3>
												<!-- 
												<p>${item} <a href="#" data-toggle="modal" data-target="#info_developer_modal">View on Userinfo</a></p>
												 -->
												<p><span class="member">${item.developerID}</span> <a href="#" class="userInfo">View on Userinfo</a></p>
											</div>
											<div class="ch-thumb ch-img-1" style="background-image: url(${item.developerProfileImg});"></div>
										</div>
									</li>
								</ul>
						  		</div>
					  		</c:forEach>
					  	</div>
				  	</div>
				  	
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
						<!-- 
						<input class="form-control" id="findid" type="text" placeholder="user id">
						 -->
						 <div class="input-group form-group">
			      			<div class="input-group-btn">
				        		<button id="searchmode" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">이름<span class="caret"></span></button>
				        		<ul class="dropdown-menu" id="searchmodedropdown">
				          			<li><a href="#">이름</a></li>
				          			<li><a href="#">아이디</a></li>
				        		</ul>        		
			      			</div>
			      			<input type="text" class="form-control" id="searchinput">
			      			<span class="input-group-btn">
			       			<button class="btn btn-default" type="button" id="searchbutton">검색</button>
			      			</span>
			    		</div>
			    		
			    		<table id="search_result" class="table table-hover">
			       			<tbody>
			       				<tr>
			       					<td class="text-center">
			       						<img style="width:50px; height:50px; margin-bottom:0px" class="thumbnail-round" src="/GardenPlatformWeb/resource/img/testimg.png">
			       					</td>
			       					<td class="text-center">
			       						23-1
			       					</td>
			       					<td class="text-center">
			       						이름
			       					</td>
			       					<td class="text-center">
			       						아이디
			       					</td>
			       				</tr>
			       			</tbody>
			       		</table>
		            </div>
		            <div class="modal-footer">
	                	<button class="btn btn-mint" type="button" id="add_developer">추가</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<div class="modal fade" id="info_developer_modal">
		    <div class="modal-dialog modal-vertical-centered">
		        <div class="modal-content">
		        	
		            <div class="modal-header">
		                <h4 class="modal-title"><strong>유저 정보</strong></h4>
		            </div>
		            <div class="modal-body">
		            	<div class="form-group row">
							<label class="control-label col-xs-4">이름</label>
							<h5 class="col-xs-8" id="modalUserName"></h5>
						</div>
						<div class="form-group row">
							<label class="control-label col-xs-4">아이디</label>
							<h5 class="col-xs-8" id="modalUserID"></h5>
						</div>
						<div class="form-group row">
							<label class="control-label col-xs-4">기수</label>
							<h5 class="col-xs-8" id="modalUserClass"></h5>
						</div>
						<div class="form-group row">
							<label class="control-label col-xs-4">핸드폰</label>
							<h5 class="col-xs-8" id="modalUserPhone"></h5>
						</div>
						<div class="form-group row">
							<label class="control-label col-xs-4">이메일</label>
							<h5 class="col-xs-8" id="modalUserEmail"></h5>
						</div>
		            </div>
		            <div class="modal-footer">
	                	<button class="btn btn-danger" type="button" id="delete_developer">삭제</button>  
		                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		            </div>
		        </div>
		    </div>
		</div>
		
	<script src="/GardenPlatformWeb/resource/js/my_apps/roles.js"></script>
</body>
</html>