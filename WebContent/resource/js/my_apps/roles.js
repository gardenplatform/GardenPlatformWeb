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
	
	var search = $('#searchinput').val().trim();
	console.log(search);
	var mode = $('#searchmode').text();
	console.log(mode);
	var data = {
			mode : mode,
			search : search
	};
	
	if(search == ""){
		setError("아이디 또는 이름을 입력해주세요.");
	}
	else {
		$.ajax({
			type : "GET",
			url : "/GardenPlatformWeb/searchUser.do",
			data : data,
			success : function(data) {
				var obj = jQuery.parseJSON(data);
				console.log(obj);
				var string='';
				string += '<tbody>';

				if(obj.userList.length==0){
					string += '<tr><td class="text-center">검색결과가 없습니다.</td></tr>';
				}
				else {
					for(var i=0; i<obj.userList.length; i++){
						string += '<tr>';
						string += '<td class="text-center"><img style="width:50px; height:50px; margin-bottom:0px" class="thumbnail-round" src="'+obj.userList[i].profile_img+'"></td>';
						string += '<td class="text-center">'+obj.userList[i].class_num+'</td>';
						string += '<td class="text-center">'+obj.userList[i].real_name+'</td>';
						string += '<td class="text-center memberid">'+obj.userList[i].username+'</td>';
						string += '</tr>';
					}
				}
				dismissProgress();

				string += '</tbody>';
				$('#search_result').html(string);

				// 테이블 tr 클릭
				$('#search_result tr').click(function(){
					$('#search_result tr').removeClass('success');
					$(this).addClass('success');
				});
			},
			error : function(xhr, status, error) {
				location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
			}
		});
	}

});

//모달 초기화
$('#modal_reset').click(function(){
	var string = ' ';
	$('#search_result').html(string);
	$('#searchinput').val("");
});

$('#add_developer').click(function(){
	var appName = $('#appName').text().trim(); 
	var memberID = $('#search_result tr.success td.memberid').html().trim();
	
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


