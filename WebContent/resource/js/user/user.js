// user js

/*
	//빱줘영님 정보 받아와서 넣어주셈.
	$('#userid').html(data.userid);
	$('#username').html(data.username);
	$('#classnum').val(data.class_num);
	$('#phonenum').val(data.phone_num);
	$('#email').val(data.email);
*/

var newpasswordgroup = $('#newpassword').add('#newpasswordconfirm'); 

$('#password').keyup(function(){
	var password = $(this).val();
	
	if(password.length == 0){
		$(newpasswordgroup).attr('disabled', 'disabled').val('');
	}
	else{
		$(newpasswordgroup).removeAttr('disabled');
	}
});

$('button#modify').click(function(){
var ispasswordchanged = $(newpasswordgroup).attr('disabled') == undefined? true : false;
	
	var classnum = $('#classnum').val();
	var phonenum = $('#phonenum').val();
	var email = $('#email').val();
	
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