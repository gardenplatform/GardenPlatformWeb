<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="/GardenPlatformWeb/resource/css/main.css">
    </head>

    <body>
      	<div class="container">
			<div class="main_container">
				<div class="row vertical-center">
					<div class="col-md-6" style="text-align:center;">
						<img src="https://dt8kf6553cww8.cloudfront.net/static/images/empty_states/sign-in@2x-vflrhf4zv.png" style="width: 288px; height: 305px;">
					</div>
					<div class="col-md-5">
						<div id="formBox">
							<h1 style="color: #1ABC9C">Garden Platform</h1>
							<p style="color: #555;">하나의 통합된 계정으로 쉽게 시스템을 이용하세요!!</p>
							<div class="signin-form">
								<div class="form-group">
									<input class="form-control" id="signinId" type="text" placeholder="아이디">
								</div>
								<div class="form-group">
									<div>
										<input type="password" id="signinPwd" class="form-control"
											placeholder="비밀번호">
									</div>
								</div>
								<div class="form-group">
									<button type="submit" id="signinBtn" class="btn btn-block btn-info">로그인</button>
									<button id="signupModalBtn" class="btn btn-block btn-mint" data-toggle="modal" data-target="#signupModal">회원가입</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="modal fade" id="signupModal">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h4 class="modal-title">회원가입</h4>
		            </div>
		            <div class="modal-body">
		            	<form class="form-join form-horizontal" role="form">
			                <div class="form-group" id="groupid">
			                    <label class="control-label col-sm-3">ID</label>
			                    <div class="col-xs-12 col-sm-9">
			                        <input type="text" id="signupId" class="form-control" maxlength="30" placeholder="swssm" autofocus="">
			                    </div> 
			                    <label id="errorid" class="col-sm-offset-3 control-label hidden"></label>
			                </div>
			                <div class="form-group" id="passwordgroup">
			                    <label class="control-label col-sm-3">비밀번호</label>
			                    <div class="col-xs-12 col-sm-9">
			                        <input type="password" id="signupPwd1" class="form-control" maxlength="100" placeholder="********" />
			                    </div>
			                    <label id="errorpassword" class="col-sm-offset-3 control-label hidden"></label>
			                </div>
			                <div class="form-group" id="passwordgroup">
			                    <label class="control-label col-sm-3">비밀번호 확인</label>
			                    <div class="col-xs-12 col-sm-9">
			                        <input type="password" id="signupPwd2" class="form-control" maxlength="100" placeholder="********" />
			                    </div>
			                    <label id="errorpasswordconfirm" class="col-sm-offset-3 control-label hidden"></label>
			                </div>
			                <div class="form-group" id="namegroup">
			                    <label class="control-label col-xs-12 col-sm-3">이름</label>
			                    <div class="col-xs-12 col-sm-9">
			                        <input type="text" id="signupName" maxlength="5" class="form-control" placeholder="김창렬" />
			                    </div> 
			                    
			                    <label id="errorname" class="col-sm-offset-3 control-label hidden"></label>
			                </div>
			                
			                <div class="form-group" id="emailgroup">
			                	<label class="control-label col-xs-12 col-sm-3">이메일</label>
			                	<div class="col-xs-12 col-sm-9">
			                		<input type="text" id="signupEmail" class="form-control" placeholder="email@gmail.com" />
			                	</div>
			                	<label id="erroremail" class="col-sm-offset-3 control-label hidden text-danger"></label>
			                </div>
			                
			                <div class="form-group" id="phonegroup">
			                	<label class="control-label col-xs-12 col-sm-3">핸드폰</label>
			                	<div class="col-xs-12 col-sm-9">
			                		<input type="text" id="signupPhone" class="form-control" placeholder="010-1234-5678" />
			                	</div>
			                	<label id="errorphone" class="col-sm-offset-3 control-label hidden text-danger"></label>
			                </div>
			                
			                <div class="form-group" id="nameclass">
			                    <label class="control-label col-xs-12 col-sm-3">기수</label>
			                    <div class="col-xs-12 col-sm-9">
			                        <input type="text" id="signupClass" class="form-control" placeholder="23-1" />
			                    </div>
			                    
			                    <label id="errorclass" class="col-sm-offset-3 control-label hidden text-danger"></label>
			                </div>
			                
			                <div class="form-group" id="gender">
			                	<label class="control-label col-xs-12 col-sm-3">성별</label>
								<div class="col-xs-12 col-sm-9">
									<button type="button" class="btn btn-default dropdown-toggle" id="inputgender" data-toggle="dropdown" style="width: 100%">Male</button>
									<ul class="dropdown-menu" id="genderdropdown">
										<li><a href="#">Male</a></li>
										<li><a href="#">Female</a></li>
									</ul>
								</div>
								
								<label id="errorgender" class="col-sm-offset-3 control-label hidden text-danger"></label>
			                </div>
			                
           				</form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                	<button class="btn btn-mint" type="button" id="signupBtn" disabled="disabled">가입</button>  
		            </div>
		        </div>
		    </div>
		</div>
	
		<!-- script -->
	    <script src="/GardenPlatformWeb/resource/js/main.js"></script>
    
    </body>
</html>