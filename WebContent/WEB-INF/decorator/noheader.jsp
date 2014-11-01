<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Garden Platform</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        
        <link rel="shortcut icon" href="/GardenPlatformWeb/resource/img/favicon.png">
        
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/bootstrap.css">
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/decorator/decorator.css">
        
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.11.0.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        
        <decorator:head/>
    </head>

    <body>
		<div class="wrapper">
   			<decorator:body/>
   		</div>
		<!-- footer -->
		<div class="undermargin"></div>
		
		<div class="footer">
			<div class="container">
				<h5 class="text-right"><small>Copyright 2014 Samsung Software Membership, All Rights Reserved.</small></h5>
				<h6 class="text-right"><small>Developed by Sungjin Park, Juyoung Park, Sungho Park, Sangwoo Jun</small></h6>
			</div>
		</div>
		
		<!-- script -->
		<script src="/GardenPlatformWeb/resource/js/decorator/noheader.js"></script>
    </body>
</html>