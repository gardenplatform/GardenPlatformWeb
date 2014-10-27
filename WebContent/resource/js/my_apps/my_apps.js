// myapps js

$(document).ready(function(){
	$('#nav-myapps').addClass('active');
});

$('#app_secret_show').click(function(){
	//show 눌리면 App Secret 지우고 그안에 값 넣어주셈
	$('#app_secret').val("1234");
	//$('#app_secret').addClass("hidden");
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