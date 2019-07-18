$(function() {
	// 수입 추가 모달창 버튼
	$('#income_modal').on('click', function() {
		$('.modal_btn').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		$(this).children().addClass('fas').css({'color':'#f2c029'});
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$($('.pop_wrap_add')[0]).load('/wallet/addWalletIncome.jsp', function(data) {
			//console.log(data);
			
			currentTime();
		});
	});
	
	// 지출 추가 모달창 버튼
	$('#expenditure_modal').on('click', function() {
		$('.modal_btn').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		$(this).children().addClass('fas').css({'color':'#f2c029'});
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$($('.pop_wrap_add')[1]).load('/wallet/addWalletExpenditure.jsp', function(data) {
			//console.log(data);
			
			currentTime();
		});
	});
	
	// 수입/지출 추가 폼 제출 버튼
	$('.pop_wrap_add').on('submit', function(event) {
		event.preventDefault();
		
		addAjax($(this)[0]);
	});
	
	// 수입/지출 추가 모달창 닫기 버튼
	$('body').on('click', function(e) {
		var container = $('.pop_wrap_add');
		
		if(container.has(e.target).length === 0 || $(e.target).is('.pop_wrap_add .close_btn')){
			$('#income_modal').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
			
			$('.pop_wrap_add').html('');
		}
	});
	
	// 수입/지출 상세내역 버튼
	$('.detail_line').on('click', function() {
		var modalWidth = $(this).next().children().width(); // 모달창 가로길이
		var modalHeight = $(this).next().children().height(); // 모달창 세로길이
		
		console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');
		
		centerPopUp($(this).next().children(), modalWidth, modalHeight);
	});
	
	// 수입/지출 상세내역 모달창 닫기 버튼
	$('.pop_wrap_contain').on('click', function(e) {
		var container = $('.pop_wrap_get');
		
		if(container.has(e.target).length === 0 || $(e.target).is('.pop_wrap_get .act_btns .close_btn')){
			$('.pop_wrap_contain').css({'display':'none'});
		}
	});
});

// 현재 날짜 및 시간 입력
function currentTime() {
	var date = new Date();
	var nowDay = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var nowTime = date.getHours() + ':' + date.getMinutes();
	
	console.log('현재시각 : ' + nowDay + ' ' + nowTime);
	
	$('input.date_time').val(nowDay + ' ' + nowTime);
}

// 팝업 중앙에 띄우기
function centerPopUp(modal, modalWidth, modalHeight) {
	console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');

	var left = Math.ceil((window.screen.width - modalWidth) / 2);
	var top = Math.ceil(((window.screen.height - modalHeight) / 2) - 80);
	
	modal.parent().css({'display':'block'});
	modal.css({'top':top, 'left':left});
}