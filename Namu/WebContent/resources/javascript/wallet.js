// 네비게이션
$(function() {
	// 페이지 이동
	$('.paging_wrap li').on('click', function() {
		//console.log('현재 페이지 : ' + $(this).text().trim());
		
		if($(this).text().trim() == '<'){
			var nextPage = parseInt($(this).next().text().trim()) - 1;
			//console.log('이동할 페이지 : ' + nextPage);
		}else if($(this).text().trim() == '>'){
			var nextPage = parseInt($(this).prev().text().trim()) + 1;
			//console.log('이동할 페이지 : ' + nextPage);
		}else{
			var nextPage = $(this).prev().text().trim();
			//console.log('이동할 페이지 : ' + $(this).text().trim());
		}
		
		getListAjax(nextPage);
	});
});

// addWallet Business Logic
function addAjax(form) {
	// file이 담긴 FORM 태그를 @ModelAttribute, MultipartFile 로 전달
	var formData = new FormData(form);
	
	/*
	for(var pair of formData.entries()) {
		console.log(pair[0] + ' = '+ pair[1]); 
	}
	console.log(formData.get('file'));
	*/
	
	$.ajax({
		url			: '/wallet/json/addWallet',
		type		: 'POST',
		enctype		: 'multipart/form-data',
		data		: formData,
		dataType	: 'json',
		contentType	: false,
		processData	: false,
		cache		: false,
		timeout		: 600000,
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
	    },
		success		: function(JSONData, status) {
			//console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
			
			form.reset();
			$('.pop_wrap_add').html('');
		}
	});
	
	getListAjax(1);
	
	// FORM 태그를 @RequestBody 로 전달
	/*
	console.log(form.serialize());
	console.log(form.serializeArray());
	console.log(JSON.stringify(form.serializeArray()));
	
	var data = {};

	$.each(form.serializeArray(), function(index, object) {
		data[object.name] = object.value;
    });
    
    console.log(data);
    console.log(JSON.stringify(data));
	
	$.ajax({
		url			: '/wallet/json/addWallet',
		type		: 'POST',
		data		: JSON.stringify(data),
		dataType	: 'json',
		contentType	: 'application/json',
		error		: function(request, status, error) {
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
		}
	});
	*/
}

// getWalletList Business Logic
function getListAjax(currentPage) {
	//console.log(currentPage);
	
	$.ajax({
		url			: '/wallet/json/getWalletList/' + $('.walletCode').text().trim(),
		type		: 'POST',
		data		: JSON.stringify({
			currentPage	: currentPage,
			pageSize	: 5
		}),
		dataType	: 'json',
		contentType	: 'application/json',
		error		: function(request, status, error) {
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log(status);
			console.log(JSONData);
			
			$.each(JSONData.list, function(index, item) {
				//console.log(item.walletDetailCode);
				
				var list = $('.ajax-' + (index+1) + ' .detail_line');
				//console.log(list.html());
				
				list.children('span.table_col:eq(0)').html(index+1);
				list.children('span.table_col:eq(1)').html(item.regDate);
				
				if(item.part == 0){
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(2)').children('span:eq(0) > span:eq(0)').html('<i class="fas fa-won-sign"></i>');
					}else if(item.moneyUnit == 'EUR'){
						list.children('span.table_col:eq(2)').children('span:eq(0) > span:eq(0)').html('<i class="fas fa-euro-sign"></i>');
					}
					
					list.children('span.table_col:eq(2)').children('span:eq(0) > span:eq(1)').html('<fmt:formatNumber value="' + item.price + '" pattern="#,###.00" />');
					
					if(item.payOption == 2){
						list.children('span.table_col:eq(2)').children('span:eq(0) > span:eq(2)').html('&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>');
					}
					
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(2)').children('span:eq(1)').html('<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="' + item.exchangePrice + '" pattern="#,###.00" />');
					}
				}else if(item.part == 1){
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(3)').children('span:eq(0) > span:eq(0)').html('<i class="fas fa-won-sign"></i>');
					}else if(item.moneyUnit == 'EUR'){
						list.children('span.table_col:eq(3)').children('span:eq(0) > span:eq(0)').html('<i class="fas fa-euro-sign"></i>');
					}
					
					list.children('span.table_col:eq(3)').children('span:eq(0) > span:eq(1)').html('<fmt:formatNumber value="' + item.price + '" pattern="#,###.00" />');
					
					if(item.payOption == 2){
						list.children('span.table_col:eq(3)').children('span:eq(0) > span:eq(2)').html('&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>');
					}
					
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(3)').children('span:eq(1)').html('<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="' + item.exchangePrice + '" pattern="#,###.00" />');
					}
				}
				
				if(item.item != null){
					list.children('span.table_col:eq(4)').children('span:eq(0)').html(item.item);
				}else{
					if(item.part == 0){
						list.children('span.table_col:eq(4)').children('span:eq(1) > span').html('예산');
					}else if(item.part == 1){
						list.children('span.table_col:eq(4)').children('span:eq(1) > span').html('지출');
					}
				}
				
				if(item.walletImage != null){
					list.children('span.table_col:eq(5)').children('span:eq(0)').html('<img src="/resources/images/wallet/' + item.walletImage + '" alt="' + item.walletImage + '" class="rounded-circle">');
				}else{
					if(item.category == 0){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-coins"></i>');
					}else if(item.category == 1){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-utensils"></i>');
					}else if(item.category == 2){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-shopping-cart"></i>');
					}else if(item.category == 3){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-landmark"></i>');
					}else if(item.category == 4){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-plane"></i>');
					}else if(item.category == 5){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-subway"></i>');
					}else if(item.category == 6){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-bed"></i>');
					}else if(item.category == 7){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-skating"></i>');
					}else if(item.category == 8){
						list.children('span.table_col:eq(5)').children('span:eq(1)').html('<i class="fas fa-ellipsis-h"></i>');
					}
				}
				
				
				
				/*
				
				
				if(item.walletImage != null){
					list.children('span.table_col:eq(6)').val('<img src="/resources/images/wallet/'+item.walletImage+'" alt="${wallet.category}" class="rounded-circle">');
				}else{
					if(item.category == 0){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-coins"></i>');
					}else if(item.category == 1){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-utensils"></i>');
					}else if(item.category == 2){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-shopping-cart"></i>');
					}else if(item.category == 3){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-landmark"></i>');
					}else if(item.category == 4){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-plane"></i>');
					}else if(item.category == 5){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-subway"></i>');
					}else if(item.category == 6){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-bed"></i>');
					}else if(item.category == 7){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-skating"></i>');
					}else if(item.category == 8){
						list.children('span.table_col:eq(6)').val('<i class="fas fa-ellipsis-h"></i>');
					}
				}*/
				
				$('.totalCount').html(JSONData.totalCount);
			});
			
			// 기존 데이터 삭제
			$('li[class^=ajax-]').each(function(idx) { // idx는 0부터 시작
	 			if(JSONData.length <= idx){
	 				$('.ajax-' + (idx+1)).remove();
	 			}
	 		});
		}
	});
}