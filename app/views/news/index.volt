	<section class=" conterbox clearfix fr mt18 article">
          <article>
      	<header>
        	<h1>{{ detail.title }}</h1>
            <p>更新时间：[{{ date('Y-m-d',detail.inputtime) }}]    作者：  {{ detail.username }}</p>
        </header>
        <p style="text-align: justify;">
<script>
$(function(){
	$(".article").find("img").parent().css("text-align","center");
	$(".article").find("img").parent().css("margin-left","0");
})
</script>		
<style>
.description{
	border-radius:5px;
	text-indent:25px;
	text-align:left;
	font-size:16px;
	line-height:25px;
	font-weight:bold;
	background:#eee;
	border:2px solid #aaa;
	padding:20px 15px;
	margin-bottom:20px;
}
p{
	font-size:14px;
}
b{
	font-weight:bold;
}
h1{
	font-weight:bold;
}
</style>		
			<div class="description"><?php if(mb_strlen($detail->description,'utf-8')  > 38){ echo mb_substr($detail->description,0,37,'utf-8')."..."; }else{ echo $detail->description;  }?></div>
			{{ detail.content }}
		</p>
      </article>
     </section>