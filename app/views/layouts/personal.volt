	{{ stylesheet_link('css/bootstrap/bootstrap.css') }}
	{{ stylesheet_link('css/bootstrap/bootstrap-responsive.css') }}
	{{ stylesheet_link('css/bootstrap/style.css') }}		
	{{ javascript_include('js/index/jquery-1.8.0.min.js') }}

	
	<div class="" style="top: 011px;">
	<style type="text/css">
	/**-----------万邦家族财富 Banner start----------------*/
	.maxbanner{height:698px; width:100%; min-width:1200px; overflow:hidden; z-index:10000;}
	.maxb_bg{min-width:100%; min-height:100%; _height:698px; _width:1000px; top:0; left:0; }
	.pr{position:relative;}
	.pa{position:absolute;}
	.fixbox{position:inherit;}
	.conterbox{margin-top:0px;}
	/*头部背景*/
section.headerbg{background:url(./../../img/index/nav_bg.jpg) repeat-x left top;height:86px;width:100%;}
.fixbox{position:absolute;left:0px;top:0px; z-index:9999; position:fixed;width:100%;}
	/* ie6固定位置*/
* html,* html body{ background-image:url(about:blank); background-attachment:fixed; }
*html .fixbox{ position:absolute;left:expression(eval(document.documentElement.scrollLeft));top:expression(eval(document.documentElement.scrollTop)); } 
/*页面居中*/
.header_warp,.conterbox,.footer_conter{width:1235px;margin:0 auto;}
.conterbox{margin-top:95px;display:block;*padding-top:110px;_margin-top:0px;}
.index_mt0{margin-top:0px;}
/*logo与语言*/
.logobox{width:388px;height:86px; }
a.logimg{display:block;height:86px; background:url(./../../img/index/logo_png.png) no-repeat left top;_background:url(./../../img/index/logo_03.png) no-repeat left top;}
section.navline{height:9px;background:#3c3c3c;width:100%; overflow:hidden;zoom:1; position:relative;top:-1px; z-index:5;}
.menubox{width:545px;height:86px;}
.language{width:90px;color:#fff;_width:93px;}
.language span{display:inline-block;line-height:20px;font-size:12px;cursor:pointer; font-family:Arial, Helvetica, sans-serif;}


.personalHead{
	
}
.personalHead .pull-left{
	display:none;
}
.personalHead .pull-right{
	position:absolute;
	top:50px;
	left:1100px;
	width:500px;
}
.personalHead .pull-right li{
	float:left;
	margin-right:20px;
}
.personalHead .pull-right li a{
	color:#fff;
	font-size:14px;
}
.personalHead .pull-right li a:hover{
	color:#fff;
	background:none;
}
	/**-----------万邦家族财富 Banner end----------------*/
	</style>
	
		<section class="fixbox" style="top: 0px; left: 0px; ">
			<section class="clearfix headerbg">
				<section class="header_warp">
					<div class="logobox fl"> <a href="/index/index" class="logimg" title="万邦家族财富"></a> </div>
					<div class="menubox fr">
						<div class="searchbox clearfix">
							<div class="fl language"><!-- <span class="mr10">English</span>|<span class="ml10">中文</span> --></div>
						</div>
						<div class="personalHead">{{ elements.getMenu() }}</div>						
					</div>
				</section>
			</section>
			<section class="navline"></section>
		</section>	
<div class="container" style="margin-top:100px;width:1170px;">		
    {{ content() }}
 
</div>		
	</div>
