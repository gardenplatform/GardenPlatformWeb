// roles js
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

//엔터 인식
$('#searchinput').keydown(function(){
	if(event.keyCode == 13){
		event.preventDefault();
		$('#searchbutton').trigger('click');
		return false;
	}
});

$('#searchmodedropdown li a').click(function(){
	$('#searchmode').html($(this).html() + ' <span class="caret"></span>');
	mode = $(this).parent().index();
});

$('#searchbutton').click(function(){
	setProgress("검색 중입니다.");
	
	var string = '<tbody>';
	
	var search = $('#searchinput').val();
	var mode = $('#searchmode').text();
	
	var name = "이름";
	var id = "아이디";
	var id1 = "test2"
	
	if(mode.trim()=="이름") {
		string += '<tr><td class="text-center">'+id+'</td><td class="text-center">'+name+'</td></tr><tr><td class="text-center">'+id1+'</td><td class="text-center">'+name+'</td></tr>';
	}
	else if(mode.trim()=="아이디") {
		string += '<tr><td class="text-center">'+id+'</td><td class="text-center">'+name+'</td></tr><tr><td class="text-center">'+id1+'</td><td class="text-center">'+name+'</td></tr>';
	}
	string += '</tbody>';
	
	$('#search_result').html(string);
	
	
	// 테이블 tr 클릭
	$('#search_result tr').click(function(){
		console.log("click");
		$('#search_result tr').removeClass('success');
		$(this).addClass('success');
	});
	
	
	dismissProgress();
});

$('#add_developer').click(function(){
	
	var appName = $('#appName').text().trim(); 
	var memberID = $('#search_result tr.success').find(':first-child').html();
	console.log(memberID);
	var search = $('#search_result');
	
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
					location.href = "/GardenPlatformWeb/my_apps/roles.do?appName="+appName;
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

$('#delete_developer').click(function(){

	var appName = $('#appName').text();
	var memberID = $('#modalUserID').html();
	var data = {
			appName    : appName,
			memberID : memberID
	};
	console.log(data);
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/deleteMember.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				setSuccess("멤버 삭제가 완료되었습니다");
				setTimeout(function(){
					location.href = "/GardenPlatformWeb/my_apps/roles.do?appName="+appName;
				}, 500);
			}
			else{
				setError(obj.msg);
			}
		},
		error : function(xhr, status, error) {
			//location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			setError("멤버 삭제에 실패하였습니다.");
		}
	});
});


