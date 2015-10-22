

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
		<label><b>现居地：</b> {{ customer.address }}</label>
		<label><b>户籍地址：</b> {{ customer.registered }}</label>
	</div>
	<div style="clear:both;"></div>			
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
					<th>资金出借及回收方式</th>
					<th>初始出借日期</th>
					<th>初始出借金额</th>
					<th>账户管理费</th>
					<th>债权受让人（新债权人）</th>
					<th>身份证（护照）号码</th>
				</tr>
			</thead>
		{% endif %}
			<tbody>
				<tr>
					<td style="vertical-align:middle;"><a href="/personal/detail/{{ debts.id }}">{{ debts.number }}</a></td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;">{{ debts.time }}</td>
					<td style="vertical-align:middle;">{{ debts.total }}</td>
					<td style="vertical-align:middle;">{{ debts.cost }}</td>
					<td style="vertical-align:middle;">{{ debts.customer.name }}</td>	
					<td style="vertical-align:middle;"><?php echo substr($debts->customer->number,0,5)?>********<?php echo substr($debts->customer->number,14,4)?></td>	
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

