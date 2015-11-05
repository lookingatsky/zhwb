
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("personal/index/", "&larr; 返回") }}
    </li>	
</ul>
<style>
label{
	text-align:left;
}	
label font{
	height:30px;
	width:150px;
}
.fileList{
	list-style-type:none;
}
.fileList li{
	text-align:center;
	float:left;
	margin-right:50px;
	width:100px;
}
.clear{
	clear:both;
}
.content{
	width:400px;
	line-height:25px;
}
.title{
	line-height:25px;
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
    <h3>债权基本信息</h3>
	<hr />
	<ul class="pager">
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>入账方式：</b></div> <div class="content pull-left">{{ debts.pay_method }}</div><div class="clear"></div></label>
				{% if debts.if_received is defined %}
				<label><div class="title pull-left"><b>是否接收债权文件：</b></div> <div class="content pull-left">{{ debts.if_received }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>接收债权文件地址：</b></div> <div class="content pull-left">{{ debts.r_address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮 编：</b></div> <div class="content pull-left">{{ debts.r_num }}</div><div class="clear"></div></label>
				{% if debts.mail_time is defined %}
				<label><div class="title pull-left"><b>邮寄日期：</b></div> <div class="content pull-left">{{ debts.mail_time }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.mail_num is defined %}
				<label><div class="title pull-left"><b>快递单号：</b></div> <div class="content pull-left">{{ debts.mail_num }}</div><div class="clear"></div></label>
				{% endif %}
			
			</div>
		</li>
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>出借编号：</b></div> <div class="content pull-left">{{ debts.number }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>合同编号：</b></div> <div class="content pull-left">{{ debts.contract_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->invest_time);?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>产品名称：</b></div> <div class="content pull-left">{{ debts.type }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借金额：</b></div> <div class="content pull-left">{{ debts.total }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>到期日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->invest_time);?></div><div class="clear"></div></label>
				{% if debts.if_invest is defined %}
				<label><div class="title pull-left"><b>续投：</b></div> <div class="content pull-left">{{ debts.if_invest }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>账单日：</b></div> <div class="content pull-left">每月{{ debts.return_day }}号</div><div class="clear"></div></label>					
			</div>
		</li>	
	</ul>		

	
	<hr />
	<h3>债权文件列表</h3>
	<hr />	
	<div style="text-align:left;">	
		<ul class="fileList">
		{% for detail in debt %}
			{% if detail.type == 'txt'%}
				<li>
					<a target="_blank" href="{{ website }}{{detail.src}}"><img src="/img/icon/file/txt.png" width="100"/></a><br />
					<a target="_blank" href="{{ website }}{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'xlsx' or detail.type == 'xls' %}
				<li>
					<a target="_blank" href="{{ website }}{{detail.src}}"><img src="/img/icon/file/excel.png" width="100"/></a><br />
					<a target="_blank" href="{{ website }}{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'pdf' %}	
				<li>
					<a target="_blank" href="{{ website }}{{detail.src}}"><img src="/img/icon/file/pdf.png" width="100"/></a><br />
					<a target="_blank" href="{{ website }}{{detail.src}}">{{ detail.title }}</a>
				</li>	
			{% elseif detail.type == 'doc' or detail.type == 'docx' %}	
				<li>
					<a target="_blank" href="{{ website }}{{detail.src}}"><img src="/img/icon/file/word.png" width="100"/></a><br />
					<a target="_blank" href="{{ website }}{{detail.src}}">{{ detail.title }}</a>
				</li>				
			{% endif %}
		{% endfor %}
		</ul>
		<div class="clear"></div>
	</div>
	<hr />	
	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>文件标题</th>
				</tr>
			</thead>
			<tbody>
				{% for index,detail in debt %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a target="_blank" href="{{ website }}{{detail.src}}">{{ detail.title }}</a></td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
	<hr />	
{{ javascript_include('js/highcharts.js') }}
{{ javascript_include('js/exporting.js') }}	
{{ javascript_include('js/highcharts-3d.js') }}	
<script>
$(function () {
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
    
  $('#p_container').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: '借款详情表'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '借款金额分配',
            data: [
			{% for index,detail in match %}
				[
					'{{ detail.loan.borrower.name }}',   
					{{ detail.debt_borrow }},
				],
			{% endfor %}
            ]
        }]
    });	
})	
</script>
	<h3>借款人列表</h3>
	<hr />
	<div style="text-align:left;">
		<div class="pull-left" style="width:60%;">
			<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
				<thead>
					<tr>
						<th>序号</th>
						<th>借款编号</th>
						<th>借款人</th>
						<th>初始借款金额</th>
						<th>本次转让债权价值</th>
						<th>借款用途</th>
						<th>到期还款日</th>
						<th>剩余还款月数</th>
						<th>目前状态</th>
					</tr>
				</thead>
				<tbody>
					{% for index,detail in match %}
					<tr>
						<td>{{ index+1 }}</td>
						<td><a target="_blank" href="/personal/loan/{{ detail.loan.id }}">{{ detail.loan_number }}</a></td>
						<td>{{ detail.loan.borrower.name }}</td>
						<td>{{ detail.loan.allowed_money }}</td>
						<td>{{ detail.debt_borrow }}</td>
						<td>{{ detail.loan.purpose }}</td>
						<td></td>
						<td></td>
						<td>{{ detail.status }}</td>
					</tr>
					{% endfor %}
				</tbody>	
			</table>
		</div>
		<div id="p_container" class="pull-left" style="width:40%;height:300px"></div>
		<div style="clear:both;"></div>	
	</div>		
</div>

