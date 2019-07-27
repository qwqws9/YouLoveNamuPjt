// https://ko.exchange-rates.org 크롤링
function convert(unit){
	//console.log(unit);
	
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
				//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		    },
			success	: function(JSONData, status) {
				//console.log('[SUCCESS]\nRESULT : ' + JSONData);
				
				$('#exchange_result').text(makeComma(JSONData.exchangeRate));
				$('#exchange_rate').val(JSONData.exchangeRate);
			}
		})
	}else{
		$('#exchange_result').text('1.0');
		$('#exchange_rate').val('1.0');
	}
}

// getWalletListView Business Logic
function isWalletAjax(i, plannerCode) {
	//console.log(i + ', ' + plannerCode);
	
	$.ajax({
		url			: '/wallet/json/isWallet/' + plannerCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log(i + ' 번째 ' + plannerCode + ' 번 플래너의 가계부 : ' + JSONData);
			
			if(JSONData != null && JSONData != '' && JSONData != 0){
				document.getElementsByClassName('walletCode')[i].setAttribute('value', JSONData);
				
				var checked = document.getElementsByClassName('isWallet')[i];
				checked.parentNode.parentNode.parentNode.parentNode.style = 'cursor:pointer';
				
				checked.innerHTML = 
					'<label class="btn btn-secondary active">' +
						'<input type="radio" name="options" id="opened" autocomplete="off" checked><span class="txt">사용중</span>' +
					'</label>' +
					'<label class="btn btn-secondary">' +
						'<input type="radio" name="options" id="closed" autocomplete="off"><span class="txt">사용안함</span>' +
					'</label>';
			}
		}
	});
}

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
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
	    },
		success		: function(JSONData, status) {
			//console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
			console.log(JSONData);
			
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
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
		}
	});
	*/
}

// getWallet Business Logic
function getAjax(walletDetailCode) {
	//console.log(walletDetailCode);
	
	$.ajax({
		url			: '/wallet/json/getWallet/' + walletDetailCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log(JSONData);
			
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
				list.find('.input_money > div:eq(1) > span').html('<i class="fas fa-won-sign"></i>&nbsp;' + makeComma(JSONData.krwPrice));
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
			
			$('.pop_wrap_get .walletDetailCode').text(JSONData.walletDetailCode);
		}
	});
}

// deleteWallet Business Logic
function deleteAjax(walletDetailCode) {
	//console.log(walletDetailCode);
	
	$.ajax({
		url			: '/wallet/json/deleteWallet/' + walletDetailCode,
		method		: 'GET',
		headers		: {
			'Accept'		: 'Application/json',
			'Content-Type'	: 'Application/json'
		},
		error		: function(request, status, error) {
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log(JSONData);
			
			alert('삭제되었습니다.');
			
			console.log(JSONData);
			
			if(JSONData == true){
				$('.pop_wrap_contain').html('');
				$('.pop_wrap_contain').hide();
			
				getListAjax(1);
			}
		}
	});
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
			//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
		},
		success		: function(JSONData, status) {
			//console.log(status);
			//console.log(JSONData);
			//console.log(JSONData.list.length);
			
			$('.totalCount').html(JSONData.totalCount);
			$('.currentPage').html(currentPage);
			
			$.each(JSONData.list, function(index, item) {
				console.log(item.walletDetailCode);
				
				// 기존 데이터 삭제
				$('li[class^=ajax-]').each(function(idx) {
					$('.ajax-' + (index+1) + ' .detail_line .table_col').empty();
					
					if(JSONData.list.length <= idx){
						$('.ajax-' + (idx+1)).hide();
					}else{
						$('.ajax-' + (idx+1)).show();
					}
				});
				
				// 새 데이터 삽입
				$('.ajax-' + (index+1) + ' > .walletDetailCode').text(item.walletDetailCode);
				
				var list = $('.ajax-' + (index+1) + ' .detail_line');
				
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
						list.children().eq(5).find('span').html('<i class="fas fa-coins"></i>');
					}else if(item.category == 1){
						list.children().eq(5).find('span').html('<i class="fas fa-utensils"></i>');
					}else if(item.category == 2){
						list.children().eq(5).find('span').html('<i class="fas fa-shopping-cart"></i>');
					}else if(item.category == 3){
						list.children().eq(5).find('span').html('<i class="fas fa-landmark"></i>');
					}else if(item.category == 4){
						list.children().eq(5).find('span').html('<i class="fas fa-plane"></i>');
					}else if(item.category == 5){
						list.children().eq(5).find('span').html('<i class="fas fa-subway"></i>');
					}else if(item.category == 6){
						list.children().eq(5).find('span').html('<i class="fas fa-bed"></i>');
					}else if(item.category == 7){
						list.children().eq(5).find('span').html('<i class="fas fa-skating"></i>');
					}else if(item.category == 8){
						list.children().eq(5).find('span').html('<i class="fas fa-ellipsis-h"></i>');
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