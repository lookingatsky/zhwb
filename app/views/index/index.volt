
		<section class="conterbox clearfix" style="margin-top: 95px;"> 
			<!-- 左边内容-->
			<section class="left_conterbox fl mt15"> 
				<!--baner图片切换-->
				<div class="baner" id="advDivindex">
					<!-- javascript:void(0) -->
					<div class="baner_imglist" id="advindex" isindex="1" style="left: 0px; width: 5712px;">            	
						<div style="width:714px;">
							<a href="/news/index/18" target="_blank">
								<img src="/../../img/index/index/index1.png" alt="">
							</a>
						</div>              	
						<div style="width:714px;">
							<a href="#" target="_blank">
								<img src="/../../img/index/index/index2.png" alt="">
							</a>
						</div>              	
						<div style="width:714px;">
							<a href="/news/index/21" target="_blank">
								<img src="/../../img/index/index/index3.png" alt="">
							</a>
						</div>              	
						<div style="width:714px;">
							<a href="/news/index/20" target="_blank">
								<img src="/../../img/index/index/index4.png" alt="">
							</a>
						</div>        	
						<div style="width:714px;">
							<a href="/news/index/19" target="_blank">
								<img src="/../../img/index/index/index5.png" alt="">
							</a>
						</div>              	
						<div style="width:714px;">
							<a href="/news/index/22" target="_blank">
								<img src="/../../img/index/index/index6.png" alt="">
							</a>
						</div>              	
<!-- 						<div style="width:714px;">
							<a href="#" target="_blank">
								<img src="/../../img/index/index/index1.png" alt="">
							</a>
						</div>            	
						<div style="width:714px;">
							<a href="#" target="_blank">
								<img src="/../../img/index/index/index1.png" alt="">
							</a>
						</div>    -->           	
					</div>
					<div class="playbox" id="id">
						<div id="obkList" class="focus_btn"> 
<!-- 							<a href="javascript:;" class="play_icon_btn web_skin 1"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 2"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 3"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 4"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 5 play_icon_on"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 6"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 7"></a>
							<a href="javascript:;" class="play_icon_btn web_skin 8"></a> -->
						</div>
					</div>
				</div>
				<!--资讯列表-->
				<section>
					<ul class="clearfix index_listbox">
						<li class="mr18">
							<dl>
								<dt class="clearfix">
									<h2 class="fl message_title web_skin">微信息</h2>
									<a href="/situation/index?type=X_WXX" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
								</dt>
								<dd class="clearfix h_114">
									<div class="fl imgbox"><img src="/../../img/index/index_pl_pic_06.jpg"></div>
									<div class="hynews fl ml10 ">
										{% for new in news1 %}
										<div><a href="/news/index/{{ new.id }}" target="_blank"><i class="new_texticon web_skin"></i><?php if(mb_strlen($new->title,'utf-8')  > 15){ echo mb_substr($new->title,0,14,'utf-8'); }else{ echo $new->title;  }?></a></div>
										{% endfor %}
									</div>
								</dd>
							</dl>
						</li>
						
						<li>
							<dl>
								<dt class="clearfix">
									<h2 class="fl message_title web_skin">行业新闻</h2>
									<a href="/situation/index?type=X_MTBD" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
								</dt>
								<dd class="clearfix h_114">
									<div class="fl imgbox"><img src="/../../img/index/index_pl.jpg"></div>
									<div class="new_lsit fr">
										{% for new in news2 %}
										<div> <a href="/news/index/{{ new.id }}" target="_blank"><i class="new_texticon web_skin"></i><?php if(mb_strlen($new->title,'utf-8')  > 15){ echo mb_substr($new->title,0,14,'utf-8')."..."; }else{ echo $new->title;  }?></a> </div>
										{% endfor %}
									</div>
								</dd>
							</dl>
						</li>
<!-- 						<li class="mr18">
							<dl>
								<dt class="clearfix">
									<h2 class="fl message_title web_skin">公司公告</h2>
									<a href="/service/infos" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
								</dt>
								<dd class="clearfix h_114">
									<div class="new_lsit w315">
										{% for new in news4 %}
										<div><a href="/news/index/{{ new.id }}" target="_blank"><i class="new_texticon web_skin"></i>{{ new.title }}</a> </div>
										{% endfor %}
									</div>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt class="clearfix">
									<h2 class="fl message_title web_skin">媒体报导</h2>
									<a href="/situation/index?type=X_MTBD" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
								</dt>
								<dd class="clearfix h_114">
									<div class="new_lsit w315">
										<div><a href="#" target="_blank"><i class="new_texticon web_skin"></i>XXXXXXXXXX...</a></div>
										<div><a href="#" target="_blank"><i class="new_texticon web_skin"></i>XXXXXXXXXX...</a></div>
										<div><a href="#" target="_blank"><i class="new_texticon web_skin"></i>XXXXXXXXXX...</a></div>
										<div><a href="#" target="_blank"><i class="new_texticon web_skin"></i>XXXXXXXXXX...</a></div>
										<div><a href="#" target="_blank"><i class="new_texticon web_skin"></i>XXXXXXXXXX...</a></div>
									</div>
								</dd>
							</dl>
						</li> -->
					</ul>
				</section>
				<!--热销业务-->
				<section class="hot_yewu mt20">
					<dl>
						<dt class="clearfix">
							<h2 class="fl message_title web_skin">热销业务</h2>
							<a href="/service/index" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
						</dt>
						<dd>
							<section id="hot" rel="1" iscom="1" style="height:240px; overflow:hidden;">
								{% for product in indexProducts %}
								<div class="start" style="zoom: 1; display: block; height: 79px; clear: both; background-color: rgb(255, 255, 255);">
									<a href="/service/product/{{ product.id }}" target="_blank">
										<div class="clearfix pr13 yewulist">
											<div class="fl cp_name">
												<h2 class="icon_align"><i class="cp_icon web_skin"></i><span>产品名称:</span>{{ product.name }}  </h2>
												<h2 class="icon_align"><i class="jigou_icon web_skin"></i><span>发行机构:</span>{{ product.issuer }}</h2>
											</div>
											<div class="fr yuyue">
												<div class="clearfix">
													<div class="fl qixian">
														<p>期限：{{ product.cycle }}</p>
														<span class="icon_align"><i class="time_icon web_skin"></i>正常 </span> 
													</div>
													<div class="fr earnings web_skin">
														<h2>预期收益</h2>
														<p>{{ product.expected }}</p>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								{% endfor %}
							</section>
						</dd>
					</dl>
				</section>
				<!-- 活动市场分支机构-->
				<section class="clearfix mt20">
					<div class="fl bazaar">
						<dl>
							<dt class="clearfix">
								<h2 class="fl message_title web_skin">市场活动</h2>
								<a href="/situation/index?type=H_SCHD" class="morebtn fr icon_align" target="_blank">更多<i class="web_skin more_icon"></i></a> 
							</dt>
							<dd style="padding-top:0px;" class="h_353">
								{% for new in news3 %}
								<div class="hdlistbox">
									<h2 class="sess_bt"><a href="/news/index/{{ new.id }}" target="_blank"><?php if(mb_strlen($new->title,'utf-8')  > 21){ echo mb_substr($new->title,0,20,'utf-8')."..."; }else{ echo $new->title;  }?></a></h2>
									<div class="clearfix mt10">
										<div class="fl infotext">
											<p><?php if(mb_strlen($new->description,'utf-8')  > 41){ echo mb_substr($new->description,0,40,'utf-8')."..."; }else{ echo $new->description;  }?></p>
										</div>
										<div class="fr picbox"><a href="/news/index/{{ new.id }}" target="_blank"><img src="/../..{{ new.thumb }}" style="width:123px;height:66px;"></a></div>
									</div>
								</div>
								{% endfor %}			  
							</dd>
						</dl>
					</div>
					<div class="fr jigou_map">
						<dl>
							<dt class="clearfix">
								<h2 class="fl message_title web_skin">分支机构</h2>
								<a href="/about/contact" class="morebtn fr icon_align">更多<i class="web_skin more_icon"></i></a> 
							</dt>
							<dd> 
								<div class="map_bg rel">
									<section class="map001_zb" id="zb">
										<a href="" class="nibo" title="北京总部"></a>
										<div class=" infobox_map position_hz">
											<div class="rel relavebox2"></div>
											<div class="zblist">
												<h2>上海中欣财富中心</h2>
												<p>地址: 上海市静安区南京西路1468号4201、4209室<br>
												联系方式: 021-61279530</p> 
											</div>
										</div> 
									</section>
									<section class="map04">
										<a href="" class="nibo" title="南京"></a>
										<div class="infobox_map position_d">
											<div class="rel relavebox2" style="height:190px;"></div>
											<div class="maptext">
												<h2>南京新地财富中心</h2>
												<p>地址:江苏省南京市建邺区庐山路188号南京新地中心45层4503、4504室<br>
												联系方式: 025-86918866</p>
												<h2>苏州晋合财富中心</h2>
												<p>地址:江苏省苏州市工业园区华池街88号晋合广场1幢1201室<br>
												联系方式: 0512-89181688</p>												
											</div>
										</div>
									</section>
									<section class="map13">
										<a href="" class="nibo" title="北京"></a>
										<strong class="text_tag">(&nbsp;总部&nbsp;)</strong> 
										<div class="infobox_map position_m" style="z-index:999;">
											<div class="rel relavebox2" style="height:190px;"></div>
											<div class="maptext">
												<h2>中合万邦投资管理有限公司（总部）</h2>
												<p>总部地址: 北京市朝阳区建国门外大街8号IFC A座32层02-03单元<br>
												联系方式: 010-85659999</p>
												<h2>北京普惠中心</h2>
												<p>地址:北京市朝阳区建外大街2号院银泰中心C座46层<br>
												联系方式: 010-85659901</p>													
											</div>
										</div>
									</section>
									<section class="map20">
										<a href="" class="nibo" title="广州"></a>
										<div class="infobox_map position_20">
											<div class="rel relavebox2"></div>
											<div class="zblist">
												<h2>广州白云财富中心</h2>
												<p>地址: 广东省广州市越秀区三元里山西大厦3号楼3220室<br>
												联系方式: 020-36298548</p>
											</div>
										</div>
									</section>
									<section class="map21">
										<a href="" class="nibo" title="海口"></a>
										<div class="infobox_map position_21">
											<div class="rel relavebox2"></div>
											<div class="zblist">
												<h2>海口时代普惠中心</h2>
												<p>地址: 海南省海口市龙华区国贸路2号海南时代广场18层东侧<br>
												联系方式: 0898-36651855</p>
											</div>
										</div>
									</section>	
									
								</div>
								<div class="company">
									<h2>中合万邦投资管理有限公司（总部）</h2>
									<p>地址: 北京市朝阳区建国门外大街2号银泰中心c座 46层<br>
									联系方式:400-077-8000 <li><a></a></li></p>
								</div>
							</dd>
						</dl>
					</div>
				</section>
			</section>
			
			<!-- 右边内容-->
			<section class="right_aside fr mt15">
				<div class="user_loging">
					<h2 style="font-size:16px;">账户登录</h2>
					<div class="formbox">
						<table width="100" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td class="w50">账号:</td>
									<td colspan="2"><div class="loging_inputbox"><input type="text" value="" name=""></div></td>
								</tr>
								<tr>
									<td class="w50">密码:</td>
									<td colspan="2"><div class="loging_inputbox"><input type="text" value="" name=""></div></td>
								</tr>
								<tr>
									<td class="w50">验证码:</td>
									<td><div class="loging_inputbox w90"><input type="text" value="" name=""></div></td>
									<td class="w60"><span class="web_skin tel_btn">手机获取</span></td>
								</tr>
							</tbody>
						</table> 
						<div class="mt10 btnbox clearfix">
							<a href="javascript:void(0)" class="loging_btn web_skin ml50 fl">登&nbsp;&nbsp;录</a>
							<a href="javascript:void(0)" class="fr mt5 mr18 help_btn">在线帮助</a>
						</div>
					</div>
				</div>

				<!--  企业文化-->
<!-- 				<div class="user_loging mt10">
					<h2>万邦企业文化</h2>
					<a href="javascript:void(0)" class="aside_video">
						<span class="play_btn"></span>
					</a>
				</div>

				<div class="user_loging mt10">
					<h2>万邦年度广告</h2>
					<a href="javascript:void(0)" class="aside_video2">
						<span class="play_btn2"></span>
					</a>
				</div>
				<div class="user_loging mt10">
					<h2>张总做客第一财经</h2>
					<a href="javascript:void(0)" class="aside_video3">
						<span class="play_btn3"></span>
					</a>
				</div> -->
				<div class="user_loging mt5">
					<div class="formbox clearfix tel400_bg" style="padding-top:10px;">
						<div class="tel400 fl"><i class="web_skin tel400_icon"></i></div>
						<div class="fr number_400">
							<h3>客服热线</h3>
							<p>400-077-8000</p>
							<p style="color:#26211a;font-size:12px;"><span style="font-family:&#39;微软雅黑&#39;;">(周一至周五：</span>9:00—18:00) </p>
						</div>
					</div>
				</div>
				
				<div class="user_loging mt5 red_title">
					<h2>理财信息</h2>
					<div class="formbox clearfix wx ">
						<ul class="clearfix">
							<li>
								<a href="javascript:void('0')" id="yuyue">
								<img src="/../../img/index/tools_icon.jpg" alt="预约理财师">                   
								<span>预约理财师</span>
								</a>
							</li>
							<li>
								<a href="/college/index" target="_blank">
								<img src="/../../img/index/tools_icon2.jpg" alt="理财学堂">
								<span>理财学堂</span>
								</a>
							</li>
							<li>
								<a href="/college/case" target="_blank">
								<img src="/../../img/index/tools_icon3.jpg" alt="理财案例">
								<span>理财案例</span>
								</a>
							</li>
							<li>
								<a href="/college/test" target="_blank">
								<img src="/../../img/index/tools_icon4.jpg" alt="在线风险测试">
								<span>在线风险测试</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="user_loging mt5 red_title">
					<h2>理财工具</h2>
					<div class="formbox clearfix">
						<div class="lc_btn w192 clearfix rel" style="z-index:200;"> 
							<div class="clearfix">
								<a href="javascript:void(0)">存款利率表</a>
								<i class="web_skin aside_lcgj_off"></i>
							</div>
							<div class="aside_laybox ck_position">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th scope="col">存款项目:</th>
											<th scope="col">央行基准年利率:</th>
										</tr>
										<tr>
											<td>活期存款</td>
											<td>0.35%</td>
										</tr>
										<tr>
											<td>三个月定期存款</td>
											<td>1.35%</td>
										</tr>
										<tr>
											<td>半年定期存款</td>
											<td>1.55%</td>
										</tr>
										<tr>
											<td>一年定期存款</td>
											<td>1.75%</td>
										</tr>
										<tr>
											<td>两年定期存款</td>
											<td>2.35%</td>
										</tr>
										<tr>
											<td>三年定期存款</td>
											<td>3.00%</td>
										</tr>
										<tr>
											<td>五年定期存款</td>
											<td>--</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="lc_btn w192  rel" style="z-index:100;">
							<div class="clearfix" style="z-index:60;">
							<a href="javascript:void(0)">贷款利率表</a>
							<i class="web_skin aside_lcgj_off"></i>
							</div>
							<div class="aside_laybox dk_position">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th scope="col">贷款项目:</th>
											<th scope="col" style="width:65px;">年利率:</th>
										</tr>
										<tr>
											<td>6个月以内(含6个月)贷款</td>
											<td>4.60</td>
										</tr>
										<tr> 
											<td>6个月至1年(含1年)贷款</td>
											<td>4.60</td>
										</tr>
										<tr>
											<td>1至3年(含3年)贷款	</td>
											<td>5.00</td>
										</tr>
										<tr>
											<td>3至5年(含5年)贷款</td>
											<td>5.00</td>
										</tr>
										<tr>
											<td>5年以上贷款</td>
											<td>5.15</td>
										</tr>
										<tr>
											<td>个人住房公积金贷款5年以下(含5年) </td>
											<td>2.75</td>
										</tr>
										<tr>
											<td>个人住房公积金贷款5年以上</td>
											<td>3.25</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div> 
						
						<div class="lc_btn w192 clearfix rel" style="z-index:99;">
							<div class="clearfix">
								<a href="javascript:void(0)">适合个人投资理财工具</a>
								<i class="web_skin aside_lcgj_off"></i>
							</div>
							<div class="aside_laybox cz_position">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th scope="col" class="text_lt">理财工具</th>
											<th scope="col">操作难易度</th>
											<th scope="col">投资门槛</th>
										</tr>
										<tr>
											<td class="text_lt">债券</td>
											<td>低</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">银行理财产品</td>
											<td>低</td>
											<td>高</td>
										</tr>
										<tr>
											<td class="text_lt">基金</td>
											<td>中</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">保险</td>
											<td>低</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">股票</td>
											<td>高</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">权证</td>
											<td>偏高</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">外汇</td>
											<td>高</td>
											<td>高</td>
										</tr>
										<tr>
											<td class="text_lt">期货</td>
											<td>偏高</td>
											<td>高</td>
										</tr>
										<tr>
											<td class="text_lt">股指期货</td>
											<td>偏高</td>
											<td>偏高</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div> 
						
						<div class="lc_btn w192 clearfix rel" style="z-index:90">
							<div class="clearfix">
								<a href="javascript:void(0)">零风险投资理财工具</a>
								<i class="web_skin aside_lcgj_off "></i>
							</div>
							<div class="aside_laybox fx_position">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th scope="col" class="text_lt">理财工具</th>
											<th scope="col">操作难易度</th>
											<th scope="col">投资门槛</th>
										</tr>
										<tr>
											<td class="text_lt">银行保本理财产品</td>
											<td>适中 </td>
											<td> 高</td>
										</tr>
										<tr>
											<td class="text_lt">保本基金</td>
											<td>适中</td>
											<td>高</td>
										</tr>
										<tr>
											<td class="text_lt">分红型保险 </td>
											<td>适中</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">国债</td>
											<td>简单</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">货币基金</td>
											<td>简单</td>
											<td>低</td>
										</tr>
										<tr>
											<td class="text_lt">储蓄</td>
											<td>容易</td>
											<td>低</td>
										</tr>
									</tbody>
								</table>
							</div> 
						</div>
						<div>(更新时间：2015年08月26日)</div>
					</div>
					<div class="user_loging mt5">
						<h2>扫描加入中合万邦官方微信</h2>
						<div class="formbox clearfix wx ">
							<img src="/../../img/index/wx_pic_03.png" width="132"> 
							<span class="blank15"> </span>
						</div>
					</div>
						   <!-- 
						   <div class="user_loging khd_donload mt5">
								<h2 >移动客户端下载</h2>
								<div class="phone_bg clearfix mt10">
									<a class="bigblackbut7" href="#" ><img src="/site/style/images/ios_07.gif" alt="Iphone客户端下载" /></a>
								</div>
								<div class="phone_bg  clearfix mt10 mb10">
									<a class="bigblackbut7" href="#" ><img src="/site/style/images/anz_11.gif" alt="安卓客户端下载" /></a>
								</div>
						   </div> -->
				</div>
			</section>
			
		<script type="text/javascript" src="./js/jwplayer.js"></script>
		   <script type="text/javascript">
		 var theplayer;
		 var theplayer2;
		 var theplayer3;
		$(function(){
			theplayer=jwplayer("container").setup({
			//通过js调用播放器并安装到指定容器（container）内flashplayer: "jwplayer/player.swf",//调用播放器
			 'flashplayer': '/site/style/js/js_plus/player.swf',
		file:"/site/style/video/hy010.flv",//调用视频文件
		width: 720,//播放器宽
		height: 400,//播放器高
		image:"/site/style/video/video_bg.jpg",//视频预览图片
		controlbar: "over",//控制条位置
		screencolor :"#000",//播放器颜色
		repeat:"always",//重复播放
		autostart:false});
			
		theplayer2=jwplayer("container2").setup({
			//通过js调用播放器并安装到指定容器（container）内flashplayer: "jwplayer/player.swf",//调用播放器
			 'flashplayer': '/site/style/js/js_plus/player.swf',
		file:"/site/style/video/hycf.flv",//调用视频文件
		width: 720,//播放器宽
		height: 400,//播放器高
		image:"/site/style/video/video_bg2.jpg",//视频预览图片
		controlbar: "over",//控制条位置
		screencolor :"#000",//播放器颜色
		repeat:"always",//重复播放
		autostart:false});

		theplayer3=jwplayer("container3").setup({
			//通过js调用播放器并安装到指定容器（container）内flashplayer: "jwplayer/player.swf",//调用播放器
			 'flashplayer': '/site/style/js/js_plus/player.swf',
		file:"/site/style/video/video3.mp4",//调用视频文件
		width: 720,//播放器宽
		height: 400,//播放器高
		image:"/site/style/video/video_bg3.jpg",//视频预览图片
		controlbar: "over",//控制条位置
		screencolor :"#000",//播放器颜色
		repeat:"always",//重复播放
		autostart:false});
			
			});
			

		</script>
		<!--视频弹出层-->
			<div class="laybox_video hide rel">
				<a href="javascript:void(0)" class="close_btnvideo"></a>
				<div class="video">
					<div id="container_wrapper" style="position: relative; width: 720px; height: 400px;"><object type="application/x-shockwave-flash" data="http://www.chyjr.com/site/style/js/js_plus/player.swf" width="100%" height="100%" bgcolor="#000000" id="container" name="container" tabindex="0"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="seamlesstabbing" value="true"><param name="wmode" value="opaque"><param name="flashvars" value="netstreambasepath=http%3A%2F%2Fwww.chyjr.com%2Fsite%2Fweb%2Findex.shtml&amp;id=container&amp;file=%2Fsite%2Fstyle%2Fvideo%2Fhy010.flv&amp;image=%2Fsite%2Fstyle%2Fvideo%2Fvideo_bg.jpg&amp;screencolor=%23000&amp;repeat=always&amp;autostart=false&amp;controlbar.position=over"></object></div>
				</div>
				<div class="video_jianjie">
					<article>
						<h2>公司简介</h2>
						<p>中合万邦长期专注于为高端人群提供专业性、个性化、综合性的财富管理服务，凭借富有创新理财服务理念的专业管理团队，通过对客户财务状况、理财需求、投资偏好等各方面的情况进行综合分析，为客户提供资产配置方案和优质理财产品，现已服务客户万余人。</p>
						<p>对于风险控制管理，中合万邦从源头上对产品风险进行把控，深入调查、跟踪产品运作情况，确保产品的安全性及其市场稀缺性。同时我们有着完善的产品存续期的管理服务，持续改进产品研发设计与甄选能力，力求提供完美的客户服务品质。除此之外，中合万邦内部有着紧密相连的几大运营体系，如：动态的财富管理体系，卓越的信息服务体系，安全稳健的客户管理系统，使我们的客户享有专属、私密的财富管理体验。 </p>
					</article>
				</div>
			</div>

			<div class="laybox_video2 hide rel">
				<a href="javascript:void(0)" class="close_btnvideo2"></a>
				<div class="video2">
					<div id="container2_wrapper" style="position: relative; width: 720px; height: 400px;"><object type="application/x-shockwave-flash" data="http://www.chyjr.com/site/style/js/js_plus/player.swf" width="100%" height="100%" bgcolor="#000000" id="container2" name="container2" tabindex="0"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="seamlesstabbing" value="true"><param name="wmode" value="opaque"><param name="flashvars" value="netstreambasepath=http%3A%2F%2Fwww.chyjr.com%2Fsite%2Fweb%2Findex.shtml&amp;id=container2&amp;file=%2Fsite%2Fstyle%2Fvideo%2Fhycf.flv&amp;image=%2Fsite%2Fstyle%2Fvideo%2Fvideo_bg2.jpg&amp;screencolor=%23000&amp;repeat=always&amp;autostart=false&amp;controlbar.position=over"></object></div>
				</div>
			</div>
			<div class="laybox_video3 hide rel">
				<a href="javascript:void(0)" class="close_btnvideo3"></a>
				<div class="video3">
					<div id="container3_wrapper" style="position: relative; width: 720px; height: 400px;"><object type="application/x-shockwave-flash" data="http://www.chyjr.com/site/style/js/js_plus/player.swf" width="100%" height="100%" bgcolor="#000000" id="container3" name="container3" tabindex="0"><param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="always"><param name="seamlesstabbing" value="true"><param name="wmode" value="opaque"><param name="flashvars" value="netstreambasepath=http%3A%2F%2Fwww.chyjr.com%2Fsite%2Fweb%2Findex.shtml&amp;id=container3&amp;file=%2Fsite%2Fstyle%2Fvideo%2Fvideo3.mp4&amp;image=%2Fsite%2Fstyle%2Fvideo%2Fvideo_bg3.jpg&amp;screencolor=%23000&amp;repeat=always&amp;autostart=false&amp;controlbar.position=over"></object></div>
				</div>
			</div>
				 
				 
			<!--公告弹出层-->
			<div class="laybox hide rel">
				<a href="javascript:void(0)" class="close_btn"></a>
				<div class="lay_title">温馨提示</div>
				<div class="lay_contbox" style="text-indent:30px;"></div>
				<div class="lay_footer">
					<section class="clearfix">
						<div class="tel400 fl">
							<i class="web_skin tel400_icon"></i>
						</div>
						<div class="fr number_400">
							<h3>客服热线</h3>
							<p>400-077-8000</p>
						</div>
					</section>
				</div>
			</div> 

		</section>

	<!-- 页脚内容-->
		<footer>
			<div class="footer_conter clearfix">
				<div class="fl footer_leftbox">
					<ul class="clearfix">
						<li><a href="/situation/index?type=X_MTBD" target="_blank">行业新闻</a></li>
						<li><a href="/college/index" target="_blank">理财学堂</a></li>
						<li><a href="/situation/index" target="_blank">公司动态</a></li>
						<li><a href="http://www.zhwbchina.com/zxns/" target="_blank">诚聘英才</a></li>
						<li><a href="/about/contact" target="_blank">联系我们</a></li>
					</ul>
					<p>
						中合万邦投资管理有限公司  版权所有
						<span>  CopyRight 1999-2023 All Rights Reserved.
							<span><br> 
							京<span>ICP</span>备<span>15005678</span>号<span>-1</span>
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
	$(function(){
		litext('.new_lsit','a',20)
		//litext('.hynews','a',22)
		$('.h_353').find('.hdlistbox').last().css({'border-bottom':0});
		
		//--------------万邦 Banner start------------------
		$("#maxbanner").maxBanner({
			fixbox:".fixbox",
			maxb_bg:"#maxb_bg",
			maxb_title:"#maxb_title",
			callback:function(that){
				$("section.fixbox").css({"top":"0","left":"0","position":"fixed"});
				$(".conterbox").css({"margin-top":"95px"});
				}
			});
		//--------------万邦 Banner end--------------------
	})
</script>
