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
			$('.col1').delay(500).fadeIn(100);
			$('.col2').delay(500).fadeIn(150);
			$('.col3').delay(500).fadeIn(200);
			$('.col4').delay(500).fadeIn(250);
			$('.col5').delay(500).fadeIn(300);
			$('.col6').delay(500).fadeIn(350);
			$('.col7').delay(500).fadeIn(400);
			$('.col8').delay(500).fadeIn(450);
			$('.col9').delay(500).fadeIn(500);
			$('.col10').delay(500).fadeIn(550);
		} else{
			$('.col10').fadeOut(100);
			$('.col9').fadeOut(150);
			$('.col8').fadeOut(200);
			$('.col7').fadeOut(250);
			$('.col6').fadeOut(300);
			$('.col5').fadeOut(350);
			$('.col4').fadeOut(400);
			$('.col3').fadeOut(450);
			$('.col2').fadeOut(500);
			$('.col1').fadeOut(550);
			$('.leftmenu').val('0');
			$('.sidebar_menu').delay(400).animate({
				left: '-' + 100 + '%'
			},function(){
				$('.sidebar_menu').hide();
			});
			
		}
	})
});