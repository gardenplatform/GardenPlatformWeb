$('#google_search').click(function () {
	setTimeout(function(){
		$('#search_input').val("");
	}, 300);
});

$(function () { 
    $("[data-toggle='tooltip']").tooltip();
});


$('.delete_app').click(function () {
	console.log("클릭");
});