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
		success		: function(JSONData, status) {
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
			form.reset();
			$('.pop_wrap_add').html('');
		},
		error		: function(request, status, error) {
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
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
		success		: function(JSONData, status) {
			console.log('[SUCCESS]\nRESULT : ' + JSONData.expression + '=' + JSONData.price);
		},
		error	: function(request, status, error) {
			console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
		}
	});
	*/
}
// getWalletList Business Logic
function getListAjax(currentPage) {
	$.ajax({
		url			: '/wallet/json/getWalletList/'+$('.walletCode').text().trim(),
		type		: 'POST',
		data		: JSON.stringify({
			
				currentPage : currentPage,
				pageSize : 5
			
			
			
			
		}),
		dataType	: 'json',
		contentType	: 'application/json',
		success		: function(JSONData, status) {
			console.log(status);
			console.log(JSONData);
			
			/*if(JSONData.reviewNo != null) {
				alert(status);
			}*/
		}
	});
}