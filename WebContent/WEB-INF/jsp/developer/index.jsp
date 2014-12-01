<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/developer.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/docs.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/lib/styles/monokai_sublime.css">
	<script src="/GardenPlatformWeb/resource/js/lib/highlight.pack.js"></script>
	<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>
	<div class="container">

		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3 role="navigation">
				<div class="well">
					<h4>Developers</h4>
				</div>
				<div class="bs-sidebar well" data-spy="affix" data-offset-top="200" data-offset-bottom="200">
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#myApps">My Apps</a>
						<ul class="nav">
							<li><a href="#do_registapp">앱 등록하기</a></li>
							<li><a href="#dashboard">Dashboard</a></li>
							<li><a href="#appdetail">App Detail</a></li>
							<li><a href="#roles">Roles</a></li>
							<li><a href="#setting">Setting</a></li>
						</ul></li>
					</ul>
					<a class="btn btn-primary btn-lg" href="/GardenPlatformWeb/downloadSDK.do" role="button" style="margin-top:20px;">SDK Download</a>
				</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				
				<h2 id="myApps">My Apps</h2>
				
				<h3 id="do_registapp">앱 등록하기</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/registapp.png"/> <br/>
					<p>상단의 탭을 통하여 앱 등록을 선택하면 다음과 같은 모달을 볼 수 있습니다.<br/>
					<div class="bs-callout bs-callout-danger">
						<h5>
							<strong class="col-md-3">App Name</strong> 사용할 앱이름을 입력합니다.(중복된 이름은 사용 할 수 없습니다.) <br/>
							<strong class="col-md-3">URL</strong> Web App의 첫화면의 URL을 입력합니다. <br/>
							<strong class="col-md-3">Redirect URL</strong> OAuth인증 URL을 입력합니다. <br/>
							<strong class="col-md-3">Permission</strong> 퍼미션을 설정합니다. <br/>
						</h5>
					</div>
					</p>
				</div>
				<h3 id="dashboard">Dashboard</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/dashboard.PNG"/> <br/>
					<p>Dashboard App ID, App Secret을 볼 수 있습니다.<br/>
					App이미지, URL, Redirect URL을 수정 할 수 있습니다.
					</p>
				</div>
				<h3 id="appdetail">App Detail</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/appDetail.PNG"/> <br/>
					<p>App에 대한 세부 정보를 입력할 수 있습니다.<br/>
					App에 대한 태그정보, 설명, 카테고리, 약관 등을 설정 할 수 있습니다. <br/>
					</p>
				</div>
				<h3 id="roles">Roles</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/roles.PNG"/> <br/>
					<p>App 개발에 참여하고 있는 사람들을 추가 할 수 있습니다.<br/>
					Add Developers를 누르면 팀원을 검색하여 추가할 수 있습니다. <br/>
					</p>
				</div>
				<h3 id="setting">Setting</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/setting.PNG"/> <br/>
					<p>일반 유저에게 보여지는 앱이름과 연락 받을 이메을을 설정하고 앱을 출시 하거나 삭제할 수 있습니다.<br/>
					ON/OFF 스위치를 통해 앱을 출시할 수 있으며, 출시된 앱은 스토어에 등록되며 유저들이 사용 할 수 있습니다. <br/>
					</p>
					<div class="bs-callout bs-callout-danger">
						<h5>
							<strong class="col-md-3">Dispaly Name</strong> 일반 유저에게 보여지는 이름 <br/>
							<strong class="col-md-3">Contact Email</strong> 앱에대한 문의 사항이나 버그 리보트를 받을 수 있는 이메일 <br/>
							<strong class="col-md-3">Delete App</strong> 앱 삭제 (프로젝트 리더만 삭제가 가능합니다.) <br/>
						</h5>
					</div>
				</div>
				
				<pre>
					<code class="hljs java">
@Controller
public class UserController {

	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	public void static main() {
		int a;
		boolean b;
		System.out.println("asdf");
	}
}

					</code>
				</pre>
			
		
			
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div>


	<script src="/GardenPlatformWeb/resource/js/developer/developer.js"></script>

</body>
</html>