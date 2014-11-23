// roles js

$('#add_developer').click(function(){
	
	var appName = $('#appName').text(); 
	var memberID = $('#findid').val();
	
	var data = {
			appName    : appName,
			memberID   : memberID
	};
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/addMember.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				setSuccess("멤버 추가가 완료되었습니다");
				setTimeout(function(){
					location.href = location.href;
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
	
});

$('.userInfo').click(function(){
	
	var index = $(this).index('.userInfo');
	var userID = $('#owner').html();
	if(index!=0) {
		userID = $('.member').eq(index-1).html();
		$('#delete_developer').show();
	}
	else {
		$('#delete_developer').hide();
	}
	
	var data = {
			userID : userID
	};
	
	$.ajax({
		type : "GET",
		url : "/GardenPlatformWeb/userInfo.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				$('#modalUserID').html(obj.username);
				$('#modalUserName').html(obj.real_name);
				$('#modalUserClass').html(obj.class_num);
				$('#modalUserEmail').html(obj.email);
				$('#modalUserPhone').html(obj.phone);
			}
			else{
				setError(obj.msg);
			}

			$('div#info_developer_modal').modal('show');

		},
		error : function(xhr, status, error) {
			location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
		}
	});
});


$('#delete_developer').click(function(){
	
	var userID = $('#modalUserID').html();
	var data = {
			userID : userID
	};
	
	console.log(userID);
	
	/*
	$.ajax({
		type : "GET",
		url : "/GardenPlatformWeb/deleteDeveloper.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				
			}
			else{
				setError(obj.msg);
			}
		},
		error : function(xhr, status, error) {
			location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
		}
	});
	*/
});


