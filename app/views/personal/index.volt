
<!-- 
<style>
label{
	text-align:left;
}	
label font{
	height:30px;
	width:150px;
}
</style>
<script>
	$(function(){
		
	　　 function trim(str){ //删除左右两端的空格
	　　     return str.replace(/(^\s*)|(\s*$)/g, "");
	　　 }
	　　 function ltrim(str){ //删除左边的空格
	　　     return str.replace(/(^\s*)/g,"");
	　　 }
	　　 function rtrim(str){ //删除右边的空格
	　　     return str.replace(/(\s*$)/g,"");
	　　 }		
	})
</script>
<div class="center scaffold">
    <h3>个人信息</h3>
	<div class="clearfix" style="float:left;">
		<label><b>名 称：</b> {{ customer.name }}</label>
		<label><b>身份证号码：</b> <?php echo substr($customer->number,0,5)?>********<?php echo substr($customer->number,14,4)?></label>
		<label><b>邮寄地址：</b> {{ customer.address }}</label>
		{% if customer.registered is defined %}
		<label><b>户籍地址：</b> {{ customer.registered }}</label>
		{% endif %}
	</div>
	<div style="clear:both;"></div>			
	<hr />
{{ javascript_include('js/highcharts.js') }}
{{ javascript_include('js/exporting.js') }}	
<script>
$(function(){
	Highcharts.setOptions({
		lang:{
		   contextButtonTitle:"图表导出菜单",
		   decimalPoint:".",
		   downloadJPEG:"下载JPEG图片",
		   downloadPDF:"下载PDF文件",
		   downloadPNG:"下载PNG文件",
		   downloadSVG:"下载SVG文件",
		   drillUpText:"返回 {series.name}",
		   loading:"加载中",
		   months:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		   noData:"没有数据",
		   numericSymbols: [ "千" , "兆" , "G" , "T" , "P" , "E"],
		   printChart:"打印图表",
		   resetZoom:"恢复缩放",
		   resetZoomTitle:"恢复图表",
		   shortMonths: [ "1月" , "2月" , "3月" , "4月" , "5月" , "6月" , "7月" , "8月" , "9月" , "10月" , "11月" , "12月"],
		   thousandsSep:",",
		   weekdays: ["星期一", "星期二", "星期三", "星期三", "星期四", "星期五", "星期六","星期天"]
		}
	}); 	
	
	$('#highchartsFrame').highcharts({ 
		chart: { 
			type: 'spline' 
		}, 
		title: { 
			text: '<span style="color:#0088cc">{{ customer.name }}</span>的理财曲线' 
		}, 
		subtitle: { 
			text: '来源: 万邦家族财富' 
		}, 

		xAxis: { 
			type: 'datetime',  
				labels: {  
				step: 4,   
				formatter: function () {  
				return Highcharts.dateFormat('%Y年%m月', this.value);  
				}  
				} 
		}, 
		yAxis: { 
			title: { 
				text: '金额（人民币：元）' 
			},
			labels: {
				formatter: function() {
					return this.value / 10000 +'万';
				}
			},
			min: 0
		}, 
		tooltip: { 
			formatter: function() { 
				return '<b>'+ Highcharts.dateFormat('%Y年%m月%d日 ', this.x) +'</b><br>'+ this.series.name +': '+ this.y +' 元'; 
			}
		},
		series: [{ 
			name: '理财曲线', 
			data: [
			{% for debts in page.items %}
				[Date.UTC(<?php echo date("Y",$debts->pay_time);?>, <?php echo date("m",$debts->pay_time)-1;?>, <?php echo date("d",$debts->pay_time);?>), {{ debts.total }} ], 
			{% endfor %}
			] 
		}] 
	}); 
})
</script>
	<div id="highchartsFrame" style="height:300px;width:100%;"></div>	
	<hr />	
	<div style="text-align:left;">
		<ul class="pager">
			<li class="previous pull-left">
				<h4>债权记录：</h4>
			</li>	
		</ul>
		
		{% for debts in page.items %}
		{% if loop.first %}
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>出借编号</th>
					<th>初始出借金额</th>
					<th>资金出借及回收方式</th>
					<th>初始出借日期</th>
					<th>到期日期</th>
					<th>账户管理费</th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;"><a href="/personal/detail/{{ debts.id }}">{{ debts.number }}</a></td>
					<td style="vertical-align:middle;">{{ debts.total }}</td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;"><?php echo date("Y年m月d日",$debts->invest_time);?></td>
					<td style="vertical-align:middle;">
					<?php 
						if($debts->type == '单季赢'){
							echo date("Y年m月d日",strtotime("+1 Months -1 days",$debts->invest_time));
						}elseif($debts->type == '双季赢'){
							echo date("Y年m月d日",strtotime("+2 Months -1 days",$debts->invest_time));
						}elseif($debts->type == '一年赢'){
							echo date("Y年m月d日",strtotime("+1 Years -1 days",$debts->invest_time));
						}elseif($debts->type == '一年宝'){
							echo date("Y年m月d日",strtotime("+1 Years -1 days",$debts->invest_time));
						}elseif($debts->type == '年年赢'){
							echo date("Y年m月d日",strtotime("+2 Years -1 days",$debts->invest_time));
						}else{
							echo "理财类型不明，无法计算时间";
						}
					?>
					</td>
					<td style="vertical-align:middle;">{{ debts.cost }}</td>
				</tr>
			</tbody>
		{% if loop.last %}
			<tbody>
				<tr>
					<td colspan="9" align="right">
						<div class="btn-group">
							{{ link_to("personal/index/" ~ customer.id, '<i class="icon-fast-backward"></i> 首页', "class": "btn") }}
							{{ link_to("personal/index/" ~ customer.id ~"?page=" ~ page.before, '<i class="icon-step-backward"></i> 上一页', "class": "btn ") }}
							{{ link_to("personal/index/" ~ customer.id ~"?page=" ~ page.next, '<i class="icon-step-forward"></i> 下一页', "class": "btn") }}
							{{ link_to("personal/index/" ~ customer.id ~"?page=" ~ page.last, '<i class="icon-fast-forward"></i> 尾页', "class": "btn") }}
							<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
						</div>
					</td>
				</tr>
			<tbody>
		</table>
		{% endif %}
		{% else %}
			没有债权信息
		{% endfor %}
		
	</div>
</div> -->
<style>
.clear{
	clear:both;
}
.gold{
	color:#d6a77a;
}
.grey{
	color:#707070;
}
.menu_frame{
	width:150px;
	border:0px solid #000;
	margin-right:50px;
	font-family:'微软雅黑';
}
.content_frame{
	width:950px;
	border:1px solid #d6a77a;
	height:600px;
	font-family:'微软雅黑';
}
.menu_list{
	list-style-type:none;
	margin:0px 0px 50px 0px;
	padding:0px;
	border-collapse: separate;
}
.menu_list>li:nth-of-type(1){
	width:148px;
	color:#d6a77a;
	height:47px;
	line-height:47px;
	font-size:20px;
	border:1px solid #d6a77a;
	border-bottom:0px solid #d6a77a;
}
.menu_list>li:nth-of-type(2){
	margin-bottom:10px;
}
.menu_list img{
	border:1px solid #d6a77a;
}
.info_list{
	list-style-type:none;
	margin:0;
	padding:0;
	position
}
.info_frame{
	position:relative;
	top:80px;
	left:80px;
}
.info_list>li{
	height:80px;
}
.info_list>li>div:nth-of-type(1){
	width:150px;
	height:30px;
	line-height:30px;
	border:1px solid #d6a77a;
	color:#d6a77a;
	margin-right:20px;
}
.info_list>li>div:nth-of-type(2){
	width:350px;
	height:30px;
	line-height:30px;
	text-align:left;
	color:#999;
	margin-right:20px;
}
.info_list>li>.button{
	width:80px;
	height:30px;
	line-height:30px;
	text-align:center;
	border-radius:5px;
	color:#fff;
	background:#d6a77a;
	cursor:pointer;
}
</style>
<script>
$(function(){
	$(".menu_list").find("img").not(".active").hover(function(){
		$(this).attr("src",$(this).attr("img2"));
	},function(){
		$(this).attr("src",$(this).attr("img1"));
	})
})
</script>
<div class="center scaffold">
	<div class="pull-left menu_frame">	
		<ul class="menu_list">
			<li>我的信息</li>
			<li><a><img class="active" src="/img/personal/info_.png" width="148" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的账户</li>
			<li><a href="#"><img src="/img/personal/account.png" width="148" img1="/img/personal/account.png" img2="/img/personal/account_.png" /></a></li>
			<li><a href="#"><img src="/img/personal/money.png" width="148" img1="/img/personal/money.png" img2="/img/personal/money_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的投资</li>
			<li><a href="/personal/highchart"><img src="/img/personal/highchart.png" width="148" img1="/img/personal/highchart.png" img2="/img/personal/highchart_.png" /></a></li>
			<li><a href="/personal/loan"><img src="/img/personal/log.png" width="148" img1="/img/personal/log.png" img2="/img/personal/log_.png" /></a></li>
		</ul>
	</div>
	<div class="pull-left content_frame">
		<div class="info_frame">	
			<ul class="info_list">
				<li>
					<div class="pull-left">姓名</div>
					<div class="pull-left">{{ customer.name }}</div>
					<div class="clear"></div>
				</li>
				<li>
					<div class="pull-left">身份证号码</div>
					<div class="pull-left"><?php echo substr($customer->number,0,5)?>********<?php echo substr($customer->number,14,4)?></div>	
					<div class="clear"></div>
				</li>
				<li>
					<div class="pull-left">手机号码</div>
					<div class="pull-left">{{ customer.cellphone }}</div>		
					<div class="pull-left button">修 改</div>
					<div class="clear"></div>
				</li>
				<li>
					<div class="pull-left">邮箱</div>
					<div class="pull-left">{{ customer.email }}</div>		
					<div class="pull-left button">修 改</div>
					<div class="clear"></div>
				</li>
				<li>
					<div class="pull-left">邮寄地址</div>
					<div class="pull-left">{{ customer.address }}</div>		
					<div class="pull-left button">修 改</div>
					<div class="clear"></div>
				</li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
