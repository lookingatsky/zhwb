	{{ stylesheet_link('css/index/basic.css') }} 
	{{ stylesheet_link('css/index/style.css') }} 
	{{ stylesheet_link('css/index/about.css') }} 
	{{ stylesheet_link('css/index/products.css') }}
	{{ stylesheet_link('css/index/pagination.css') }}
	
	{{ javascript_include('js/index/jquery-1.js') }}
	{{ javascript_include('js/index/html5.js') }}
	{{ javascript_include('js/index/basic.js') }}
	{{ javascript_include('js/index/about.js') }}
	{{ javascript_include('js/index/page.js') }}
	

	<section class="fixbox">
		<section class="clearfix headerbg">
			<section class="header_warp">
				<div class="logobox fl"> <a href="/index/index" class="logimg" title="万邦财富"></a> </div>
				<div class="menubox fr">
					<div class="searchbox clearfix">
						<div class="fl language"><!-- <span class="mr10">English</span>|<span class="ml10">中文</span> --></div>
						<div class="fr fx_search">
							<div class="clearfix">
								<ul class="fr fenxiang">
									<li><a href="http://weibo.com/5657584093" title="新浪" class="sina_icon web_skin" target="_blank"></a></li>
								</ul>
								<div class="fr">
									<div class="search_input clearfix">
										<div class="inputbox fl">
											<i class="web_skin search_icon"></i><input name="search" type="text">
										</div>
										<a href="javascript:void(0)" class="search_btn web_skin">搜索</a> 
									</div>
								</div>
							</div>
						</div>
					</div>
					<nav>
						<ul class="clearfix menu_list mt20"> <li class="w77"><a href="/index/index">首&nbsp;&nbsp;页</a></li>
							<li class="menu_line">|</li>
							<li class="rel">
								<a href="/index/index">关于我们</a><!-- class="menu_on" -->
								<div class="menulist">
									<ul class="clearfix ulbox">
										<li><a href="/about/index">公司简介<i class="web_skin menu_icon"></i></a></li>
										<!-- <li><a href="#">客户服务<i class="web_skin menu_icon"></i></a></li>
										<li><a href="#">员工风采<i class="web_skin menu_icon"></i></a></li>-->
										<!-- <li><a href="http://www.chyjr.com/site/web/aboutZhici.jsp">总裁致辞<i class="web_skin menu_icon"></i></a></li> -->
										<!-- <li><a href="/about/partner">合作伙伴<i class="web_skin menu_icon"></i></a></li> -->
										<li><a href="/about/contact">联系我们<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/about/culture">公司文化<i class="web_skin menu_icon"></i> </a></li>
										<li><a href="/about/partner">合作伙伴<i class="web_skin menu_icon"></i> </a></li>
										<!-- <li><a href="#">万邦荣誉<i class="web_skin menu_icon"></i></a></li>-->
									</ul>
								</div>
							</li>
							<li class="menu_line">|</li>
							<li class="rel">
								<a href="/situation/index">公司动态</a>
								<div class="menulist">
									<ul class="clearfix ulbox hydt_tab">
										<li><a href="/situation/index?type=X_WXX">公司新闻<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=X_MTBD">行业新闻<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=H_SCHD">市场活动<i class="web_skin menu_icon"></i></a></li>
									</ul>
								</div>
							</li>
							<li class="menu_line">|</li>
							<li class="rel cpfu_menubtn">
								<a style="" href="/service/index" class="menu_on">产品与服务</a>
								<div class="menulist">
									<ul class="clearfix ulbox">
										<li><a href="/service/index">公司产品<i class="web_skin menu_icon"></i></a></li>
										<!-- <li><a href="/service/infos">信息披露<i class="web_skin menu_icon"></i></a></li> -->
										<li><a href="/service/method">服务方式<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/service/mode">服务理念<i class="web_skin menu_icon"></i></a></li>
									</ul>
								</div>
							</li>
<!-- 							<li class="menu_line">|</li>
							<li class="rel">
								<a href="/situation/index?type=X_MTBD">行业新闻</a>
								<div class="menulist zx_menulist">
									<ul class="clearfix ulbox">
										<li><a href="/situation/index?type=X_MTBD?type=WEB_HYYJ">行业新闻<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=X_MTBD?type=Y_XTZX">信托资讯<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=X_MTBD?type=Y_LCSC">理财市场<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=X_MTBD?type=WEB_RDZT">热点专题<i class="web_skin menu_icon"></i></a></li>
										<li><a href="/situation/index?type=X_MTBD?type=Y_HYZX">万邦资讯<i class="web_skin menu_icon"></i></a></li>
									</ul>
								</div>
							</li> -->
							<li class="menu_line">|</li>
							<li class="rel job_menu">
							<a href="http://old.zhwbchina.com/zxns/">诚聘英才</a>
							</li>
						</ul>
					</nav>
				</div>
			</section>
		</section>
		<section class="navline"></section>
	</section>	
<!-- 以上为菜单与logo内容-->
	
    {{ content() }}
		
	<!-- 页脚内容-->
	<footer>
		<div class="footer_conter clearfix">
			<div class="fl footer_leftbox">
				<ul class="clearfix">
					<li><a href="/situation/index?type=X_MTBD" target="_blank">行业新闻</a></li>
					<li><a href="/college/index" target="_blank"> 理财学堂</a></li>
					<li><a href="/situation/index" target="_blank">公司动态</a></li>
					<li><a href="http://old.zhwbchina.com/zxns/" target="_blank">诚聘英才</a></li>
					<li><a href="/about/contact" target="_blank">联系我们</a></li>
					<li><a href="/about/partner" target="_blank">合作伙伴</a></li>
				</ul>
				<p>
					万邦家族财富投资管理（北京）有限公司  版权所有<span>  CopyRight 1999-2023 All Rights Reserved.<span><br> 
					京<span>ICP</span>备<span>15062970</span>号<span>-1</span>
					</span>
					</span>
				</p>
			</div>
			<div class="fr footer_fx mt18">
			<ul>
				<li class="fx_title">分享我们：</li> 
				<li><a href="http://weibo.com/5657584093" title="新浪" class="footer_sina_icon web_skin" target="_blank"></a></li>
				<li><a></a></li>
				<li><a></a></li>
			</ul>
			</div>
		</div>
	</footer>
<script type="text/javascript">
$(document).ready(function(){	
	$("a[rel^='prettyPhoto']").prettyPhoto();
	$(".gallery a[rel^='prettyPhoto']").prettyPhoto();
})
</script>
	