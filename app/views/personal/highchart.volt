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
#highchartsFrame{
	font-family:"微软雅黑";
}
</style>
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
			type: 'spline',
			borderWidth:1,
			borderColor:'#d6a77a',
		}, 
		title: { 
			text: '<span style="color:#ff0000">{{ customer.name }}</span>的理财曲线' 
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
			],
			color:'#ff0000',
		}] 
	}); 
})
</script>
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
			<li><a href="/personal/index"><img src="/img/personal/info.png" width="148"  img1="/img/personal/info.png" img2="/img/personal/info_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的账户</li>
			<li><a href="/personal/infos"><img src="/img/personal/account.png" width="148" img1="/img/personal/account.png" img2="/img/personal/account_.png" /></a></li>
			<li><a href="/personal/money"><img src="/img/personal/money.png" width="148" img1="/img/personal/money.png" img2="/img/personal/money_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的投资</li>
			<li><a><img class="active" src="/img/personal/highchart_.png" width="148" img1="/img/personal/highchart.png" img2="/img/personal/highchart_.png" /></a></li>
			<li><a href="/personal/loan"><img src="/img/personal/log.png" width="148" img1="/img/personal/log.png" img2="/img/personal/log_.png" /></a></li>
		</ul>
	</div>
	<div class="pull-left content_frame">
		<div class="info_frame">	
			<div id="highchartsFrame" style="height:300px;width:80%;"></div>	
		</div>
	</div>
	<div class="clear"></div>
</div>
