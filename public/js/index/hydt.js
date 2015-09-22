$(function(){

   /*判断列表是偶数时加左边距*/
	var $dl=$('.dtinfo_list dl')
	    $dl.each(function(index) {
			var num=index+1;
			var o=num%2;
			if(o==0){
			$(this).css({'margin-left':15});
			} 
    });
	$('.video_box ul').find('li').last().css({'border-bottom':0})
	$('.active_box ul').find('li').last().css({'margin-bottom':0,'border-bottom':0})
})