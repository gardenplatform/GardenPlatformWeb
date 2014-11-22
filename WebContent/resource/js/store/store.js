// store js

$(document).ready(function(){
	$('#nav-store').addClass('active');
});

$(function () { 
    $("[data-toggle='tooltip']").tooltip();
});

$('.show_detail').click(function(){

	var index = $(this).index('.show_detail');
	var appName = $('.appName').eq(index).val();
	
	data = {
			appName : appName
	};
	
	$.ajax({
		type : "GET",
		url : "/GardenPlatformWeb/getStoreDetail.do",
		data : data,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				var developer_email;
				var tag;
				var short_des;
				var long_des;
				var per;
				
				$('.modal-title').html(obj.displayName);
				
				if(obj.shortDescription == "없음"){
					short_des = "설명이 등록되지 않았습니다.";
					$('#short_des').html(short_des);
				} else {
					short_des = obj.shortDescription;
					$('#short_des').html(short_des);
				}
				
				if(obj.longDescription == "없음"){
					long_des = "설명이 등록되지 않았습니다.";
					$('#long_des').html('<small>'+long_des+'</small>');
				} else {
					long_des = obj.longDescription;
					$('#long_des').html(long_des);
				}
				
				if(obj.contactEmail == "없음"){
					developer_email = "메일이 등록되지 않았습니다.";
				} else {
					developer_email = obj.contactEmail;
				}
				$('#contact_email').html(developer_email);
				$('#category').html(obj.category);
				$('#created_at').html(obj.createdAt);
				
				if(obj.tag1 == "없음" && obj.tag2 == "없음" && obj.tag3 == "없음"){
					tag = "등록된 태그가 없습니다.";
				} else {
					tag = obj.tag1 + ", " + obj.tag2 + ", "+ obj.tag3;
				}
				$('#tags').html(tag);
				
				if(obj.permissionExplanation == "없음"){
					per = "등록된 약관이 없습니다.";
				} else {
					per = obj.permissionExplanation;
				}
				$('#permissionexplanation').html(per);
				
				$('#detail_realAppName').val(appName);
				$('div#store_modal').modal('show');
				
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

$('.m_addApp').click(function(){
	var index = $(this).index('.m_addApp');
	var appName = $('.appName').eq(index).val();
	console.log(appName);
	console.log(index);
	data = {
			appName : appName
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/addApp.do",
		data : data,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				setSuccess("추가가 완료되었습니다");
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



$('#addApp').click(function(){

	var appName = $('#detail_realAppName').val();
	
	data = {
			appName : appName
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/addApp.do",
		data : data,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				setSuccess("추가가 완료되었습니다");
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
