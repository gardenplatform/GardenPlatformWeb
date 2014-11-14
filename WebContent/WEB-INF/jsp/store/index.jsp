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
		        	<div class="thumbnail">
						<img src="https://lh6.ggpht.com/sJMM68hWF0hlzwANvG2sOvvHx-ApEfPyzUd63eXGAv-3I5IUXYt9hO8zmY1hmOlzjQ=w170-rw" alt="300x200" data-src="holder.js/300x200">
						<div class="caption">
							<h4 class="ellipsis">${item.displayName}</h4>
							<p><h5 class="ellipsis"><small>${item.category}</small></h5></p>
						</div>
					</div>
		    	</div>
			</c:forEach>
		</div>
		
	</div>
	</div>

	<script src="/GardenPlatformWeb/resource/js/store/store.js"></script>
</body>
</html>