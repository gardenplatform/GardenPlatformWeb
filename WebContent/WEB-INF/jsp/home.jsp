<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/home.css">
    </head>

    <body>
		<div class="container">
				<div class="text-center" style="margin-top:150px;">
					<img src="/GardenPlatformWeb/resource/img/Garden-Logo.png">
				</div>
				<div class="text-center">
				<form method=get action="http://www.google.co.kr/search" target="_blank" >
					<div class="input-group">
				      <input id="search_input" type="text" class="form-control" name=q maxlength=255 value="">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="submit" name=btnG id="google_search">Google 검색</button>
				      </span>
				    </div>
			    </form>
				</div>
		</div>
		<script src="/GardenPlatformWeb/resource/js/home.js"></script>
</body>
</html>