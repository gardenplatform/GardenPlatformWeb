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
<!-- content23 -->
        <section class="content-23 v-center">
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
                  <div class="additional-links" style="color:#555; margin-bottom:30px;">
                      By signing up you agree to <a href="#">Terms of Use</a> and <a href="#">Privacy Policy</a>
                  </div>
              </div>
            </div>
        </section>


        <section class="price-1">
            <div class="container" >
                <h3>Take a look to our Plans</h3>
                <p class="lead">
                    This is a probably the best plans ever born
                </p>
                <div class="row plans">
                    <div class="col-sm-4">
                        <div class="plan">
                        	<img src="/GardenPlatformWeb/resource/img/icons/iPhone@2x.png" alt="Compas">
                            <div class="title">MY APPS</div>
                            <div class="description">
                            	샬라샬라 설명
                            </div>
                            <a class="btn btn-primary" href="#">Go to MY APPS page</a>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="plan">
                        	<img src="/GardenPlatformWeb/resource/img/icons/Pocket@2x.png" alt="Compas">
                            <div class="title">APP STORE</div>
                            <div class="description">
                            	샬라샬라 설명
                            </div>
                            <a class="btn btn-primary" href="#">Go to STORE page</a>
                        </div>
                    </div>
                   	<div class="col-sm-4">
                        <div class="plan">
                        	<img src="/GardenPlatformWeb/resource/img/icons/Settings@2x.png" alt="Compas">
                            <div class="title">DEVELOPER</div>
                            <div class="description">
                            	샬라샬라 설명
                            </div>
                            <a class="btn btn-primary" href="#">Go to DEVELOPER page</a>
                        </div>
                    	<div class="ribbon">NEW</div>
                    </div>
                </div>
            </div>
        </section>
		
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="/GardenPlatformWeb/resource/js/lib/jquery-1.10.2.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/bootstrap.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/modernizr.custom.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/startup-kit.js"></script>
        <script src="/GardenPlatformWeb/resource/js/lib/jquery.backgroundvideo.min.js"></script>
        <script src="/GardenPlatformWeb/resource/js/main.js"></script>
    </body>
</html>