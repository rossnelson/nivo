$(document).ready(function(){
						   
 $(window).resize(function(){

  $('#container').css({
   position:'absolute',
   left: ($(window).width() 
     - $('#container').outerWidth())/2,
   top: ($(window).height() 
     - $('#container').outerHeight())/2
  });
		
 });
 
 // To initially run the function:
 $(window).resize();
	
 $.fancybox.showActivity();
 $('#container').hide().delay(800).fadeIn(function(){
	 $.fancybox.hideActivity();
 });

});