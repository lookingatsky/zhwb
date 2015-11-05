

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
				text: '投资金额（人民币：元）' 
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
					<td style="vertical-align:middle;"><?php echo date("Y年m月d日",$debts->assign_time);?></td>
					<td style="vertical-align:middle;"><?php echo date("Y年m月d日",$debts->assign_time);?></td>
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
</div>

