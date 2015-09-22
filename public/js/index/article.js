$(function(){
	   	$('.anli_list li').toggle(function(){
			    $(this).find('.anli_info').slideDown(500);
				 $(this).find('.other_icon').addClass('other_iconoff')
			},function(){
				 $(this).find('.anli_info').slideUp(500);
				 $(this).find('.other_icon').removeClass('other_iconoff')
				});
		
	})