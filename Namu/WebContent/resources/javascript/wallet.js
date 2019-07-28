// getWalletListView.jsp
$(function() {
	isWallet();
	
	// 가계부 상세내역 조회 페이지로 이동
	$('.wallet_box .square').on('click', function(e) {
		//console.log('현재 가계부 사용 여부 판단 : ' + $(this).find('.isWallet .btn:first-child').hasClass('active'));
		
		if($(this).find('.isWallet').has(e.target).length === 0){
			if($(this).find('.isWallet .btn:first-child').hasClass('active')){
				var walletCode = $(this).data('walletCode');
				//console.log('walletCode : ' + walletCode);
				
				self.location = '/wallet/getWalletList?walletCode=' + walletCode;
			}
		}
	});
	
	// 가계부 목록 페이지로 이동
	$('.btnns .pre_btn').on('click', function() {
		self.location = '/wallet/getWalletListView';
	});
});

// 가계부 생성 및 삭제
$(function() {
	// 가계부 생성
	$(document).on('click', '.isWallet .btn:first-child', function() {
		//console.log('<사용중> BUTTON : ' + $(this).hasClass('active'));
		//console.log('walletCode : ' + $(this).closest('.square').attr('data-wallet-code'));
		
		if($(this).hasClass('active') && $(this).closest('.square').attr('data-wallet-code') == null){
			var result = confirm('가계부를 생성하시겠습니까?');
			
			if(result){
				var plannerCode = $(this).closest('.square').data('plannerCode');
				//console.log('plannerCode : ' + plannerCode);
				
				addWalletAjax(plannerCode);
			}else{
				$(this).removeClass('active');
				$(this).next().addClass('active').children().prop('checked', true);
			}
		}else{
			return false;
		}
	});
	
	// 가계부 삭제
	$(document).on('click', '.isWallet .btn:last-child', function() {
		//console.log('<사용안함> BUTTON : ' + $(this).hasClass('active'));
		//console.log('walletCode : ' + $(this).closest('.square').attr('data-wallet-code'));
		
		if($(this).hasClass('active') && $(this).closest('.square').attr('data-wallet-code') != null){
			var result = confirm('기존 가계부 내역이 모두 삭제 됩니다. 정말 삭제하시겠습니까?');
			
			if(result){
				var walletCode = $(this).closest('.square').attr('data-wallet-code');
				//console.log('walletCode : ' + walletCode);
				
				deleteWalletAjax(walletCode);
			}else{
				$(this).removeClass('active');
				$(this).prev().addClass('active').children().prop('checked', true);
			}
		}else{
			return false;
		}
	});
});

// 가계부 존재 여부 확인
function isWallet() {
	var plannerCodes = document.getElementsByClassName('square');
	
	for(var i=0; i<plannerCodes.length; i++){
	    var plannerCode = plannerCodes[i].getAttribute('data-planner-code');
	    //console.log('plannerCode : ' + plannerCode);
	    
	    isWalletAjax(plannerCode);
	}
}

// 가계부 '사용중' 라디오 버튼 셋팅
function ingWallet(plannerCode, walletCode) {
	$('.square[data-planner-code=' + plannerCode + ']').attr('data-wallet-code', walletCode);
	$('.square[data-planner-code=' + plannerCode + ']').css('cursor', 'pointer');
	
	var checked = $('.square[data-planner-code=' + plannerCode + ']').find('.isWallet');
	
	checked.html(
		'<label class="btn btn-secondary active">' +
			'<input type="radio" name="options" id="opened" autocomplete="off" checked><span class="txt">사용중</span>' +
		'</label>' +
		'<label class="btn btn-secondary">' +
			'<input type="radio" name="options" id="closed" autocomplete="off"><span class="txt">사용안함</span>' +
		'</label>'
	);
	
	//console.log('walletCode : ' + $('.square[data-planner-code=' + plannerCode + ']').data('walletCode'));
}





// getWalletList.jsp
// 가계부 상세내역 조회 페이지 내 모달창 컨트롤
$(function() {
	// 페이지 이동
	$('.paging_wrap li').on('click', function() {
		if($(this).text().trim() == 'PREV'){
			var nextPage = parseInt($('.currentPage').text().trim()) - 1;
			//console.log('이동할 페이지 : ' + nextPage);
		}else if($(this).text().trim() == 'NEXT'){
			var nextPage = parseInt($('.currentPage').text().trim()) + 1;
			//console.log('이동할 페이지 : ' + nextPage);
		}
		
		getListAjax(nextPage);
		
		/*
		console.log('현재 페이지 : ' + $(this).text().trim());
		
		if($(this).text().trim() == '<'){
			var nextPage = parseInt($(this).next().text().trim()) - 1;
			console.log('이동할 페이지 : ' + nextPage);
		}else if($(this).text().trim() == '>'){
			var nextPage = parseInt($(this).prev().text().trim()) + 1;
			console.log('이동할 페이지 : ' + nextPage);
		}else{
			var nextPage = $(this).text().trim();
			console.log('이동할 페이지 : ' + $(this).text().trim());
		}
		*/
	});
	
	// 수입 추가 모달창 오픈
	$('#income_modal').on('click', function() {
		//console.log('수입 추가할 walletCode : ' + $('#wallet_detail_section').data('walletCode'));
		
		$('.modal_btn').children().removeClass('fas').addClass('far').css('color', '#282c37');
		$(this).children().addClass('fas').css('color', '#f2c029');
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$('#save_income_form').load('/wallet/addWalletIncome.jsp', {"walletCode":$('#wallet_detail_section').data('walletCode')}, function(data) {
			//console.log('addWalletIncome.jsp :\n' + data);
			
			$(this).show();
			currentTime();
			initPopUp();
		});
	});
	
	// 지출 추가 모달창 오픈
	$('#expenditure_modal').on('click', function() {
		//console.log('지출 추가할 walletCode : ' + $('#wallet_detail_section').data('walletCode'));
		
		$('.modal_btn').children().removeClass('fas').addClass('far').css('color', '#282c37');
		$(this).children().addClass('fas').css('color', '#f2c029');
		
		$('.pop_wrap_add').html('');
		
		// innerHTML
		$('#save_expenditure_form').load('/wallet/addWalletExpenditure.jsp', {"walletCode":$('#wallet_detail_section').data('walletCode')}, function(data) {
			//console.log('addWalletExpenditure.jsp :\n' + data);
			
			$(this).show();
			currentTime();
			initPopUp();
		});
	});
	
	// 수입/지출 추가 폼 제출
	$('#save_income_form, #save_expenditure_form').on('submit', function(event) {
		//console.log('제출할 FORM : ' + $(this).html());
		
		$('.modal_btn').children().removeClass('fas').addClass('far').css('color', '#282c37');
		
		event.preventDefault();
		
		addAjax($(this)[0]);
	});
	
	// 수입/지출 상세내역 수정
	$(document).on('click', '.pop_wrap_get .act_btns .update_btn', function() {
		var walletDetailCode = $(this).closest('li').attr('data-wallet-detail-code');
		//console.log('수정할 walletDetailCode : ' + walletDetailCode);
		var part = $(this).closest('.pop_wrap_get > div').attr('data-part');
		//console.log('수정할 part : ' + part);
		
		$('.modal_btn').children().removeClass('fas').addClass('far').css('color', '#282c37');
		
		$('.pop_wrap_contain').html('');
		$('.pop_wrap_contain').hide();
		$('.pop_wrap_add').html('');
		
		var list = getAjax(walletDetailCode, 'update');
		console.log('getAjax(walletDetailCode, "update") :\n' + list);
		
		// innerHTML
		if(part == 0){
			$('#income_modal').children().addClass('fas').css('color', '#f2c029');
			
			$('#save_income_form').load('/wallet/updateWalletIncome.jsp', list, function(data) {
				console.log('updateWalletIncome.jsp :\n' + data);
				
				$(this).show();
				initPopUp();
				multiply();
			});
		}else if(part == 1){
			$('#expenditure_modal').children().addClass('fas').css('color', '#f2c029');
			
			$('#save_expenditure_form').load('/wallet/updateWalletExpenditure.jsp', list, function(data) {
				console.log('updateWalletIncome.jsp :\n' + data);
				
				$(this).show();
				initPopUp();
				multiply();
			});
		}
	});
	
	// 수입/지출 추가 모달창 클로즈
	$(document).on('click', '.pop_wrap_add .act_btns .close_btn', function() {
		$('#income_modal, #expenditure_modal').children().removeClass('fas').addClass('far').css({'color':'#282c37'});
		
		$('.pop_wrap_add').html('');
		$('.pop_wrap_add').hide();
	});
	
	// 수입/지출 상세내역 조회 모달창 오픈
	$('.detail_line').on('click', function() {
		var walletDetailCode = $(this).parent().data('walletDetailCode');
		//console.log('walletDetailCode : ' + walletDetailCode);
		
		// innerHTML
		$($(this).next('.pop_wrap_contain')).load('/wallet/getWallet.jsp', function(data) {
			//console.log('getWallet.jsp :\n' + data);
			//console.log('모달창 넓이 : ' + $(this).children().width() + 'px, 높이 : ' + $(this).children().height() + 'px');
			
			$(this).show();
			centerPopUp($(this).children());
			getAjax(walletDetailCode, 'get');
		});
	});
	
	// 수입/지출 상세내역 삭제
	$(document).on('click', '.pop_wrap_get .act_btns .delete_btn', function() {
		var walletDetailCode = $(this).closest('li').attr('data-wallet-detail-code');
		//console.log('walletDetailCode : ' + walletDetailCode);
		
		var result = confirm('삭제 후 복구가 불가능 합니다. 정말 삭제하시겠습니까?');
		
		if(result){
			deleteAjax(walletDetailCode);
			getListAjax($('#currentPage').text().trim());
		}else{
			return false;
		}
	});
	
	// 수입/지출 상세내역 모달창 클로즈
	$(document).on('click', '.pop_wrap_contain .pop_wrap_get .close_btnn', function() {
		$('.pop_wrap_contain').html('');
		$('.pop_wrap_contain').hide();
	});
	
	// 결산 보고서 모달창 오픈
	$('.report_btn').on('click', function() {
		// innerHTML
		$($('.report_wrap')).load('/wallet/getWalletReport.jsp', function(data) {
			//console.log('getWalletReport.jsp :\n' + data);
			//console.log('모달창 넓이 : ' + $(this).children().width() + 'px, 높이 : ' + $(this).children().height() + 'px');
			
			$('.report_wrap').show();
			centerPopUp($(this).children());
		});
	});
	
	// 결산 보고서 모달창 클로즈
	$(document).on('click', '.report_wrap .get_report .close_btnn', function() {
		$('.report_wrap').html('');
		$('.report_wrap').hide();
	});
	
	// 모달창 외부 클릭시 모달창 클로즈
	$('body').on('click', function(e) {
		//console.log(': BODY ONCLICK EVENT :');
		
		if($('#save_income_form').css('display') == 'block' || $('#save_expenditure_form').css('display') == 'block'){
			if($('.pop_wrap_add').has(e.target).length === 0){
				$('#income_modal, #expenditure_modal').children().removeClass('fas').addClass('far').css('color', '#282c37');
				
				$('.pop_wrap_add').html('');
				$('.pop_wrap_add').hide();
			}
		}else if(e.target.className == 'pop_wrap_contain'){
			if($('.pop_wrap_get').has(e.target).length === 0){
				$('.pop_wrap_contain').html('');
				$('.pop_wrap_contain').hide();
			}
		}else if(e.target.className == 'report_wrap'){
			if($('.get_report').has(e.target).length === 0){
				$('.report_wrap').html('');
				$('.report_wrap').hide();
			}
		}
	});
});

// 수입/지출 추가 팝업 초기 작업
function initPopUp() {
	$('#expression').focus();
	
	exchangeRate();
	memoPopUp();
	calculation();
}

// 현재 날짜 및 시간 입력
function currentTime() {
	var day = new Date();
	
	var month = slice(day.getMonth() + 1);
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
	
	$('#moneyUnit').on('change', function() {
		$('.apply_exchange_rate .second_unit').text($('#moneyUnit').val());
		
		convert($(this).val());
		multiply();
	});
}

// 메모장
function memoPopUp() {
	// 메모장 오픈
	$('.add_option_selec #memo_btn').on('click', function() {
		$('#memo_btn').next().show();
		$('.memo_modal > textarea').focus();
	});
	
	// 메모장 클로즈
	$('.add_option_selec .close_btn').on('click', function() {
		$('#memo_btn').next().hide();
	});
	
	// 메모장 입력
	$('.memo_cont').on('keyup', function(){
		//console.log($(this).val());
		
		$('.memo_cont').val(removeTag($(this).val()));
	});
}
function removeTag(memo) {
	memo.replace(/(<([^>]+)>)/gi, '');
	
	if(memo.length > 100){
        alert('최대 100자까지 입력 가능합니다.');
        
        $('.memo_cont').val(memo.substring(0, 100));
    }

	return memo;
}

// 금액 X 환율 계산
function multiply() {
	//console.log('금액 : ' + $('#price').val() + ', 환율 : ' + $('#exchange_rate').val());
	
	var exchangePrice = $('#price').val() * $('#exchange_rate').val();
	//console.log('결과값 : ' + exchangePrice);
	
	$('.exchange_plus_result').text(makeComma(exchangePrice));
	$('#exchange_price').val(Math.round(exchangePrice * 100) / 100);
}

// 세자리 콤마
function makeComma(db) {
	//console.log('콤마 적용 전 : ' + db);
	//console.log('콤마 적용 후 : ' + db.toLocaleString(undefined, {maximumFractionDigits : 2}));
	
	return db.toLocaleString(undefined, {maximumFractionDigits : 2});
}

// 계산기
function calculation() {
	// 키보드로 입력시 숫자만 입력 가능하도록 제한
	$('#expression').keyup(function() {
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
	// 15자까지 입력 제한
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
	}else{
		backspace();
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

//윈도우창 중앙에 모달 오픈
function centerPopUp(modal) {
	realCenterPopUp(modal);
	
	// 윈도우창 크기 변화 감지
	$(window).resize(function() {
		realCenterPopUp(modal);
	});
}
function realCenterPopUp(modal) {
	// var top = Math.max(0, (($(window).height() - modal.outerHeight()) / 2) + $(window).scrollTop()) + 'px';
	var top = Math.max(0, (($(window).height() - modal.outerHeight()) / 2) - 15) + 'px';
	var left = Math.max(0, (($(window).width() - modal.outerWidth()) / 2) + $(window).scrollLeft()) + 'px';
	//console.log('모달창 위치 : top ' + top + ' left ' + left);

	modal.css({'top':top, 'left':left});
}