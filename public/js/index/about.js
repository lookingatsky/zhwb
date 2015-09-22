$(function(){
	/*关于我们侧栏效果*/
	 $('.aside_listbox li').hover(function(){
      		$(this).find('.arrow_menu').show();
			$(this).find('span').stop().animate({"margin-left":80},500);
 		 },function(){
			 if($(this).find('a').hasClass('aside_btn_on')) {
				 $(this).find('span').stop().css({"margin-left":0});
		 }else{
       	$(this).find('.arrow_menu').hide()
		$(this).find('span').stop().css({"margin-left":0});
    	 }
     })
	
	 $('.aside_listbox').find('li').last().css({'border-bottom':0});
	 $('.pl_list').find('li').last().css({'border-bottom':0});
	 $('.hy_yjbox').find('dl').last().css({'border-bottom':0});
	 $('.trust_list dl').hover(function(){$(this).css({'background':'#f1f0f0'});},function(){$(this).css({'background':'#fff'})})
	  
	 var $dlbox=$('.trust_list').find('dl');
	 var dl_len=$dlbox.lenght;
	     $dlbox.each(function(index, element) {
            if(index==1){
				$(this).css({'margin-left':10,'margin-right':12})
				}
			if(index==4){
				$(this).css({'margin-left':10,'margin-right':12})
				}
			if(index==7){
				$(this).css({'margin-left':10,'margin-right':12})
				}	
				 if(index==10){
				$(this).css({'margin-left':10,'margin-right':12})
				}
			if(index==13){
				$(this).css({'margin-left':10,'margin-right':12})
				}
			if(index==16){
				$(this).css({'margin-left':10,'margin-right':12})
				}	
        });
/*侧栏滚动定位 
     var otop = $(".about_aside").offset().top;
	     $(window).scroll(function(){
	 var scroll_top = parseInt($(window).scrollTop());
			if( scroll_top > otop ){
				if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
					$(".about_aside").css({position:"absolute", top:$(window).scrollTop()+"px"});
			}else{
					$(".about_aside").css({position:"fixed", top:"0px"});
				}
			}else{
				$(".about_aside").css({position:"static", top:""});
			}
	 });
	 $('.aside_listbox').find('li').last().css({"border-bottom":0});*/
})