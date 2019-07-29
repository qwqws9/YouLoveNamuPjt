// getWalletListView Business Logic
function isWalletAjax(plannerCode) {
	//console.log('plannerCode :: ' + plannerCode);
	
	$.ajax({
		url			: '/wallet/json/isWallet/' + plannerCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData);
			
			if(JSONData != null && JSONData != '' && JSONData != 0){
				ingWallet(plannerCode, JSONData);
			}
		}
	});
}

// addWalletView Business Logic
function addWalletAjax(plannerCode) {
	//console.log('plannerCode :: ' + plannerCode);
	
	$.ajax({
		url			: '/wallet/json/addWalletView/' + plannerCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData);
			
			if(JSONData != null && JSONData != '' && JSONData != 0){
				ingWallet(plannerCode, JSONData);
			}
		}
	});
}

// deleteWalletView Business Logic
function deleteWalletAjax(walletCode) {
	//console.log('walletCode :: ' + walletCode);
	
	$.ajax({
		url			: '/wallet/json/deleteWalletView/' + walletCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData);
			
			if(JSONData == true){
				alert('삭제되었습니다.');
				
				$('.square[data-wallet-code=' + walletCode + ']').css('cursor', 'default');
				
				var checked = $('.square[data-wallet-code=' + walletCode + ']').find('.isWallet');
				
				checked.html(
					'<label class="btn btn-secondary">' +
						'<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>' +
					'</label>' +
					'<label class="btn btn-secondary active">' +
						'<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>' +
					'</label>'
				);
				
				$('.square[data-wallet-code=' + walletCode + ']').removeAttr('data-wallet-code');
				//console.log('walletCode :: ' + $('.square[data-wallet-code=' + walletCode + ']').data('walletCode'));
			}
		}
	});
}





// https://ko.exchange-rates.org 크롤링
function convert(unit) {
	//console.log('화폐단위 :: ' + unit);
	
	if(unit != 'KRW'){
		$.ajax({
			url		: '/wallet/json/convert',
			method	: 'POST',
			headers	: {
				'Accept'		: 'Application/json',
				'Content-Type'	: 'Application/json'
			},
			data	: JSON.stringify({
				from	: unit,
				to		: 'KRW',
				amount	: 1
			}),
			error	: function(request, status, error) {
				//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		    },
			success	: function(JSONData, status) {
				//console.log(status);
				//console.log('JSONData :: ' + JSONData.exchangeRate);
				
				$('#exchange_result').text(makeComma(JSONData.exchangeRate));
				$('#exchange_rate').val(JSONData.exchangeRate);
			}
		})
	}else{
		$('#exchange_result').text('1.0');
		$('#exchange_rate').val('1.0');
	}
}

// addWallet Business Logic
function addAjax(form) {
	// file이 담긴 FORM 태그를 @ModelAttribute, MultipartFile 로 전달
	var formData = new FormData(form);
	
	/*
	console.log('FORM ::');
	for(var pair of formData.entries()){
		console.log(pair[0] + ' = ' + pair[1]);
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
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
	    },
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData);
			
			if(JSONData == true){
				form.reset();
				$('.pop_wrap_add').html('');
			
				getListAjax(1);
			}
		}
	});
	
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
			console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log(status);
			console.log('JSONData :: ' + JSONData.expression + '=' + JSONData.price);
		}
	});
	*/
}

// updateWallet Business Logic
function updateAjax(form) {
	var formData = new FormData(form);
	
	/*
	console.log('FORM ::');
	for(var pair of formData.entries()){
		console.log(pair[0] + ' = ' + pair[1]);
	}
	console.log(formData.get('file'));
	*/
	
	$.ajax({
		url			: '/wallet/json/updateWallet',
		type		: 'POST',
		enctype		: 'multipart/form-data',
		data		: formData,
		dataType	: 'json',
		contentType	: false,
		processData	: false,
		cache		: false,
		timeout		: 600000,
		error		: function(request, status, error) {
			console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
	    },
		success		: function(JSONData, status) {
			console.log(status);
			console.log('JSONData :: ' + JSONData);
			
			if(JSONData == true){
				form.reset();
				$('.pop_wrap_add').html('');
			
				getListAjax(1);
			}
		}
	});
}

// getWalletList Business Logic
function getListAjax(currentPage) {
	console.log('현재 페이지 :: ' + currentPage);
	
	var walletCode = $('#wallet_detail_section').data('walletCode')
	console.log('walletCode :: ' + walletCode);
	
	$.ajax({
		url			: '/wallet/json/getWalletList/' + walletCode,
		type		: 'POST',
		data		: JSON.stringify({
			currentPage	: currentPage,
			pageSize	: 5
		}),
		dataType	: 'json',
		contentType	: 'application/json',
		error		: function(request, status, error) {
			console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log(status);
			console.log('JSONData LIST 길이 :: ' + JSONData.list.length);
			console.log('페이지의 열 :: ' + document.getElementsByClassName('table_row').length);
			
			$('.totalCount').html(JSONData.totalCount);
			$('.currentPage').html(currentPage);
			
			// 기존 데이터 삭제
			if(JSONData.list.length > document.getElementsByClassName('table_row').length){
				for(var i=document.getElementsByClassName('table_row').length; i<=JSONData.list.length; i++){
					$('ajax-' + (document.getElementsByClassName('table_row').length - 1)).clone().append('#ajax-base');
				}
			}
			
			/*
			$('li[class^=ajax-]').each(function(idx) {
				$('.ajax-' + (idx + 1) + ' .detail_line .table_col').empty();
			});
			
			if(JSONData.list.length <= idx){
				$('.ajax-' + (idx + 1)).hide();
			}else{
				$('.ajax-' + (idx + 1)).show();
			}
			*/
			
			$.each(JSONData.list, function(index, item) {
				console.log((index + 1) + '번째 :: ' + item.walletDetailCode);
				
				// 새 데이터 삽입
				$('.ajax-' + (index + 1) + ' > .walletDetailCode').attr('data-wallet-detail-code', item.walletDetailCode);
				
				var list = $('.ajax-' + (index + 1) + ' .detail_line');
				
				list.find('.table_col').empty();
				
				list.children().eq(0).html(index+1);
				
				list.children().eq(1).html(item.regDate);
				
				if(item.part == 0){
					list.children().eq(2).html('<span></span><span></span>');
					
					if(item.moneyUnit == 'KRW'){
						list.children().eq(2).find('span:eq(0)').append('<i class="fas fa-won-sign"></i>');
					}else if(item.moneyUnit == 'EUR'){
						list.children().eq(2).find('span:eq(0)').append('<i class="fas fa-euro-sign"></i>');
					}else if(item.moneyUnit == 'CHF'){
						list.children().eq(2).find('span:eq(0)').append('CHF');
					}else if(item.moneyUnit == 'GBP'){
						list.children().eq(2).find('span:eq(0)').append('<i class="fas fa-pound-sign"></i>');
					}else if(item.moneyUnit == 'CZK'){
						list.children().eq(2).find('span:eq(0)').append('CZK');
					}else if(item.moneyUnit == 'HUF'){
						list.children().eq(2).find('span:eq(0)').append('HUF');
					}
					list.children().eq(2).find('span:eq(0)').append('&nbsp;' + makeComma(item.price));
					
					if(item.payOption == 2){
						list.children().eq(2).find('span:eq(0)').append('&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>');
					}
					
					if(item.moneyUnit != 'KRW' && (item.krwPrice != null && item.krwPrice != 0)){
						list.children().eq(2).find('span:eq(1)').append('<i class="fas fa-won-sign"></i>&nbsp;' + makeComma(item.krwPrice));
					}
				}
				
				if(item.part == 1){
					list.children().eq(3).html('<span></span><span></span>');
					
					if(item.moneyUnit == 'KRW'){
						list.children().eq(3).find('span:eq(0)').append('<i class="fas fa-won-sign"></i>');
					}else if(item.moneyUnit == 'EUR'){
						list.children().eq(3).find('span:eq(0)').append('<i class="fas fa-euro-sign"></i>');
					}else if(item.moneyUnit == 'CHF'){
						list.children().eq(3).find('span:eq(0)').append('CHF');
					}else if(item.moneyUnit == 'GBP'){
						list.children().eq(3).find('span:eq(0)').append('<i class="fas fa-pound-sign"></i>');
					}else if(item.moneyUnit == 'CZK'){
						list.children().eq(3).find('span:eq(0)').append('CZK');
					}else if(item.moneyUnit == 'HUF'){
						list.children().eq(3).find('span:eq(0)').append('HUF');
					}
					list.children().eq(3).find('span:eq(0)').append('&nbsp;' + makeComma(item.price));
					
					if(item.payOption == 2){
						list.children().eq(3).find('span:eq(0)').append('&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>');
					}
					
					if(item.moneyUnit != 'KRW' && (item.krwPrice != null && item.krwPrice != 0)){
						list.children().eq(3).find('span:eq(1)').append('<i class="fas fa-won-sign"></i>&nbsp;' + makeComma(item.krwPrice));
					}
				}
				
				if(item.item != null && item.item != ''){
					list.children().eq(4).html(item.item);
				}else{
					if(item.part == 0){
						list.children().eq(4).html('예산 추가');
					}else if(item.part == 1){
						list.children().eq(4).html('지출 추가');
					}
				}
				
				if(item.walletImage != null){
					list.children().eq(5).html('<img src="/resources/images/wallet/' + item.walletImage + '" alt="' + item.category + '" class="rounded-circle">');
				}else{
					list.children().eq(5).html('<span></span>');
					
					if(item.category == 0){
						list.children().eq(5).find('span').html('<i class="fas fa-coins fa-2x"></i>');
					}else if(item.category == 1){
						list.children().eq(5).find('span').html('<i class="fas fa-utensils fa-2x"></i>');
					}else if(item.category == 2){
						list.children().eq(5).find('span').html('<i class="fas fa-shopping-cart fa-2x"></i>');
					}else if(item.category == 3){
						list.children().eq(5).find('span').html('<i class="fas fa-landmark fa-2x"></i>');
					}else if(item.category == 4){
						list.children().eq(5).find('span').html('<i class="fas fa-plane fa-2x"></i>');
					}else if(item.category == 5){
						list.children().eq(5).find('span').html('<i class="fas fa-subway fa-2x"></i>');
					}else if(item.category == 6){
						list.children().eq(5).find('span').html('<i class="fas fa-bed fa-2x"></i>');
					}else if(item.category == 7){
						list.children().eq(5).find('span').html('<i class="fas fa-skating fa-2x"></i>');
					}else if(item.category == 8){
						list.children().eq(5).find('span').html('<i class="fas fa-ellipsis-h fa-2x"></i>');
					}
				}
			});
			
			// 페이징 처리
			// PREV
			if(currentPage == 1){
				$('.paging_wrap ul .left').addClass('disabled');
			}else{
				$('.paging_wrap ul .left').removeClass('disabled');
			}
			// NEXT
			if(JSONData.list.length < JSONData.search.pageSize || JSONData.list.length * currentPage == JSONData.totalCount){
				$('.paging_wrap ul .right').addClass('disabled');
			}else{
				$('.paging_wrap ul .right').removeClass('disabled');
			}
		}
	});
}

// getWallet Business Logic
function getAjax(walletDetailCode, way) {
	//console.log('walletDetailCode :: ' + walletDetailCode);
	
	var result;
	
	$.ajax({
		url			: '/wallet/json/getWallet/' + walletDetailCode,
		method		: 'GET',
		async		: false,
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData.walletDetailCode);
			
			if(way == 'get'){
				$('.pop_wrap_get > div').attr('data-part', JSONData.part);
				
				var list = $('.pop_wrap_get .padding_boxing');
				
				list.find('.input_date').html(JSONData.regDate);
				
				if(JSONData.category == 0){
					list.find('.input_category').html('<i class="fas fa-coins"></i>');
				}else if(JSONData.category == 1){
					list.find('.input_category').html('<i class="fas fa-utensils"></i>');
				}else if(JSONData.category == 2){
					list.find('.input_category').html('<i class="fas fa-shopping-cart"></i>');
				}else if(JSONData.category == 3){
					list.find('.input_category').html('<i class="fas fa-landmark"></i>');
				}else if(JSONData.category == 4){
					list.find('.input_category').html('<i class="fas fa-plane"></i>');
				}else if(JSONData.category == 5){
					list.find('.input_category').html('<i class="fas fa-subway"></i>');
				}else if(JSONData.category == 6){
					list.find('.input_category').html('<i class="fas fa-bed"></i>');
				}else if(JSONData.category == 7){
					list.find('.input_category').html('<i class="fas fa-skating"></i>');
				}else if(JSONData.category == 8){
					list.find('.input_category').html('<i class="fas fa-ellipsis-h"></i>');
				}
				
				list.find('.input_money .input_expresion').html(JSONData.expression);
				
				if(JSONData.moneyUnit == 'KRW'){
					list.find('.input_money > div:eq(0) > span').html('<i class="fas fa-won-sign"></i>');
				}else if(JSONData.moneyUnit == 'EUR'){
					list.find('.input_money > div:eq(0) > span').html('<i class="fas fa-euro-sign"></i>');
				}else if(JSONData.moneyUnit == 'CHF'){
					list.find('.input_money > div:eq(0) > span').html('CHF');
				}else if(JSONData.moneyUnit == 'GBP'){
					list.find('.input_money > div:eq(0) > span').html('<i class="fas fa-pound-sign"></i>');
				}else if(JSONData.moneyUnit == 'CZK'){
					list.find('.input_money > div:eq(0) > span').html('CZK');
				}else if(JSONData.moneyUnit == 'HUF'){
					list.find('.input_money > div:eq(0) > span').html('HUF');
				}
				list.find('.input_money > div:eq(0) > span').append('&nbsp;' + makeComma(JSONData.price));
				
				if(JSONData.moneyUnit != 'KRW' && (JSONData.krwPrice != null && JSONData.krwPrice != 0)){
					list.find('.input_money > div:eq(1)').html('<i class="fas fa-won-sign"></i>&nbsp;' + makeComma(JSONData.krwPrice));
				}
				
				if(JSONData.payer != null && JSONData.payer != 0){
					list.find('.top_input').append(
						'<div class="input_payer">' +
							'<span>결제자</span><span>' + JSONData.payer.nickname + '</span>' +
						'</div>'
					);
				}
				
				if(JSONData.part == 0){
					list.find('.top_input').after(
						'<div class="what_unit">' +
							'<div class="clear">' +
								'<span>화폐 단위</span><span>' + JSONData.moneyUnit + '</span>' +
							'</div>' +
						'</div>'
					);
					
					if(JSONData.moneyUnit != 'KRW'){
						list.find('.what_unit').append(
							'<div class="clear">' +
								'<span>적용 환율</span><span>' + JSONData.moneyUnit + ' 1 = KRW ' + makeComma(JSONData.exchangeRate) + '</span>' +
							'</div>'
						);
					}
				}
				
				if(JSONData.item != null && JSONData.item != ''){
					list.find('.input_item').html(JSONData.item);
				}else{
					if(JSONData.part == 0){
						list.find('.input_item').append('예산 추가');
					}else if(JSONData.part == 1){
						list.find('.input_item').append('지출 추가');
					}
				}
				
				if(JSONData.content != null && JSONData.content != ''){
					list.find('.text_width').append('<div class="input_content">' + JSONData.content + '</div>');
				}
				
				if(JSONData.walletImage != null){
					list.append('<img src="/resources/images/wallet/' + JSONData.walletImage + '" alt="' + JSONData.item + ' 이미지" class="big_image">');
				}
			}else if(way == 'update'){
				//console.log('JSONData 타입 :: ' + typeof JSONData);
				
				result = JSONData;
				//console.log('JSON.stringify(JSONData) 타입 :: ' + typeof result);
			}
		}
	});
	
	// ajax 내부에서 return 사용시 undefined 되므로 동기 방식으로  ajax 사용 후 외부에서 return 사용
	if(way == 'update'){
		//console.log('JSON.stringify(JSONData) :: ' + result);
		
		return result;
	}
}

// deleteWallet Business Logic
function deleteAjax(walletDetailCode) {
	//console.log('walletDetailCode :: ' + walletDetailCode);
	
	$.ajax({
		url			: '/wallet/json/deleteWallet/' + walletDetailCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE :: ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log('JSONData :: ' + JSONData);
			
			if(JSONData == true){
				alert('삭제되었습니다.');
				
				$('.pop_wrap_contain').html('');
				$('.pop_wrap_contain').hide();
			
				getListAjax(1);
			}
		}
	});
}