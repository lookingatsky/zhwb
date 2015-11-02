
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
.title{
	width:150px;
	text-align:right;
	margin-right:30px;
	line-height:25px;
}
.content{
	width:400px;
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
    <h3>借款基本信息</h3>
	<hr />
	
	<ul class="pager">
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>借款人姓名：</b></div> <div class="content pull-left">{{ loan.borrower.name }}</div><div class="clear"></div></label>
				{% if loan.borrower.source is defined %}
				<label><div class="title pull-left"><b>来源：</b></div> <div class="content pull-left">{{ loan.borrower.source }}</div><div class="clear"></div></label>
				{% endif %}
				<label><div class="title pull-left"><b>性 别：</b></div> <div class="content pull-left">{% if loan.borrower.sex == 1 %}男{% else %}女{% endif %}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>营业部：</b></div> <div class="content pull-left">{{ loan.department }}</div><div class="clear"></div></label>
				{% if loan.account_manager is defined %}
				<label><div class="title pull-left"><b>客户经理：</b></div> <div class="content pull-left">{{ loan.account_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.team_manager is defined %}
				<label><div class="title pull-left"><b>团队经理：</b></div> <div class="content pull-left">{{ loan.team_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.d_manager is defined %}
				<label><div class="title pull-left"><b>营业部经理：</b></div> <div class="content pull-left">{{ loan.d_manager }}</div><div class="clear"></div></label>
				{% endif %}
				{% if loan.d_assistant is defined %}
				<label><div class="title pull-left"><b>营业部副经理：</b></div> <div class="content pull-left">{{ loan.d_assistant }}</div><div class="clear"></div></label>
				{% endif %}
			</div>
		</li>
		<li class="previous pull-left">
			<div class="clearfix" style="float:left;">
				<label><div class="title pull-left"><b>合同编号：</b></div> <div class="content pull-left">{{ loan.number }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>产品类型：</b></div> <div class="content pull-left">{{ loan.type }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款期数：</b></div> <div class="content pull-left">{{ loan.cycle }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款用途：</b></div> <div class="content pull-left">{{ loan.purpose }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>签约日期：</b></div> <div class="content pull-left">{{ loan.assign_time }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>借款状态：</b></div> <div class="content pull-left">{{ loan.loan_status }}</div><div class="clear"></div></label>
				<label><div class="title pull-left"><b>终审日期：</b></div> <div class="content pull-left">{{ loan.verify_time }}</div><div class="clear"></div></label>
				{% if loan.remark is defined %}
				<label><div class="title pull-left"><b>备注：</b></div> <div class="content pull-left">{{ loan.remark }}</div><div class="clear"></div></label>
				{% endif %}
			</div>
		</li>	
	</ul>
	<hr />
	<h3>抵押物文件列表</h3>
	<hr />	
	<div style="text-align:left;">	
		<ul class="fileList">
		{% for detail in pawn %}
			{% if detail.type == 'txt'%}
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/txt.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'xlsx' or detail.type == 'xls' %}
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/excel.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'pdf' %}	
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/pdf.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
				</li>	
			{% elseif detail.type == 'doc' or detail.type == 'docx' %}	
				<li>
					<a href="{{detail.src}}"><img src="/img/icon/file/word.png" width="100"/></a><br />
					<a href="{{detail.src}}">{{ detail.title }}</a>
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
				{% for index,detail in pawn %}
				<tr>
					<td>{{ index+1 }}</td>
					<td><a href="{{detail.src}}">{{ detail.title }}</a></td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
</div>

