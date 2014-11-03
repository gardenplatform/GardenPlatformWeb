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
$('#detail_update').click(function(){
	var tag1 = $('#tag1').val();
	var tag2 = $('#tag2').val();
	var tag3 = $('#tag3').val();
	
	var short_desc = $('#short_desc').val();
	var long_desc = $('#long_desc').val();
	var category = $('#category').val();
	var permissions = $('#permissions').val();
	
	console.log(tag1);
	console.log(tag2);
	console.log(tag3);
	console.log(short_desc);
	console.log(long_desc);
	console.log(category);
	console.log(permissions);
	
	
});

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


// 출시할때 checkbox 애니메이션 넣어줌
$(function() {
	  var $window = $(window);
	  var sectionTop = $('.top').outerHeight() + 20;

	  // initialize highlight.js
	  hljs.initHighlightingOnLoad();

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

	    alert($('#switch-' + type).bootstrapSwitch(type));
	  });

	  $('[data-set]').on('click', function() {
	    var type = $(this).data('set');

	    $('#switch-' + type).bootstrapSwitch(type, $(this).data('value'));
	  });

	  $('[data-toggle]').on('click', function() {
	    var type = $(this).data('toggle');

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
