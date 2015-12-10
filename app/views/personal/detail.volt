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
h3{
	font-family:"宋体";
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
	min-height:1000px;
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
	top:40px;
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
.previous:nth-of-type(1){
	width:475px;
	border:0px solid #000;
	margin-right:30px;
}
.previous:nth-of-type(2){
	width:295px;
	border:0px solid #000;
}
.previous:nth-of-type(1) .title{
	width:150px;
	text-align:right;
	margin-right:10px;
}
.previous:nth-of-type(1) .content{
	width:300px;
}
.previous:nth-of-type(2) .title{
	width:100px;
	text-align:right;
	margin-right:10px;
}
.previous:nth-of-type(2) .content{
	width:170px;
}
.backforward{
	position:relative;
	left:280px;
}
.backforward .btn{
	background:#d6a77a;
	color:#fff;
	border-radius:5px;
	width:70px;
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
</style>
<script>
$(function(){
	$(".menu_list").find("img").not(".active").hover(function(){
		$(this).attr("src",$(this).attr("img2"));
	},function(){
		$(this).attr("src",$(this).attr("img1"));
	})
	
	$(".button").click(function(){
		$("."+$(this).attr("childclass")).toggle();
	})
})
</script>
<div class="center scaffold">
	<div class="pull-left menu_frame">
		<ul class="menu_list">
			<li>我的信息</li>
			<li><a><img src="/img/personal/info.png" width="148" img1="/img/personal/info.png" img2="/img/personal/info_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的账户</li>
			<li><a href="#"><img src="/img/personal/account.png" width="148" img1="/img/personal/account.png" img2="/img/personal/account_.png" /></a></li>
			<li><a href="#"><img src="/img/personal/money.png" width="148" img1="/img/personal/money.png" img2="/img/personal/money_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的投资</li>
			<li><a href="/personal/highchart"><img src="/img/personal/highchart.png" width="148" img1="/img/personal/highchart.png" img2="/img/personal/highchart_.png" /></a></li>
			<li><a><img  class="active" src="/img/personal/log_.png" width="148" img1="/img/personal/log.png" img2="/img/personal/log_.png" /></a></li>
		</ul>
	</div>
	
	<div class="pull-left content_frame">
		<div class="info_frame">	
			<ul class="pager">
				<li class="backforward">
					{{ link_to("personal/loan/", '返 回', "class": "btn") }}
				</li>
			</ul>
			<div class="clear"></div>	
		
			<ul class="pager">
				<h3 style="text-align:left;margin-bottom:20px;">债权基本信息</h3>
				<li class="previous pull-left" style="text-align:left;">
					<div class="clearfix" style="float:left;">
						<label>
							<span class="title"><b>入账方式：</b></span> 
							<span class="content">{{ debts.pay_method }}</span>
						</label>
						{% if debts.if_received is defined %}
						<label><span class="title"><b>是否接收债权文件：</b></span> <span class="content">{{ debts.if_received }}</span></label>
						{% endif %}
						<label><span class="title"><b>接收债权文件地址：</b></span> <span class="content">{{ debts.r_address }}</span></label>
						<label><span class="title"><b>邮 编：</b></span> <span class="content">{{ debts.r_num }}</span></label>
						{% if debts.mail_time is defined %}
						<label><span class="title"><b>邮寄日期：</b></span> <span class="content">{{ debts.mail_time }}</span></label>
						{% endif %}
						{% if debts.mail_num is defined %}
						<label><span class="title"><b>快递单号：</b></span> <span class="content">{{ debts.mail_num }}</span></label>
						{% endif %}
					
					</div>
				</li>
				<li class="previous pull-left">
					<div class="clearfix" style="float:left;">
						<label><span class="title"><b>出借编号：</b></span> <span class="content">{{ debts.number }}</span></label>
						<label><span class="title"><b>合同编号：</b></span> <span class="content">{{ debts.contract_num }}</span></label>
						<label><span class="title"><b>出借日期：</b></span> <span class="content"><?php echo date("Y年m月d日",$debts->invest_time);?></span></label>
						<label><span class="title"><b>产品名称：</b></span> <span class="content">{{ debts.type }}</span></label>
						<label><span class="title"><b>出借金额：</b></span> <span class="content">{{ debts.total }}</span></label>
						<label><span class="title"><b>到期日期：</b></span> <span class="content"><?php echo date("Y年m月d日",$debts->invest_time);?></span></label>
						{% if debts.if_invest is defined %}
						<label><span class="title"><b>续投：</b></span> <span class="content">{{ debts.if_invest }}</span></label>
						{% endif %}
						<label><span class="title"><b>账单日：</b></span> <span class="content">每月{{ debts.return_day }}号</span></label>					
					</div>
				</li>
				<div class="clear"></div>
			</ul>		

 			<div style="text-align:left;margin-bottom:50px;">
			<h3 style="text-align:left;margin-bottom:20px;">债权文件列表</h3>
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

			<div class="clear"></div>
			
			<div style="text-align:left;">
			<h3 style="text-align:left;margin-bottom:20px;">借款人列表</h3>
				<div>
					<table class="table table-bordered table-striped pull-left" align="center" style="width:85%;max-width:85%;">
						<thead>
							<tr>
								<th width="30">序号</th>
								<th width="100">借款编号</th>
								<th width="70">借款人</th>
								<th>初始借款金额</th>
								<th>本次转让债权价值</th>
								<th>借款用途</th>
								<th>到期还款日</th>
								<th>剩余还款月数</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody>
							{% for index,detail in match %}
							<tr class="button" childclass="show{{ index }}" style="cursor:pointer;">
								<td>{{ index+1 }}</td>
								<td><!-- <a target="_blank" href="/personal/loan/{{ detail.loan.id }}"> -->{{ detail.loan_number }}<!-- </a> --></td>
								<td>{{ detail.loan.borrower.name }}</td>
								<td>{{ detail.loan.allowed_money }}</td>
								<td>{{ detail.debt_borrow }}</td>
								<td>{{ detail.loan.purpose }}</td>
								<td>{{ detail.endtime }}</td>
								<td><?php 
									if(strtotime($detail->endtime) > time()){
										echo date("m",strtotime($detail->endtime))-date("m",time());
									}else{
										echo 0;
									}?>
								</td>
								<td>{{ detail.status }}</td>
							</tr>
							<tr class="show{{ index }}" style="display:none;">
								<td colspan="9" height="100" style="margin:0;padding:0px;">
									<div style="background:#d6a77a;color:#fff;width:100%;height:100%;">
										
									</div>
								</td>
							</tr>
							{% endfor %}
						</tbody>	
					</table>
				</div>
				<div class="clear"></div>
			</div>	
			
		</div>
	</div>
	<div class="clear"></div>
</div>