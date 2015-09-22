// JavaScript Document
(function($) {
	
	$.fn.maxBanner=function(options){
		var $this=this;
		var op=$.extend({
			   
			   //页面最小宽度
			   minw:1200,
			   
			   //图片原始大小
			   imgh : 698, 
			   imgw : 1400,
			   
			   //焦点图大小
			   jh : 412,
			   jw : 258,
			   firstBanner:"firstBanner"
			   },options);
		   
		var isfirst=$.maxBanner.getCookie(op.firstBanner);
		if(isfirst == null ){
			
			$.maxBanner.setCookie(op.firstBanner,"1");
			}else{ 
			
			 $this.remove();
			 
			 return false;
			
			}
	   
	   
	  
	   
	    $.maxBanner.init(this,op);
	    $(window).resize(function(){
			 $.maxBanner.init($this,op);
			
			}); 
			
	   $.maxBanner.effect(this,op);
	 
	
	}
  $.maxBanner={
	  init : function(that,op){
		  
		  op.screenw=$(window).width() > op.minw ? $(window).width() : op.minw ;
		
	  	  op.screenh=$(window).height();
		  
		  //确定外框的高宽
	  	that.find(op.maxb_bg).css("left","50%");
	 	 $.maxBanner.outerH(that,op);
	  
	 	 //确定背景图片的高宽
	  
	 	 $.maxBanner.backgroundH(that,op);
		  
		  },
	   effect : function(that,op){
		   var  timeout = setTimeout(function(){
	        if($.maxBanner.isIe6){
				
				that.animate({ 
				
				"top":-$(window).height()+"px"
				
			 	 }, 1000,function(){
				  that.next().removeClass("pr").css("top","0");
				  that.remove(); 
				  
				  if(typeof(op.callback)!="undefined"){
					  
					  op.callback(that);
					  
					  }
				   } );
				 that.next().addClass("pr").animate({ 
					"top":-$(window).height()+"px"
					 }, 1000,function(){
					 that.next().removeClass("pr").css("top","0");
					 that.remove();  
					  if(typeof(op.callback)!="undefined"){
						  
						  op.callback(that);
						  
						  }
					   } );
				
				}else{
					
					that.animate({ 
						"marginTop":-$(window).height()+"px"
					  }, 1000,function(){
						  
						 that.remove(); 
						  
						  if(typeof(op.callback)!="undefined"){
							  
							  op.callback(that);
							  
							  }
						   } );
					
					
					
					
					}
		
		},3000); 
		   
		   
		   },
	   isIe6 : function(){
		   if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
			   
            return true;
			
        	}
			
		   return false;
		   
		   },
	  outerH : function(that,op){
		  
		   that.height(op.screenh).width(op.screenw);
		   
		  },
	
	  backgroundH : function(that,op){
		  
		 
		  
		  var imgcw=op.imgw*op.screenh/op.imgh; 
		  
		  var swh=op.screenw/op.screenh;
		
		  if(imgcw < op.screenw){ 
		  
		     var imgch= op.imgh*op.screenw/op.imgw;
			 
			  
		  	that.find(op.maxb_bg+", "+op.maxb_title).width(op.screenw).height(imgch).css("margin-left",-op.screenw/2+"px");
		  
		  }else {
			   var imgcw= op.imgw*op.screenh/op.imgh;
			  
			  that.find(op.maxb_bg+", "+op.maxb_title).width(imgcw).height(op.screenh).css("margin-left",-imgcw/2+"px");
			  
			  }
		  
		  
		  },
	setCookie: function(name, objValue) { //设置cookie
		var str = name + "=" + escape(objValue) + ";";
		document.cookie = str;
		
	},
	getCookie: function(name) { //取cookies函数       
		var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
		if (arr = document.cookie.match(reg)) return unescape(arr[2]);
		else return null;
	}
	  }
	})(jQuery)
