
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

	<div style="text-align:left;">
		<table class="table table-bordered table-striped" align="center" style="width:100%;max-width:100%;">
			<thead>
				<tr>
					<th>出借编号</th>
					<th>资金出借及回收方式</th>
					<th>初始出借日期</th>
					<th>初始出借金额</th>
					<!-- <th>下一个报告日</th> -->
					<th>账户管理费</th>
					<th>债权受让人（新债权人）</th>
					<th>身份证（护照）号码</th>
					<!-- <th>预计下一个报告日您的收益总额</th> -->
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="vertical-align:middle;">{{ debts.number }}</td>
					<td style="vertical-align:middle;">{{ debts.type }}</td>
					<td style="vertical-align:middle;">{{ debts.time }}</td>
					<td style="vertical-align:middle;">{{ debts.total }}</td>
					<!-- <td style="vertical-align:middle;"></td> -->
					<td style="vertical-align:middle;">{{ debts.cost }}</td>
					<td style="vertical-align:middle;">{{ debts.customer.name }}</td>	
					<td style="vertical-align:middle;">{{ debts.customer.number }}</td>	
					<!-- <td style="vertical-align:middle;"></td> -->
				</tr>
			</tbody>
		</table>
	</div>
	<hr />
	<h3>债权文件列表</h3>
	<hr />	
	<div style="text-align:left;">	
		<ul class="fileList">
		{% for detail in debt %}
			{% if detail.type == 'txt'%}
				<li>
					<a href="http://test2.com{{detail.src}}"><img src="/img/icon/file/txt.png" width="100"/></a><br />
					<a href="http://test2.com{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'xlsx' or detail.type == 'xls' %}
				<li>
					<a href="http://test2.com{{detail.src}}"><img src="/img/icon/file/excel.png" width="100"/></a><br />
					<a href="http://test2.com{{detail.src}}">{{ detail.title }}</a>
				</li>
			{% elseif detail.type == 'pdf' %}	
				<li>
					<a href="http://test2.com{{detail.src}}"><img src="/img/icon/file/pdf.png" width="100"/></a><br />
					<a href="http://test2.com{{detail.src}}">{{ detail.title }}</a>
				</li>	
			{% elseif detail.type == 'doc' or detail.type == 'docx' %}	
				<li>
					<a href="http://test2.com{{detail.src}}"><img src="/img/icon/file/word.png" width="100"/></a><br />
					<a href="http://test2.com{{detail.src}}">{{ detail.title }}</a>
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
					<td><a href="http://test2.com{{detail.src}}">{{ detail.title }}</a></td>
				</tr>
				{% endfor %}
			</tbody>	
		</table>
	</div>
</div>

