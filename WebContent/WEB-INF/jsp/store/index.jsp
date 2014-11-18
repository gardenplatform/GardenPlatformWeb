<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/store/store.css">
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
						<ul class="nav collapse" id="sub1">
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
			<c:forEach var="item" items="${appList}">
				<div class="col-md-3">
					<a href="/GardenPlatformWeb/store/detail.do?appName="${item.appName}>
		        	<div class="thumbnail">
						<a class="thumbnail" style="margin-bottom: 0px;"><img class="show_detail" src="https://lh6.ggpht.com/1eVPA6Iukw-F4i5xq1ZWicaKBzmprLGw98YhdG20E-wlsHHg3PcKJqbY_fWLdJeGRw=w170-rw" alt="300x200" data-src="holder.js/300x200"></a>
						<div class="caption">
							<h4 class="ellipsis">${item.displayName}</h4>
							<p><h5 class="ellipsis"><small>${item.category}</small></h5></p>
							<input type="hidden" class="appName" value="${item.appName}">
							<!--  <button class="btn btn-mint" id="store_register">추가</button> -->
						</div>
					</div>
					</a>
		    	</div>
			</c:forEach>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="store_modal">
	    <div class="modal-dialog-long modal-vertical-centered">
	        <div class="modal-content">
	        	<div class="modal-header">
	        		<div class="row">
	        		<div class="col-md-2 text-center">
	        		 <img src="https://lh6.ggpht.com/1eVPA6Iukw-F4i5xq1ZWicaKBzmprLGw98YhdG20E-wlsHHg3PcKJqbY_fWLdJeGRw=w170-rw" style="width:73px; height:73px;">
	        		</div>
	        		<div class="col-md-10">
		                <h3 class="modal-title"></h3>
		                <h4><small id="category"></small></h4>
	        		</div>	        		
	        		</div>
	            </div>
	            <div class="modal-body">
		            <div class="row">
		        		<div class="col-md-9">
		            	<h4><strong>설명</strong></h4>
		            	<h5><strong id="short_des"></strong></h5>
		            	<div id="long_des">
		            	</div>
		            	<!-- 
		            	<div id="contact_email">
		            	</div>
		            	<div id="category">
		            	</div>
		            	 -->
						<input type="hidden" id="detail_realAppName">
		        		</div>
		        		<div class="col-md-3">
			        		<div class="well well-lg">
			        			
			        		</div>
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

	<script src="/GardenPlatformWeb/resource/js/store/store.js"></script>
</body>
</html>