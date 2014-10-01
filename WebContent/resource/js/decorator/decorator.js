(function($) {
  	// 회원가입 이벤트
	$('#signupBtn' ).click(function() {
		var id = $('#signupId').val();
		var pwd1 = $('#signupPwd1').val();
		var pwd2 = $('#signupPwd2').val();
		var email = $('#signupEmail').val();
		var phone = $('#signupPhone').val();
		
		var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
		var reg_phone=/^\(?([0-9]{2,3})\)?[-. ]?([0-9]{3,4})[-. ]?([0-9]{4})$/;
		
		
		var userInfo = {
				id    : id,
				pwd   : pwd1,
				email : email,
				phone : phone
		};
		
		var fieldNameElement = document.getElementById('signupMsg');
		
		if(id  == "" || pwd1  == "" || pwd2  == "" || email  == ""|| phone=="") {	
			fieldNameElement.innerHTML = "All fileds are required.";
		}
		else if(email.search(reg_email) == -1){
			fieldNameElement.innerHTML = "Email is invalid.";
		}
		else if(phone.search(reg_phone) == -1){
			fieldNameElement.innerHTML = "Phone number is invalid.";
			console.log(0);
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
					if(obj.status==200) {
						signin(id,pwd1);
					}
					else {
						location.href="error.do?status="+obj.status;
					}
				},
				error : function(xhr, status, error) {
					location.href="error.do?status="+status;
					console.log("Status : " + status + "\n" + "Error : " + error);
				}
			});	
		}
	});

	$('#signupModalBtn').click(function() {
		$('#signupId').val("");
		$('#signupPwd1').val("");
		$('#signupPwd2').val("");
		$('#signupEmail').val("");
		$('#signupPhone').val("");
		
		var fieldNameElement = document.getElementById('signupMsg');
		fieldNameElement.innerHTML = "";
	});

})(jQuery);

