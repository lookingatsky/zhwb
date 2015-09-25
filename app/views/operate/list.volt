<?php use Phalcon\Tag as Tag ?>

<?php echo $this->getContent() ?>

<div align="right">
    <?php echo Tag::linkTo(array("products/list", "记录列表	", "class" => "btn btn-info")) ?>
</div>

<?php echo Tag::form(array("products/create", "autocomplete" => "off")) ?>

<div class="center scaffold">

    <h2>填 表</h2>
	<div class="clearfix">
		<?php 
			echo Tag::select(array("company", $Newstype, "using" => array("id", "name"), "useDummy" => true));
		 ?>		
	</div>

	<table>

		<tr>
			<td colspan="2"><?php echo Tag::submitButton(array("提 交", "class" => "btn btn-primary")) ?></td>
		</tr>
	</table>
	
</div>

</form>