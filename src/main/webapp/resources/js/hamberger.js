var burger = $('.menu-trigger');

burger.each(function(index){
	var $this = $(this);
	
	$this.on('click', function(e){
		e.preventDefault();
		$(this).toggleClass('active-' + (index+1));
		if($('.leftmenu').val() == '0'){
			$('.leftmenu').val('1');
			$('.sidebar_menu').show().animate({
				left:0
			});
		} else{
			$('.leftmenu').val('0');
			$('.sidebar_menu').animate({
				left: '-' + 100 + '%'
			},function(){
				$('.sidebar_menu').hide();
			});
		}
	})
});