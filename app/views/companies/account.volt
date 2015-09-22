<?php use Phalcon\Tag as Tag ?>
<form method="post" action="{{ url("companies/accountsave") }}">

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("companies/search", "&larr; 返回") }}
    </li>
    <li class="pull-right">
         {{ link_to("companies/accountdelete/"~aid,"class":"btn btn-danger","删除帐号") }}
    </li>
</ul>

{{ content() }}

<div class="center scaffold">
	
	<?php echo Tag::hiddenField(array("id","type" => "number")) ?>
	
    <div class="clearfix">
        <label for="username">帐号</label>
        <?php echo Tag::textField(array("username", "size" => 10, "maxlength" => 10, "type" => "str")) ?>
    </div>

    <div class="clearfix">
        <label for="email">邮箱</label>
        <?php echo Tag::textField(array("email", "size" => 10, "maxlength" => 10, "type" => "str")) ?>
    </div>
	
    <div class="clearfix">
        <label for="name">使用者</label>
        <?php echo Tag::textField(array("name", "size" => 10, "maxlength" => 10, "type" => "str")) ?>
    </div>
	
	<div class="clearfix">
		<?php echo Tag::submitButton(array("保 存", "class" => "btn btn-primary")) ?>
	</div>
</div>
</form>
