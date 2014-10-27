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

$('#add_developer').click(function(){
	var appName = $('#appName').text();
	
	
});

