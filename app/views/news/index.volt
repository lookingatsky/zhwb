	<section class=" conterbox clearfix fr mt18 article">
          <article>
      	<header>
        	<h1>{{ detail.title }}</h1>
            <p>更新时间：[{{ date('Y-m-d',detail.inputtime) }}]    作者：  {{ detail.username }}</p>
        </header>
        <p style="text-align: justify;">
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
</style>		
			<div class="description">{{ detail.description }}</div>
			{{ detail.content }}
		</p>
      </article>
     </section>