// 모달창
$(function(){
	// add 모달창 오픈
	$('#income_modal').on('click', function(){
		$('.modal_btn').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		$(this).children().addClass('fas').css({'color':'#f2c029'});
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$($('.pop_wrap_add')[0]).load('/wallet/addWalletIncome.jsp', function(data) {
			//console.log(data);
			
			currentTime();
			
			$('.close_btn').on('click', function(){
				$('#income_modal').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
				
				$('.pop_wrap_add').html('');
			});
		});
	});
	$('#expenditure_modal').on('click', function(){
		$('.modal_btn').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		$(this).children().addClass('fas').css({'color':'#f2c029'});
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$($('.pop_wrap_add')[1]).load('/wallet/addWalletExpenditure.jsp', function(data) {
			//console.log(data);
			
			currentTime();
			
			$('.close_btn').on('click', function(){
				$('#expenditure_modal').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
				
				$('.pop_wrap_add').html('');
			});
		});
	});
	
	// add 폼 서브밋
	$('.pop_wrap_add').on('submit', function(event){
		event.preventDefault();
		
		addAjax($(this)[0]);
	});
	
	// get 모달창 오픈
	$('.detail_line').on('click', function(){
		var modalWidth = $(this).next().find('.pop_wrap_get').width();
		var modalHeight = $(this).next().find('.pop_wrap_get').height();

		centerPopUp($(this).next().find('.pop_wrap_get'), modalWidth, modalHeight);
	});
});

// 현재 날짜 및 시간 입력
function currentTime(){
	var date = new Date();
	var nowDay = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var nowTime = date.getHours() + ':' + date.getMinutes();
	
	console.log('현재시각 : ' + nowDay + ' ' + nowTime);
	
	$('input.date_time').val(nowDay + ' ' + nowTime);
}

// 팝업 중앙에 띄우기
function centerPopUp(modal, modalWidth, modalHeight){
	console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');
	
	var left = Math.ceil((window.screen.width - modalWidth) / 2);
	var top = Math.ceil((window.screen.height - modalHeight) / 2);
	
	modal.parent().css({'display':'block'});
	modal.css({'top':top, 'left':left});
}

// addWallet Business Logic
function addAjax(form){
	// file이 담긴 FORM 태그를 @ModelAttribute, MultipartFile 로 전달
	var formData = new FormData(form);
	
	for(var pair of formData.entries()){
		console.log(pair[0] + ' = '+ pair[1]); 
	}
	console.log(formData.get('file'));
	
	
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
		success		: function(JSONData, status){
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
			form.reset();
			$('.pop_wrap_add').html('');
		},
		error		: function(request, status, error){
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
	    }
	});

	
	// FORM 태그를 @RequestBody 로 전달
	/*
	console.log(form.serialize());
	console.log(form.serializeArray());
	console.log(JSON.stringify(form.serializeArray()));
	
	var data = {};

	$.each(form.serializeArray(), function(index, object){
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
		success		: function(JSONData, status){
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
		},
		error	: function(request, status, error){
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
		}
	});
	*/
}

//addWallet Business Logic
function getListAjax(walletCode){
	
}