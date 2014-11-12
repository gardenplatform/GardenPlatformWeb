<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>

	<div class="container">

		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3 role="navigation">
				<div class="well">
				<h4>Developer</h4>
				</div>
				<div class="well">
				<ul class="snb nav">
					<li class="active"><a href="/GardenPlatformWeb/my_apps/index.do">Getting Start</a></li>
					<li><a href="/GardenPlatformWeb/my_apps/apps_detail.do">Apps Detail</a></li>
					<li><a href="#" data-toggle="collapse" data-target="#sub1"> Dropdown <span class="caret"></span></a>
						<ul class="nav collapse" id="sub1">
							<li><a href="#">Sub Link 1</a></li>
							<li><a href="#">Sub Link 2</a></li>
							<li><a href="#">Sub Link 3</a></li>
						</ul>
					</li>
				</ul>
				</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				<div class="jumbotron">
  <h1>Getting Start!</h1>
  <p>밥줘영</p>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div>


	<script src="/GardenPlatformWeb/resource/js/developer/developer.js"></script>

</body>
</html>