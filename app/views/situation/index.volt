<script type="text/javascript">
 	function changeType(type){
 		$("#newsType").val(type);
 	}
	
 </script>
 <form action="/situation/index" method="post" id="pageForm">
     	<input name="dynamicPageBegin" id="dynamicPagebegin" type="hidden">
     	<input name="mediaPageBegin" id="mediaPagebegin" type="hidden">
     	<input name="schdPageBegin" id="schdPagebegin" type="hidden">
     	<input name="type" value="{{type}}" id="newsType" type="hidden">
     </form>
<section class="conterbox clearfix">
    <div class="page_baner mt25"><img src="/../../img/index/hy_dtbaner.jpg" alt="关于我们"></div>
    <div class="dtlistbox mt25">
    	<ul class="dt_title  {% if type == 'X_WXX' %}index_tab001{% endif %} {% if type == 'X_MTBD' %}index_tab002{% endif %} {% if type == 'H_SCHD' %}index_tab003{% endif %}   clearfix">
            <li class="hy_info_tab wxtitle" onclick="javascript:changeType('X_WXX')">公司新闻</li>
            <li class="medio_tab" onclick="javascript:changeType('X_MTBD')">行业新闻</li>
            <li class="schd_tab" onclick="javascript:changeType('H_SCHD')">市场活动</li>
        </ul>
        <section class="tabbox">
        <div class="dtinfo_list clearfix mt20 hide" {% if type == 'X_WXX' %}style="display:block;"{% endif %}>	
			<?php foreach ($page1->items  as $key=>$new) { ?>
        	<dl {% if key%2 !=0 %}style="margin-left: 15px;"{% endif %} class="clearfix">
            	<dt>
					<a href="/news/index/{{ new.id }}" target="_blank"><?php if(mb_strlen($new->title,'utf-8')  > 28){ echo mb_substr($new->title,0,28,'utf-8')."..."; }else{ echo $new->title;  }?></a>
            	</dt>
                <dd>
					<a href="/news/index/{{ new.id }}" target="_blank">
						<img src="{{ new.thumb }}">
					</a>
				</dd>
                <dd class="info_text">
                	<p>
						<?php if(mb_strlen($new->description,'utf-8')  > 60){ echo mb_substr($new->description,0,60,'utf-8')."..."; }else{ echo $new->description;  }?>
					</p>
                    <p class="mt5 clearfix">
						<span class="fl w92">[{{ date("Y-m-d",new.inputtime) }}]</span>
						<a href="/news/index/{{ new.id }}" target="_blank" class="icon_align fr">
							查看详情
							<i class="web_skin more_icon"></i>
						</a>
					</p>
                </dd>
            </dl>
            <?php }?>       
            <span class="blank1"></span>
       			<p class="page_number"><a href='javascript:hygotopage("","dynamicPagebegin",1,6,{{ page1.total_pages }})'>首页</a>|
				<a href='javascript:hygotopage("","dynamicPagebegin",{{ page1.before }},6,{{ page1.total_pages }})'>上一页</a>|
				<a href='javascript:hygotopage("","dynamicPagebegin",{{ page1.next }},6,{{ page1.total_pages }})'>下一页</a>|
				<a href='javascript:hygotopage("","dynamicPagebegin",{{ page1.last }},6,{{ page1.total_pages }})'>尾页</a>
				<span>第&nbsp;&nbsp;{{ page1.current }}&nbsp;/&nbsp;{{ page1.total_pages }}&nbsp;&nbsp;页</span>
				<span>转到第<input name="topagedynamicPagebegin" id="topagedynamicPagebegin" type="text">页</span>
				<a class="jump_btn web_skin" href='javascript:hygotopage("","dynamicPagebegin",$("#topagedynamicPagebegin").val(),6,{{ page1.total_pages }})'>跳转</a>
			</p>
        </div>
		
        <div class="video_box mt10 hide" {% if type == 'X_MTBD' %}222 style="display:block;"{% endif %}>
        	<ul>
				<?php foreach ($page2->items as $key=>$new) { ?>
            	<li class="clearfix">
                	<h3 class="fl video_title"><a href="/news/index/{{ new.id }}" target="_blank">{{ key+1 }}. {{ new.title }}</a></h3>
                    <h5 class="fr title_date">{{ date("Y-m-d",new.inputtime) }}</h5>
                </li>
				<?php }	?>              
            </ul>
            <p class="page_number">
				<a href='javascript:hygotopage("","mediaPagebegin",1,10,{{ page2.total_pages }})'>首页</a>|
				<a href='javascript:hygotopage("","mediaPagebegin",{{ page2.before }},10,{{ page2.total_pages }})'>上一页</a>|
				<a href='javascript:hygotopage("","mediaPagebegin",{{ page2.next }},10,{{ page2.total_pages }})'>下一页</a>|
				<a href='javascript:hygotopage("","mediaPagebegin",{{ page2.last }},10,{{ page2.total_pages }})'>尾页</a>
				<span>第&nbsp;&nbsp;{{ page2.current }}&nbsp;/&nbsp;{{ page2.total_pages }}&nbsp;&nbsp;页</span>
				<span>转到第<input name="topagemediaPagebegin" id="topagemediaPagebegin" type="text">页</span>
				<a class="jump_btn web_skin" href='javascript:hygotopage("","mediaPagebegin",$("#topagemediaPagebegin").val(),10,{{ page2.total_pages }})'>跳转</a>
			</p>
        </div>
		
        <div class="active_box mt10 hide" {% if type == 'H_SCHD' %}333 style="display:block;"{% endif %}>
        	<ul>
				<?php foreach ($page->items as $new) { ?>
            	<li class="clearfix">
                	<div class="fl schd_infobox">
                    	<h2><a href="/news/index/{{ new.id }}" target="_blank">{{ new.title }}</a></h2>
                        <p>
							{{ new.description }}
						</p>
                    </div>
                    <div class="fr schd_imgbox">
                       <div class="clearfix">
                        <h3 class="fl xq_btnbox">
                    	<a href="/news/index/{{ new.id }}" target="_blank">查看详情<i class="more_icon web_skin"></i></a><br>
                        <span>[{{ date("Y-m-d",new.inputtime) }}]</span>
                        </h3>
                        <a href="/news/index/{{ new.id }}" class="fl picbox" target="_blank"><img src="{{ new.thumb }}" style="width:155px;height:88px"></a>
                        </div>
                    </div>
                </li>
                <?php }?>             
            </ul>
            <p class="page_number">
				<a href='javascript:hygotopage("","schdPagebegin",1,4,{{ page.total_pages }})'>首页</a>|
				<a href='javascript:hygotopage("","schdPagebegin",{{ page.before }},4,{{ page.total_pages }})'>上一页</a>|
				<a href='javascript:hygotopage("","schdPagebegin",{{ page.next }},4,{{ page.total_pages }})'>下一页</a>|
				<a href='javascript:hygotopage("","schdPagebegin",{{ page.last }},4,{{ page.total_pages }})'>尾页</a>
				<span>第&nbsp;&nbsp;{{ page.current }}&nbsp;/&nbsp;{{ page.total_pages }}&nbsp;&nbsp;页</span>
				<span>转到第<input name="topageschdPagebegin" id="topageschdPagebegin" type="text">页</span>
				<a class="jump_btn web_skin" href='javascript:hygotopage("","schdPagebegin",$("#topageschdPagebegin").val(),4,{{ page.total_pages }})'>跳转</a>
			</p>
            <!-- 
             <p class="page_number"><a href="javascript:void(0)">首页</a>|<a href="javascript:void(0)">上一页</a>|<a href="javascript:void(0)">下一页</a>|<a href="javascript:void(0)">尾页</a><span>第&nbsp;&nbsp;1&nbsp;/&nbsp;30&nbsp;&nbsp;页</span><span>转到第<input type="text" value="">页</span><a class="jump_btn web_skin" href="javascript:void(0)">跳转</a></p>
              -->
        </div>
        </section>
    </div>
 </section>
