
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
				<label><div class="title pull-left"><b>是否接收债权文件：</b></div> <div class="content pull-left">{{ debts.if_received }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>接收债权文件地址：</b></div> <div class="content pull-left">{{ debts.r_address }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮 编：</b></div> <div class="content pull-left">{{ debts.r_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>邮寄方式：</b></div> <div class="content pull-left">{{ debts.mail_method }}</div><div class="clear"></div></label>
				{% if debts.mail_time is defined %}
				<label><div class="title pull-left"><b>邮寄日期：</b></div> <div class="content pull-left">{{ debts.mail_time }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.mail_num is defined %}
				<label><div class="title pull-left"><b>快递单号：</b></div> <div class="content pull-left">{{ debts.mail_num }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>申请门店：</b></div> <div class="content pull-left">{{ debts.apply_store }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>营业部：</b></div> <div class="content pull-left">{{ debts.department }}</div><div class="clear"></div></label>
				{% if debts.account_manager is defined %}
				<label><div class="title pull-left"><b>客户经理：</b></div> <div class="content pull-left">{{ debts.account_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.team_manager is defined %}
				<label><div class="title pull-left"><b>团队经理：</b></div> <div class="content pull-left">{{ debts.team_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.d_manager is defined %}
				<label><div class="title pull-left"><b>营业部经理：</b></div> <div class="content pull-left">{{ debts.d_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.d_assistant is defined %}
				<label><div class="title pull-left"><b>营业部副经理：</b></div> <div class="content pull-left">{{ debts.d_assistant }}</div><div class="clear"></div></label>
				{% endif %}
			
			</div>
		</li>
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>出借编号：</b></div> <div class="content pull-left">{{ debts.number }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>合同编号：</b></div> <div class="content pull-left">{{ debts.contract_num }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>签约日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->assign_time);?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>划扣日期：</b></div> <div class="content pull-left"><?php if($debts->pay_time == "续签"){ echo $debts->pay_time; }else{ echo date("Y年m月d日",$debts->pay_time); } ?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借日期：</b></div> <div class="content pull-left"><?php echo date("Y年m月d日",$debts->invest_time);?></div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>产品名称：</b></div> <div class="content pull-left">{{ debts.type }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>出借金额：</b></div> <div class="content pull-left">{{ debts.total }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>POS小条流水号：</b></div> <div class="content pull-left">{{ debts.pos_num }}</div><div class="clear"></div></label>
				{% if debts.if_match is defined %}
				<label><div class="title pull-left"><b>是否匹配：</b></div> <div class="content pull-left">{{ debts.if_match }}</div><div class="clear"></div></label>
				{% endif %}
				{% if debts.if_invest is defined %}
				<label><div class="title pull-left"><b>续投：</b></div> <div class="content pull-left">{{ debts.if_invest }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>反息日：</b></div> <div class="content pull-left">{{ debts.return_day }}天</div><div class="clear"></div></label>					
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
	
	<h3>借款人列表</h3>
	<hr />
	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>序号</th>
					<th>借款编号</th>
					<th>借款人</th>
					<th>出借编号</th>
					<th>出借金额</th>
					<th>此次分配金额</th>
					<th>剩余金额</th>
					<th>目前状态</th>
				</tr>
			</thead>
			<tbody>
				{% for index,detail in match %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a target="_blank" href="/personal/loan/{{ detail.loan.id }}">{{ detail.loan_number }}</a></td>
					<td>{{ detail.loan.borrower.name }}</td>
					<td>{{ detail.debt_number }}</td>
					<td>{{ detail.debt_money }}</td>
					<td>{{ detail.debt_borrow }}</td>
					<td>{{ detail.debt_last }}</td>
					<td>{{ detail.status }}</td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>		
</div>

