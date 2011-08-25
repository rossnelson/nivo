// setup all javascript headers for rails /////////////////////////////////////////////////////////////////////////////////////////////
jQuery.ajaxSetup({ 
  beforeSend: function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){

// slideup all notices /////////////////////////////////////////////////////////////////////////////////////////////
	$(".flash_notice, .flash_error, #status").fadeIn().delay(2000).slideUp('slow');
	$(".flash_notice, .flash_error, #status").delay(2000).slideUp('slow');
	$('#status').hide();
	
	$( "#dialog-confirm" ).dialog({
	        autoOpen: false,
	        resizable: false,
	        modal: true     
	    });

// Site Wide Admin /////////////////////////////////////////////////////////////////////////////////////////////
	$( ".accordion" ).accordion({
		autoHeight: false,
		navigation: true,
		collapsible: true,
		active: false
	});

// edit user form /////////////////////////////////////////////////////////////////////////////////////////////
	$('#myForm1').ajaxForm(formoptions);
	
	var formoptions = { 
	        success: showFlash, 
					target: '#leftcol',
	        data:  {format: 'js'},
	        clearForm: true
	    };
	
	function showFlash() { 
		$("#status").html("Success, Your new user has been Saved");
		$('#status').fadeIn().delay(2000).slideUp('slow');
	}
	
// profile menu: show submenu /////////////////////////////////////////////////////////////////////////////////////////////
  $('#controls').hover(function()
          {
              $(this).addClass('hover');
          },
          function()
          {
              $(this).removeClass('hover');
  });
	$("#controls").click(function () {
		$(this).find(".dropdown").toggle("fast");
	});
	
// Setup sortable list /////////////////////////////////////////////////////////////////////////////////////////////
	$('ol.sortable').nestedSortable({
		disableNesting: 'no-nest',
		forcePlaceholderSize: true,
		handle: 'div',
		helper:	'clone',
		items: 'li',
		maxLevels: 3,
		opacity: .6,
		placeholder: 'placeholder',
		revert: 250,
		tabSize: 25,
		tolerance: 'pointer',
		toleranceElement: '> div'
	});
	
	$('ul#tree').nestedSortable({	
		disableNesting: 'no-nest',
		forcePlaceholderSize: true,
		handle: '.handle',
		items: 'li',
		maxLevels: 2,
		opacity: .6,
		placeholder: 'placeholder',
		tabSize: 15,
		tolerance: 'pointer',
		revert: 250,
		toleranceElement: '> div'
	});
	
// save ordered menu items /////////////////////////////////////////////////////////////////////////////////////////////	
	$('.orderpages').click(function(){
		$.fancybox.showActivity();
		
		var mylist = $('#tree').serializelist();
		$.post("/menu/array", mylist);
		
		return false;
	});

// save ordered admin menu items /////////////////////////////////////////////////////////////////////////////////////////////		
	$('#ordermenuitems').click(function(){
		$.fancybox.showActivity();
		
		var menu_items = $('#tree').serializelist();
		$.post("/cms_menu/array", menu_items);

		return false;
	});
	
// tiptip /////////////////////////////////////////////////////////////////////////////////////////////			
	$(function(){
	$(".tip").tipTip();
	});
	
// Fancy box: User settings /////////////////////////////////////////////////////////////////////////////////////////////		
	$("a.settings").fancybox({
		'showCloseButton' : false,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	400, 
		'speedOut'		:	200,
		'width' : 400,
		'hideOnContentClick': false,
		'overlayOpacity' : 0.6,
		'overlayColor' : '#000',
		'opacity' : 'true'
	});

// Fancy box: User settings /////////////////////////////////////////////////////////////////////////////////////////////		
	$("a.smallogo").fancybox({
		'showCloseButton' : false,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	400, 
		'speedOut'		:	200,
		'hideOnContentClick': true,
		'overlayOpacity' : 0.6,
		'overlayColor' : '#000',
		'opacity' : 'true',
		'padding' : 0
	});
		
	$("a.remote").fancybox({
		'showCloseButton' : false,
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	400, 
		'speedOut'		:	200,
		'hideOnContentClick': true,
		'overlayOpacity' : 0.6,
		'overlayColor' : '#000',
		'opacity' : 'true',
		'padding' : 30
	});
// Fancy box: single image /////////////////////////////////////////////////////////////////////////////////////////////		
	$("a#single_image").fancybox();
	
// Fancy box: inline content /////////////////////////////////////////////////////////////////////////////////////////////		
	$("a#inline").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	400, 
		'speedOut'		:	200,
		'hideOnContentClick': false
	});

// Fancy box: Gallery /////////////////////////////////////////////////////////////////////////////////////////////		
	$("a.group").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	true,
		'hideOnContentClick': true,
		'titlePosition'     : 'over',
		'titleFormat'       : function(title, currentArray, currentIndex, currentOpts) {
		    return '<span id="fancybox-title-over">Image ' +  (currentIndex + 1) + ' / ' + currentArray.length + ' ' + title + '</span>';
		}
	});
	
	$("a.remote_iframe").fancybox({
		'width'             : '90%',
    'height'            : '75%',
    'autoScale'         : false,
    'transitionIn'			:	'elastic',
		'transitionOut'			:	'elastic',
		'speedIn'						:	600, 
		'speedOut'					:	200, 
		'overlayShow'				:	true,
    'type'            	: 'iframe'
	});
	
});