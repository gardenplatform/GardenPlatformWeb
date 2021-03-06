// user js

$(document).ready(function(){
	$('#nav-userinfo').addClass('active');
});

$(function () { 
    $("[data-toggle='tooltip']").tooltip();
});

$('ul.nav-tabs li').click(function(){
	var index = $(this).index();
	$('ul.nav-tabs li').removeClass('active');
	$(this).addClass('active');
	console.log(index);
	if(index == 0){
		$('div#myapps').removeClass('hidden');
		$('div#profile').addClass('hidden');
	}
	else if(index == 1){
		$('div#profile').removeClass('hidden');
		$('div#myapps').addClass('hidden');
	}
});


var newpasswordgroup = $('#newpassword').add('#newpasswordconfirm'); 

$('#password').keyup(function(){

	var password = $('#password').val();
	console.log(password);
	console.log(password.length);
	if(password.length > 0) {
		$(newpasswordgroup).removeAttr('disabled');
		$('#modify').removeAttr('disabled');
	}
	else {
		$(newpasswordgroup).attr('disabled', 'disabled').val('');
		$('#modify').attr('disabled', 'disabled').val('');
	}
});

$("#imgFile").change(function() {

	if(!checkImgFile()){
		$("#imgFile").val("");
		$('#imgSubmit').addClass("hidden");
	}
	else{
		$('#imgSubmit').removeClass("hidden");
	}
});

  
function checkImgFile() {
	
    var fileName = $("#imgFile").val();
    var suffix = fileName.split(".")[1];
    
    if(fileName=="") {
    	return false;
    }
    else if (suffix.toUpperCase() == "PNG" || suffix.toUpperCase() == "JPG" ) {
    	return true;
    }
    else {
    	setError("이미지 파일을 선택해 주세요.");
        return false;
    }
}

$('button#modify').click(function(){
	var ispasswordchanged = $(newpasswordgroup).attr('disabled') == undefined? true : false;

	var id = $('#userid').html();
	var phone = $('#phonenum').val();
	var email = $('#email').val();
	
	var phoneRegEx = /01[0-9]-[0-9]{4}-[0-9]{4}/;
	var emailRegEx = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	
	var userInfo = {
			id 	: id,
			pwd   : pwd,
			newPwd   : newPwd1,
			email   : email,
			phone    : phone
	};
	
	if(ispasswordchanged){
		var pwd = $('#password').val();
		var newPwd1 = $('#newpassword').val();
		var newPwd2 = $('#newpasswordconfirm').val();
		
		if(newPwd1.length == 0){
			setError('비밀번호를 입력해 주십시오.');
			return;
		}
		
		if(newPwd1 != newPwd2){
			setError("새 비밀번호가 일치하지 않습니다.");
			return;
		}
		
		pwd = sha256_digest(pwd);
		newPwd1 = sha256_digest(newPwd1);
		
		userInfo.pwd = pwd;
		userInfo.newPwd = newPwd1;
	}

	if(!phoneRegEx.test(phone)) {
		setError("핸드폰 번호 입력 양식이 틀립니다.");
	}
	else if(!emailRegEx.test(email)) {
		setError("Email 입력 양식이 틀립니다.");
	} else {
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/updateUser.do",
			data : userInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				if(obj.status=="success") {
					setSuccess("성공적으로 변경되었습니다.");
					setTimeout(function(){
						location.href = "/GardenPlatformWeb/user/profile.do";
					}, 500);
				}
				else{
					setError(obj.msg);
				}
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});	
	}
	
	
	/*
	var userInfo = {
			id 	: id,
			pwd   : pwd,
			newPwd   : newPwd1,
			email   : email,
			phone    : phone,
	};
	
	if(!phoneRegEx.test(phone)) {
		setError("핸드폰 번호 입력 양식이 틀립니다.");
	}
	else if(!emailRegEx.test(email)) {
		setError("Email 입력 양식이 틀립니다.");
	}
	else if(newPwd1 != newPwd2) {
		setError("새로운 비밀번호를 확인해주세요.");
	}
	else {
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/updateUser.do",
			data : userInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				if(obj.status=="success") {
					setSuccess("성공적으로 변경되었습니다.");
					setTimeout(function(){
						location.href = "/GardenPlatformWeb/user/profile.do";
					}, 500);
				}
				else{
					setError(obj.msg);
				}
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});	
	}
	*/
	/*
			classnum : classnum,
			phonenum : phonenum,
			pwchanged : ispasswordchanged
			email : email
	*/
	
	/*
	if(ispasswordchanged){
		var password = $('#password').val();
		var newpassword = $('#newpassword').val();
		var newpasswordconfirm = $('#newpasswordconfirm').val();
		
		if(newpassword.length == 0){
			setError('비밀번호를 입력해 주십시오.');
			return;
		}
		
		if(newpassword != newpasswordconfirm){
			setError("새 비밀번호가 일치하지 않습니다.");
			return;
		}
		
	}
	*/
});