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
.table{
	border:1px solid #d6a77a;
}
.table th{
	border:1px solid #d6a77a;
	border-width:0px 0px 1px 1px;
}
.table td{
	border:1px solid #d6a77a;
	border-width:0px 0px 1px 1px;
}
.btn-group a{
	background:#d6a77a;
	margin-right:5px;
	color:#fff;
	width:70px;
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
			<li><a href="/personal/index"><img src="/img/personal/info.png" width="148" img1="/img/personal/info.png" img2="/img/personal/info_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的账户</li>
			<li><a href="#"><img src="/img/personal/account.png" width="148" img1="/img/personal/account.png" img2="/img/personal/account_.png" /></a></li>
			<li><a href="#"><img src="/img/personal/money.png" width="148" img1="/img/personal/money.png" img2="/img/personal/money_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的投资</li>
			<li><a href="/personal/highchart"><img src="/img/personal/highchart.png" width="148" img1="/img/personal/highchart.png" img2="/img/personal/highchart_.png" /></a></li>
			<li><a><img class="active" src="/img/personal/log_.png" width="148" img1="/img/personal/log.png" img2="/img/personal/log_.png" /></a></li>
		</ul>
	</div>
	<div class="pull-left content_frame">
		<div class="info_frame">	
			<div style="text-align:left;">
				<ul class="pager">
					<li class="previous pull-left">
						<h4>债权记录</h4>
					</li>	
				</ul>
				{% for debts in page.items %}
				{% if loop.first %}
				<table class="table table-bordered table-striped pull-left" align="center" bgcolor="#d6a77a" style="width:85%;max-width:85%;">
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
									{{ link_to("personal/loan/" ~ customer.id, ' 首 页', "class": "btn") }}
									{{ link_to("personal/loan/" ~ customer.id ~"?page=" ~ page.before, ' 上一页', "class": "btn ") }}
									{{ link_to("personal/loan/" ~ customer.id ~"?page=" ~ page.next, ' 下一页', "class": "btn") }}
									{{ link_to("personal/loan/" ~ customer.id ~"?page=" ~ page.last, ' 尾 页', "class": "btn") }}
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
	</div>
	<div class="clear"></div>
</div>