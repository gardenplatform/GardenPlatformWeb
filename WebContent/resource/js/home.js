$('#google_search').click(function () {
	setTimeout(function(){
		$('#search_input').val("");
	}, 300);
});

$(function () { 
    $("[data-toggle='tooltip']").tooltip();
});


$('.delete_app').click(function () {
	
	var index = $(this).index('.delete_app');
	var appName = $('.realName').eq(index).val();
	
	data = {
			appName : appName
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/deleteBookmark.do",
		data : data,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			console.log(obj);
			if(obj.status=="success") {
				setSuccess("삭제가 완료되었습니다");
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