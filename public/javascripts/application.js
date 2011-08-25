jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

//Sub Menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   // side menu: show submenu
   $('#nav ul li').hover(function()
           {
               $(this).addClass('hover');
           },
           function()
           {
               $(this).removeClass('hover');
           });
  
  $( "#dialog-confirm" ).dialog({
       autoOpen: false,
       resizable: false,
       modal: true     
   });
  
//Fade In and Hide Flash Messages/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  $("#flash_notice,#flash_error,#status").fadeIn().delay(2000).slideUp('slow');
    
//Fancy Box Single Image/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  $("a#single_image").fancybox();
  
//Fancy Box Single Inline content/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  $("a#inline").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 400, 
    'speedOut'    : 200,
    'hideOnContentClick': false
  });

//Fancy Box Single Gallery/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  $("a.group").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 600, 
    'speedOut'    : 200, 
    'overlayShow' : true,
    'hideOnContentClick': true,
    'titlePosition'     : 'over',
    'titleFormat'       : function(title, currentArray, currentIndex, currentOpts) {
        return '<span id="fancybox-title-over">Image ' +  (currentIndex + 1) + ' / ' + currentArray.length + ' ' + title + '</span>';
    }
  });
  
});
