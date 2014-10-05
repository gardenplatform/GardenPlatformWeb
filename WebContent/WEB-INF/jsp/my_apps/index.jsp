<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>
	<div class="container">

		<div class="snb">

			<h4>MY Apps</h4>

			<ul class="nav nav-pills nav-stacked">
			  <li class="active"><a href="#">Dashboard</a></li>
			  <li><a href="#">Apps Detail</a></li>
			  <li><a href="#">Messages</a></li>
			  <li class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
			    </a>
			    <ul class="dropdown-menu" role="menu">
			    	<li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
			    </ul>
			  </li>
			</ul>
			
		</div>
		
		<div class="content">
		 컨텐츠
		</div>
	</div>

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>