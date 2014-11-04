//apps detail

// --------------------------------------------- app detail
$('#detail_update').click(function(){

	var appName = $('#appName').text(); 
	var tag1 = $('#tag1').val();
	var tag2 = $('#tag2').val();
	var tag3 = $('#tag3').val();
	
	var short_description = $('#short_desc').val();
	var long_description = $('#long_desc').val();
	var category = $('#category').val();
	var permission_explanation = $('#permissions').val();
	
	var category_index = $("#category option").index($("#category option:selected"));

	var data = {
			appName : appName,
			tag1    : tag1,
			tag2    : tag2,
			tag3    : tag3,
			short_description   : short_description,
			long_description   : long_description,
			category   : category,
			permission_explanation   : permission_explanation
	};

	if(category_index === 0) {
		setError("카테고리를 선택하세요");
	}
	else {
		$.ajax({
			type : "POST",
			url : "/GardenPlatformWeb/postAppDetail.do",
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
	}
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