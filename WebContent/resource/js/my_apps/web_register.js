$('#register').click(function(){

	var appName = $('#appName').val();
	var appUrl = $('#appUrl').val();
	var appRedirectUrl = $('#reUrl').val();
	
	var appInfo = {
			appName 	: appName,
			appUrl   : appUrl,
			appRedirectUrl   : appRedirectUrl,
	};
	
	if(appName=="" || appUrl=="" || appRedirectUrl=="") {
		alert("입력하지 않은 항목이 있습니다.");
	}
	else {
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/webRegister.do",
			data : appInfo,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				console.log(obj);
				if(obj.status=="success") {
					alert("성공적으로 등록되었습니다.");
					//location.href = "/GardenPlatformWeb/user/profile.do";
				}
				else{
					//location.href="/GardenPlatformWeb/error.do?status="+obj.status+"&msg="+obj.msg;
				}
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});	
	}
});