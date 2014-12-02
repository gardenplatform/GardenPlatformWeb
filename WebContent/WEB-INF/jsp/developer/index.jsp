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

<body data-spy="scroll" data-target=".bs-sidebar">
	<div class="container">

		<div class="row">
			<div class="col-md-3 role="navigation">
				<div class="bs-sidebar" data-spy="affix" data-offset-top="200" data-offset-bottom="200">
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#myApps">My Apps</a>
							<ul class="nav">
								<li><a href="#do_registapp">앱 등록하기</a></li>
								<li><a href="#dashboard">Dashboard</a></li>
								<li><a href="#appdetail">App Detail</a></li>
								<li><a href="#roles">Roles</a></li>
								<li><a href="#setting">Setting</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#gardenSDKDownlaod">Garden SDK Download</a></li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#tutorial_java">Garden SDK Tutorial</a>
							<ul class="nav">
								<li><a href="#Tutorial_1">Step 1</a></li>
								<li><a href="#Tutorial_2">Step 2</a></li>
								<li><a href="#Tutorial_3">Step 3</a></li>
								<li><a href="#Tutorial_4">Step 4</a></li>
								<li><a href="#Tutorial_5">Step 5</a></li>
								<li><a href="#Tutorial_6">Step 6</a></li>
								<li><a href="#Tutorial_7">Step 7</a></li>
								<li><a href="#Tutorial_8">Step 8</a></li>
								<li><a href="#Tutorial_9">Step 9</a></li>
								<li><a href="#Tutorial_10">Step 10</a></li>
								<li><a href="#Tutorial_11">Step 11</a></li>
								<li><a href="#Tutorial_12">Step 12</a></li>
								<li><a href="#Tutorial_13">Step 13</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#guideSDK">Garden SDK Guide</a>
							<ul class="nav">
								<li><a href="#Guide_1">Guide 1</a></li>
								<li><a href="#Guide_2">Guide 2</a></li>
								<li><a href="#Guide_3">Guide 3</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li class="active"><a href="#guideApi">Garden Api Guide</a>
						</li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li><a href="/GardenPlatformWeb/sdk/doc/index.html" target="_blank">Garden SDK Document</a></li>
					</ul>
					<ul class="nav bs-sidenav manualmenu">
						<li><a href="http://211.189.127.73:8000/docs/" target="_blank">Rest Api Document</a></li>
					</ul>
				</div>
			</div>

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
				
				<br/>
				<h2 id="gardenSDKDownlaod">Garden SDK Download</h2>
				<div class="well">
					<div class="bs-callout bs-callout-danger">
						<h5>
							<strong>Garden SDK</strong>를 통해 앱을 개발해보세요.<br/>
							하나의 통합된 계정으로 쉽게 시스템을 이용할 수 있습니다.
						</h5>
					</div>
					<a href="/GardenPlatformWeb/downloadSDK.do">
						<button class="btn-mint" >Garden SDK Download</button>
					</a>
				</div>
				
				<h2 id="tutorial_java">Garden SDK Tutorial</h2>
				<div class="well">
					<div class="bs-callout bs-callout-danger">
						<h5>
							<strong>샘플 서블릿 컨트롤러 (ServletSample.java, ServletCallbackSample.java)를</strong></br>
							다운로드 받아 추가하면 더욱 쉽게 구현할 수 있습니다.
						</h5>
					</div>
					<a href="/GardenPlatformWeb/downloadSample.do">
						<button class="btn-mint" >Garden Sample Download</button>
					</a>
					<a href="/GardenPlatformWeb/downloadTutorialDoc.do">
						<button class="btn-mint" >Tutorial Document Downlaod</button>
					</a>
				</div>
				<h3 id="Tutorial_1">Step 1 : 어플리케이션의 Client ID와 Client Secret을 받는다.</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/dashboard.PNG"/> <br/>
					<p>
					redirect URL은 Authentication 과정을 위한 URL로 <br/>
					실제로 로그인 후 redirect될 페이지가 아닌 임의의 콜백 URL로 지정한다. (실제 존재하는 페이지가 아니어도 됨.)<br/>
					</p>
				</div>
				<h3 id="Tutorial_2">Step 2 : SDK를 다운로드 받고, 본인의 IDE에 Import한다.</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_step2.PNG"/> <br/>
					<p>
					이클립스의 경우, <br/>
					1) 해당 프로젝트 우클릭 -> Properties 선택 -> <br/>
					Java Build Path메뉴에서 Libraries 탭 선택 -> Add External Jars 버튼 클릭 후 SDK 선택<br/>
					2) 해당 프로젝트 우클릭 -> Properties 선택 -> Deployment Assembly 메뉴에서 Add 버튼 클릭 -> <br/>
					Java Build Path Entries 선택 후 SDK 선택.<br/>
					</p>
				</div>
				<h3 id="Tutorial_3">Step 3 : Garden 로그인을 위한 서블릿을 만든다.</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_step3.PNG"/> <br/>
					<p>
					Garden 로그인을 위한 서블릿 클래스(컨트롤러) 1개를 만든 후<br/> 
					AbstractAuthorizationCodeServlet를 상속하여, Implemented된 메소드들을 상속받는다. <br/>
					</p>
				</div>
				<h3 id="Tutorial_4">Step 4 : 변수들의 값을 설정한다.</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_step3.PNG"/> <br/>
					<p>
					Garden Platform에 앱을 등록할 때 입력한 Redirect URI와, <br/>
					등록 후 받은 Client Id, Client Secret, Scope를 String타입으로 선언 및 초기화한다. <br/> 
					(Scope의 경우 현재 'read'권한만 제공한다.)
					</p>
				</div>
				<h3 id="Tutorial_5">Step 5 : getRedirectUri() 메소드를 설정한다.</h3>
<pre>
<code class="hljs java">
GenericUrl url = new GenericUrl(req.getRequestURL().toString());
url.setRawPath(Redirect_Uri); //Redirect_uri는Garden Platform 앱에등록한RedirectURL의URI이다.
returnurl.build();

</code>
상속받은 getRedirectUri 메소드에 Redirect_Uri를 리턴할 수 있도록 다음과 같은 코드를 추가한다.<br/>
</pre>

				<h3 id="Tutorial_6">Step 6 : initializeFlow() 메소드를 설정한다.</h3>
<pre>
<code class="hljs java">
AuthorizationCodeFlow flow = new AuthorizationCodeFlow.Builder(
newBasicAuthentication(Garden_Client_ID, Garden_Client_Secret), Garden_Client_ID) 
//Garden_Client_ID, Garden_Client_Secret은Garden Platform에서서발급받은값이다.
.setScopes(Arrays.asList(SCOPE)) //Scope는현재'read' 권한만제공한다.
.setApprovalPrompt("auto")
.build();

return flow;

</code>
상속받은 initializeFlow()메소드에 다음과같은코드를추가한다.<br/>
</pre>
				<h3 id="Tutorial_7">Step 7 : Oauth Callback을 위한 서블릿을 만든다.</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_step7.PNG"/> <br/>
					<p>
					Oauth Callback을 위한 서블릿클래스(컨트롤러)를 하나 더 만든 후, <br/>
					AbstractAuthorizationCodeServlet을 상속하여 <br/>
					Implemented된 메소드와 onError, onSuccess 메소드를 Override한다.<br/>
					</p>
				</div>
	
				<h3 id="Tutorial_8">Step 8 : OnError() 메소드를 설정한다.</h3>
<pre>
<code class="hljs java">
protected void onError(HttpServletRequest req, HttpServletResponse resp,
		AuthorizationCodeResponseUrl errorResponse)throws ServletException,IOException{
		
	redirectAfterErrorAuth(req, resp, "http://localhost:8080/GardenServletSample/");
	// 세번째파라미터에는에러발생시Redirect 될주소를넣는다/
}

</code>
상속받은 onError 메소드에 redirectAfterErrorAuth 메소드를 넣어
에러발생시 Redirect될 주소를 지정한다.<br/>
</pre>

				<h3 id="Tutorial_9">Step 9 : OnError() 메소드를 설정한다.</h3>
<pre>
<code class="hljs java">
protected void onSuccess(HttpServletRequest req, HttpServletResponse resp,
		TokenResponse tokenResponse)throws ServletException,IOException{
		
	redirectAfterSuccessAuth(req, resp,
		"http://localhost:8080/GardenServletSample/login_success");
	// 세번째파라미터에는로그인성공시Redirect될주소를넣는다.
}

</code>
상속받은 onSuccess 메소드에도 redirectAfterSuccessAuth 메소드를 넣어
로그인성공시 Redirect될 주소를 넣는다.<br/>
</pre>

				<h3 id="Tutorial_10">Step 10 : getRedirectUri(), initializeFlow() 메소드를 설정한다.</h3>
<pre>
<code class="hljs java">
protected String getRedirectUri(HttpServletRequest req)throws ServletException, IOException{

	GenericUrl url = new GenericUrl(req.getRequestURL().toString());
	url.setRawPath(GardenTutorial.Redirect_Uri);
	
	return url.build();
}

</code>
getRedirectUri 메소드와 initializeFlow 메소드에는 이전에 만들었던 
서블릿 클래스(GardenTutorial.java)를 참조하여 다음과 같은 코드를 추가한다.<br/>
</pre>

				<h3 id="Tutorial_11">Step 11 : getRedirectUri(), initializeFlow() 메소드를 설정한다.</h3>
<pre>
<code class="hljs xml">
<span class="hljs-tag">&lt;<span class="hljs-title">servlet</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-name</span>&gt;</span><servlet-class>ServletSample</servlet-class><span class="hljs-tag"><span class="hljs-title">/servlet-name</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-class</span>&gt;</span><servlet-class>controller.GardenTutorial</servlet-class><span class="hljs-tag">&lt;<span class="hljs-title">/servlet-class</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">/servlet</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">servlet-mapping</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-name</span>&gt;</span><servlet-class>ServletSample</servlet-class><span class="hljs-tag"><span class="hljs-title">/servlet-name</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">url-pattern</span>&gt;</span><servlet-class>/gardenLogin</servlet-class><span class="hljs-tag">&lt;<span class="hljs-title">/url-pattern</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">/servlet-mapping</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">servlet</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-name</span>&gt;</span><servlet-class>ServletCallbackSample<</servlet-class><span class="hljs-tag"><span class="hljs-title">/servlet-name</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-class</span>&gt;</span><servlet-class>controller.GardenTutorialCallback</servlet-class><span class="hljs-tag">&lt;<span class="hljs-title">/servlet-class</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">/servlet</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">servlet-mapping</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">servlet-name</span>&gt;</span><servlet-class>ServletCallbackSample<</servlet-class><span class="hljs-tag"><span class="hljs-title">/servlet-name</span>&gt;</span>
	<span class="hljs-tag">&lt;<span class="hljs-title">url-pattern</span>&gt;</span><servlet-class>/garden2callback</servlet-class><span class="hljs-tag">&lt;<span class="hljs-title">/url-pattern</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">/servlet-mapping</span>&gt;</span>

</code>
web.xml에 만든 서블릿 컨트롤러를 추가하고, url-pattern을 다음 주석과 같이 지정한다.<br/>
</pre>

				<h3 id="Tutorial_12">Step 12 : Garden Platform 전용 로그인버튼을 만든다.</h3>
<pre>
<code class="hljs xml">
&lt;<span class="hljs-title">form </span><span class="hljs-attribute">action=</span><span class="hljs-value">"gardenLogin" </span><span class="hljs-attribute">method=</span><span class="hljs-value">"get"</span>&gt;
	<span class="hljs-title">&lt;<span class="hljs-title">input </span><span class="hljs-attribute">type=</span><span class="hljs-value">"submit" </span><span class="hljs-attribute">value=</span><span class="hljs-value">"가든 로그인"</span>/&gt;
&lt;<span class="hljs-title">/form</span></span>&gt;

</code>
Garden Platform 전용 로그인 버튼을 만든 후
 버튼을 누를 시 web.xml에서 지정한 url-pattern으로 GET Method로 Request 보내도록 한다.<br/>
</pre>

				<h3 id="Tutorial_13">Step 13 : API 사용하기</h3>
<pre>
만든 로그인 버튼을 누르면 Authorization 과정이 진행되고, 
Redirect될 페이지로 성공적으로 Redirect된 경우 연동에 성공한것이다. 
Redirect된 페이지 세션에서 다음과 같이 Access Token 정보를 확인할 수 있다. 
(사용자 정보를 가져오는 등 API를 호출하는 것은 API Guide 참조)<br/>
<code class="hljs java">
protected void doGet(HttpServletRequest request, HttpServletResponse response)
						throws ServletException,IOException{
	HttpSession session = request.getSession();
	String accessToken = (String)session.getAttribute("access_token");
	System.out.println("success session tests : "+accessToken);
}

</code>
</pre>
				</br>
				<h2 id="guideSDK">Garden SDK Guide</h2>
				
				<div class="well">
					<div class="bs-callout bs-callout-danger">
						<h5>
							Garden API는 Oauth Authorization 과정을 통해 Access Token을 받은 후, <br/>
							Access Token을 이용하여 호출할 수 있다. <br/>
							아래의 코드와 같이 Access Token을 이용하여 Clients 객체를 만든 후 <br/>
							다음과 같은 메소드로 API를 호출할 수있다. <br/>
						</h5>
					</div>
					<a href="/GardenPlatformWeb/downloadSDKGuideDoc.do">
						<button class="btn-mint" >SDK Guide Document Downlaod</button>
					</a>
				</div>
				<pre><code class="hljs java">Clients client = new Clients(accessToken);</code></pre>		
					
				<h3 id="Guide_1">Guide 1 : 로그인한 사용자 프로필 가져오기</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide1_1.PNG"/> <br/>
					<p>
					리턴받은값에서 Json이아닌 파싱된 데이터를 가져오려면<br/> 
					getProfile() 메소드 뒤에 get(index)를 한 후 다음과 같은 메소드를 사용한다. <br/>
					</p>
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide1_2.PNG"/> <br/>
				</div>
				
				<h3 id="Guide_2">Guide 2 : 로그인한 사용자가 이용 중인 앱목록 가져오기</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide2_1.PNG"/> <br/>
					<p>
					리턴받은값에서 Json이아닌 파싱된 데이터를 가져오려면<br/> 
					getProjectList() 메소드 뒤에 get(index)를 한 후 다음과 같은 메소드를 사용한다. <br/>
					</p>
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide2_2.PNG"/> <br/>
				</div>
				
				<h3 id="Guide_3">Guide 3 : 로그인한 사용자가 진행한 프로젝트 목록 가져오기</h3>
				<div class="well">
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide3_1.PNG"/> <br/>
					<p>
					리턴받은값에서 Json이아닌 파싱된 데이터를 가져오려면<br/> 
					getAppList() 메소드 뒤에 get(index)를 한 후 다음과 같은 메소드를 사용한다. <br/>
					</p>
					<img class="img-responsive" src="/GardenPlatformWeb/resource/img/developer/sdk_guide3_2.PNG"/> <br/>
				</div>
				<h2 id="guideApi">Garden Api Guide</h2>
				<div class="well">
					<div class="bs-callout bs-callout-danger">
						<h5>
							Rest Api를 통해 다양한 언어로 개발할 수 있습니다. <br/>
						</h5>
					</div>
					<a href="/GardenPlatformWeb/downloadAPIGuideDoc.do">
						<button class="btn-mint" >API Guide Document Downlaod</button>
					</a>
				</div>
			</div>
		</div>
		
		<script src="/GardenPlatformWeb/resource/js/developer/developer.js"></script>
</body>
</html>