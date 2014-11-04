// index js

$(document).ready(function(){
	$('#nav-myapps').addClass('active');
	
	var appURL = $('#index_app_url').val();
	var appRedirectUrl = $('#index_app_redirecturl').val();
	
	if(appURL.match("^http://")) {
		$('#index_app_url').val(appURL.replace("http://",""));
		$('#index_type').html("http://");
	}
	else if(appURL.match("^https://")) {
		$('#index_app_url').val(appURL.replace("https://",""));
		$('#index_type').html("https://");
	}
	
	if(appRedirectUrl.match("^http://")) {
		$('#index_app_redirecturl').val(appURL.replace("http://",""));
		$('#index_re_type').html("http://");
		
	}
	else if(appRedirectUrl.match("^https://")) {
		$('#index_app_redirecturl').val(appURL.replace("https://",""));
		$('#index_re_type').html("https://");
	}
});

$('#index_typedropdown li a').click(function(){
	$('#index_type').html($(this).html());
});

$('#index_re_typedropdown li a').click(function(){
	$('#index_re_type').html($(this).html());
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

$('#index_update').click(function(){
	
	var appName = $('#appName').text(); 
	var appUrl =  $('#index_type').html() + $('#index_app_url').val();
	var appRedirectUrl = $('#index_re_type').html() + $('#index_app_redirecturl').val();
	
	var data = {
			appName : appName,
			appUrl : appUrl,
			appRedirectUrl    : appRedirectUrl
	};
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/updateClient.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				setSuccess("수정이 완료되었습니다");
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
	console.log(data);

});

var url_ok = false;
var reurl_ok = false;

$('#index_app_url').keyup(function(){
	 var appurl = $(this).val();
	 
	 var re = /^(https?:\/\/)?((([a-z\d](([a-z\d-]*[a-z\d]))|([ㄱ-힣])*)\.)+(([a-zㄱ-힣]{2,}))|((\d{1,3}\.){3}\d{1,3}))(\:\d+)?(\/[-a-z\d%_.~+]*)*(\?[;&a-z\d%_.~+=-]*)?(\#[-a-z\d_]*)?$/;

	 if (appurl.length == 0){
		 $('#index_appurl_div').removeClass('has-success');
		 $('#index_appurl_div').removeClass('has-error');
		 $('#index_appurl_success').addClass('hidden');
		 $('#index_appurl_fail').addClass('hidden');
		 $('#index_type').removeClass('btn-success');
		 $('#index_type').removeClass('btn-danger');
		 url_ok = false;
    } else if (re.test(appurl)){
   	$('#index_appurl_div').addClass('has-success');
   	$('#index_appurl_success').removeClass('hidden');
   	$('#index_appurl_fail').addClass('hidden');
   	$('#index_type').addClass('btn-success');
   	$('#index_type').removeClass('btn-danger');
   	url_ok = true;
    } 
	 else {
		$('#index_appurl_div').addClass('has-error');
		$('#index_appurl_fail').removeClass('hidden');
		$('#index_appurl_div').removeClass('has-success');
		$('#index_appurl_success').addClass('hidden');
		$('#index_type').addClass('btn-danger');
		$('#index_type').removeClass('btn-success');
		url_ok = false;
	 }
	 toggle_update_Button();
});

$('#index_app_redirecturl').keyup(function(){
	 
	 var reurl = $(this).val();
	 var re = /^(https?:\/\/)?((([a-z\d](([a-z\d-]*[a-z\d]))|([ㄱ-힣])*)\.)+(([a-zㄱ-힣]{2,}))|((\d{1,3}\.){3}\d{1,3}))(\:\d+)?(\/[-a-z\d%_.~+]*)*(\?[;&a-z\d%_.~+=-]*)?(\#[-a-z\d_]*)?$/;

	 if (reurl.length == 0){
		 $('#index_reurl_div').removeClass('has-success');
		 $('#index_reurl_div').removeClass('has-error');
		 $('#index_reurl_success').addClass('hidden');
		 $('#index_reurl_fail').addClass('hidden');
		 $('#index_re_type').removeClass('btn-success');
		 $('#index_re_type').removeClass('btn-danger');
		 reurl_ok = false;
    } else if (re.test(reurl)){
   	$('#index_reurl_div').addClass('has-success');
   	$('#index_reurl_success').removeClass('hidden');
   	$('#index_reurl_fail').addClass('hidden');
   	$('#index_re_type').addClass('btn-success');
   	$('#index_re_type').removeClass('btn-danger');
   	reurl_ok = true;
    } 
	 else {
		$('#index_reurl_div').addClass('has-error');
		$('#index_reurl_fail').removeClass('hidden');
		$('#index_reurl_div').removeClass('has-success');
		$('#index_reurl_success').addClass('hidden');
		$('#index_re_type').addClass('btn-danger');
		$('#index_re_type').removeClass('btn-success');
		reurl_ok = false;
	 }
	 toggle_update_Button();
});

function toggle_update_Button(){
	if(reurl_ok && url_ok){
		$('#index_update').removeAttr('disabled');
	}
	else{
		$('#index_update').attr('disabled', 'disabled');
	}
}