/**
 * navigation dropdown menu script
 */

$(function(){
	$("li.navi_main ul").hide();
	$("li.navi_main").hover(function(){
		$("ul", this).stop().slideDown(300);
		
	}, function(){
		$("ul", this).stop().slideUp(300);
		
	});
});
