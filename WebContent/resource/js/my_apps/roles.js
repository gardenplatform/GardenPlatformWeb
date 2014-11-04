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
				setSuccess(obj.msg);
				location.href="/GardenPlatformWeb/my_apps/roles.do?appName="+appName;
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