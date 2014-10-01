(function($) {
    $(function() {
        var videobackground = new $.backgroundVideo($('#bgVideo'), {
            "align" : "centerXY",
            "path" : "/GardenPlatformWeb/resource/video/",
            "width": 1280,
            "height": 720,
            "filename" : "preview",
            "types" : ["mp4", "ogg", "webm"]
        });
    });

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
			if(obj.status==200) {
				location.href="home.do";
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