<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/main.css">
    </head>

    <body>
    	<c:set var="id" value="${id}" />
        	<div class="container" >
            <div id="bgVideo" class="background" ></div>
            
            <div id="formBox" class="col-sm-5 pull-right">
			<h1 style="color:#1ABC9C">Garden Platform</h1>
            <p style="color:#555;">
				You have the design, you have the code. We’ve created the product that will help your startup to look even better.
            </p>
                  <div class="signin-form">
                         <div class="form-group">
                             <input class="form-control" id="signinId" type="text" placeholder="ID">
                         </div>
                         <div class="form-group">
                             <div>
                                 <input type="password" id="signinPwd" class="form-control" placeholder="Password">
                             </div>
                         </div>
                         <div class="form-group">
                             <button type="submit" id="signinBtn" class="btn btn-block btn-info">Sign in</button>
                         </div>
                  </div>
              </div>
            </div>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/jquery.backgroundvideo.min.js"></script>
    </body>
</html>