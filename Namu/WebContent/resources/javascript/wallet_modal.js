// 모달창 오픈 및 클로즈
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
			calculation();
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
			calculation();
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
		
		//console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');
		
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

// 팝업 중앙에 띄우기
function centerPopUp(modal, modalWidth, modalHeight) {
	//console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');

	var left = Math.ceil((window.screen.width - modalWidth) / 2);
	var top = Math.ceil(((window.screen.height - modalHeight) / 2) - 80);
	
	modal.parent().css({'display':'block'});
	modal.css({'top':top, 'left':left});
}

//현재 날짜 및 시간 입력
function currentTime() {
	var date = new Date();
	var nowDay = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
	var nowTime = date.getHours() + ':' + date.getMinutes();
	
	//console.log('현재시각 : ' + nowDay + ' ' + nowTime);
	
	$('input.date_time').val(nowDay + ' ' + nowTime);
}

// 계산기
function calculation() {
	var test; // true 또는 false 판단
	
	$('.cal_btn:not(.operator, .real, .back, .ac)').on('click', function() {
		pressNumber($(this).val());
	});
	
	$('.operator').on('click', function() {
		test = true;
		
		if($('#expression').val() == '' || $('#expression').val().length == 1){
			test = false;
			
			// 첫글자에 +, -를 입력하면
			if($(this).val() == '+' || $(this).val() == '-'){
				test = true;
			// 첫글자가 연산자면
			}else if($('#expression').val().length == 1 && operStr.indexOf($('#expression').val()) == -1){
				test = true;
			}
		}
		
		if(test){
			pressNumber($(this).val());
		}
	});
	
	$('.real').on('click', function() {
		test = true;
		
		// . 중복 입력 방지
		if($(this).val() == '.' && $('#expression').val().indexOf('.') != -1){
			test = false;
			
			var tempStr = $('#expression').val().substring($('#expression').val().lastIndexOf('.')+1, $('#expression').val().length);
			
			for(i=0; i<tempStr.length; i++){
				// .과 . 사이에 연산자가 있으면
				if(operStr.indexOf(tempStr.charAt(i)) != -1){
					test = true;
				}
			}
		}
		
		if(test){
			// . 입력시 앞에 숫자가 없으면 0 추가
			if($('#expression').val() == '' || operStr.indexOf($('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length)) != -1){
				// . 연속 입력 방지
				if($('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length) != '.'){
					pressNumber('0' + $(this).val());
				}
			}else{
				pressNumber($(this).val());
			}
		}
	});
	
	$('.back').on('click', function() {
		backspace();
	});
	
	$('.ac').on('click', function() {
		allClear();
	});
}

var operStr = '+-*/.';

function pressNumber(num) {
	// 25자까지 입력 제한
	if($('#expression').val().length < 15){
		// 연산자 중복 클릭시 기존 연산자 삭제
		if(operStr.indexOf($('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length)) != -1 && operStr.indexOf(num) != -1){
			backspace();
		}
		
		$('#expression').val($('#expression').val() + num);
		
		// 연산자 중복 입력 방지
		if(operStr.indexOf(num) == -1 && $('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length) != '.'){
			answer($('#expression').val());
		}
	}
}

function answer(num) {
	var zeroStr = '/0';
	var numStr = '123456789'
	operStr = '+-*/';
	
	// 0으로 나눌 때 생기는 오류 방지
	if(num.indexOf(zeroStr) != -1){
		var test = true; // true 또는 false 판단
		var tempStr = $('#expression').val().substring(num.indexOf(zeroStr) + 2);
		
		for(i=0; i<tempStr.length; i++){
			if(numStr.indexOf(tempStr.charAt(i)) != -1){
				$('#price').val(eval(num));
				test = false;
			}
			if(operStr.indexOf(tempStr.charAt(i)) != -1){
				break;
			}
		}
		
		if(test){
			$('#price').val(0);
		}
	}else{
		$('#price').val(eval(num));
	}
}

function backspace() {
	$('#expression').val($('#expression').val().substring(0, $('#expression').val().length-1));
	
	// 다시 계산
	if(operStr.indexOf($('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length)) == -1 || $('#expression').val() == ''){
		answer($('#expression').val());
	}
}

function allClear() {
	$('#expression, #price').val('');
}