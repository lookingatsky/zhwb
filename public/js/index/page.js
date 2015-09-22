function hygotopage(formid,beginid,page, length, totalpage){
 		if(page<1){
 			page = 1;
 		}
 		if(page>(totalpage)){
 			page = totalpage;
 		}
 		var begin = (page-1) * length + 1;
 		if(formid == ''){
 			formid="pageForm";
 		}
 		if(beginid == ''){
 			beginid="pagebegin";
 		}
 		$('#' + beginid).val(page);
 		$('#' + formid).submit();
 	}