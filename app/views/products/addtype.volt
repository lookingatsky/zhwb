<?php use Phalcon\Tag as Tag ?>

<?php echo Tag::form(array("products/createtype", "autocomplete" => "off")) ?>

<ul class="pager">
    <li class="previous pull-left">
        <?php echo Tag::linkTo(array("products", "&larr; 返 回")) ?>
    </li>
    <li class="pull-right">
        <?php echo Tag::submitButton(array("保 存", "class" => "btn btn-success")) ?>
    </li>
</ul>

<?php echo $this->getContent() ?>

<div class="left scaffold">
    <h2>创建类型</h2>	

    <div class="clearfix">
        <label for="name">类型名称</label>
        <?php echo Tag::textField(array("name","maxlength" => 70)) ?>
    </div>
	
	
</div>
</form>
