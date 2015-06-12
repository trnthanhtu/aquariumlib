// JavaScript Document
(function($){
$(document).ready(function(){

// scroll
$('.list_product a').click(function(e){
	e.preventDefault();

	$('.on').removeClass('on');

	el = $(this);

	name = el.attr('href');

	pos = $(name).position().top;

	el.addClass('on');

	$('html,body').stop().animate({scrollTop:pos},800,'easeInQuart');
	return false;
});

	$(window).scroll(function(){
		t = $(window).scrollTop();

		$('.main').find('.page').each(function(){
			el = $(this);
			p = el.position().top;

			if(p <= t){
				id = el.attr('id');
				$('.on').removeClass('on');
				$("[href='#"+id+"']").addClass('on');
			}
		});
	});

});

})(jQuery);
