<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/store/store.css">
	<link rel="stylesheet" type="text/css" href="/GardenPlatformWeb/resource/css/lib/component.css" />
</head>

<body>
	<div class="container">
	<div class="row">
		<div class="col-md-3" role="navigation">
			<div class="well">
				<h4>Store</h4>
			</div>
			<div class="well">
				<ul class="snb nav">
					<li class="active"><a href="/GardenPlatformWeb/store/index.do"><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="#" data-toggle="collapse" data-target="#sub1"><span class="glyphicon glyphicon-tags"></span> Category <span class="caret"></span></a>
						<ul class="nav in" id="sub1">
							<li><a href="/GardenPlatformWeb/store/index.do?category=Webapp">Webapp</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Native">Native</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Books">Books</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Business">Business</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Communication">Communication</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Education">Education</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=Entertainment">Entertainment</a></li>
							<li><a href="/GardenPlatformWeb/store/index.do?category=etc">etc</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
			
		<div class="col-md-9">
			<div class="col-md-12">
			<div class="input-group form-group">
      			<div class="input-group-btn">
	        		<button id="searchmode" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	        			 <c:choose>
							<c:when test="${tag}">
								태그
						    </c:when>
						    <c:otherwise>
								앱이름
						    </c:otherwise>
					    </c:choose>
	        			<span class="caret"></span>
	        		</button>
	        		<ul class="dropdown-menu" id="searchmodedropdown">
	          			<li><a href="#">앱이름</a></li>
	          			<li><a href="#">태그</a></li>
	        		</ul>        		
      			</div>
      			<input type="text" class="form-control" id="searchinput" value="${search}">
      			<span class="input-group-btn">
       			<button class="btn btn-default" type="button" id="searchbutton">검색</button>
      			</span>
    		</div>
			</div>
    		
			<ul class="grid cs-style-3">
			<div class="row">
				<c:forEach var="item" items="${appList}">
					<div class="col-md-4">
						<li>
						<figure>
							<img class="thumbnail" src="${item.appImgUrl}" alt="img04" style="width:170px; height:170px;">
							<figcaption>
								<h5 class="ellipsis">${item.displayName}</h5>
								<c:if test="${empty item.category}">
									<h6>Empty Category</h6>
								</c:if>
								<h6>${item.category}</h6>
								<div class="pull-right">
								<button class="btn btn-mint btn-sm m_addApp">추가</button>
								<button class="btn btn-default btn-sm show_detail">정보</button>
								</div>
								<input type="hidden" class="appName" value="${item.appName}">
							</figcaption>
						</figure>
						</li>
					</div>
				</c:forEach>
			</div>
			</ul>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="store_modal">
	    <div class="modal-dialog modal-vertical-centered">
	        <div class="modal-content">
	        	<div class="modal-header">
	        		<div class="row">
	        		
		        		<div class="col-md-2 text-center">
		        			<img id="miniAppIcon" src="/GardenPlatformWeb/resource/img/dashboard_default_img.png" style="width:73px; height:73px;">
		        		</div>
		        		
		        		<div class="col-md-10">
			                <h3 class="modal-title"></h3>
			                <h4><small id="category"></small></h4>
		        		</div>
	        		</div>
	            </div>
	            <div class="modal-body">
		            <div class="row">
		        		<div class="col-md-12">
		        			<div class="form-group">
			            		<h4><strong>설명</strong></h4>
			            		<h5><strong id="short_des"></strong></h5>
			            		<h5 id="long_des"></h5>
		        			</div>

		            	<div class="form-group">
			            	<h4><strong>약관</strong></h4>
			        		<div id="permissionexplanation"></div>
		        		</div>
		        		
		        		<ul class="list-group">
							  <li class="list-group-item ellipsis"><span class="glyphicon glyphicon-wrench"></span>　<small id="contact_email"></small></li>
							  <li class="list-group-item ellipsis"><span class="glyphicon glyphicon-cloud"></span>　<small id="created_at"></small></li>
							  <li class="list-group-item ellipsis"><span class="glyphicon glyphicon-tags"></span>　<small id="tags"></small></li>
						</ul>
		        		
						<input type="hidden" id="detail_realAppName">
		        		</div>
					</div>
	            </div>
	            <div class="modal-footer">
                	<button class="btn btn-mint" type="button" id="addApp" >추가</button>  
	                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>

	<script src="/GardenPlatformWeb/resource/js/lib/modernizr.custom.js"></script>
	<script src="/GardenPlatformWeb/resource/js/store/store.js"></script>
</body>
</html>