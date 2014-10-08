(function($) {
  	// 로그인 이벤트
	$('#signinBtn' ).click(function() {
		
		var id = $('#signinId').val();
		var pwd = $('#signinPwd').val();
		
		if(id  == "" || pwd  == "") {	
			console.log("All fileds are required.");
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
		url : "signin.do",
		data : userInfo,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				location.href="home.do";
			}
			else {
				//location.href="error.do?status="+obj.status+"&msg="+obj.msg;
			}
		},
		error : function(xhr, status, error) {
			location.href="error.do?status="+status+"&msg="+error;
		}
	});	
}