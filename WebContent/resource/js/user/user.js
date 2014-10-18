// user js

var newpasswordgroup = $('#newpassword').add('#newpasswordconfirm'); 

$('#password').keyup(function(){
	var id = $('#userid').html();
	var pwd = $(this).val();
	
	var userInfo = {
			id    : id,
			pwd   : pwd
	};
	
	console.log(userInfo);
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/checkPwd.do",
		data : userInfo,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				$(newpasswordgroup).removeAttr('disabled');
				$('#modify').removeAttr('disabled');
			}
			else if(obj.status=="failure"){
				$(newpasswordgroup).attr('disabled', 'disabled').val('');
				$('#modify').attr('disabled', 'disabled').val('');
			}
			else{
				location.href="/GardenPlatformWeb/error.do?status="+obj.status+"&msg="+obj.msg;
			}
		},
		error : function(xhr, status, error) {
			location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
		}
	});	
});

$('button#modify').click(function(){
var ispasswordchanged = $(newpasswordgroup).attr('disabled') == undefined? true : false;

	var id = $('#userid').html();
	var phone = $('#phonenum').val();
	var email = $('#email').val();
	var pwd = $('#password').val();
	var newPwd1 = $('#newpassword').val();
	var newPwd2 = $('#newpasswordconfirm').val();
	
	var phoneRegEx = /01[0-9]-[0-9]{4}-[0-9]{4}/;
	var emailRegEx = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	
	var userInfo = {
			id 	: id,
			pwd   : pwd,
			newPwd   : newPwd1,
			email   : email,
			phone    : phone,
	};
	
	if(phone=="" || email=="" || pwd=="") {
		setError("입력하지 않은 항목이 있습니다.");
		//alert("입력하지 않은 항목이 있습니다.");
	}
	else if(!phoneRegEx.test(phone)) {
		setError("핸드폰 번호 입력 양식이 틀립니다.");
//		alert("핸드폰 번호 입력 양식이 틀립니다.");
	}
	else if(!emailRegEx.test(email)) {
		setError("Email 입력 양식이 틀립니다.");
//		alert("email 입력 양식이 틀립니다.");
	}
	else if(newPwd1 != newPwd2) {
		setError("새로운 비밀번호를 확인해주세요.");
		//alert("새로운 비밀번호를 확인해주세요.");
	}
	else {
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/updateUser.do",
			data : userInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				console.log(obj);
				if(obj.status=="success") {
					setSuccess("성공적으로 변경되었습니다.");
					//alert("성공적으로 변경되었습니다.");
					location.href = "/GardenPlatformWeb/user/profile.do";
				}
				else if(obj.status=="failure"){
					alert("비밀번호가 틀렸습니다.");
				}
				else{
					location.href="/GardenPlatformWeb/error.do?status="+obj.status+"&msg="+obj.msg;
				}
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});	
	}
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