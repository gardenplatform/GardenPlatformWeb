(function($) {
	$('#btn_web_register').click(function(){
		var appName = $('#appName').val();
		var appUrl = "http://" + $('#appUrl').val();
		var appRedirectUrl = "http://" + $('#reUrl').val();
		
		var appInfo = {
				appName 	: appName,
				appUrl   : appUrl,
				appRedirectUrl   : appRedirectUrl
		};
		
		if(appName=="" || appUrl=="" || appRedirectUrl=="") {
			alert("입력하지 않은 항목이 있습니다.");
		}
		else {
			$.ajax({
				type : "POST",
				url : "/GardenPlatformWeb/webRegister.do",
				data : appInfo,
				success : function(data) {
					var obj = jQuery.parseJSON(data);
					console.log(obj);
					if(obj.status=="success") {
						alert("성공적으로 등록되었습니다.");
						location.href = "/GardenPlatformWeb/home.do";
					}
					else{
						location.href="/GardenPlatformWeb/error.do?status="+obj.status+"&msg="+obj.msg;
					}
				},
				error : function(xhr, status, error) {
					location.href="/GardenPlatformWeb/error.do?status="+status+"&msg="+error;
				}
			});	
		}
	});

})(jQuery);



function setProgress(string){
	$('<div class="loadingdiv fade"><div class="loading-container container hidden-xs"><div class="loading fade in"></div><img class="fade success" src="/GardenPlatformWeb/resource/img/success.png"/><img class="fade fail" src="/GardenPlatformWeb/resource/img/fail.png"/><h2 class="fade in text-right">' + string + '</h2></div>' +
			'<div class="loading-container container visible-xs"><div class="loading fade in"></div><img class="fade success" src="/GardenPlatformWeb/resource/img/success.png"/><img class="fade fail" src="/GardenPlatformWeb/resource/img/fail.png"/><h3 class="text-center fade in">' + string + '</h3></div></div>').ready(function(){setTimeout(function(){$('div.loadingdiv').addClass('in');}, 50);}).prependTo('body');
}

function dismissProgress(){
	$('div.loadingdiv').removeClass('in');
	setTimeout(function(){
		$('div.loadingdiv').remove();
	}, 300);
}

function setError(string){
	
	if($('div.loadingdiv').length == 0){
		$('<div class="loadingdiv fade"><div class="loading-container container hidden-xs"><img class="fade in fail" src="/GardenPlatformWeb/resource/img/fail.png"/><h2 class="fade in text-right">' + string + '</h2></div>' +
				'<div class="loading-container container visible-xs"><img class="fade in fail" src="/GardenPlatformWeb/resource/img/fail.png"/><h3 class="text-center fade in">' + string + '</h3></div></div>').ready(function(){setTimeout(function(){$('div.loadingdiv').addClass('in');}, 50);}).prependTo('body');
		$('div.loading-container h2, div.loading-container h3').html(string).addClass('in').css('color', '#a94442');
		$('div.loadingdiv').click(function(){
			$(this).removeClass('in');
			setTimeout(function(){
				$('div.loadingdiv').remove();
			}, 300);
		});
		return;
	}
	
	$('div.loading-container h2, div.loading-container h3, div.loading').removeClass('in');
	setTimeout(function(){
		$('div.loading-container h2, div.loading-container h3').html(string).addClass('in').css('color', '#a94442');
		$('img.fail').addClass('in');
	}, 300);
	
	$('div.loadingdiv').click(function(){
		$(this).removeClass('in');
		setTimeout(function(){
			$('div.loadingdiv').remove();
		}, 300);
	});
}

function setSuccess(string){
	
	if($('div.loadingdiv').length == 0){
		$('<div class="loadingdiv fade"><div class="loading-container container hidden-xs"><img class="fade in success" src="/GardenPlatformWeb/resource/img/success.png"/><h2 class="fade in text-right">' + string + '</h2></div>' +
				'<div class="loading-container container visible-xs"><img class="fade in success" src="/GardenPlatformWeb/resource/img/success.png"/><h3 class="text-center fade in">' + string + '</h3></div></div>').ready(function(){setTimeout(function(){$('div.loadingdiv').addClass('in');}, 50);}).prependTo('body');
		$('div.loading-container h2, div.loading-container h3').html(string).addClass('in').css('color', '#3c763d');
		$('div.loadingdiv').click(function(){
			$(this).removeClass('in');
			setTimeout(function(){
				$('div.loadingdiv').remove();
			}, 300);
		});
		return;
	}
	
	$('div.loading-container h2, div.loading-container h3, div.loading').removeClass('in');
	setTimeout(function(){
		$('div.loading-container h2, div.loading-container h3').html(string).addClass('in').css('color', '#3c763d');
		$('img.success').addClass('in');
	}, 300);
	
	$('div.loadingdiv').click(function(){
		$(this).removeClass('in');
		setTimeout(function(){
			$('div.loadingdiv').remove();
		}, 300);
	});
}

$('#appName').change(function(){
	//서버에서 앱네임 겹치는지 확인해서
	//if(안겹치면)
	$('#appname_div').addClass('has-success');
	$('#appname_success').removeClass('hidden');
	//else{
	//$('#appname_div').addClass('has-error');
	//$('#appname_fail').removeClass('hidden');
	//}
});

$('#appUrl').change(function(){
	//이건 어케해야될지 잘 ㅋ
	$('#appurl_div').addClass('has-success');
	$('#appurl_success').removeClass('hidden');
});

$('#reUrl').change(function(){
	//이건 어케해야될지 잘 ㅋ
	$('#reurl_div').addClass('has-success');
	$('#reurl_success').removeClass('hidden');
});

//모달 초기화
$('#app').click(function() {
	$('#appName').val("");
	$('#appUrl').val("");
	$('#reUrl').val("");
	
	$('#appname_div').removeClass('has-success');
	$('#appurl_div').removeClass('has-success');
	$('#reurl_div').removeClass('has-success');
	$('#appname_success').addClass('hidden');
	$('#appurl_success').addClass('hidden');
	$('#reurl_success').addClass('hidden');
	
	$('#appname_div').removeClass('has-error');
	$('#appurl_div').removeClass('has-error');
	$('#reurl_div').removeClass('has-error');
	$('#appname_fail').addClass('hidden');
	$('#appurl_fail').addClass('hidden');
	$('#reurl_fail').addClass('hidden');
	
});


//적용예정 기달
$(function () { 
    $("[data-toggle='tooltip']").tooltip(); 
});
