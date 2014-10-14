<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    
    </head>
	
	<body>
		<div class="container">
			<div class="col-md-14" style="margin-top:100px;">
				<div class="tile" style="height:500px;">
					<div style="margin-top:30px;">
						<img src="/GardenPlatformWeb/resource/img/icons/error.png" alt="Error Message"
						class="tile-image big-illustration" width="200" height="200">
					</div>
					<h1> ${status} ${title} </h1>
					<h4> ${type}</h4> 
					<p> ${content} </p>
					<a class="btn btn-primary btn-large btn-block"
						href="/GardenPlatformWeb/home.do">Go Home</a>
				</div>
			</div>
		</div>
	
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="/GardenPlatformWeb/resource/js/lib/jquery-1.10.2.min.js"></script>
		<script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
	</body>
</html>