$(function($){
        var getAdvlength = $("#advindex>div").length, Advtime = 4000;
        var getAdvHeight =$("#advindex>div").height(); 
		var isIndex = $("#advindex").attr("isIndex");
		/*var getAdvwidth =$("#advindex div").width(); //FAN FUAN SHI 1*/
		var getAdvwidth=$('#advindex').find('div').eq(0).width();
		var wh=$('scroll_zsimgbox').find('div').eq(0).width();
		var len=$('.scroll_zsimgbox div').length;
		
        if(getAdvlength>=2){
                var index = 0 ;
                var mytime = null;
                for(var i=1; i<=getAdvlength; i++){
                                $("#obkList").append("<a href='javascript:;' class='play_icon_btn web_skin'></a>");
                        }
                        $("#obkList a").eq(0).addClass("play_icon_on").siblings("a").removeClass("play_icon_on");
                $("#obkList a").click(function(){index = $("#obkList a").index(this);advFun(index)});
                $("#obkList a").hover(function(){if(mytime){clearInterval(mytime)}},function(){mytime = setInterval(function(){advFun(index);index++;if(index==getAdvlength){index=0}},Advtime);});
                 mytime = setInterval(function(){advFun(index);index++;if(index==getAdvlength){index=0}},Advtime);
                }
                function advFun(n){
								if(isIndex == "1"){
									
										$("#advindex").stop(true,false).animate({left : -getAdvwidth*n, width: (getAdvwidth*getAdvlength)},400);
									}else{
										$("#advindex").stop(true,false).animate({top : -getAdvHeight*n},400);
										}
                                $("#obkList a").eq(n).addClass("play_icon_on").siblings("a").removeClass("play_icon_on");	
                        }
               
})

/*scroll*/
var oosetDate =null;
$(function() {
    var getDtListn = $(".start").length;
	var lastLiHeight;
    var lastHtml;
    if (getDtListn > 3) {
        var moveFunction = function(moveWrapId) {
            var Getcom = $("#hot").attr("isCom");
            if (Getcom == "1") {
                $("#hot").attr("isCom", "0");
                lastLiHeight = $(moveWrapId).find("div.start:last").height();
			    lastHtml = $(moveWrapId).find("div.start:last").remove().html();
				
			    $(moveWrapId).prepend("<div class='start' style='zoom:1;display:block;height:0;clear:both;background-color:#fff;'></div>");
                $(moveWrapId).find("div.start:first").animate({
                    "height":lastLiHeight},1200,function(){
                    $(this).html(lastHtml).hide().fadeIn(1300, 
                    function() {
                        var ofalse = $(moveWrapId).attr("rel");
                        if (ofalse == "0") {
                            clearTimeout(oosetDate);
                        }
                        var cRel = $(moveWrapId).attr("rel");
                        if (cRel == "1") {
                            oosetDate = setTimeout(function() {
                                moveFunction(moveWrapId);
                            },
                            2000);
                        }
                        $("#hot").attr("isCom", "1");
                    })
                })
            }
        }
        moveFunction("#hot");
        $("#hot").hover(function() {
            $("#hot").attr("rel", "0");
            clearTimeout(oosetDate);
        },
        function() {
            $("#hot").attr("rel", "1");
            var getCOm = $("#hot").attr("isCom");
            if (getCOm == "1") {
                setTimeout(function() {
                    moveFunction("#hot");
                },
                2000);
            }
        })
    }
   
})
/*address-scroll*/
var oosetDate =null;
$(function() {
    var getDtListn = $(".startAddress").length;
	var lastLiHeight;
    var lastHtml;
    if (getDtListn > 3) {
        var moveFunction = function(moveWrapId) {
            var Getcom = $("#hotAddress").attr("isCom");
            if (Getcom == "1") {
                $("#hotAddress").attr("isCom", "0");
                lastLiHeight = $(moveWrapId).find("div.startAddress:last").height();
			    lastHtml = $(moveWrapId).find("div.startAddress:last").remove().html();
				
			    $(moveWrapId).prepend("<div class='startAddress' style='zoom:1;display:block;height:0;clear:both;background-color:#fff;'></div>");
                $(moveWrapId).find("div.startAddress:first").animate({
                    "height":lastLiHeight},1200,function(){
                    $(this).html(lastHtml).hide().fadeIn(1300, 
                    function() {
                        var ofalse = $(moveWrapId).attr("rel");
                        if (ofalse == "0") {
                            clearTimeout(oosetDate);
                        }
                        var cRel = $(moveWrapId).attr("rel");
                        if (cRel == "1") {
                            oosetDate = setTimeout(function() {
                                moveFunction(moveWrapId);
                            },
                            2000);
                        }
                        $("#hotAddress").attr("isCom", "1");
                    })
                })
            }
        }
        moveFunction("#hotAddress");
        $("#hotAddress").hover(function() {
            $("#hotAddress").attr("rel", "0");
            clearTimeout(oosetDate);
        },
        function() {
            $("#hotAddress").attr("rel", "1");
            var getCOm = $("#hotAddress").attr("isCom");
            if (getCOm == "1") {
                setTimeout(function() {
                    moveFunction("#hotAddress");
                },
                2000);
            }
        })
    }
   
})
function lay(){
	var mask='<div class="mask"></div>'
		$('body').append(mask)
		 var $laybox=$('.laybox');
		 	$laybox=$('.laybox').show();
		 var boxwidth=$laybox.width();
		 var getPoupHeight=$laybox.height();
		 var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop},500);
			
	}
$(function(){
	
	/*弹出层*/
	$('.loging_btn').on('click',function(){
		 lay();
		 $('.lay_contbox').text('账户登录正在筹建中，敬请期待。如果您有什么疑问或者建议，请致电客服中心，在这里我们表示由衷的感谢。')
    })
	$('.help_btn').on('click',function(){
		 lay();
		  $('.lay_contbox').text('在线帮助正在筹建中，敬请期待。如果您有什么问题请致电客服中心，我们会及时清楚地为您解答任何疑问。')
    })
	$('.phone_bg').on('click',function(){
		 lay();
		 $('.lay_contbox').text('移动客户端正在筹建中，敬请期待。如果您有什么疑问或者建议，请致电客服中心，在这里我们表示由衷的感谢。')
    })
    $('.tel_btn').on('click',function(){
		 lay();
		 $('.lay_contbox').text('短信验证正在筹建中，敬请期待。如果您有什么疑问或者建议，请致电客服中心，在这里我们表示由衷的感谢。')
    })
	$('.aside_video').on('click',function(){
		var mask='<div class="mask"></div>'
		$('body').append(mask)
		 var $laybox=$('.laybox_video');
		 	 $laybox.show();
		 var boxwidth=$laybox.width();
		 var getPoupHeight=$laybox.height();
		 var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		 var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop},500);
		
		});
	/*万邦年度广告*/
	$('.aside_video2').on('click',function(){
		var mask='<div class="mask"></div>'
		$('body').append(mask)
		 var $laybox=$('.laybox_video2');
		 	 $laybox.show();
		 var boxwidth=$laybox.width();
		 var getPoupHeight=$laybox.height();
		 var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		 var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop},500);
		
		});
	/*第一财经访谈*/
	$('.aside_video3').on('click',function(){
		var mask='<div class="mask"></div>'
		$('body').append(mask)
		 var $laybox=$('.laybox_video3');
		 	 $laybox.show();
		 var boxwidth=$laybox.width();
		 var getPoupHeight=$laybox.height();
		 var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		 var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop},500);
		
		});
	 /* 移除弹出层*/
	 $('.close_btn').on('click',function(){
			$('.laybox').hide();
			$('.mask').remove();
	 });
	 
	 $('.close_btnvideo').on('click',function(){
		 jwplayer("container").stop();
		 $('.laybox_video').hide();
		 $('.mask').remove();
	 });
	 
	 $('.close_btnvideo2').on('click',function(){
		 jwplayer("container2").stop();
		 $('.laybox_video2').hide();
		 $('.mask').remove();
	 });
	$('.close_btnvideo3').on('click',function(){
		 jwplayer("container3").stop();
		 $('.laybox_video3').hide();
		 $('.mask').remove();
	 });
	/*map
     $('.map_bg span').live('mouseenter mouseleave', function(event) {
			 if (event.type == 'mouseenter') {
                  var index=$(this).index();
		          var $laybox= $('.map_bg div');
		              $laybox.eq(index).stop(true).fadeIn();
		              $(this).addClass('web_skin hy_icon');
             } else {
                 var index=$(this).index();
		         var $laybox= $('.map_bg div');
			        $(this).removeClass('web_skin hy_icon');
			        $laybox.eq(index).stop(true).fadeOut();
              }	
        })
		*/
		  
  
	   $('.map_bg section').hover(function(){
		   $(this).addClass('red_icon');
		   $(this).find('div').stop(true,true).delay(200).fadeIn(300);
		   $(this).css({'z-index':60})
		 /*  $('.map001_zb').find('div').stop(true,true).delay(300).fadeOut(500)*/
		   },function(){
		   $(this).removeClass('red_icon');
		   $(this).find('div').stop(true,true).delay(200).fadeOut(300); 
		    $(this).css({'z-index':15})
		/*	$('.map001_zb').find('div').stop(true,true).delay(300).fadeIn(500);*/
			
			   });	
		
	/*高清与标清切换*/	
	$('.tab_hd').toggle(
	            function(){
					$(this).siblings('.laybox_hd_list').animate({'right':-61,'top':0},500)
					$(this).addClass('tab_hd_off')
				},function(){
					
					$(this).siblings('.laybox_hd_list').animate({'right':14,'top':0},500).show();
					$(this).removeClass('tab_hd_off')
					
				}
	 );	
		
})
/*截取字符串长度*/
function litext(rq,lia,len){
		var $libox=$(rq).find('div');
			$libox.each(function() {
				var text=$(this).find(lia).text();
				if(text.length>len){
					var xx=text.substr(0,len)+'...'
					$(this).find(lia).html('<i class="new_texticon web_skin"></i>'+xx);
				}
        });	
}