// setting js

//----------------------------------------------setting

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

