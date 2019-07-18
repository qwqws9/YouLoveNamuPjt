// 네비게이션
$(function() {
	// 페이지 이동
	$('.paging_wrap li').on("click", function() {
		var currentPage = $(this).children().text().trim();
		
		if($(this).has('.left')){
			getListAjax(currentPage - 1);
		}else if($(this).has('.right')){
			getListAjax(currentPage + 1);
		}else{
			getListAjax(currentPage);
		}
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
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
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
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
		}
	});
	*/
}

// getWalletList Business Logic
function getListAjax(currentPage) {
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
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log(status);
			console.log(JSONData);
			
			$.each(JSONData.list, function(index, item) {
				//console.log(item.walletDetailCode);
				
				var list = $('.ajax-' + (index+1) + ' .detail_line');
				
				list.children('span.table_col:eq(1)').val(index+1);
				list.children('span.table_col:eq(2)').val(item.regDate);
				
				if(item.part == 0){
					list.children('span.table_col:eq(3)').find('span:first-child').val(item.price);
					
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(3)').find('span:last-child').val(item.exchangePrice);
					}
				}else if(item.part == 1){
					list.children('span.table_col:eq(4)').find('span:first-child').val(item.price);
					
					if(item.moneyUnit == 'KRW'){
						list.children('span.table_col:eq(4)').find('span:last-child').val(item.exchangePrice);
					}
				}
				
				list.children('span.table_col:eq(5)').val(item.item);
				
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
				}
				
				$('.totalCount').text(JSONData.totalCount);
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