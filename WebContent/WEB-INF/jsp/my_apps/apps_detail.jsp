<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-5 col-sm-2 sidebar-offcanvas" id="sidebar" role="navigation">
				<h4>MY Apps</h4>
				<ul class="snb nav">
					<li><a href="/GardenPlatformWeb/my_apps/index.do">Dashboard</a></li>
					<li class="active"><a href="/GardenPlatformWeb/my_apps/apps_detail.do">Apps Detail</a></li>
					<li><a href="#" data-toggle="collapse" data-target="#sub1"> Dropdown <span class="caret"></span></a>
						<ul class="nav collapse" id="sub1">
							<li><a href="#">Sub Link 1</a></li>
							<li><a href="#">Sub Link 2</a></li>
							<li><a href="#">Sub Link 3</a></li>
						</ul>
					</li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9 content">
				컨텐츠 추가예정
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div><!--/.container-->

	<script src="/GardenPlatformWeb/resource/js/my_apps/my_apps.js"></script>
</body>
</html>