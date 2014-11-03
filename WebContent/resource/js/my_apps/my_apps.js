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


// ----------------------------------------- index
$('#index_update').click(function(){
	var url = $('#app_url').val();
	var re_url = $('#app_redirecturl').val();
	//업뎃하셈
});



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

// ---------------------------------------------- roles
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

//----------------------------------------------setting

$('#setting_update').click(function(){
	//Setting update
});

$('#deleteApp').click(function(){
	//Setting update
});

/*
// 출시할때 checkbox 애니메이션 넣어줌
$(function() {
	  var $window = $(window);
	  var sectionTop = $('.top').outerHeight() + 20;

	  // initialize highlight.js
	  //hljs.initHighlightingOnLoad();

	  // navigation
	  $('a[href*="#"]').on('click', function(event) {
	    event.preventDefault();
	    var $target = $($(this).attr('href').slice('#'));

	    if ($target.length) {
	      $window.scrollTop($target.offset().top - sectionTop);
	    }
	  });

	  // download switch
	  $('input[name="download-version"]').on({
	    'init.bootstrapSwitch': function() {
	      $('#download-' + ($(this).is(':checked') ? '2' : '3')).hide();
	    },
	    'switchChange.bootstrapSwitch': function(event, state) {
	      $('#download-3')[state ? 'show' : 'hide']();
	      $('#download-2')[state ? 'hide' : 'show']();
	    }
	  });

	  // initialize all the inputs
	  $('input[type="checkbox"],[type="radio"]').not('#create-switch').not('#events-switch').bootstrapSwitch();

	  $('[data-get]').on("click", function() {
	    var type = $(this).data('get');
	    console.log(type);
	    console.log($('#switch-' + type).bootstrapSwitch(type));
	    alert($('#switch-' + type).bootstrapSwitch(type));
	  });

	  $('[data-set]').on('click', function() {
	    var type = $(this).data('set');
	    console.log(type);
	    $('#switch-' + type).bootstrapSwitch(type, $(this).data('value'));
	  });

	  $('[data-toggle]').on('click', function() {
	    var type = $(this).data('toggle');
	    console.log(type);
	    $('#switch-' + type).bootstrapSwitch('toggle' + type.charAt(0).toUpperCase() + type.slice(1));
	  });

	  $('[data-set-text]').on('change', function(event) {
	    event.preventDefault();
	    var type = $(this).data('set-text');
	    var value = $.trim($(this).val());

	    if ( ! value) {
	      return;
	    }

	    $('#switch-' + type).bootstrapSwitch(type, value);
	  });
	});
*/

