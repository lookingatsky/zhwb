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
		if($did == 0){
			echo Tag::select(array("company", $departments, "using" => array("id", "name"), "useDummy" => true));
		}else{
			echo Tag::select(array("company", $departments, "using" => array("id", "name"), "useDummy" => true ,"readonly" => "readonly"));
		}
		 ?>		
	</div>

	<table>
	<?php foreach($typeArr as $key=>$val){?>
		<tr>
			<td colspan="2"><b><?php echo $key; ?></b></td>
			<input type="hidden" name="<?php echo $key; ?>" value="" />
		</tr>
		<?php foreach($val as $k=>$v){?>
		<tr valign="top">	
			<td width="150" align="right"><?php echo $v['name'];?>&nbsp;&nbsp;</td>
			<td> 
				<?php echo Tag::textField(array("cost[".$v['name']."]", "size" => 10, "maxlength" => 10, "type" => "number")) ?>
			</td>
		</tr>
		<tr>
			<td width="150" align="right">备注&nbsp;&nbsp;</td>
			<td><?php echo Tag::textArea(array("remark[".$v['name']."]", "size" => 10,"cols" => 10,"value"=>"（备注）","rows" => 1, "maxlength" => 250, "type" => "str")) ?></td>	
		</tr>
		
		
		<tr <?php if($did != 0){ ?>style="display:none;"<?php }?>>
			<td width="150" align="right">限额&nbsp;&nbsp;</td>
			<td><?php echo Tag::textField(array("limit[".$v['name']."]", "size" => 10, "maxlength" => 10, "value"=>$v['limit'] , "type" => "number")) ?></td>
		</tr>	
		
		
		<?php if($v['remark'] != ''){?>
		<tr height="35" valign="top" align="left">
			<td></td>
			<td>(<?php echo $v['remark']; ?>)</td>
		</tr>
		<?php }?>
		<tr>
			<td colspan="2"><hr /></td>
		</tr>
		<?php }?>
	<?php }?>	
		<tr>
			<td colspan="2"><?php echo Tag::submitButton(array("提 交", "class" => "btn btn-primary")) ?></td>
		</tr>
	</table>
	
</div>

</form>
