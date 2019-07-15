// 모달창
$(function(){
	$('.pop_wrap_parent').hide();
	
	// 모달창 오픈
	$('.modal_btn').on('click', function(){
		$('.pop_wrap_parent').hide();
		$(this).next('.pop_wrap_parent').show();
	});
	
	// 모달창 클로즈
	$('.closs_btn').on('click', function(){
		$('.pop_wrap_parent').hide();
	});
});

//현재 날짜 및 시간 입력
$(function(){
	var date = new Date();
	var nowDay = date.getFullYear() + '-' + date.getMonth() + '-' + date.getDate();
	var nowTime = date.getHours() + ':' + date.getMinutes();
	
	console.log(nowDay + nowTime);
	
	$('input.date_time').val(nowDay + ' ' + nowTime);
});