
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
	height:500px;
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
.info_list>li>.submit{
	width:80px;
	height:30px;
	line-height:30px;
	text-align:center;
	border-radius:5px;
	color:#fff;
	background:#d6a77a;
	cursor:pointer;
	display:none;
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
			<li><a href="/personal/index"><img src="/img/personal/info.png" img1="/img/personal/info.png" img2="/img/personal/info_.png"  width="148" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的账户</li>
			<li><a href="/personal/infos"><img src="/img/personal/account.png" width="148" img1="/img/personal/account.png" img2="/img/personal/account_.png" /></a></li>
			<li><a><img class="active" src="/img/personal/money_.png" width="148" img1="/img/personal/money.png" img2="/img/personal/money_.png" /></a></li>
		</ul>
		<ul class="menu_list">
			<li>我的投资</li>
			<li><a href="/personal/highchart"><img src="/img/personal/highchart.png" width="148" img1="/img/personal/highchart.png" img2="/img/personal/highchart_.png" /></a></li>
			<li><a href="/personal/loan"><img src="/img/personal/log.png" width="148" img1="/img/personal/log.png" img2="/img/personal/log_.png" /></a></li>
		</ul>
	</div>
<style>
.inputFrame{
	display:none;
}
.inputFrame input{
	border:none;
	width:350px;
	height:30px;
	line-height:30px;
	text-align:left;
	color:#999;
	margin-right:10px;	
}
</style>	
	<div class="pull-left content_frame">
		<img src="/../img/jianzhan.png" />	
	</div>
	<div class="clear"></div>
</div>
