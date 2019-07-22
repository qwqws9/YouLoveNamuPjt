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
			
			initPopUp();
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
			
			initPopUp();
		});
	});
	
	// 수입/지출 추가 폼 제출 버튼
	$('.pop_wrap_add').on('submit', function(event) {
		$('.modal_btn').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		
		event.preventDefault();
		
		addAjax($(this)[0]);
	});
	
	// 수입/지출 추가 모달창 닫기 버튼
	/*
	$('body').on('click', function(e) {
		var container = $('.pop_wrap_add');
		
		if(container.has(e.target).length === 0 || $(e.target).is('.pop_wrap_add .act_btns .close_btn')){
			$('#income_modal, #expenditure_modal').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
			
			$('.pop_wrap_add').html('');
		}
	});
	*/
	
	// 수입/지출 상세내역 모달창 버튼
	$('.detail_line').on('click', function() {
		$(this).next('.pop_wrap_contain').show();
		
		// innerHTML
		$($(this).next('.pop_wrap_contain')).load('/wallet/getWallet.jsp', function(data) {
			//console.log(data);
			//console.log('모달창 넓이 : ' + $(this).children().width() + 'px, 길이 : ' + $(this).children().height() + 'px');
			
			var walletDetailCode = $(this).prev().prev().text();
			//console.log(walletDetailCode);
			
			centerPopUp($(this).children());
			getAjax(walletDetailCode);
			
			// 수입/지출 상세내역 모달창 닫기 버튼
			$('.pop_wrap_contain').on('click', function(e) {
				var container = $('.pop_wrap_get');
				
				if($(e.target).is('.pop_wrap_contain .pop_wrap_get .close_btnn') || container.has(e.target).length === 0){
					$('.pop_wrap_contain').html('');
					$('.pop_wrap_contain').hide();
				}
			});
			
			// 수입/지출 상세내역 삭제 버튼
			$('.pop_wrap_get .act_btns .delete_btn').on('click', function(e) {
				var result = confirm('삭제 후 복구가 불가능 합니다. 정말 삭제하시겠습니까?');
				
				if(result){
					//console.log($(this).parent().prev().text().trim());
					
					deleteAjax($(this).parent().prev().text().trim());
					getListAjax($('#currentPage').text().trim());
				}
			});
		});
	});
	
	// 결산 보고서 모달창 버튼
	$('.report_btn').on('click', function() {
		//$('.report_wrap').html('');
		
		// innerHTML
		$($('.report_wrap')).load('/wallet/getWalletReport.jsp', function(data) {
			console.log(data);
			
			$('.report_wrap').show();
		});
	});
});

// 팝업 중앙에 띄우기
function centerPopUp(modal) {
	realCenterPopUp(modal);
	
	// 윈도우창 크기 변화 감지
	$(window).resize(function() {
		realCenterPopUp(modal);
	});
}
function realCenterPopUp(modal) {
	// var top = Math.max(0, (($(window).height() - modal.outerHeight()) / 2) + $(window).scrollTop()) + 'px';
	var top = Math.max(0, ((($(window).height() - modal.outerHeight()) / 2)) - 20) + 'px';
	var left = Math.max(0, (($(window).width() - modal.outerWidth()) / 2) + $(window).scrollLeft()) + 'px';
	//console.log('모달창 위치 : 위쪽 ' + top + ', 왼쪽 ' + left);

	modal.css({'top':top, 'left':left});
}

// 팝업 초기 작업
function initPopUp() {
	$('#expression').focus();
	
	currentTime();
	exchangeRate();
	memoPopUp();
	multiply()
	calculation();
}

// 현재 날짜 및 시간 입력
function currentTime() {
	var day = new Date();
	
	var month = slice(day.getMonth()+1);
	var date = slice(day.getDate());
	var hours = slice(day.getHours());
	var minutes = slice(day.getMinutes());
	
	var nowDay = day.getFullYear() + '-' + month + '-' + date;
	var nowTime = hours + ':' + minutes;
	//console.log('현재 시각 : ' + nowDay + ' ' + nowTime);
	
	$('input.date_time').val(nowDay + ' ' + nowTime);
}
function slice(day) {
	var str = String(day);
	//console.log(str.length);
	
	if(str.length == 1){
		return '0' + str;
	}else{
		return str;
	}
}

// 환율 적용
function exchangeRate() {
	convert($('#moneyUnit').val());
	
	$('#moneyUnit').on('change', function(){
		convert($(this).val());
		multiply();
	});
}

// 메모장
function memoPopUp() {
	$('.add_option_selec #memo_btn').on('click', function() {
		//console.log($('#memo_btn').html());
		
		$('#memo_btn').next().show();
		$('.memo_modal > textarea').focus();
	});
	
	$('.add_option_selec .close_btn').on('click', function() {
		$('#memo_btn').next().hide();
	});
}

// 금액 X 환율
function multiply() {
	//console.log('금액 : ' + $('#price').val() + ', 환율 : ' + $('#exchange_rate').val());
	
	var exchangePrice = $('#price').val() * $('#exchange_rate').val();
	//console.log(exchangePrice);
	
	$('.exchange_plus_result').text(makeComma(exchangePrice));
	$('#exchange_price').val(Math.round(exchangePrice * 100) / 100);
}

// 계산기
function calculation() {
	$('#expression').keyup(function(event) {
		var regexp = /[^0-9]/gi;
        var data = $(this).val();

        if(regexp.test(data)){
        	$(this).val(data.replace(regexp, ''));
        }
        
        $('#price').val($(this).val());
        multiply();
    });
	
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
			multiply();
		}
	}else{
		$('#price').val(eval(num));
		multiply();
	}
}
function backspace() {
	$('#expression').val($('#expression').val().substring(0, $('#expression').val().length-1));
	
	// 다시 계산
	if(operStr.indexOf($('#expression').val().substring($('#expression').val().length-1, $('#expression').val().length)) == -1 || $('#expression').val() == ''){
		answer($('#expression').val());
		multiply();
	}
}
function allClear() {
	$('#expression, #price').val('');
	multiply();
}