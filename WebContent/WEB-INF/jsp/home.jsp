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
			<div class="row">
				<div class="col-md-12">
					<div class="text-center" style="margin-top:100px;">
						<img src="/GardenPlatformWeb/resource/img/Garden-Logo.png">
					</div>
					<div class="text-center" style="margin-bottom:30px;">
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

				<c:forEach var="item" items="${bookmarkList}">
					<div class="col-xs-6 col-md-3 text-center">
						<input class="realName" type="hidden" value="${item.realName}">
						<button type="button" class="close delete_app"><span aria-hidden="true">&times;</span></button>
						<c:choose>
							<c:when test="${item.publish}">
								<a href="${item.url}" class="thumbnail-round">
									<img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="${item.appImgUrl}" data-toggle="tooltip" data-placement="top" data-original-title="${item.displayName}" style="width: 140px; height: 140px;">
								</a>
						    </c:when>
						    <c:otherwise>
								<a class="thumbnail-round">
									<img data-src="holder.js/140x140" class="img-circle" alt="140x140" src="${item.appImgUrl}" data-toggle="tooltip" data-placement="top" data-original-title="Publish OFF" style="width: 140px; height: 140px; -webkit-filter: grayscale(1);">
								</a>
						    </c:otherwise>
					    </c:choose>
							
					</div>
				</c:forEach>
				 	
			</div>
		</div>
		<script src="/GardenPlatformWeb/resource/js/home.js"></script>
</body>
</html>