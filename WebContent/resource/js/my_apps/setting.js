// setting js

//----------------------------------------------setting
$(document).ready(function(){
	var type = $('[data-get]').data('get');
	var launch = $('#switch-' + type).bootstrapSwitch(type);
	console.log(launch);
	if(launch){
		$('#launch_status').html("<small>출시 된 상태입니다.</small>");
	} else {
		$('#launch_status').html("<small>출시되지 않은 상태입니다.</small>");
	}
});

$('#setting_update').click(function(){

    var type = $('[data-get]').data('get');
	var appName = $('#appName').text(); 
	var displayName = $('#displayName').val();
	var contactEmail = $('#contactEmail').val();
	var publish = $('#switch-' + type).bootstrapSwitch(type);
	
	var data = {
			appName : appName,
			displayName    : displayName,
			contactEmail    : contactEmail,
			publish    : publish,
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/updateSetting.do",
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
});

$('#deleteApp').click(function(){
	var appName = $('#appName').text(); 
	var data = {
			appName : appName,
	};
	
	$.ajax({
		type : "POST",
		url : "/GardenPlatformWeb/deleteClient.do",
		data : data,
		success : function(data) {
			var obj = jQuery.parseJSON(data);
			if(obj.status=="success") {
				setSuccess("삭제가 완료되었습니다.");
				setTimeout(function(){
					location.href = "/GardenPlatformWeb/home.do";
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

// checkbox 애니메이션 넣어줌
$(function() {
	  var $window = $(window);
	  var sectionTop = $('.top').outerHeight() + 20;

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

