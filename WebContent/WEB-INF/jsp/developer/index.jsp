<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/deceloper.css">
	<link rel="stylesheet" href="/GardenPlatformWeb/resource/css/developer/docs.css">
</head>

<body>
<!-- 
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
 -->
	<div class="container">

		<div class="row">
			<!-- sidebar -->
			<div class="col-md-3 role="navigation">
				<div class="well">
					<h4>Developers</h4>
				</div>
				<div class="well">
					<div class="bs-sidebar" data-spy="affix" data-offset-top="60" data-offset-bottom="200">
				<ul class="nav bs-sidenav manualmenu">
					<li class="active"><a href="#book">도서 시스템</a><ul class="nav">
						<li><a href="#bookrent">도서 대여</a></li>
						<li><a href="#bookcheckrent">내 도서 현황</a></li>
						<li><a href="#bookapply">도서 신청</a></li>
					</ul></li>
					<li><a href="#hardware">하드웨어 시스템</a><ul class="nav">
						<li><a href="#hardwarerent">하드웨어 대여 신청</a></li>
						<li><a href="#adminhardwarerecord">하드웨어 대여기록</a></li>
						<li><a href="#managerhardwarerent">운영실 하드웨어 대여</a></li>
						<li><a href="#hardwarerentcheck">하드웨어 대여 현황</a></li>
						<li><a href="#materialrequest">개발자재 신청</a></li>
						<li><a href="#checkmaterialrequest">신청한 개발자재 확인</a></li>
					</ul></li>
					<li><a href="#fee">회비 시스템</a><ul class="nav">
						<li><a href="#checkfee">회비 사용 내역</a></li>
						<li><a href="#checkfeeunpaid">회비 미납 내역</a></li>
					</ul></li>
					<li><a href="#duty">당직 시스템</a><ul class="nav">
						<li><a href="#checkduty">당직 확인</a></li>
						<li><a href="#requestdutychange">당직 맞변경 신청</a></li>
						<li><a href="#checkdutypoint">상벌당직 조회</a></li>
					</ul></li>
					<li><a href="#chrome">크롬 웹 애플리케이션</a></li>
					<li><a href="#android">안드로이드 애플리케이션</a></li>
				</ul>
			</div>
				</div>
			</div>

			<!-- main area -->
			<div class="col-md-9">
				<div class="jumbotron">
				  <h1>Getting Start!</h1>
				  <p>밥줘영</p>
				  <p><a class="btn btn-primary btn-lg" href="/GardenPlatformWeb/downloadSDK.do" role="button">SDK Download</a></p>
				</div>
				<h2 id="book">도서 시스템</h2>
				<h3 id="bookrent">도서 대여</h3>
			
			<img src="/images/manual/bookrent2.jpg"/>
			<p>도서를 클릭하면, 위와 같은 창으로 이동됩니다.</p>
			<div class="bs-callout bs-callout-danger"><h5>분실 신고는 도서가 대여 가능한 상태에서만 가능합니다. 도서 대여 신청 후 분실됨을 알았을 때는 반납 후 분실 신고를 해주세요.</h5></div>
			
			<img src="/images/manual/bookrent3.jpg"/>
			<p>대여중인 도서는 다음과 같이 대여한 회원의 이름과, 대여 기한, 도서를 예약한 사람 수를 알려 드립니다.</p>
			<div class="bs-callout bs-callout-danger"><h5>현재 도서를 대여중인 회원은 동일한 도서를 예약할 수 없습니다.</h5></div>
			
			<h3 id="bookcheckrent">내 도서 현황</h3>
			<img src="/images/manual/bookcheckrent1.jpg"/>
			<p>내가 대여중인 도서와 예약한 도서를 볼 수 있습니다.</p>
			<p>내가 빌린 도서 탭에서는 빌린 도서의 이름, 예약자의 명수, 대여 기한 등이 표시되며 대여 기한은 그래프로도 표기됩니다. 그래프는 대여 기간을 초과하였을 경우 빨간색, 남은 대여 기간이 3일 이하인 경우 노란색, 그 외에는 초록색을 띕니다.</p>
			<div class="bs-callout bs-callout-info"><h5>예약자가 n명 있습니다. 문구를 클릭하면 예약자의 목록을 볼 수 있습니다.</h5></div>
			<div class="bs-callout bs-callout-info"><h5>예약한 도서가 반납되었을 경우, 순차적으로 자동 대여가 되며 다음 대여자는 푸시 알림을 받습니다.</h5></div>
			
			<img src="/images/manual/bookcheckrent2.jpg"/>
			<p>도서 대여 기간이 3일 이하로 남은 경우, 대여 연장 버튼이 활성화되며 대여 연장을 신청할 수 있습니다.</p>
			
			<img src="/images/manual/bookcheckrent3.jpg"/>
			<p>예약자가 있을 경우 대여 연장 버튼이 비활성화되며 연장 불가임을 알려드립니다.</p>
			
			<h3 id="bookapply">도서 신청</h3>
			<img src="/images/manual/bookapply1.jpg"/>
			<p>멤버십에 원하는 도서가 없거나 있지만 신청자가 많아 대여하기가 어려울 경우 도서를 새로 신청할 수 있습니다.</p>
			
			<img src="/images/manual/bookapply2.jpg"/>
			<p>이미 존재하는 도서의 경우 n권 대여의 형태로 정보를 알려드립니다.</p>
			
			<div class="bs-callout bs-callout-danger"><h5>절판된 도서의 경우 목록에 나타나지 않습니다.</h5><h5>품절된 도서의 경우는 신청할 수 있지만 주문 당시에도 품절상태일 경우 해당 달에 주문하지 않을 수도 있습니다.</h5></div>
			
			<img src="/images/manual/bookapply3.jpg"/>
			<p>책을 클릭하면 위와 같은 창이 뜨며, 해당 도서를 신청할 수 있습니다.</p>
			
			<h2 id="hardware">하드웨어 시스템</h2>
			<h3 id="hardwarerent">하드웨어 대여 신청</h3>
			
			<img src="/images/manual/hardwarerent1.jpg"/>
			<p>하드웨어 대여 신청 탭에서는 대여 가능한 하드웨어 목록을 볼 수 있고, 대여 신청을 할 수 있습니다.</p>
			
			<img src="/images/manual/hardwarerent2.jpg"/>
			<p>물품을 클릭하면 위 화면과 같이 새 창이 뜨며, 대여할 수량을 선택하고 대여를 신청하면 됩니다.</p>
			
			<div class="bs-callout bs-callout-info"><h5>목록에 없는 하드웨어 부품은 대여 신청 없이 가져가 사용하실 수 있습니다.</h5></div>
			<div class="bs-callout bs-callout-danger"><h5>하드웨어 부품을 반납 시에는 반드시 제자리에 놓아주십시오.</h5></div>
			
						
			<h3 id="managerhardwarerent">운영실 하드웨어 대여</h3>
			<img src="/images/manual/hardwarerent3.jpg"/>
			<p>운영실 하드웨어는 대여 후 바로 사용할 수 없습니다.</p>
			<p>신청 후 운영자님이 승인하시면 대여가 가능하며, 운영자님의 승인은 매일 아침에 이루어집니다.</p>
			<p>대여가 승인되면 푸시 알림으로 알려드리며, 푸시 알림을 받은 회원은 운영실에서 기기를 받아가시면 됩니다.</p>
			
			<div class="bs-callout bs-callout-info"><h5>운영실 하드웨어를 대여하고자 하면 여유있게 1일~2일 전에 신청해 주세요!</h5></div>
			
			
			<h3 id="hardwarerentcheck">하드웨어 대여 현황</h3>
			<img src="/images/manual/hardwarerentcheck1.jpg"/>
			<p>하드웨어 대여 현황에서는 내가 빌린 하드웨어 목록을 볼 수 있습니다.</p>
			
			<div class="bs-callout bs-callout-info"><h5>하드웨어는 대여 예약이 불가능합니다.</h5></div>
			<div class="bs-callout bs-callout-danger"><h5>하드웨어를 연체할 경우 벌당직이 추가됩니다!</h5></div>
			
			<h3 id="materialrequest">개발자재 신청</h3>
			<img src="/images/manual/materialrequest.jpg"/>
			<p>과제 개발에 필요한 자재의 경우 신청하여 사용할 수 있습니다.</p>
			<p>사용 용도와 각 부품의 정보를 입력 후, 신청하면 됩니다.</p>
			
			<div class="bs-callout bs-callout-info"><h5>빈 칸은 - 로 입력해 주시면 됩니다.</h5></div>
			<div class="bs-callout bs-callout-danger"><h5>한 번 신청한 내역은 수정할 수 없습니다. 불가피하게 수정 내역이 생기면 신청 내역을 삭제하고 다시 신청해 주십시오.</h5></div>
			
			<h3 id="checkmaterialrequest">신청한 개발자재 확인</h3>
			
			<img src="/images/manual/checkmaterialrequest1.jpg"/>
			<p>신청했던 개발 자재를 확인할 수 있습니다.</p>
			
			<div class="bs-callout bs-callout-danger"><h5>자재를 수정하시려면 개별 자재를 클릭하여 삭제하고 다시 신청해 주십시오.</h5></div>
			
			
			<h2 id="fee">회비 시스템</h2>
			<h3 id="checkfee">회비 사용 내역</h3>
			<img src="/images/manual/fee1.jpg"/>
			<p>월간 회비 사용 내역을 확인할 수 있습니다.</p>
			
			<h3 id="checkfeeunpaid">회비 미납 내역</h3>
			<img src="/images/manual/feeunpaid1.jpg"/>
			<p>개인별로 회비와 우유, 삼성과제비 미납량을 알 수 있습니다.</p>
			
			<h2 id="duty">당직 시스템</h2>
			<h3 id="checkduty">당직 확인</h3>
			<img src="/images/manual/checkduty1.jpg"/>
			<p>당월 당직을 알 수 있습니다.</p>
			<div class="bs-callout bs-callout-info"><h5>노란색으로 보여지는 이름은 당일 벌당직입니다.</h5></div>
			
			<h3 id="requestdutychange">당직 맞변경 신청</h3>
			<img src="/images/manual/requestdutychange1.jpg"/>
			<img src="/images/manual/requestdutychange2.jpg"/>
			<p>당직 맞변경을 신청할 수 있습니다.</p>
			<p>1. 변경 신청자 1에서 자신을 선택합니다. 이 부분은 자신이 아직 하지 않은 당직이 보여집니다.</p>
			<p>2. 변경 신청자 2에서 맞변경하고자 하는 회원의 날짜를 클릭합니다.</p>
			<p>3. 해당 날짜의 회원을 클릭하고 맞변경을 신청합니다.</p>
			
			<div class="bs-callout bs-callout-info"><h5>당직 맞변경 신청이 승인되거나 거부되면 푸시 알림을 받을 수 있습니다.</h5></div>
			
			<h3 id="checkdutypoint">상벌당직 조회</h3>
			<img src="/images/manual/checkdutypoint1.jpg"/>
			<p>자신과 모든 회원의 상, 벌당직을 받은 기록을 볼 수 있습니다.</p>
			
			<h2 id="chrome">크롬 웹 애플리케이션</h2>
			<img src="/images/manual/systeminfo.jpg"/>
			<h3>크롬 웹 애플리케이션은 <a href="/info/appinfo">정보 - 시스템 정보</a>에서 다운로드받을 수 있습니다.</h3>
			
			<img src="/images/manual/info.jpg"/>
			<p>정보 탭에서 크롬 Push 웹 애플리케이션을 눌러 크롬 웹 스토어로 이동 후, 다운로드받아 설치합니다.</p>
			
			<img src="/images/manual/chromegcm.jpg"/>
			<p>크롬 Push 웹 애플리케이션 창에서 자신의 아이디와 비밀번호를 입력하여 인증받고 등록합니다.</p>
			
			<img src="/images/manual/chromepush.jpg"/>
			<div class="bs-callout bs-callout-info"><h5>정상적으로 등록되면 등록되었다는 푸시 메시지가 화면 우측 하단에 출력됩니다. 또한 추후 모든 푸시 알림이 해당 자리에서 보여집니다!</h5></div>
			
			<img src="/images/manual/chromegcm2.jpg"/>
			<p>해당 계정에 등록된 크롬 브라우저는 내 정보에서 확인할 수 있습니다.</p>
			
			<h2 id="android">안드로이드 애플리케이션</h2>
			<img src="/images/manual/systeminfo.jpg"/>
			<h3>안드로이드 애플리케이션은 <a href="/info/appinfo">정보 - 시스템 정보</a>에서 다운로드받을 수 있습니다.</h3>
			<img src="/images/manual/android1.png" class="portrait"/>
			<p>안드로이드 애플리케이션에서 로그인하면 위 화면과 같이 계정에 기기가 등록됩니다.</p>
			<div class="bs-callout bs-callout-info"><h5>등록된 기기에서는 해당 계정으로 자동로그인되며, 추후 푸시 알림을 받을 수 있습니다.</h5></div>
			
			<img src="/images/manual/deletedevice.jpg"/>
			<div class="bs-callout bs-callout-info"><h5>자동로그인을 해제하고 다른 계정으로 로그인하려면 내 정보 탭의 등록된 모바일 디바이스 정보에서 해당 기기를 삭제하십시오. 기기를 삭제하면 푸시 알림을 받을 수 없습니다.</h5></div>
			
				
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div>


	<script src="/GardenPlatformWeb/resource/js/developer/developer.js"></script>

</body>
</html>