(function($) {
  	// 회원가입 이벤트
	$('#signupBtn' ).click(function() {
		var id = $('#signupId').val();
		var pwd1 = $('#signupPwd1').val();
		var pwd2 = $('#signupPwd2').val();;
		var name = $('#signupName').val();
		var email = $('#signupEmail').val();
		var phone = $('#signupPhone').val();
		var classNum = $('#signupClass').val();
		var gender = $("input[name='gender']:checked").val();
		
		var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
		var reg_phone=/^\(?([0-9]{2,3})\)?[-. ]?([0-9]{3,4})[-. ]?([0-9]{4})$/;
		
		var userInfo = {
				id    : id,
				pwd   : pwd1,
				name  : name,
				email : email,
				phone : phone,
				classNum : classNum,
				gender : gender
		};
		
		var fieldNameElement = document.getElementById('signupMsg');
		
		if(id  == "" || pwd1  == "" || pwd2  == "" || name  == "" || email  == ""|| phone==""|| classNum=="") {	
			fieldNameElement.innerHTML = "All fileds are required.";
		}
		else if(email.search(reg_email) == -1){
			fieldNameElement.innerHTML = "Email is invalid.";
		}
		else if(phone.search(reg_phone) == -1){
			fieldNameElement.innerHTML = "Phone number is invalid.";
		}
		else if(pwd1 != pwd2) {
			fieldNameElement.innerHTML = "Password doesn't match the confirmation.";
		}
		else if(pwd1.length < 6 || pwd2.length < 6) {
			fieldNameElement.innerHTML = "Password is too short (minimum is 7 characters).";
		}
		else {
			$.ajax({
				type : "POST",
				url : "signup.do",
				data : userInfo,
				success : function(data) {
					var obj = jQuery.parseJSON(data);
					console.log(obj);
					if(obj.status=="success") {
						signin(id,pwd1);
					}
					else {
						location.href="error.do?status="+obj.status+"&msg="+obj.msg;
					}
				},
				error : function(xhr, status, error) {
					location.href="error.do?status="+status+"&msg="+error;
				}
			});	
		}
	});

	$('#signupModalBtn').click(function() {
		$('#signupId').val("");
		$('#signupPwd1').val("");
		$('#signupPwd2').val("");
		$('#signupName').val("");
		$('#signupEmail').val("");
		$('#signupPhone').val("");
		$('#signupClass').val("");
		
		$('input[name="gender"]').attr('checked', false);
		$('#signupMale').prop('checked', true);
		
		var fieldNameElement = document.getElementById('signupMsg');
		fieldNameElement.innerHTML = "";
	});

})(jQuery);

