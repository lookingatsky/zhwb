$(function(){
	/*首页二级菜单效果*/
	$('.menu_list li.rel').hover(function(){
	  $(this).find('a').css({'background-color':'#3c3c3c'});
	  $(this).find('div.menulist').stop(true,true).delay(100).slideDown(300);
	},function(){
		 $(this).find('div.menulist').stop(true,true).delay(100).fadeOut(100);
		 $(this).find('a').css({'background-color':''});
	});
	/*动态切换选项*/
	$('.dt_title li').click(function(){
		var index=$(this).index();
		var $cont=$('.tabbox div');
			if(index==0){
				$(this).parent().removeClass('index_tab002');
				$(this).parent().removeClass('index_tab003');
				$(this).parent().addClass('index_tab001');
			}else if(index==1){
				$(this).parent().addClass('index_tab002');
				$(this).parent().removeClass('index_tab001');
				$(this).parent().removeClass('index_tab003');
			}else if(index==2){
				$(this).parent().removeClass('index_tab001');
				$(this).parent().removeClass('index_tab002');
				$(this).parent().addClass('index_tab003');
			}
			$cont.eq(index).fadeIn(1000);
			$cont.eq(index).siblings().hide();
	});
	
	$('.cp_tbbg li').click(function(){
	var index=$(this).index();
	var $cont=$('.tabbox div');
		if(index==0){
			$(this).parent().removeClass('cp_tab002');
			$(this).parent().addClass('cp_tab001');
		}else if(index==1){
			$(this).parent().addClass('cp_tab002');
			$(this).parent().removeClass('cp_tab001');
		}
		$cont.eq(index).fadeIn(1000);
		$cont.eq(index).siblings().hide();
	});
	   /*理财工显示隐藏*/
		$('.lc_btn').toggle(function(){
			 $(this).find('.aside_laybox').slideDown(500);
			$(this).find('.aside_lcgj_off').addClass('aside_lcgj')	
		},function(){
			$(this).find('.aside_laybox').slideUp(500);
			$(this).find('.aside_lcgj_off').removeClass('aside_lcgj')	
		});
	
	/*预约理财师弹出层*/
  
	$('#yuyue').on('click',function(){
		 var html='<div class="laybox_yuyue" id="lightbox1" style="width:520px;height:285px;display:none;"><div class="tc_title_c"><h2 style="text-align:left;padding-left:20px;">您的情况</h2><a rel="deactivate" class="close_btnyuyue" href="javascript:void("0");"></a></div<div class="lay_contbox" style="text-indent:0px;"><div class="lay_contbox"><form action="/index/getdata" method="post" id="reservationForm"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td class="w100">您的姓名： </td><td ><input type="text" value="" name="res.custName" class="lay_inputbox" /></td><td class="w60">性别：</td><td><input name="res.custSex" type="radio" value="1" class="icon_align">&nbsp;&nbsp;先生&nbsp;&nbsp;&nbsp;&nbsp;<input name="res.custSex" type="radio" value="0" class="icon_align">&nbsp;&nbsp;女士</td></tr><tr><td class="w100"><span class="start_red">*</span>手机号码：</td><td><input type="text value="" name="res.mobile" class="lay_inputbox tel" /></td><td class="w60"> E-mail:</td><td><input type="text" value="" name="res.email" class="lay_inputbox" /></div></td></tr><tr><td class="w100">联系电话：</td><td><input type="text" value="" name="res.telephone" class="lay_inputbox" /></td><td class="w60">邮编：</td><td><input type="text" value="" name="res.postcode" class="lay_inputbox" /></td></tr><tr><td class="w100" >您的通信地址：</td><td colspan="3"><input type="text" value="" name="res.address" class="lay_inputbox" style="width:336px;" /></td></tr></table></form><div class="but_fxcx"><a href="javascript:void(0)" class="return_btn updata">理财师预约 </a><a href="javascript:void(0)" class="blute_laybtn clear_val ml10">重新填写</a></div></div></div></div>'
		    var mask='<div class="mask"></div>'
		   $('body').append(mask);
		    $('body').append(html)
			var $laybox=$('.laybox_yuyue');
		 	       $laybox.show();
			var scrol_top=$(window).scrollTop();
			var boxwidth=$laybox.width();
		    var getPoupHeight=$laybox.height();
		    var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		    var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop+scrol_top},500);
		});


	$('.close_btnyuyue').live('click',function(){
		
			$('.laybox_yuyue').remove();
			 $('.mask').remove();
	 })
	$('.clear_val').live('click',function(){
		
			$('.laybox_yuyue').find('input').val('');
			
	 })
	/*提交数据*/	
	
	 $('.updata').live('click',function(){
		/*验证手机号码*/
		 var $tel=$('.tel');
		 if($tel.val()==""){$('.tc_title_c').find('.tel_text').remove();
				 var tel_html="<span class='tel_text'>请输入手机号码</span>"
				 $('.tc_title_c').append(tel_html);
			return false;
		 }else if(
				!(/^1[3|4|5|8][0-9]\d{4,8}$/.test($tel.val()))
								)
		    { $('.tc_title_c').find('.tel_text').remove();
			 var tel_number="<span class='tel_text'>请输入正确的手机号码</span>"
				$('.tc_title_c').append(tel_number);
			 return false;
			}else{
				 $('.tc_title_c').find('.tel_text').remove();
		  }
			/*预约成功弹出框*/
		 var html='<div  class="laybox chj" id="lightbox1"  style="width:340px;height:160px;"><div class="fx_problem_l lay_contbox" style="text-align:center;"><h2 style="font-size:24px;color:#db1b14;padding-left:30px;">预约成功,<br /><span style="font-size:18px;color:#3c3c3c;">我们会尽快与您联系。<span></h2><a href="javascript:void(0)" class="return_btn mt25 sure_btn" style="margin-left:30px;">确&nbsp;&nbsp;定</a></div></div>'
		  /*提交数据*/
			 var reservationForm = $("#reservationForm"); 
		   $.ajax({
			    type: "POST",
  				 url: reservationForm.attr("action"),
  				 data: reservationForm.serialize(),
				// dataType: "json",
  				 success: function(data){
				$('.laybox_yuyue').remove();
		         $('body').append(html);
				  var $laybox=$('.chj');
		 	          $laybox.show();
			var scrol_top=$(window).scrollTop();
			var boxwidth=$laybox.width();
		    var getPoupHeight=$laybox.height();
		    var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		    var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop+scrol_top},500);
                 }
	       });
	})
	$('.sure_btn').live('click',function(){
		
		   $('.chj').remove();
			 $('.mask').remove();
		});

		/*移动端下载*/
		$('.phone_bg').click(function(){
			
			var mask='<div class="mask"></div>'
		$('body').append(mask)
		 var $laybox=$('.laybox_phone');
		 	$laybox=$('.laybox_phone').show();
		 var boxwidth=$laybox.width();
		 var getPoupHeight=$laybox.height();
		 var getPoupLeft =($(window).width()> boxwidth) ? ($(window).width()/2)- (boxwidth/2) : 0;
		var getPoupTop = (($(window).height()/2) - getPoupHeight/2)>0 ? ($(window).height()/2) - (getPoupHeight/2):0;
             $laybox.css({"left":getPoupLeft,"top":0}).animate({'top':getPoupTop},500);
			
			});
			
			 $('.close_phone').on('click',function(){
			$('.laybox_phone').hide();
			$('.mask').remove();
	 })
	
})


	
	 