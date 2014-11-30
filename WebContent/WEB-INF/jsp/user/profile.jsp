<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/user/user.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/jasny-bootstrap.css">
</head>

<body>
	<div class="container">
			<div class="row">
				<div class="col-md-3">
			    	<div class="list-group">
					  <a href="#" class="list-group-item" data-toggle="modal" data-target="#profileImgModal">
					  	<img src="${profileImg}" alt="profile" class="thumbnail img-responsive" 
					  		style="margin:5px; width:180px; height:180px;" data-toggle="tooltip" data-placement="bottom" data-original-title="프로필 사진 변경">
					  </a>
					  <a class="list-group-item">
					    <h4 class="list-group-item-heading"><strong>${name}</strong></h4>
					    <h3 class="list-group-item-heading"><small>${id}</small></h3>
					  </a>
					  <a class="list-group-item">
					    <h5 class="list-group-item-heading ellipsis" style="height:20px;"><span class="glyphicon glyphicon-comment"></span> ${email}</h5>
					    <h5 class="list-group-item-heading ellipsis" style="height:20px;"><span class="glyphicon glyphicon-book"></span> ${class_num}기</h5>
					    <h5 class="list-group-item-heading ellipsis" style="height:20px;"><span class="glyphicon glyphicon-phone"></span> ${phone}</h5>
					  </a>
					</div>
				</div>
				<div class="col-md-9">
					<ul class="nav nav-tabs" style="margin-bottom:10px;">
						<li role="presentation" class="active"><a href="#" style="color:#000000"><span class="glyphicon glyphicon-list-alt"></span> My Apps</a></li>
						<li role="presentation"><a href="#" style="color:#000000"><span class="glyphicon glyphicon-wrench"></span> Profile</a></li>
					</ul>
					<div id="myapps">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										내가 등록한 앱
									</div>
								
									<ul class="list-group">
								  	<c:forEach var="item" items="${sessionScope.myAppList}">
								  		<li class="list-group-item">
		                            	<h5>
		                            		<span class="glyphicon glyphicon-list-alt"></span>
		                            		<a href="/GardenPlatformWeb/my_apps/index.do?appName=${item.name}">${item.name}</a>
	                            		</h5>
									    <h6>
									    <c:choose>
											<c:when test="${empty item.shortDescription}">
												설명이 없습니다.
										    </c:when>
										    <c:otherwise>
												${item.shortDescription}
										    </c:otherwise>
									    </c:choose>
									    </h6>
		                            	</li>
								    </c:forEach>
									</ul>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="panel panel-default">
									<div class="panel-heading">
										현재 출시 중인 앱
									</div>

									<c:forEach var="item" items="${sessionScope.myAppList}">
										<c:if test="${item.publish}">
								  		<li class="list-group-item">
			                            	<h5>
			                            		<span class="glyphicon glyphicon-list-alt"></span>
			                            		<a href="/GardenPlatformWeb/my_apps/index.do?appName=${item.name}">${item.name}</a>
		                            		</h5>
											<h6>
										    <c:choose>
												<c:when test="${empty item.shortDescription}">
													설명이 없습니다.
											    </c:when>
											    <c:otherwise>
													${item.shortDescription}
											    </c:otherwise>
										    </c:choose>
										    </h6>
			                            	</li>
										</c:if>
								    </c:forEach>
								</div>
							</div>
							</div>
						</div>
					<div id="profile" class="hidden">
					<div class="panel panel-default">
					<div class="panel-body">
						<div class="form center-block">
	
							<div class="form-group row">
								<h5 class="col-xs-4">ID</h5>
								<h5 id="userid" class="col-xs-8">${id}</h5>
							</div>
							<div class="form-group row">
								<h5 class="col-xs-4">이름</h5>
								<h5 id="username" class="col-xs-8">${name}</h5>
							</div>
							
							<div class="form-group row">
								<h5 class="col-xs-4">기수</h5>
								<h5 id="classnum" class="col-xs-8">${class_num}</h5>
							</div>
							
							<div class="form-group row">
								<h5 class="col-xs-4">기존 비밀번호</h5>
								<div class="col-xs-8">
									<input id="password" class="form-control" type="password" placeholder="기존 비밀번호"></input>
								</div>
							</div> 
							
							<div class="form-group row">
								<h5 class="col-xs-4">새 비밀번호</h5>
								<div class="col-xs-8">
									<input id="newpassword" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호"></input>
								</div>
							</div>
							
							<div class="form-group row">
								<h5 class="col-xs-4">비밀번호 확인</h5>
								<div class="col-xs-8">
									<input id="newpasswordconfirm" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호 확인"></input>
								</div>
							</div>
							
							
							<div class="form-group row">
								<h5 class="col-xs-4">이메일</h5>
								<div class="col-xs-8">
									<input id="email" class="form-control" placeholder="email@gmail.com" value=${email}></input>
								</div>
							</div>
							
							<div class="form-group row">
								<h5 class="col-xs-4">핸드폰 번호</h5>
								<div class="col-xs-8">
									<input id="phonenum" class="form-control" type="tel" placeholder="010-1234-5678" value=${phone}></input>
								</div>
							</div>
							
							<button id="modify" type="button" class="btn btn-primary btn-block">수정</button>
						</div>
					</div>
					</div>
					</div>
				</div>
				</div>
			</div>
	</div>
	
	<div class="modal fade" id="profileImgModal">
	    <div class="modal-dialog-short modal-vertical-centered">
	        <div class="modal-content">
	          	<form action="/GardenPlatformWeb/postProfileImg.do" method="POST" enctype="multipart/form-data">
	        	<div class="modal-header">
	                <h4 class="modal-title">프로필 사진 업로드</h4>
	            </div>
	            <div class="modal-body">
		             <div class="text-center">
		             <div class="fileinput fileinput-new" data-provides="fileinput">
					  <div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
					  	<img src="${profileImg}" style="width: 150px; height: 150px;">
					  </div>
					  <div class="fileinput-preview fileinput-exists thumbnail" style="width: 150px; height: 150px;"></div>
					  <div>
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
	  
	<!-- 
	 
	<h3>개인 정보</h3>
	<h4><small>개인 정보를 수정할 수 있습니다.</small></h4>

	<div class="form center-block">
	
		<div class="form-group row">
			<h5 class="col-xs-4">ID</h5>
			<h5 id="userid" class="col-xs-8">${id}</h5>
		</div>
		<div class="form-group row">
			<h5 class="col-xs-4">이름</h5>
			<h5 id="username" class="col-xs-8">${name}</h5>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">기수</h5>
			<h5 id="classnum" class="col-xs-8">${class_num}</h5>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">기존 비밀번호</h5>
			<div class="col-xs-8">
				<input id="password" class="form-control" type="password" placeholder="기존 비밀번호"></input>
			</div>
		</div> 
		
		<div class="form-group row">
			<h5 class="col-xs-4">새 비밀번호</h5>
			<div class="col-xs-8">
				<input id="newpassword" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호"></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">비밀번호 확인</h5>
			<div class="col-xs-8">
				<input id="newpasswordconfirm" class="form-control" disabled="disabled" type="password" placeholder="새 비밀번호 확인"></input>
			</div>
		</div>
		
		
		<div class="form-group row">
			<h5 class="col-xs-4">이메일</h5>
			<div class="col-xs-8">
				<input id="email" class="form-control" placeholder="email@gmail.com" value=${email}></input>
			</div>
		</div>
		
		<div class="form-group row">
			<h5 class="col-xs-4">핸드폰 번호</h5>
			<div class="col-xs-8">
				<input id="phonenum" class="form-control" type="tel" placeholder="010-1234-5678" value=${phone}></input>
			</div>
		</div>
		
		<button id="modify" type="button" class="btn btn-primary btn-block" disabled="disabled">수정</button>
	</div>
		
	</div>
	
	
	    -->

	<script src="/GardenPlatformWeb/resource/js/user/user.js"></script>
	<script src="/GardenPlatformWeb/resource/js/lib/jasny-bootstrap.js"></script>
</body>
</html>