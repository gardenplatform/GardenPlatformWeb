// myapps js

$(document).ready(function(){
	$('#nav-myapps').addClass('active');
});

$('#app_secret_show').click(function(){
	var appSecretInputTag = $('#app_secret');

	if(appSecretInputTag.attr("type")=="password") {
		appSecretInputTag.attr("type","text");
		$('#app_secret_show').text("Hide");
		
	}
	else if(appSecretInputTag.attr("type")=="text") {
		appSecretInputTag.attr("type","password");
		$('#app_secret_show').text("Show");
	}
});


//index

//app detail


//roles
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

//setting
$('#setting_update').click(function(){
	//Setting update
});

$('#deleteApp').click(function(){
	//Setting update
});