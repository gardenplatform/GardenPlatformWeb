(function($) {
	
	var idok = false;
	var errorid = $('#errorid');
	$('#signupId').change(function () {
	    var userid = $(this).val();
	    
	    var re = /.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+.*/;
	    var patt = new RegExp(" ");
	    
	    if(userid.length < 4){
	    	$(errorid).removeClass('text-success hidden').addClass('text-danger').html('아이디가 너무 짧습니다.');
	    	idok = false;
	    }
	    else if(re.test(userid)){
	    	$(errorid).removeClass('text-success hidden').addClass('text-danger').html('아이디에 한글을 사용할 수 없습니다.');
	    	idok = false;
	    }
	    else if(patt.test(userid)){
	    	$(errorid).removeClass('text-success hidden').addClass('text-danger').html('아이디에 띄어쓰기를 사용할 수 없습니다.');
	    	idok = false;
	    }
	    else{
	    	$(errorid).removeClass('text-danger text-success hidden').html('아이디 중복 확인 중..');
			var id = $('#signupId').val();
	    	var data = {
					id    : id,
			};
	    	$.ajax({
				type : "POST",
				url : "/GardenPlatformWeb/checkID.do",
				data : data,
				success : function(data) {
					var obj = jQuery.parseJSON(data);
					console.log(obj);
					if(obj.status=="success") {
		        		$(errorid).addClass('text-success').html('사용 가능한 아이디입니다.');
		        		idok = true;
					}
					else if(obj.status=="conflict") {
						$(errorid).addClass('text-danger').html('이미 존재하는 ID입니다.');
		        		idok = false;
					}
					else {
						location.href="/GardenPlatformWeb/error.do?status="+obj.status+"&msg="+obj.msg;
					}
				},
				error : function(xhr, status, error) {
					location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
				}
			});
	    }
	    toggleButton();
	    
	}); 
	// 아이디를 입력하여 텍스트가 변경되고 다른 곳을 클릭할때
	// 실시간으로 서버와 통신하여 아이디 중복 여부 확인
	
	var errorpassword = $('#errorpassword');
	var password;

	$('#signupPwd1').keyup(function () {
	    password = $(this).val();
	    
	    if(password.length < 8){
	    	$(errorpassword).removeClass('text-warning hidden').addClass('text-warning').html('좀 더 긴 비밀번호를 권장합니다.');
	    }
	    else{
	    	$(errorpassword).removeClass('text-warning').addClass('hidden');
	    }
	    toggleButton();
	}); // 비밀번호를 입력할 때마다 호출
	// 비밀번호의 길이 및 보안 확인

	var pwconfirmok = false;
	var errorpasswordconfirm = $('#errorpasswordconfirm');

	$('#signupPwd2').keyup(function(){
		
		var passwordconfirm = $(this).val();
		
		if(passwordconfirm == password || passwordconfirm.length == 0){
			$(errorpasswordconfirm).removeClass('text-danger').addClass('hidden').html('');
			pwconfirmok = true;
		}
		else{
			$(errorpasswordconfirm).removeClass('hidden').addClass('text-danger').html('비밀번호가 맞지 않습니다.');
			pwconfirmok = false;
		}
		toggleButton();
	});
	
	var erroremail = $('#erroremail');
	var emailok = false;
	$('#signupEmail').keyup(function(){
		
		var emailconfirm = $(this).val();
		
		var re = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
		
		if(re.test(emailconfirm) || emailconfirm.length == 0){
			$(erroremail).addClass('hidden').html('');
			emailok = true;
		}
		else{
			$(erroremail).removeClass('hidden').html('이메일 표현이 잘못되었습니다.');
			emailok = false;
		}
		toggleButton();
	});
	
	var errorphone = $('#errorphone');
	var phoneok = false;
	$('#signupPhone').keyup(function(){
		var phonenum = $(this).val();
		
		var re = /01[0-9]-[0-9]{4}-[0-9]{4}/;
		
		if(re.test(phonenum) || phonenum.length == 0){
			phoneok = true;
			$(errorphone).removeClass('text-warning').addClass('hidden');
		}
		else{
			$(errorphone).removeClass('hidden').html('핸드폰 번호 표현이 잘못되었습니다.');
			phoneok = false;
		}
		toggleButton();
	});
	
	var errorclass = $('#errorclass');
	var classok = false;
	$('#signupClass').keyup(function(){
		var classnum = $(this).val();
		
		var re = /\d{2}(\-)[1-2]{1}$/;
		
		if(re.test(classnum) || classnum.length == 0){
			$(errorclass).addClass('hidden').html('');
			classok = true;
		}
		else{
			$(errorclass).removeClass('hidden').html('기수 표현이 잘못되었습니다.');
			classok = false;
		}
		toggleButton();
	});
	
	$('#genderdropdown li a').click(function(){
		$('#inputgender').html($(this).html());
	});
	
	function toggleButton(){
		if(idok && pwconfirmok && classok && phoneok && emailok){
			$('#signupBtn').removeAttr('disabled');
		}
		else{
			$('#signupBtn').attr('disabled', 'disabled');
		}
	}
	
  	// 회원가입 이벤트
	$('#signupBtn' ).click(function() {
		var id = $('#signupId').val();
		var pwd1 = $('#signupPwd1').val();
		pwd1 = sha256_digest(pwd1);
		var pwd2 = $('#signupPwd2').val();
		var name = $('#signupName').val();
		var email = $('#signupEmail').val();
		var phone = $('#signupPhone').val();
		var classNum = $('#signupClass').val();
		var gender = $('#inputgender').html();
		
		var userInfo = {
				id    : id,
				pwd   : pwd1,
				name  : name,
				email : email,
				phone : phone,
				classNum : classNum,
				gender : gender
		};
		
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/signup.do",
			data : userInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				console.log(obj);
				console.log(obj.status);
				if(obj.status=="success") {
					setSuccess("회원가입이 완료되었습니다.");
					setTimeout(function(){
						signin(id,pwd1);
					}, 300);
				}
				else {
					setError(obj.msg);
				}
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});	
	});
	

	// 회원가입 내용초기화
	$('#signupModalBtn').click(function() {
		$('#signupId').val("");
		$('#signupPwd1').val("");
		$('#signupPwd2').val("");
		$('#signupName').val("");
		$('#signupEmail').val("");
		$('#signupPhone').val("");
		$('#signupClass').val("");
	});
	
	
	// 엔터 인식
	$('#signinPwd').keydown(function(){
		if(event.keyCode == 13){
			event.preventDefault();
			$('#signinBtn').trigger('click');
			return false;
		}
	});
	
  	// 로그인 이벤트
	$('#signinBtn' ).click(function() {
		
		var id = $('#signinId').val();
		var pwd = $('#signinPwd').val();
		pwd = sha256_digest(pwd);
		
		if(id  == "" || pwd  == "") {	
			setError("아이디와 비밀번호를 입력해주세요.");
		}
		else {
			signin(id,pwd);
		}
		console.log();
	});

})(jQuery);


function signin(id, pwd) {
	
	var userInfo = {
			id    : id,
			pwd   : pwd
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/signin.do",
		data : userInfo,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				location.href="/GardenPlatformWeb/home.do";
			}
			else {
				setError(obj.msg);
			}
		},
		error : function(xhr, status, error) {
			location.href="error.do?status="+status+"&msg="+error;
		}
	});	
}