// store js

$(document).ready(function(){
	$('#nav-store').addClass('active');
});

$('img.test').click(function(index){
		
	$('.modal-title').html("App Name");
	$('#short_des').html("short");
	$('#long_des').html("long");
	$('#contact_email').html("email");
	$('#category').html("category");
	
	$('div#store_modal').modal('show');
});

/*$('.thumbnail test').each(function(index){
$(this).click(function(event){
console.log(index);
$('div#store_modal').modal('show');
});
});*/