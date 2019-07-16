// 모달창
$(function(){
	$('.pop_wrap_parent').hide();
	
	// 모달창 오픈
	$('.modal_btn').on('click', function(){
		currentTime();
		
		$('.pop_wrap_parent').hide();
		$(this).next('.pop_wrap_parent').show();
	});
	
	// 모달창 세이브
	$('form#save_income_form').on('submit', function(event){
		event.preventDefault();
		
		addAjax($(this)[0]);
	});
	
	// 모달창 클로즈
	$('.closs_btn').on('click', function(){
		$('.pop_wrap_parent').hide();
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

function addAjax(form){
	// form.method = 'POST';
	// form.enctype = 'multipart/form-data';

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
		success		: function(result){
			console.log("[SUCCESS]\nRESULT : " + result);
			
			$('.save_btn').prop('disabled', true);
			$('.pop_wrap_parent').hide();
			form.reset();
		},
		error		: function(request, status, error){
			console.log("[ERROR]\nCODE : " + request.status + "\n" + "MESSAGE : " + request.responseText + "\n" + "ERROR : " + error);
	    }
	});

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
		success		: function(result){
			console.log("[SUCCESS]\nRESULT : " + result);
		},
		error	: function(request, status, error){
			console.log("[ERROR]\nCODE : " + request.status + "\n" + "MESSAGE : " + request.responseText + "\n" + "ERROR : " + error);
		}
	});
	*/
}