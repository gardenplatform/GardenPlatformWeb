// store js

$(document).ready(function(){
	$('#nav-store').addClass('active');
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
			console.log(obj);
			if(obj.status=="success") {
				$('.modal-title').html(obj.status);
				$('#short_des').html(obj.shortDescription);
				$('#long_des').html(obj.longDescription);
				$('#contact_email').html(obj.contactEmail);
				$('#category').html(obj.category);
				
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

$('.store_register').click(function(){
	//앱 추가
});
