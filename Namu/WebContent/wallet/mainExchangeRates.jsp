<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.skip {overflow: hidden; position: absolute; width: 1px; height: 1px; margin: -1px; padding: 0; border: 0; clip: rect(0 0 0 0);}
	
	.exchange_rate_wrap {width: 100%; height: 225px;}
	.exchange_rate_wrap h3 {margin: 0; padding: 0; font-size: inherit; font-weight: inherit;}
	.exchange_rate_wrap h3 .titlee {font-size: 20px; font-weight: 700;}
	.exchange_rate_wrap h3 .datee_wrap {display: block; margin-top: 10px; margin-bottom: 15px;}
	.exchange_rate_wrap .exchange_cont::after {content: ''; display: block; clear: both;}
	.exchange_rate_wrap .exchange_data_wrap {position: relative; width: 100%;}
	.exchange_rate_wrap .exchange_data_wrap .kor {background-color: #a3daff;}
	.exchange_rate_wrap .exchange_data_wrap, .exchange_rate_wrap .exchange_convert_wrap {float: left; width: 50%;}
	.exchange_rate_wrap .exchange_data_wrap > span {position: absolute; top: -35px; right: 5px; font-size: 22px;}
	.exchange_rate_wrap .exchange_data_wrap > span > span {cursor: pointer;}
	.exchange_rate_wrap .exchange_data_wrap > span > span.disabled {color: #cbcbcb; cursor: default; pointer-events: none;}
	.exchange_rate_wrap .exchange_data_wrap > div {position: relative; height: 226px; overflow: hidden;}
	.exchange_rate_wrap ul, .exchange_rate_wrap li {margin: 0; padding: 0; list-style:none;}
	.exchange_rate_wrap ul {position: absolute; top: -1; width: 100%; box-sizing: border-box;}
	.exchange_rate_wrap li
		{position: relative; height: 45px; line-height: 45px;
		border-top: 1px solid #cbcbcb; border-left: 1px solid #cbcbcb; border-right: 1px solid #cbcbcb;}
	.exchange_rate_wrap li:hover {background-color: #cbcbcb; cursor: default;}
	.exchange_rate_wrap li:last-child {border-bottom: 1px solid #cbcbcb;}
	.exchange_rate_wrap li span {display: inline-block; height: 40px;}
	.exchange_rate_wrap li .flagg
		{position: absolute; top: 2px; left: 10px; width: 45px; height: 40px;
		background-size: 100% 100%; background-repeat: no-repeat; background-position: center center;}
	.exchange_rate_wrap li .dataa {position: absolute; left: 65px;}
	.exchange_rate_wrap li .korr {font-weight: 700;}
	.exchange_rate_wrap li .unitt {color: #30a9de;}
	.exchange_rate_wrap li .exchange_ratee {position: absolute; right: 15px;}
	
	.exchange_rate_wrap .exchange_convert_wrap form {position: relative; margin-left: 25px;}
	.exchange_rate_wrap .exchange_convert_wrap .changee {position: absolute; top: -35px; right: 5px;}
	.exchange_rate_wrap .exchange_convert_wrap select {font-size: 16px; border: 1px solid #a3daff;}
	.exchange_rate_wrap .exchange_convert_wrap select:focus {box-shadow: none; border-color: #a3daff; outline: 0;}
	.exchange_rate_wrap .exchange_convert_wrap input[type=text] {height: 37px; margin-top: 12px; text-align: right; border-radius: 0;}
	.exchange_rate_wrap .exchange_convert_wrap input[type=text]:focus {box-shadow: none; border-color: #f2c029; outline: 0;}
	.exchange_rate_wrap .exchange_convert_wrap button[type=button]
		{width: 100%; margin-top: 10px; margin-bottom: 10px; background-color: #f2c029; border: 1px solid #cbcbcb;}
	.exchange_rate_wrap .exchange_convert_wrap .nextt
		{width: 100%; height: 30px; margin: 10px 0; color: #f2c029; font-size: 20px; line-height: 30px; text-align: center;}
</style>

<section class="exchange_rate_wrap">
	<h3>
		<span class="titlee">오늘의 환율</span>
		<span class="datee_wrap"><span class="datee"></span> 기준</span>
	</h3>
	<div class="exchange_cont">
		<div class="exchange_data_wrap">
			<span><span class="disabled"><i class="fas fa-angle-up"></i></span>&nbsp;&nbsp;<span><i class="fas fa-angle-down"></i></span></span>
			<div>
				<ul>
					<li class="kor">
						<span>
							<span class="flagg" style="background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNjAwIiB2aWV3Qm94PSItMzYgLTI0IDcyIDQ4IiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+DQo8cGF0aCBmaWxsPSIjZmZmIiBkPSJtLTM2LTI0aDcydjQ4aC03MnoiLz4NCjxnIHRyYW5zZm9ybT0ibWF0cml4KC41NTQ3IC0uODMyMDUgLjgzMjA1IC41NTQ3IDAgMCkiPg0KPGcgaWQ9ImIyIj4NCjxwYXRoIHN0cm9rZT0iIzAwMCIgaWQ9ImIiIHN0cm9rZS13aWR0aD0iMiIgZD0iTS02LTI1SDZNLTYtMjJINk0tNi0xOUg2Ii8+DQo8dXNlIHk9IjQ0IiB4bGluazpocmVmPSIjYiIvPg0KPC9nPg0KPHBhdGggc3Ryb2tlPSIjZmZmIiBkPSJtMCwxN3YxMCIvPg0KPGNpcmNsZSBmaWxsPSIjYzYwYzMwIiByPSIxMiIvPg0KPHBhdGggZmlsbD0iIzAwMzQ3OCIgZD0iTTAtMTJBNiw2IDAgMCAwIDAsMEE2LDYgMCAwIDEgMCwxMkExMiwxMiAwIDAsMSAwLTEyWiIvPg0KPC9nPg0KPGcgdHJhbnNmb3JtPSJtYXRyaXgoLS41NTQ3IC0uODMyMDUgLjgzMjA1IC0uNTU0NyAwIDApIj4NCjx1c2UgeGxpbms6aHJlZj0iI2IyIi8+DQo8cGF0aCBzdHJva2U9IiNmZmYiIGQ9Im0wLTIzLjV2M20wLDM3LjV2My41bTAsM3YzIi8+DQo8L2c+DQo8L3N2Zz4NCg==)"></span>
								<span class="dataa korr">
									<span>대한민국 원</span>&nbsp;&nbsp;-&nbsp;&nbsp;<span class="unitt">KRW</span>
								</span>
							</span>
							<span class="exchange_ratee korr">1</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="exchange_convert_wrap">
			<form>
				<a class="changee"><span class="skip">위치 바꾸기</span> <i class="fas fa-arrows-alt-v"></i></a>
				<label for="from" class="skip">변환 전 통화</label>
				<select class="form-control" name="from" id="from">
					<option value="KRW">대한민국</option>
					<option value="EUR" selected>유럽연합</option>
					<option value="CHF">스위스</option>
					<option value="GBP">영국</option>
					<option value="CZK">체코</option>
					<option value="HUF">헝가리</option>
					<option value="NOK">노르웨이</option>
					<option value="DKK">덴마크</option>
					<option value="RUB">러시아</option>
					<option value="RON">루마니아</option>
					<option value="MDL">몰도바</option>
					<option value="BYN">벨로루시</option>
					<option value="BGN">불가리아</option>
					<option value="RSD">세르비아</option>
					<option value="SEK">스웨덴</option>
					<option value="ISK">아이슬란드</option>
					<option value="ALL">알바니아</option>
					<option value="UAH">우크라이나</option>
					<option value="HRK">크로아티아</option>
					<option value="PLN">폴란드</option>
				</select>
				<input type="text" class="form-control amountt" id="amount" name="amount" value="1" />
				<!-- <button type="button" class="btn btn-warning">변환</button> -->
				<div class="nextt"><i class="fas fa-angle-double-down"></i></div>
				
				<label for="to" class="skip">변환 후 통화</label>
				<select class="form-control" name="to" id="to">
					<option value="KRW" selected>대한민국</option>
					<option value="EUR">유럽연합</option>
					<option value="CHF">스위스</option>
					<option value="GBP">영국</option>
					<option value="CZK">체코</option>
					<option value="HUF">헝가리</option>
					<option value="NOK">노르웨이</option>
					<option value="DKK">덴마크</option>
					<option value="RUB">러시아</option>
					<option value="RON">루마니아</option>
					<option value="MDL">몰도바</option>
					<option value="BYN">벨로루시</option>
					<option value="BGN">불가리아</option>
					<option value="RSD">세르비아</option>
					<option value="SEK">스웨덴</option>
					<option value="ISK">아이슬란드</option>
					<option value="ALL">알바니아</option>
					<option value="UAH">우크라이나</option>
					<option value="HRK">크로아티아</option>
					<option value="PLN">폴란드</option>
				</select>
				<input type="text" class="form-control" id="exchange_result" readonly />
			</form>
		</div><!-- //exchange_convert_wrap -->
	</div><!-- //exchange_cont -->
	
	<script>
		$(function() {
			convert();
			
			$(document).on('click', '.exchange_rate_wrap .exchange_data_wrap > span > span:first-child', function() {
				console.log($('.exchange_rate_wrap ul').css('top'));
				
				if($('.exchange_rate_wrap ul').css('top') == '-675px'){
					$(this).next().removeClass('disabled');
					$('.exchange_rate_wrap ul').animate({top:'-450px'}, 'slow');
				}else if($('.exchange_rate_wrap ul').css('top') == '-450px'){
					$('.exchange_rate_wrap ul').animate({top:'-225px'}, 'slow');
				}else if($('.exchange_rate_wrap ul').css('top') == '-225px'){
					$('.exchange_rate_wrap ul').animate({top:'0px'}, 'slow');
					$(this).addClass('disabled');
				}
			});
			
			$(document).on('click', '.exchange_rate_wrap .exchange_data_wrap > span > span:last-child', function() {
				console.log($('.exchange_rate_wrap ul').css('top'));
				
				if($('.exchange_rate_wrap ul').css('top') == '0px'){
					$(this).prev().removeClass('disabled');
					$('.exchange_rate_wrap ul').animate({top:'-225px'}, 'slow');
				}else if($('.exchange_rate_wrap ul').css('top') == '-225px'){
					$('.exchange_rate_wrap ul').animate({top:'-450px'}, 'slow');
				}else if($('.exchange_rate_wrap ul').css('top') == '-450px'){
					$('.exchange_rate_wrap ul').animate({top:'-675px'}, 'slow');
					$(this).addClass('disabled');
				}
			});
			
			$(document).on('click', '.exchange_rate_wrap ul li', function() {
				var fromValue = $(this).find('.unitt').text().trim();
				//console.log(fromValue);
				
				$('#from').val(fromValue).prop('selected', true);
				
		        if($('#amount').val() != null && $('#amount').val() != 0){
		        	convert();
		        }else{
		        	$('#exchange_result').val('0');
		        }
		    });
			
			$(document).on('keyup', '#amount', function() {
				var regexp = /[^0-9]/gi;
		        var data = $(this).val();

		        if(regexp.test(data)){
		        	$(this).val(data.replace(regexp, ''));
		        }
		        
		        if($('#amount').val() != null && $('#amount').val() != 0){
		        	convert();
		        }else{
		        	$('#exchange_result').val('0');
		        }
		    });
			
			$(document).on('change', '#from, #to', function() {
				if($('#amount').val() != null && $('#amount').val() != 0){
		        	convert();
		        }else{
		        	$('#exchange_result').val('0');
		        }
		    });
			
			$(document).on('click', '.exchange_rate_wrap .exchange_convert_wrap .changee', function() {
				var up = $('#from').val();
				var down = $('#to').val();
				
				$('#from').val(down).prop('selected', true);
				$('#to').val(up).prop('selected', true);
				
				
				if($('#amount').val() != null && $('#amount').val() != 0){
		        	convert();
		        }else{
		        	$('#exchange_result').val('0');
		        }
		    });
		});
		// https://ko.exchange-rates.org 크롤링
		function exchangeRatesData() {
			$.ajax({
				url		: '/wallet/json/exchangeRates',
				method	: 'POST',
				headers	: {
					'Accept'		: 'Application/json',
					'Content-Type'	: 'Application/json'
				},
				error	: function(request, status, error) {
					//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
			    },
				success	: function(JSONData, status) {
					//console.log(status);
					//console.log(JSONData);
					//console.log(JSONData.length);
					
					$('.exchange_rate_wrap h3 span.datee').text(currentTime());
					
					$.each(JSONData, function(index, item) {
						var flag;
						
						if(item.unit == 'NOK'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMTAwIDgwMCI+DQo8cGF0aCBmaWxsPSIjZWYyYjJkIiBkPSJtMCwwaDExMDB2ODAwaC0xMTAweiIvPg0KPGcgZmlsbD0iI2ZmZiI+DQo8cGF0aCBkPSJtMzAwLDBoMjAwdjgwMGgtMjAweiIvPg0KPHBhdGggZD0ibTAsMzAwaDExMDB2MjAwaC0xMTAweiIvPg0KPC9nPg0KPGcgZmlsbD0iIzAwMjg2OCI+DQo8cGF0aCBkPSJtMzUwLDBoMTAwdjgwMGgtMTAweiIvPg0KPHBhdGggZD0ibTAsMzUwaDExMDB2MTAwaC0xMTAweiIvPg0KPC9nPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'DKK'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNzAgMjgwIj4NCjxwYXRoIGZpbGw9IiNkMDBjMzMiIGQ9Im0wLDBoMzcwdjI4MGgtMzcweiIvPg0KPGcgc3Ryb2tlPSIjZmZmIiBzdHJva2Utd2lkdGg9IjQwIj4NCjxwYXRoIGQ9Im0xNDAsMHYyODAiLz4NCjxwYXRoIGQ9Im0wLDE0MGgzNzAiLz4NCjwvZz4NCjwvc3ZnPg0K';
						}else if(item.unit == 'RUB'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0NTAgMzAwIj4NCjxwYXRoIGZpbGw9IiNmZmYiIGQ9Im0wLDBoNDUwdjEwMGgtNDUweiIvPg0KPHBhdGggZmlsbD0iIzAwZiIgZD0ibTAsMTAwaDQ1MHYxMDBoLTQ1MHoiLz4NCjxwYXRoIGZpbGw9IiNmMDAiIGQ9Im0wLDIwMGg0NTB2MTAwaC00NTB6Ii8+DQo8L3N2Zz4NCg==';
						}else if(item.unit == 'RON'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0NTAgMzAwIj4NCjxwYXRoIGZpbGw9IiMwMDJiN2YiIGQ9Im0wLDBoMTUwdjMwMGgtMTUweiIvPg0KPHBhdGggZmlsbD0iI2ZjZDExNiIgZD0ibTE1MCwwaDE1MHYzMDBoLTE1MHoiLz4NCjxwYXRoIGZpbGw9IiNjZTExMjYiIGQ9Im0zMDAsMGgxNTB2MzAwaC0xNTB6Ii8+DQo8L3N2Zz4NCg==';
						}else if(item.unit == 'MDL'){
							flag = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSIxNTguMXB4IiBoZWlnaHQ9Ijg2LjNweCIgdmlld0JveD0iMCAwIDE1OC4xIDg2LjMiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDE1OC4xIDg2LjMiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxyZWN0IHg9IjU3LjYiIHk9IjguOCIgZmlsbD0iI0ZFRDIwNiIgd2lkdGg9IjQ3LjEiIGhlaWdodD0iNzAuNyIvPjxyZWN0IHg9IjEwNC43IiB5PSI4LjgiIGZpbGw9IiNDRDIwMzEiIHdpZHRoPSI0Ny4xIiBoZWlnaHQ9IjcwLjciLz48cmVjdCB4PSIxMC45IiB5PSI4LjgiIGZpbGw9IiMyMDRDQTEiIHdpZHRoPSI0Ny4xIiBoZWlnaHQ9IjcwLjciLz48cGF0aCBmaWxsPSIjQjA3RjU1IiBkPSJNNzQuOCwzNS4xaDE2LjhjMCwwLTAuOSwwLjEtMC45LDEuN1Y0OWMwLDAsMCw0LjYsNS40LDguNlYzMmMwLDAtMS0yLjItMy4xLTMuN2wtMi42LDIuNXYyLjNjMCwwLTEuNCwwLjEtMS45LDAuMmMtMS43LDAuNS0yLDEuMy0yLDEuM3MtMi4xLTEuMS0yLTRsMC43LTEuMWwwLTFoMC40bC0wLjEtMC43bDAuMi0wLjJsLTAuNS0wLjRsMC4xLTAuM2MwLDAtMi43LTEuNS0zLjMtMS4xYzAsMC0xLjItMC4xLTEuMiwwLjVsMC41LDAuOWwwLDAuNWwtMC40LDAuNWMwLDAsMS4yLDMuOS0xLjEsNmwtMS4yLTAuNGwtMi4yLTAuOWwtMS40LDAuMXYtMi4zTDcyLjYsMjljMCwwLTEuMSwwLjYtMS40LDAuOWMtMC40LDAuNC0xLjIsMS44LTEuMiwxLjh2MjQuNGMwLDAsNC41LTIuMyw1LjEtNy43VjM2Qzc1LjEsMzYsNzUuMywzNiw3NC44LDM1LjF6Ii8+PHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNODAuNCwyNC45bC0wLjMsMC40aC0wLjd2LTFsMC4zLTAuM2MtMC40LTAuMy0wLjYtMC4xLTAuNi0wLjF2MGMwLDAtMC4yLTAuMS0wLjYsMC4xbDAuMywwLjN2MC45aC0wLjhsLTAuMy0wLjRjMCwwLTAuMywwLjQsMCwxLjFsMC4zLTAuNGgwLjh2My4xbC0wLjIsMC4ybDAuNSwwLjV2MGwwLjUtMC41bC0wLjItMC4ydi0zLjFoMC43bDAuMywwLjRDODAuNywyNS4zLDgwLjQsMjQuOSw4MC40LDI0Ljl6Ii8+PHBhdGggZD0iTTc5LDI3LjFjMCwwLDAuNC0xLjIsMS42LTAuOGwwLjIsMC4zQzgwLjgsMjYuNiw3OS41LDI2LjIsNzksMjcuMXoiLz48cGF0aCBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik03OS4xLDI3YzAsMCwxLjMtMC40LDIuMiwwLjYiLz48cGF0aCBmaWxsPSIjQ0QyMDMxIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik04MS4yLDI3LjVjMCwwLTEuMS0wLjktMi0wLjVjMCwwLDAuMi0wLjYsMS41LTAuNEM4MC43LDI2LjYsODEuMiwyNy4xLDgxLjIsMjcuNXoiLz48cGF0aCBkPSJNODQuNCwyNy40bC0xLjEtMC44bC0xLjMsMGMwLDAtMC42LTAuNi0xLjItMC4yYzAsMCwwLjksMC4yLDEuMywwLjRsMS4yLDBMODQuNCwyNy40eiIvPjxwYXRoIGQ9Ik04MC42LDI2LjVjMCwwLDAtMC41LDAuNi0wLjVoMS40YzAsMC0xLjQtMC45LDIuNiwwLjhsMC41LTAuMWwtMC40LDAuM2wwLjcsMC42bC0wLjUsMC4xbDAuMywwLjlsLTAuNS0wLjJsMCwxbC0wLjQsMC44YzAsMCwwLDIuMiwwLjgsMy4xYzAsMCwwLjksMS4xLDEuNCwxLjJjMCwwLTEuMiwwLjEtMi4zLTAuOGMwLDAsMC4xLDAuNywwLjQsMC44YzAsMC0xLDAuMi0xLjctMC45bC0wLjQsMC44bC0wLjQtMC44YzAsMC0wLjYsMC45LTEuNywwLjlsMC41LTAuOWMwLDAtMC41LDAuOC0yLjQsMC45YzAsMCwyLjMtMC42LDIuMy00LjNjMCwwLDAuMS0yLjMtMS44LTNjMCwwLDEuMSwwLjIsMS41LDAuOGMwLDAsMS40LDMtMC43LDUuOGMwLDAsMS4yLTAuNiwxLjYtMS41YzAsMCwwLjEsMS4yLTAuNSwxLjhjMCwwLDAuOS0wLjMsMS4yLTEuMWwwLjUsMC42bDAuNC0wLjdjMCwwLDAuNSwxLDEuMywxLjJjMCwwLTAuOC0xLTAuNi0xLjdjMCwwLDAuOCwxLjIsMS43LDEuMmMwLDAtMi0yLjMtMC43LTQuNWwwLTEuNGwwLjUsMC4ybC0wLjQtMC42bDAuMy0wLjNMODUsMjcuMWwtMS44LTEuMUM4My4yLDI2LjEsODEuMSwyNS43LDgwLjYsMjYuNXoiLz48cmVjdCB4PSI4MS43IiB5PSIzMC40IiB3aWR0aD0iMC4yIiBoZWlnaHQ9IjIuNyIvPjxyZWN0IHg9IjgyLjUiIHk9IjMwLjQiIHdpZHRoPSIwLjIiIGhlaWdodD0iMi43Ii8+PHJlY3QgeD0iODMuMiIgeT0iMzAuNCIgd2lkdGg9IjAuMiIgaGVpZ2h0PSIyLjciLz48cmVjdCB4PSI4My45IiB5PSIzMC40IiB3aWR0aD0iMC4yIiBoZWlnaHQ9IjIuNyIvPjxwYXRoIGQ9Ik03OC45LDM0LjJjMCwwLTIuNi0yLjEtMy42LTEuNXYtMi4ybC0yLjgtMi40YzAsMC0yLjIsMS44LTMuMiwzLjZ2MjUuNWMwLDAsMS41LTAuOSwxLjktMS45YzAsMCwwLjMsMC43LDItMS4zaC0wLjVMNzIsNTQuOGwtMC40LTAuM0w3MC4zLDU2VjMxLjdjMCwwLDAuNC0xLjYsMi4xLTIuN2wxLjksMS42djIuNUM3NC4zLDMzLjEsNzYuMywzMyw3OC45LDM0LjJ6Ii8+PHBhdGggZD0iTTc4LDM0bC0wLjgsMC41TDc3LDMzLjZjMCwwLTEuMSwwLjQtMS4xLDAuOWwtMC41LTEuMWwtMS43LTEuN2wtMC45LDAuNWwtMC44LTFsLTAuOSwwLjhsLTAuNS0wLjlsLTAuMiwwLjVsMC40LDFsMS4xLTAuOGwwLjcsMWwxLTAuNWMwLDAsMS42LDEsMi4zLDIuOGMwLDAsMC4zLTEuMSwwLjktMWwwLjQsMC45TDc4LDM0eiIvPjxwYXRoIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIwLjIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTcwLDM0LjZWMzRsMC43LTAuN2wwLjksMC43bDAuOS0wLjZsMS4xLDAuNWwxLTFsMCwwLjJjMCwwLTAuNywxLjMtMS4yLDEuNmwtMS0wLjhsLTAuOCwwLjhMNzAuOSwzNEw3MCwzNC42eiIvPjxwb2x5Z29uIHBvaW50cz0iNzAuMywzNS40IDcwLjMsMzYgNzAuOSwzNi43IDcxLjgsMzUuOSA3Mi42LDM2LjcgNzMuNiwzNiA3NC40LDM2LjcgNzUuMywzNS45IDc1LjEsMzUuNCA3NC40LDM1LjkgNzMuNSwzNS4zIDcyLjYsMzYgNzEuNywzNS4yIDcxLDM1LjkgIi8+PHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2Utd2lkdGg9IjAuMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzIuMSwzMC4zYzAsMC0wLjcsMS0wLjQsMS43djIyLjkiLz48cGF0aCBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4yIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik03NCwzMC44YzAsMC0wLjYsMC42LTAuMywxLjJ2MTkuMiIvPjxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIwLjIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgeDE9IjcwLjkiIHkxPSIzMS45IiB4Mj0iNzAuOSIgeTI9IjM2LjUiLz48bGluZSBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4yIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHgxPSI3Mi42IiB5MT0iMzEuOSIgeDI9IjcyLjYiIHkyPSIzNi41Ii8+PGxpbmUgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2Utd2lkdGg9IjAuMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iNzQuNiIgeTE9IjMyLjUiIHgyPSI3NC42IiB5Mj0iMzYuNSIvPjxwYXRoIGQ9Ik04Ni43LDM0LjJjMCwwLDIuNi0yLjEsMy42LTEuNXYtMi4ybDIuOC0yLjRjMCwwLDIuMiwxLjgsMy4yLDMuNnYyNS41YzAsMC0xLjUtMC45LTEuOS0xLjljMCwwLTAuMywwLjctMi0xLjNIOTNsMC43LDAuN2wwLjQtMC4zbDEuMiwxLjZWMzEuN2MwLDAtMC40LTEuNi0yLjEtMi43bC0xLjksMS42djIuNUM5MS4zLDMzLjEsODkuNCwzMyw4Ni43LDM0LjJ6Ii8+PHBhdGggZD0iTTg3LjcsMzRsMC44LDAuNWwwLjItMC45YzAsMCwxLjEsMC40LDEuMSwwLjlsMC41LTEuMWwxLjctMS43bDAuOSwwLjVsMC44LTFsMC45LDAuOGwwLjUtMC45bDAuMiwwLjVsLTAuNCwxbC0xLjEtMC44bC0wLjcsMWwtMS0wLjVjMCwwLTEuNiwxLTIuMywyLjhjMCwwLTAuMy0xLjEtMC45LTFsLTAuNCwwLjlMODcuNywzNHoiLz48cGF0aCBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4yIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik05NS42LDM0LjZWMzRsLTAuNy0wLjdMOTQsMzRsLTAuOS0wLjZsLTEsMC41bC0xLTFsMCwwLjJjMCwwLDAuNywxLjMsMS4yLDEuNmwxLTAuOGwwLjgsMC44bDAuOC0wLjhMOTUuNiwzNC42eiIvPjxwb2x5Z29uIHBvaW50cz0iOTUuMywzNS40IDk1LjMsMzYgOTQuOCwzNi43IDkzLjksMzUuOSA5My4xLDM2LjcgOTIuMiwzNiA5MS40LDM2LjcgOTAuNSwzNS45IDkwLjYsMzUuNCA5MS4zLDM1LjkgOTIuMiwzNS4zIDkzLjEsMzYgOTQsMzUuMiA5NC43LDM1LjkgIi8+PHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2Utd2lkdGg9IjAuMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNOTMuNSwzMC4zYzAsMCwwLjcsMSwwLjQsMS43djIyLjkiLz48cGF0aCBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS13aWR0aD0iMC4yIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik05MS42LDMwLjhjMCwwLDAuNiwwLjYsMC4zLDEuMnYxOS4yIi8+PGxpbmUgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2Utd2lkdGg9IjAuMiIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iOTQuNyIgeTE9IjMxLjkiIHgyPSI5NC43IiB5Mj0iMzYuNSIvPjxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIwLjIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgeDE9IjkzIiB5MT0iMzEuOSIgeDI9IjkzIiB5Mj0iMzYuNSIvPjxsaW5lIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiB4MT0iOTAuOCIgeTE9IjMyLjEiIHgyPSI5MC44IiB5Mj0iMzYuMSIvPjxwYXRoIGQ9Ik04OS43LDYwYy0xLjUtMC40LTUuMS03LjItNS4xLTcuMmwtMy41LDBDNzguOCw1OC40LDc2LDYwLDc2LDYwbDIuOSwxLjNsMi0yLjdjMC4xLDAuNC0xLjQsMy4xLTEuNCwzLjFjMSwwLjIsMy40LDIuNywzLjQsMi43YzAuNS0wLjksMy40LTIuNywzLjQtMi43bC0xLjQtMy4ybDIsMi44TDg5LjcsNjB6IE04My44LDU0LjZjLTAuNiwyLDEuNyw2LjcsMS43LDYuN2MtMS4yLDAuNC0yLjUsMS42LTIuNSwxLjZjLTAuMS0wLjQtMi41LTEuNy0yLjUtMS43YzEuNi0xLjUsMS43LTYuNywxLjctNi43Yy0wLjUsMi4zLTMuMiw1LjktMy4yLDUuOWwtMS42LTAuN2MxLjctMS4yLDQuMS02LjgsNC4xLTYuOGMwLjksMC4yLDEuNSwxLjEsMS41LDEuMWMwLjQtMC43LDEuNS0xLjEsMS41LTEuMWMyLDUuMSw0LjMsNi44LDQuMyw2LjhMODcsNjAuNUM4NC45LDU4LjYsODMuOCw1NC42LDgzLjgsNTQuNnoiLz48cGF0aCBmaWxsPSIjQjA3RjU1IiBkPSJNODguNyw1OS45YzAsMC0yLjMtMS43LTQuMy02LjhjMCwwLTEuMSwwLjMtMS41LDEuMWMwLDAtMC41LTAuOS0xLjUtMS4xYzAsMC0yLjQsNS42LTQuMSw2LjhsMS42LDAuN2MwLDAsMi43LTMuNiwzLjItNS45YzAsMC0wLjEsNS4xLTEuNyw2LjdjMCwwLDIuNCwxLjIsMi41LDEuN2MwLDAsMS4zLTEuMywyLjUtMS42YzAsMC0yLjMtNC42LTEuNy02LjdjMCwwLDEuMSw0LDMuMiw1LjlMODguNyw1OS45eiIvPjxwYXRoIGZpbGw9IiNGRUQyMDYiIGQ9Ik04MywzNS4yYy0wLjIsMC0wLjMsMC0wLjMsMGMtMS41LDAtOC4yLDAtOC4yLDBsMC45LDAuN3YxMi42YzAsMS43LDMuNiwzLDMuNiwzYzIuMywwLjksMy4zLDEuNiwzLjcsMnYwLjNjMCwwLDAtMC4xLDAuMS0wLjJjMC4xLDAuMSwwLjEsMC4yLDAuMSwwLjJ2LTAuM2MwLjQtMC40LDEuNC0xLjEsMy43LTJjMCwwLDMuNi0xLjQsMy42LTNWMzUuOWwwLjktMC43QzkxLjIsMzUuMiw4NC41LDM1LjIsODMsMzUuMnoiLz48cGF0aCBmaWxsPSIjRDEyMDJCIiBkPSJNODIuOSw1Mi43TDgyLjksNTIuN2MtMC42LTAuNC0xLjctMS0zLjctMS44Yy0xLjQtMC41LTMuMy0xLjYtMy4zLTIuNVYzNS43aDEzLjl2MTIuN2MwLDEtMi4yLDIuMS0zLjMsMi41Qzg0LjYsNTEuNyw4My41LDUyLjMsODIuOSw1Mi43TDgyLjksNTIuN3oiLz48cGF0aCBmaWxsPSIjMkQ0RkEyIiBkPSJNODguOCw0My4zaC0xM3Y1LjJjMCwwLjksMS45LDIsMy4zLDIuNWMyLDAuOCwzLjEsMS40LDMuNiwxLjhsMCwwbDAsMGMwLjYtMC40LDEuNy0xLjEsMy42LTEuOGMxLjEtMC40LDMuMy0xLjUsMy4zLTIuNXYtNS4xTDg4LjgsNDMuM0w4OC44LDQzLjN6Ii8+PHBvbHlnb24gZmlsbD0iI0ZFRDIwNiIgc3Ryb2tlPSIjMDEwMjAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9IjgyLjksMzYuMSA4My40LDM3LjMgODQuNSwzNi44IDg0LDM3LjkgODUuMywzOC40IDg0LDM4LjggODQuNiw0MCA4My40LDM5LjUgODIuOSw0MC44IDgyLjUsMzkuNSA4MS4zLDQwLjEgODEuOSwzOC44IDgwLjYsMzguNCA4MS45LDM4IDgxLjMsMzYuOCA4Mi40LDM3LjMgIi8+PHBhdGggZmlsbD0iI0ZFRDIwNiIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNODUuNywzNi40YzAsMCwyLjIsNC40LTAuNSw1LjFjMCwwLTEsMC43LTEuMiwwYzAsMC0wLjQtMC40LTAuNiwwbC0wLjUsMC40bC0wLjUtMC40Yy0wLjItMC40LTAuNiwwLTAuNiwwYy0wLjIsMC43LTEuMiwwLTEuMiwwYy0yLjctMC43LTAuNS01LjEtMC41LTUuMWMtNS41LDQsMC40LDYuNiwwLjQsNi42bC0wLjcsMS40bDEuMSwwLjJjMS4yLDAuNCwxLjEsMi42LDEuMSwyLjZsMCwwLjFjMC4zLDIuMS0xLDIuNy0xLDIuN2MtMC43LDAuNCwwLDAuOSwwLDAuOWMwLjgsMC4yLDAuNiwwLjQsMS4xLDAuN2MwLjMsMC4yLDAuNywwLjMsMC45LDAuM3YwYzAsMCwwLDAsMC4xLDBjMCwwLDAuMSwwLDAuMSwwdjBjMC4yLDAsMC41LTAuMSwwLjktMC4zYzAuNS0wLjQsMC4zLTAuNSwxLjEtMC43YzAsMCwwLjctMC41LDAtMC45YzAsMC0xLjItMC42LTEtMi43bDAtMC4xYzAsMC0wLjEtMi4yLDEuMS0yLjZsMS4xLTAuMkw4NS40LDQzQzg1LjQsNDMsOTEuMiw0MC40LDg1LjcsMzYuNHoiLz48cG9seWdvbiBmaWxsPSIjRkVEMjA2IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50cz0iNzcuOSw0Mi41IDc5LjIsNDMuMyA3OCw0NC4zIDc2LjUsNDMuNCAiLz48cG9seWdvbiBmaWxsPSIjRkVEMjA2IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50cz0iODcuOSw0Mi41IDg5LjEsNDMuMyA4Ny45LDQ0LjMgODYuNSw0My40ICIvPjxwYXRoIGZpbGw9IiMwNDA0MDMiIGQ9Ik03OS44LDQ1LjJjMCwwLDAuNC0wLjIsMC43LTAuNWMwLDAsMC4zLDAuNCwwLjcsMC40YzAsMC0wLjUsMC40LTAuNiwwLjdDODAuNCw0NS44LDc5LjksNDUuMiw3OS44LDQ1LjJ6Ii8+PHBvbHlnb24gZmlsbD0iI0ZFRDIwNiIgcG9pbnRzPSI4MC40LDQ0LjggODAuOCw0NS4yIDgwLjQsNDUuNiA4MCw0NS4yICIvPjxwYXRoIGZpbGw9IiMwNDA0MDMiIGQ9Ik04MC4xLDQ2LjFjMCwwLDAuNiwyLjEsMC4yLDMuNGMwLDAsMS4xLTAuMiwxLTEuNWMwLDAsMC4zLTItMC41LTEuOUw4MC4xLDQ2LjF6Ii8+PHBhdGggZmlsbD0iI0ZFRDIwNiIgZD0iTTgwLjQsNDYuM2wwLjIsMi42YzAsMCwwLjgtMC40LDAuNi0xLjdDODEuMiw0Ny4yLDgxLjMsNDYuMSw4MC40LDQ2LjN6Ii8+PHBhdGggZmlsbD0iIzA0MDQwMyIgZD0iTTg1LjksNDUuMmMwLDAtMC40LTAuMi0wLjctMC41YzAsMC0wLjMsMC40LTAuNywwLjRjMCwwLDAuNSwwLjQsMC42LDAuN0M4NS4yLDQ1LjgsODUuOCw0NS4yLDg1LjksNDUuMnoiLz48cG9seWdvbiBmaWxsPSIjRkVEMjA2IiBwb2ludHM9Ijg1LjMsNDQuOCA4NC45LDQ1LjIgODUuMiw0NS42IDg1LjcsNDUuMiAiLz48cGF0aCBmaWxsPSIjMDQwNDAzIiBkPSJNODUuNiw0Ni4xYzAsMC0wLjYsMi4xLTAuMiwzLjRjMCwwLTEuMS0wLjItMS0xLjVjMCwwLTAuMy0yLDAuNS0xLjlMODUuNiw0Ni4xeiIvPjxnPjxnPjxwYXRoIGZpbGw9IiMwNDA0MDMiIGQ9Ik03OCw0Ni42YzAuMiwwLDAuNCwwLjIsMC40LDAuNGMwLTAuMSwwLTAuMSwwLTAuMmMwLTAuMi0wLjItMC41LTAuNS0wLjVjLTAuMiwwLTAuNSwwLjItMC41LDAuNWMwLDAuMSwwLDAuMiwwLjEsMC4zYzAsMCwwLDAsMC0wLjFDNzcuNiw0Ni43LDc3LjgsNDYuNiw3OCw0Ni42eiIvPjxwYXRoIGZpbGw9IiNGRUQyMDYiIGQ9Ik03OCw0Ni42Yy0wLjIsMC0wLjQsMC4yLTAuNCwwLjRjMCwwLDAsMCwwLDAuMWMwLDAuMiwwLjIsMC40LDAuNCwwLjRjMC4yLDAsMC40LTAuMiwwLjQtMC40YzAsMCwwLDAsMCwwQzc4LjQsNDYuNyw3OC4yLDQ2LjYsNzgsNDYuNnoiLz48L2c+PGc+PHBhdGggZmlsbD0iIzA0MDQwMyIgZD0iTTc5LDQ2LjljMC4xLDAuMiwwLDAuNC0wLjIsMC41YzAuMSwwLDAuMSwwLDAuMi0wLjFjMC4yLTAuMSwwLjMtMC40LDAuMi0wLjZjLTAuMS0wLjItMC40LTAuMy0wLjYtMC4yYy0wLjEsMC0wLjEsMC4xLTAuMiwwLjJjMCwwLDAsMCwwLDBDNzguNiw0Ni43LDc4LjksNDYuNyw3OSw0Ni45eiIvPjxwYXRoIGZpbGw9IiNGRUQyMDYiIGQ9Ik03OSw0Ni45Yy0wLjEtMC4yLTAuNC0wLjItMC42LTAuMWMwLDAsMCwwLDAsMGMtMC4yLDAuMS0wLjIsMC40LTAuMSwwLjVjMC4xLDAuMiwwLjQsMC4yLDAuNiwwLjFjMCwwLDAsMCwwLDBDNzksNDcuMyw3OS4xLDQ3LjEsNzksNDYuOXoiLz48L2c+PGc+PHBhdGggZmlsbD0iIzA0MDQwMyIgZD0iTTc5LDQ4LjFjLTAuMSwwLjItMC40LDAuMi0wLjYsMC4xYzAsMCwwLjEsMC4xLDAuMSwwLjFjMC4yLDAuMSwwLjUsMC4xLDAuNi0wLjFjMC4xLTAuMiwwLjEtMC41LTAuMS0wLjZjLTAuMS0wLjEtMC4yLTAuMS0wLjMtMC4xYzAsMCwwLDAsMCwwQzc5LDQ3LjcsNzkuMSw0Ny45LDc5LDQ4LjF6Ii8+PHBhdGggZmlsbD0iI0ZFRDIwNiIgZD0iTTc5LDQ4LjFjMC4xLTAuMiwwLjEtMC40LTAuMS0wLjZjMCwwLDAsMCwwLDBjLTAuMi0wLjEtMC40LTAuMS0wLjUsMC4xYy0wLjEsMC4yLTAuMSwwLjQsMC4xLDAuNmMwLDAsMCwwLDAsMEM3OC42LDQ4LjMsNzguOCw0OC4zLDc5LDQ4LjF6Ii8+PC9nPjxnPjxwYXRoIGZpbGw9IiMwNDA0MDMiIGQ9Ik03Ny43LDQ4LjRjLTAuMi0wLjEtMC4zLTAuMy0wLjItMC41YzAsMC0wLjEsMC4xLTAuMSwwLjFjLTAuMSwwLjIsMCwwLjUsMC4yLDAuNmMwLjIsMC4xLDAuNSwwLDAuNi0wLjJjMC0wLjEsMC4xLTAuMiwwLTAuM2MwLDAsMCwwLDAsMEM3OC4yLDQ4LjQsNzcuOSw0OC41LDc3LjcsNDguNHoiLz48cGF0aCBmaWxsPSIjRkVEMjA2IiBkPSJNNzcuNyw0OC40YzAuMiwwLjEsMC40LDAsMC42LTAuMmMwLDAsMCwwLDAsMGMwLjEtMC4yLDAtMC40LTAuMi0wLjVjLTAuMi0wLjEtMC40LDAtMC42LDAuMmMwLDAsMCwwLDAsMEM3Ny41LDQ4LjEsNzcuNSw0OC4zLDc3LjcsNDguNHoiLz48L2c+PGc+PHBhdGggZmlsbD0iIzA0MDQwMyIgZD0iTTc3LjIsNDcuM2MwLTAuMiwwLjItMC4zLDAuNS0wLjNjMCwwLTAuMS0wLjEtMC4yLTAuMWMtMC4yLDAtMC41LDAuMS0wLjUsMC40YzAsMC4yLDAuMSwwLjUsMC40LDAuNWMwLjEsMCwwLjIsMCwwLjMsMGMwLDAsMCwwLTAuMSwwQzc3LjMsNDcuNyw3Ny4xLDQ3LjUsNzcuMiw0Ny4zeiIvPjxwYXRoIGZpbGw9IiNGRUQyMDYiIGQ9Ik03Ny4yLDQ3LjNjMCwwLjIsMC4xLDAuNCwwLjQsMC41YzAsMCwwLDAsMC4xLDBjMC4yLDAsMC40LTAuMSwwLjUtMC4zYzAtMC4yLTAuMS0wLjQtMC40LTAuNWMwLDAsMCwwLDAsMEM3Ny40LDQ3LDc3LjIsNDcuMSw3Ny4yLDQ3LjN6Ii8+PC9nPjxjaXJjbGUgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iNzguMiIgY3k9IjQ3LjUiIHI9IjAuNiIvPjwvZz48cGF0aCBmaWxsPSIjRkVEMjA2IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik04OC42LDQ3LjJjMCwwLTIuMy0wLjEtMS42LDIuM2MwLDAtMS0wLjUtMS4xLTEuNmMwLDAsMC4xLTEuMiwxLjMtMS4zQzg3LjEsNDYuNiw4OC4yLDQ2LjYsODguNiw0Ny4yeiIvPjxwYXRoIGZpbGw9IiNGRUQyMDYiIGQ9Ik04NS4yLDQ2LjNMODUsNDguOWMwLDAtMC44LTAuNC0wLjYtMS43Qzg0LjUsNDcuMiw4NC40LDQ2LjEsODUuMiw0Ni4zeiIvPjxwb2x5Z29uIGZpbGw9IiNCMDdGNTUiIHBvaW50cz0iODYuNyw1MS41IDg3LjUsNTIuNCA4Ny44LDUyIDg4LjMsNTIuMSA4OC4zLDUxLjYgODkuMSw1MS43IDg4LjUsNTAuNiAiLz48cG9seWdvbiBmaWxsPSIjMDQwNDAzIiBwb2ludHM9Ijg4LjYsNTEuMSA4OS40LDUyIDg4LjcsNTEuOCA4OC41LDUyLjQgODgsNTIuMSA4Ny43LDUzLjEgODYuMyw1MS43IDg2LjYsNTEuNCA4Ny41LDUyLjQgODcuOCw1MS44IDg4LjIsNTEuOSA4OC4zLDUxLjQgODguOSw1MS43IDg4LjMsNTEuMSAiLz48cG9seWdvbiBmaWxsPSIjQjA3RjU1IiBwb2ludHM9Ijc5LjEsNTEuNSA3OC4yLDUyLjQgNzcuOSw1MiA3Ny40LDUyLjEgNzcuNCw1MS42IDc2LjcsNTEuNyA3Ny4yLDUwLjYgIi8+PHBvbHlnb24gZmlsbD0iIzA0MDQwMyIgcG9pbnRzPSI3Ny4yLDUxLjEgNzYuNCw1MiA3Ny4xLDUxLjggNzcuMyw1Mi40IDc3LjgsNTIuMSA3OCw1My4xIDc5LjQsNTEuNyA3OS4xLDUxLjQgNzguMiw1Mi40IDc4LDUxLjggNzcuNSw1MS45IDc3LjQsNTEuNCA3Ni44LDUxLjcgNzcuNCw1MS4xICIvPjxnPjxwYXRoIGZpbGw9IiNEMTIwMkIiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjIiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTc2LjksNTEuOGwtMS41LDIuNWMwLDAtMS4zLTAuMi0yLjEsMC44YzAsMCwwLjEsMS4zLDEuMiwyLjFjMCwwLDEtMC40LDEuMy0xYzAsMCwxLTIuNCwyLjMtMy41TDc3LjksNTJsLTAuNSwwbDAtMC40TDc2LjksNTEuOHoiLz48ZWxsaXBzZSB0cmFuc2Zvcm09Im1hdHJpeCgtMC42MjE2IC0wLjc4MzQgMC43ODM0IC0wLjYyMTYgNzYuNTMwOCAxNDguNTAwMSkiIGZpbGw9IiNEMTIwMkIiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgY3g9Ijc0LjEiIGN5PSI1NS44IiByeD0iMC4yIiByeT0iMC41Ii8+PGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLTAuNjIxNiAtMC43ODM0IDAuNzgzNCAtMC42MjE2IDc2LjY5NTYgMTQ3LjcwNjYpIiBmaWxsPSIjRDEyMDJCIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC41IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGN4PSI3NCIgY3k9IjU1LjMiIHJ4PSIwLjEiIHJ5PSIwLjMiLz48ZWxsaXBzZSB0cmFuc2Zvcm09Im1hdHJpeCgtMC42MjE2IC0wLjc4MzQgMC43ODM0IC0wLjYyMTYgNzYuNzkwMiAxNDkuMzM1OSkiIGZpbGw9IiNEMTIwMkIiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgY3g9Ijc0LjUiIGN5PSI1Ni4xIiByeD0iMC4yIiByeT0iMC41Ii8+PGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLTAuNjIxNiAtMC43ODM0IDAuNzgzNCAtMC42MjE2IDc3LjA4NzkgMTUwLjE5MDMpIiBmaWxsPSIjRDEyMDJCIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC41IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGN4PSI3NC44IiBjeT0iNTYuNSIgcng9IjAuMiIgcnk9IjAuNSIvPjwvZz48Zz48cGF0aCBmaWxsPSIjRDEyMDJCIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik04OC43LDUxLjVsMS41LDIuNWMwLDAsMS4zLTAuMiwyLjEsMC44YzAsMC0wLjEsMS4zLTEuMiwyLjFjMCwwLTEtMC40LTEuMy0xYzAsMC0xLTIuNC0yLjMtMy41bDAuMi0wLjdsMC41LDBsMC0wLjRMODguNyw1MS41eiIvPjxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjIxNiAtMC43ODM0IDAuNzgzNCAwLjYyMTYgLTguODI4NCA5Mi42ODUyKSIgZmlsbD0iI0QxMjAyQiIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTEuNSIgY3k9IjU1LjUiIHJ4PSIwLjIiIHJ5PSIwLjUiLz48ZWxsaXBzZSB0cmFuc2Zvcm09Im1hdHJpeCgwLjYyMTYgLTAuNzgzNCAwLjc4MzQgMC42MjE2IC04LjQ0NSA5Mi42MDU2KSIgZmlsbD0iI0QxMjAyQiIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTEuNiIgY3k9IjU1IiByeD0iMC4xIiByeT0iMC4zIi8+PGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC42MjE2IC0wLjc4MzQgMC43ODM0IDAuNjIxNiAtOS4yMzIyIDkyLjU1OTkpIiBmaWxsPSIjRDEyMDJCIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC41IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGN4PSI5MS4yIiBjeT0iNTUuOCIgcng9IjAuMiIgcnk9IjAuNSIvPjxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjIxNiAtMC43ODM0IDAuNzgzNCAwLjYyMTYgLTkuNjQ0OSA5Mi40MTYpIiBmaWxsPSIjRDEyMDJCIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC41IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGN4PSI5MC44IiBjeT0iNTYuMiIgcng9IjAuMiIgcnk9IjAuNSIvPjwvZz48cG9seWdvbiBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9Ijk4LjksNDAuOCA5OC45LDQxLjggOTguMSw0MS40ICIvPjxjaXJjbGUgZmlsbD0iI0Y0RDQwRSIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgY3g9Ijk4LjMiIGN5PSI0MiIgcj0iMC40Ii8+PHBhdGggZmlsbD0iI0Y0RDQwRSIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTk2LjgsNDQuNGMwLDAtMC40LTAuMiwwLTAuNGwwLjMtMC41TDk3LDQyLjJsMS4yLDAuMWwwLjcsMC45TDk3LjgsNDRsLTAuMSwwLjZjMCwwLTAuNSwwLjEtMC41LDAuMUM5Ny4xLDQ0LjYsOTYuOCw0NC40LDk2LjgsNDQuNHoiLz48cG9seWdvbiBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9Ijk4LjEsNDIuNCA5Ny40LDQyLjUgOTcuNCw0My4zIDk2LjksNDQuNCA5Ny4yLDQ0LjYgOTcuOCw0My41IDk4LjQsNDMgIi8+PHBvbHlsaW5lIGZpbGw9IiNGNEQ0MEUiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjI1IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50cz0iOTYuNiw0NC41IDk2LjUsNDUgOTUuMiw0Ny42IDk1LjYsNDcuOCA5Nyw0NS4xIDk3LjMsNDUgOTcuMSw0NC42ICIvPjxwb2x5Z29uIGZpbGw9IiNGNEQ0MEUiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjI1IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50cz0iOTUuNSw0Ny44IDk0LjksNDcuOCA5NS4xLDQ4LjMgOTUuNSw0OC4yICIvPjxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuOTA1NiAwLjQyNDEgLTAuNDI0MSAwLjkwNTYgMjkuNTYxNyAtMzUuNzAzNikiIGZpbGw9IiNGNEQ0MEUiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjI1IiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGN4PSI5NSIgY3k9IjQ4LjYiIHJ4PSIwLjQiIHJ5PSIwLjQiLz48ZWxsaXBzZSB0cmFuc2Zvcm09Im1hdHJpeCgwLjkwNTYgMC40MjQxIC0wLjQyNDEgMC45MDU2IDI5Ljc1NzUgLTM1LjUyMTYpIiBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTQuNyIgY3k9IjQ5LjEiIHJ4PSIwLjQiIHJ5PSIwLjMiLz48cG9seWdvbiBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9IjkzLjMsNTIuMyA5NC43LDQ5LjUgOTQuMyw0OS40IDkyLjksNTIgIi8+PGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC44OTIgMC40NTIgLTAuNDUyIDAuODkyIDMzLjkwNDQgLTM2LjIwODYpIiBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTIuNyIgY3k9IjUyLjgiIHJ4PSIwLjYiIHJ5PSIwLjkiLz48ZWxsaXBzZSBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTIiIGN5PSI1My45IiByeD0iMC41IiByeT0iMC41Ii8+PGNpcmNsZSBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBjeD0iOTAuNiIgY3k9IjU3IiByPSIwLjMiLz48cGF0aCBmaWxsPSIjRjRENDBFIiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNODkuOSw1Ny4xYzAsMCwwLjcsMCwxLDAuNWwtMSwwLjhMODkuOSw1Ny4xeiIvPjxwYXRoIGZpbGw9IiMwQjc3NTQiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjEiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTY3LjcsNDEuOGMwLDAsMS4yLDAuMywxLDEuN0M2OC43LDQzLjUsNjcuNSw0My41LDY3LjcsNDEuOHoiLz48cGF0aCBmaWxsPSIjMEI3NzU0IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik02Ny4xLDQzLjFjMCwwLDEuNS0wLjIsMS44LDEuM0M2OC45LDQ0LjQsNjcuNiw0NC45LDY3LjEsNDMuMXoiLz48cGF0aCBmaWxsPSIjMEI3NzU0IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik02OSw0MS43YzAsMCwwLjYsMC45LDAuMiwyLjJDNjkuMSw0My45LDY4LjMsNDMsNjksNDEuN3oiLz48cGF0aCBmaWxsPSIjMEI3NzU0IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik03MC45LDQ1LjFjMCwwLDAuNCwxLTAuMywyLjJDNzAuNiw0Ny4zLDcwLDQ2LjIsNzAuOSw0NS4xeiIvPjxwYXRoIGZpbGw9IiMwQjc3NTQiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjEiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTcwLjMsNDQuMmMwLDAsMC40LDEtMC4zLDIuMkM3MCw0Ni40LDY5LjQsNDUuNCw3MC4zLDQ0LjJ6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNjkuOCw0Ni4yYzAsMC0wLjctMC44LTIuMS0wLjdDNjcuOCw0NS41LDY4LjQsNDYuNiw2OS44LDQ2LjJ6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzAuMSw0Ny4xYzAsMC0wLjctMC44LTIuMS0wLjdDNjgsNDYuNCw2OC42LDQ3LjUsNzAuMSw0Ny4xeiIvPjxwYXRoIGZpbGw9IiMwQjc3NTQiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjEiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTcyLjYsNDguOGMwLDAsMC40LDEtMC4zLDIuMkM3Mi4zLDUxLDcxLjcsNDkuOSw3Mi42LDQ4Ljh6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzIsNDcuOWMwLDAsMC40LDEtMC4zLDIuMkM3MS43LDUwLjEsNzEuMSw0OS4xLDcyLDQ3Ljl6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzEuNSw0OS45YzAsMC0wLjctMC44LTIuMS0wLjdDNjkuNSw0OS4yLDcwLjEsNTAuMyw3MS41LDQ5Ljl6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzEuOCw1MC44YzAsMC0wLjctMC44LTIuMS0wLjdDNjkuNyw1MC4xLDcwLjMsNTEuMiw3MS44LDUwLjh6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzQuMyw1Mi41YzAsMCwwLjQsMS0wLjMsMi4yQzc0LDU0LjcsNzMuNCw1My42LDc0LjMsNTIuNXoiLz48cGF0aCBmaWxsPSIjMEI3NzU0IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4xIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik03My44LDUxLjZjMCwwLDAuNCwxLTAuMywyLjJDNzMuNCw1My44LDcyLjgsNTIuOCw3My44LDUxLjZ6Ii8+PHBhdGggZmlsbD0iIzBCNzc1NCIgc3Ryb2tlPSIjMDQwNDAzIiBzdHJva2Utd2lkdGg9IjAuMSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNNzMuMyw1My42YzAsMC0wLjctMC44LTIuMS0wLjdDNzEuMiw1Mi45LDcxLjgsNTQsNzMuMyw1My42eiIvPjxwYXRoIGZpbGw9IiMwQjc3NTQiIHN0cm9rZT0iIzA0MDQwMyIgc3Ryb2tlLXdpZHRoPSIwLjEiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTczLjUsNTQuNWMwLDAtMC43LTAuOC0yLjEtMC43QzcxLjQsNTMuOCw3Miw1NC44LDczLjUsNTQuNXoiLz48cG9seWdvbiBmaWxsPSIjRkVEMjA2IiBzdHJva2U9IiMwNDA0MDMiIHN0cm9rZS13aWR0aD0iMC4yNSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9Ijc0LjMsNTUuMyA2OC44LDQzLjUgNjguNSw0My41IDc0LDU1LjQgIi8+PC9zdmc+';
						}else if(item.unit == 'BYN'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDUwIiB2aWV3Qm94PSIwIDAgMTA5OCA1NDkiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj4NCjxwYXRoIGZpbGw9IiNjODMxM2UiIGQ9Im0wLDBoMTA5OHY1NDloLTEwOTh6Ii8+DQo8cGF0aCBmaWxsPSIjNGFhNjU3IiBkPSJtMCwzNjZoMTA5OHYxODNoLTEwOTh6Ii8+DQo8cGF0aCBmaWxsPSIjZmZmIiBkPSJtMCwwaDEyMnY1NDloLTEyMnoiLz4NCjxnIGlkPSJoIj4NCjxnIGZpbGw9IiNjODMxM2UiIGZpbGwtcnVsZT0iZXZlbm9kZCIgaWQ9InEiIHRyYW5zZm9ybT0ic2NhbGUoNS4zMDQzNSA5KSI+DQo8cGF0aCBkPSJtNCwwaDN2MWgxdjFoMXYxaDF2MWgxdjFoLTF2MWgtMXYxaC0xdjFoLTF2MWgtMXYxaC0xdi0xaC0xdi0xaC0xdi0xaC0xdi0xaC0xdi0xaC0xdi0xaDF2LTFoMXYtMWgxdi0xaDF6bTEsMWgxdjFoMXYxaDF2MWgtMXYxaC0xdjFoLTF2LTFoLTF2LTFoLTF2LTFoMXYtMWgxem0wLDFoMXYxaC0xem0tNS00aDF2MWgtMXptMCw1aDF2MWgtMXptMTEtOGguNnYyaC0uNnptMCw1aC42djJoLS42em0tOSwwaDF2MWgxdjFoMXYxaC0xdjFoLTF2MWgtMXYtMWgtMXYtMWgtMXYtMWgxdi0xaDF6bTAsMWgxdjFoLTF6bTYtM2gxdjFoMXYxaDF2MWgtMXYxaC0xdjFoLTF2LTFoLTF2LTFoLTF2LTFoMXYtMWgxem0wLDFoMXYxaC0xem0tOCwzaDF2MWgtMXptMTEtMmguNnYyaC0uNnoiLz4NCjxwYXRoIGQ9Im0wLDE4aDF2LTFoMXYtMWgxdi0xaDF2LTFoMXYtMWgxdjFoMXYxaDF2MWgxdjFoMXYxaDF2MWguNnY0aC0uNnYxaC0xdjFoLTF2MWgtMXYxaC0xdjFoLTF2Mi42aC0ydi0uNmgtMXYtMWgtMXYtMWgtMXYtMWgtMXYtM2gxdjFoMXYxaDF2MWgxdi0xaDF2LTFoMXYtMWgxdi0xaDF2LTFoMXYtMWgtMXYtMWgtMXYtMWgtM3YxaDJ2MWgtMXYxaC0xdjFoLTF2LTFoLTF2LTFoLTF2LTFoLTF6bTAsMmgxdjFoLTF6bTExLDJoLjZ2MWgtLjZ6bS0yLDFoMXYxaDF2MWguNnYxLjZoLS42di0uNmgtMXYtMWgtMXptLTIsMWgxdi42aC0xeiIvPg0KPC9nPg0KPHVzZSB4bGluazpocmVmPSIjcSIgdHJhbnNmb3JtPSJtYXRyaXgoLTEgMCAwIDEgMTIyIDApIi8+DQo8L2c+DQo8dXNlIHhsaW5rOmhyZWY9IiNoIiB0cmFuc2Zvcm09Im1hdHJpeCgxIDAgMCAtMSAwIDU0OSkiLz4NCjwvc3ZnPg0K';
						}else if(item.unit == 'BGN'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjYwMCIgdmlld0JveD0iMCAwIDUgMyI+DQo8cGF0aCBmaWxsPSIjZmZmIiBkPSJtMCwwaDV2M2gtNXoiLz4NCjxwYXRoIGZpbGw9IiMwMDk2NmUiIGQ9Im0wLDFoNXYyaC01eiIvPg0KPHBhdGggZmlsbD0iI2Q2MjYxMiIgZD0ibTAsMmg1djFoLTV6Ii8+DQo8L3N2Zz4NCg==';
						}else if(item.unit == 'RSD'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMzUwIDkwMCI+DQo8cGF0aCBmaWxsPSIjYzYzNjNjIiBkPSJtMCwwaDEzNTB2NDUwaC0xMzUweiIvPg0KPHBhdGggZmlsbD0iI2ZmZiIgZD0ibTAsNDUwaDEzNTB2NDUwaC0xMzUweiIvPg0KPHBhdGggZmlsbD0iIzBjNDA3NiIgZD0ibTAsMzAwaDEzNTB2MzAwaC0xMzUweiIvPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'SEK'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNjAwIDEwMDAiPg0KPHBhdGggZmlsbD0iIzBiNTA4OSIgZD0ibTAsMGgxNjAwdjEwMDBoLTE2MDB6Ii8+DQo8ZyBmaWxsPSIjZmZjMTAwIj4NCjxwYXRoIGQ9Im01MDAsMGgyMDB2MTAwMGgtMjAweiIvPg0KPHBhdGggZD0ibTAsNDAwaDE2MDB2MjAwaC0xNjAweiIvPg0KPC9nPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'CHF'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMjAgMzIwIj4NCjxwYXRoIGZpbGw9IiNkNTJiMWUiIGQ9Im0wLDBoMzIwdjMyMGgtMzIweiIvPg0KPGcgZmlsbD0iI2ZmZiI+DQo8cGF0aCBkPSJtNjAsMTMwaDIwMHY2MGgtMjAweiIvPg0KPHBhdGggZD0ibTEzMCw2MGg2MHYyMDBoLTYweiIvPg0KPC9nPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'ISK'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAwIDcyMCI+DQo8ZyB0cmFuc2Zvcm09InNjYWxlKDQwKSI+DQo8cGF0aCBmaWxsPSIjMDAzODk3IiBkPSJtMCwwaDI1djE4aC0yNXoiLz4NCjxnIGZpbGw9IiNmZmYiPg0KPHBhdGggZD0ibTAsN2gyNXY0aC0yNXoiLz4NCjxwYXRoIGQ9Im03LDBoNHYxOGgtNHoiLz4NCjwvZz4NCjxnIGZpbGw9IiNkNzI4MjgiPg0KPHBhdGggZD0ibTAsOGgyNXYyaC0yNXoiLz4NCjxwYXRoIGQ9Im04LDBoMnYxOGgtMnoiLz4NCjwvZz4NCjwvZz4NCjwvc3ZnPg0K';
						}else if(item.unit == 'ALL'){
							flag = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHdpZHRoPSI3MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iNzAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI2U0MWUyMCIvPjxwYXRoIGlkPSJoYWxmIiBkPSJtMzAwLjA5NCw5Ny4yMDQzYy00Ljg2MTgtMC4wODItMTIuOTMwOCwxLjU0OTk4LTEyLjc1LDUuMjgxMi0xMy41NDE5LTIuMzIwOTItMTQuOTUyLDMuMjcyNjctMTQuMTU2Miw4LjI1MDAzLDEuMjg4NDQtMS45NzUzMiwyLjg1NzIzLTMuMDQ3NzYsNC4wNjI1MS0zLjI0OTk5LDEuODA1NzYtMC4yOTk3LDMuNjk1NCwwLjI4MzUsNS42MjUsMS40Njg3MSwxLjkyOTY5LDEuMTg1Myw0LjA1NTU4LDMuMDk3OTgsNS4wMDAwNCw0LjI4MTIxLTQuNzc5NDUsMS4xNDI2NC04LjQ3MTcsMC40MDUtMTIuMjE4OC0wLjI1MDItMS44NDcxNi0wLjMyMzEtNC40MzIwNS0xLjM2MjI0LTUuOTY4NzEtMi40Mzc0Ny0xLjUzNjY2LTEuMDc1NDEtMi4wMjA1LTIuMDg3NTUtNC40Mzc1NC00LjU2MjQ2LTIuODQ5NjctMi45MTc5OC01Ljg4MjU4LTIuMDk2MzctNC45Mzc0OSwyLjQzNzQ3LDIuMTg1NTYsNC4yMTA5Miw1LjgzNjU5LDYuMDg4NTksMTAuNDM3NSw2Ljg0Mzc4LDIuMjE0LDAuMzYzNiw1LjUxMTk2LDEuMTUyNjMsOS4yNSwxLjE1NjIzLDMuNzM4MDYsMC4wMDQsNy45MzUyMS0wLjU0LDEwLjIxODgtMC4wNjI1LTEuMzcxODcsMC44NjEzLTIuOTI0MjgsMi4zNDYyMS02LjAwMDAzLDIuOTM3NTEtMy4xMjc3NywwLjYwMTItNy44ODMwMS0xLjg1OTk0LTEwLjc4MTItMi41MzEyNSwwLjM2ODEsMi40Mzg1NSwzLjQ0NDAzLDQuNzE4MTYsOS40OTk5OSw1LjkwNjI1LDkuOTUxNTIsMi4xNjY5MywxOC4yMjA4LDMuODEzNzUsMjMuNjg3NSw2Ljc4MTIzLDUuNDY2NjksMi45Njc0OCw4LjkxMzQyLDYuNjgyNjgsMTEuMzc1LDkuNTkzNzUsNC44OTg2MSw1Ljc5MzEyLDUuMTU2MjgsMTAuMjQwMiw1LjQ2ODc2LDExLjIxODcsMS4wMDc4Miw5LjI1NTctMi4yMTk1OCwxNC40NjIyLTguMjE4NzEsMTYuMDYyNS0yLjk5OTYxLDAuODAwMS04LjMyNzg4LTAuNzA2NS0xMC4yODEyLTIuOTk5OTctMS45NTM0NS0yLjI5MjkzLTMuODU0MDctNi4yMzQyMS0zLjMxMjU0LTEyLjQwNjIsMC41MjY1LTIuNDIxMjcsMy4yOTUyNi04LjcyODExLDAuOTM3NTMtMTAuMDMxMi0xMC44NjE2LTYuMDAzMjYtMjQuMDUxMi0xMi4wNzQ0LTMzLjU5MzgtMTUuNjg3My0yLjYwODE1LTAuOTg3NDUtNC43NTY3NSwyLjU1NzM1LTUuNTkzNzUsMy45Mzc1LTE2LjIxMTEtMS45NzQxOC0zMC44MjctMTIuOTQ0My0zNy40MDYyLTI0LjYyNS00LjQ4MTAxLTcuOTU1NTUtMTEuODY2NSwwLjAxNjQtMTAuNjI1LDcuNTMxMiwyLjAwNDMsOC4zODc2NCw4LjM5NTAyLDE0LjQ1MTksMTYuMDYyNSwxOC43NSw3Ljg2OTUxLDQuMzMzMTQsMTcuNzA1OSw4LjU5Njk4LDI3LjY1NjIsOC4zNzUwNCw1LjM2MDY3LDEuMDE0MTIsNS4zMDc3NSw3Ljk0OTQzLTEuMTI1LDkuMjQ5OTktMTIuNTgwOSwwLjA3OTYtMjIuNjE3NS0wLjIzNC0zMi4wOTM4LTkuMzc1LTcuMTg3NzYtNi41NjI4LTExLjIzNDIsMS4yNTY5NC05LjE1NjI0LDUuNjg3NDYsMy41MjEzNCwxMy42NTgzLDIzLjAwNjMsMTcuNDgzLDQyLjcxODcsMTMuMDYyNSw3LjYzMzQ0LTEuMjY0MTQsMy4wNjI1Miw2LjkxNTQyLDAuOTA2MjEsNy4wMDAwMi04LjIzNjYyLDUuOTA1NjItMjIuOTgyNywxMS42ODQxLTM1Ljk2ODgtMC4wNjI1LTUuOTQyNDMtNC41NTAyMi05Ljk2MDE2LTAuNzI1NC03Ljc0OTk5LDUuODQzNzksNS43NjIxNiwxNy4xMjc0LDI3LjgwMzcsMTMuNTMwMiw0Mi45Mzc1LDUuMDkzNzMsMy44OTUyOS0yLjE3MTQzLDcuNDMwNDksMi44ODA0NSwyLjY4NzQ5LDYuNzE4NzctMTguODIwMSwxMy4xNTAzLTI4LjIyOTgsMTMuMjk5OS0zNi43MTg3LDguMjQ5OTgtMTAuNjI3NS00LjE5MTMtMTEuNTYyMyw3LjU5NjM3LTUuMjUsMTEuNDY4OCw3LjAxNTk1LDQuMzAzOTgsMjQuODcwMSwxLjA3NzAzLDM3Ljk2ODgtNy4xNTYyNiw1LjYxNTM3LTQuMTc0ODMsNS44Njk0NCwyLjM1MzA1LDIuMzEyNDYsNC45Mzc0OS0xNS41NDQyLDEzLjQzMzQtMjEuNjcxLDE2Ljk3MS0zNy44NzUsMTQuNzgxMi04LjAzNTExLTAuNjI2NC03LjkxNDQyLDkuMjc5OS0xLjU5MzcyLDEzLjE1NjIsOC42Mjk4Myw1LjI5MjQ1LDI1LjQ4MjctMy40OTI0NSwzOC41NjI1LTE0LjM0MzgsNS41MDUyMS0yLjk0MTY1LDYuNDA5MzUsMS44ODI3MSwzLjY4NzQ4LDcuNTkzNzUtNy45OTIwOSwxMC4wODMyLTE1LjQ5MzIsMTYuMDI4MS0yMi43MTg3LDE4Ljc4MTItNy4yMjU1NiwyLjc1MzE5LTE0LjE3NTUsMi4zMTQ1My0xOS4wOTM4LDAuNjI0Ni02LjAwMDIxLTIuMDYxNDUtNi43NTI2MSw0LjE3NDI5LTMuNDM3NDYsOS44NDM3NSwxLjk5ODM2LDMuNDE3NDgsMTAuMjc5Nyw0LjUxMzMyLDE5LjIxODcsMS4zNDM3OSw4LjkzOTA3LTMuMTY5MDgsMTguNTM1OC0xMC42MDI2LDI1LjEyNS0xOS4zMTI1LDUuNzMyOTEtNS4wMTg5NCw1LjAxOTkzLDEuNzIzNjgsMi40MDYyNCw2LjQ2ODc1LTEzLjE5NDQsMjAuODU4Ny0yNS4yNjIsMjguNTk2My00MS4xNTYyLDI3LjI4MTItNy4wNDc1NC0xLjE5NjczLTguNjQ4MSw0LjI4MzY0LTQuMTU2Miw5LjM0Mzc1LDcuODg3NDIsNi41NDExMSwxNy43NDkzLDYuMzM2LDI2LjM3NS0wLjEyNTEsNy42NjgxOC03LjM5MzIzLDIyLjMzNzktMjMuMzEzNCwzMC4wMzEyLTMxLjg0MzgsNS40MjEzMy00LjMyMTg5LDcuMTUzMi0wLjA2MTIsNS41NjI1NCw4LjcxODc1LTEuNDQ2NjYsNS4wMjgwMy01LjA2ODI2LDEwLjMyMzQtMTQuOTM3NSwxNC4xODc1LTYuNzQyMjYsMy44NDgwNC0xLjY3OTA0LDkuMTUxNDIsMy4zNzUsOS4yNSwyLjc4MTM2LDAuMDU0Miw4LjQyOTIyLTMuMTk3MTYsMTIuNzUtOC4wNjI0Nyw1LjY4NDIyLTYuNDAwNTMsNi4wMjIyNi0xMC42OTc2LDkuMTU2MjUtMjAuNjU2MiwyLjk2MDkxLTQuODU0NDIsOC4yNDk0OS0yLjU4ODU4LDguMjUwMDMsMi41MDAwMi0yLjUzNjQ3LDkuOTc1MTktNC43MTU4MiwxMS43NjM4LTkuODQzNzUsMTUuODQzOC00LjkwNDgyLDQuNjA0OTQsMy40MTUyMyw2LjEzOTYyLDYuMjE4NzMsNC4yNDk5OCw4LjExMDQ0LTUuNDY2NzgsMTEuMDcxMy0xMi41MzgzLDEzLjc4MTItMTguOTY4OCwxLjk1NjA2LTQuNjQxNjYsNy42MzAzOC0yLjM5MTQ4LDUuMDAwMDQsNS4xODc1MS02LjI4NjA1LDE4LjExMjgtMTYuNjE1MiwyNS4yNDQ3LTM0LjY4NzUsMjguOTA2Mi0xLjgzMTU5LDAuMzI1OC0yLjk0ODc2LDEuNDA2NjEtMi4zMTI0NiwzLjUzMTI0LDIuNDI1NTksMi41MTgxMSw0Ljg1NTU5LDQuODAzMDMsNy4yODEyNyw3LjMxMjUtMTEuMTc1MSwzLjI1Mzc3LTIwLjI1NDEsNS4wODE3MS0zMS40Mzc3LDguMzQ0MjEtNS40ODY4NS0zLjU5NzIxLTkuOTE5NC02LjY0OTA5LTE1LjQwNjItMTAuMjUtMS40NDY4NC0zLjM4MjI5LTIuMTIxNDktOC41NDUwNS0xMC4yMTg4LTQuOTA2MjYtNS40ODY4NS0yLjUzNDEzLTguMDE3ODMtMS42MDQ4OC0xMS4wNjI1LDAuOTM3NTMsNC4zOTU0MiwwLjE2MzgsNi4zMDc4MywxLjM0MDkxLDguMDMxMjQsMy4zNDM3NywyLjI1MDA5LDUuOTI2MTQsNy40Mzg3Nyw2LjQ5ODYzLDEyLjc1LDQuODEyNDgsMy40NTUyOCwyLjkxMDc4LDUuMjk1NDIsNS4xNDM1LDguNzQ5OTgsOC4wNjI0Ny02LjQ0OTIyLTAuMjIwNS0xMC45NDIyLTAuMzM0OC0xNy4zNzUtMC41MzEtNi4xNDA3LTYuNTkzNC0xMS4wNDItNi4yMzIyMy0xNS40Mzc1LTEuMDYyNDUtMy4zNTAwNywwLjUxNDgtNC43NzAxOCwwLjU4NjgtNy4wNjI0OCw0LjY1NjI0LDMuNjA1MTMtMS40Nzk2LDUuODczMjItMS45MjMxMiw3LjQzNzUxLTAuMzEyMyw2LjUyODY5LDMuNzg0OTUsMTAuNzkzOCwyLjk0MDEyLDE0LjAzMTMsMCw2LjI5ODc0LDAuMzg1MiwxMS45NzQ2LDAuNzExLDE4LjI4MTIsMS4xMjUtMi4zMTY2LDEuOTY5MTEtNS40OTU4NSwzLjAxMzY1LTcuODEyNTQsNS4wMDAwNC05LjQ2MDMtMi43MDY0OC0xNC4zOTc5LDAuOTM2NjMtMTYuMDYyNSw4LjY1NjI5LTEuMjY3ODMsMy4xMTU3MS0xLjg2MTQ3LDYuMzIzNDktMS4zMTI0Nyw5LjY1NjI2LDAuOTE1NjYtMy4wNDgzOSwyLjM4Nzg4LTUuNjY5MzcsNS4wOTM3My03LjMxMjUsOC40MzIwMSwyLjE0MTgyLDExLjYwMjYtMS4zMDA1LDEyLjA2MjUtNi4zNDM3NCw0LjA2NDQ5LTMuMzE2MzIsMTAuMTkzNS00LjA0NzY2LDE0LjI1LTcuNDA2MjgsNC43NDMsMS41MTgzOSw3LjAzNTc1LDIuNDU4ODksMTEuODEyNSwzLjk2ODczLDEuNjk4Myw1LjE2MDc4LDUuNTQxMyw3LjIwNDIzLDExLjc4MTIsNS44NzUwMiw3LjQyNzk3LDAuMjMzMSw2LjExNjY3LDMuMjgwOTUsNi43MTg3Nyw1LjcxODc4LDEuOTc0MDYtMy41MDEwOSwxLjkxOTA3LTYuOTA1ODgtMi42NTYyNi0xMC0xLjY2NDY0LTQuNTIyNDEtNS4zNTI3NS02LjU3OTE4LTEwLjE4NzUtMy45Njg3My00LjU1MDk0LTEuMjkyMDQtNS43NDc0LTMuMTQ5MS0xMC4yODEyLTQuNDM3NTQsMTEuNDY4MS0zLjY1NTI2LDE5LjYwMy00LjQ3Nzc3LDMxLjA2MjUtOC4xMjUwMiwyLjg2ODQ4LDIuNzA1ODUsNS4xNDE4OCw0LjY0ODQxLDguMDMxMjQsNy4wNjI0OCwxLjUyMjgsMC45MDg5MSwyLjk4MDUzLDEuMTM3ODcsMy44NzUwNCwwLDcuMTgwODMtMTAuMzkzMiwxMC4zODc5LTE5LjU1MjgsMTcuMDYyNS0yNi40MDYyLDIuNTQ5OTctMi44MzU1NCw1Ljc3MTYxLTYuNjYxMzUsOS4zNDM3NS03LjU5Mzc1LDEuNzg2MDUtMC40NjYyLDMuOTc2MzgtMC4xODE4LDUuMzc0OTgsMS4zNDM3OSwxLjM5ODYsMS41MjU0MSwyLjQ5NzIzLDQuMzM2ODMsMi4wMzEzLDguNTMxMjgtMC42Njg3LDYuMDIwODItMi4xMjMzNyw3LjkyMTgtMy44MTI0OSwxMS41MzEyLTEuNjg5MTIsMy42MDk1NC0zLjc1MzM2LDUuODI5NzUtNS44NzUwMiw4LjU5Mzc0LTQuMjQzNDEsNS41Mjc4OS05Ljg0MjQsOC43NDUzOS0xMy4xNTYyLDEwLjkwNjItNi42Mjc2OSw0LjMyMTgtOS40MzA3MywyLjQzMDI3LTE0LjU2MjUsMi4xNTYyMi02LjYzMjczLDAuNzQ0My04LjM5NzU0LDMuOTc0NjctMi45Njg3NCw4LjQzNzUsNS4wNzQ5MiwyLjY0MDUxLDkuNjM2NTIsMi45NjY0OSwxMy4zNDM4LDIuMjgxMjMsMy4xODMxMi0wLjU4ODYsNi45MDgzMS00LjY5NzEsOS41NjI1LTYuOTA2MjQsMi45ODc2NC0zLjQ1MTUsNy45NDA5NywwLjY0MTcsNC41NjI0Niw0LjY1NjI0LTYuMTM5MzUsNy4yOTQ3Ny0xMi4yNzM4LDEyLjEwNDQtMTkuODQzOCwxMi03Ljk1NDY1LDEuMDcwNTUtNi40NjY2OCw1LjU0MDA0LTEuMTg3NDYsNy43MTg3Niw5LjUwMTE3LDMuOTIxMjEsMTguMDc5Ni0zLjQyMzUxLDIyLjQzNzUtOC4yNTAwMywzLjM2MjIyLTMuNjc4MzksNS43NTAyOC0zLjgyMTg1LDUuMTU2MjgsMS44NzQ5Ny0zLjMzNzgzLDEwLjMxMzYtNy44OTkxMiwxNC4yOTc3LTE1LjM0MzgsMTQuODEyNS02LjAzODU1LTAuNTYwNy02LjEwMzgsNC4xMDA1OC0xLjY4NzUsNy4yNTAwNCwxMC4wNjAzLDYuOTYzMjEsMTcuMzQ1OS00Ljg5NDc0LDIwLjc1LTEyLjA2MjUsMi40MjU2OC02LjQ2NTY5LDYuMTQ2MTktMy4zOTA5Myw2LjUzMTMsMS45Mzc1MiwwLjA1MDIsNy4xMTkzNi0zLjE2Njc0LDEyLjkzMjEtMTEuNzgxMiwyMC4yMTg3LDYuNTkxMTUsMTAuNTAxNSwxNC4yNzUyLDIxLjE4MjksMjAuODc0OSwzMS43MTg4bDIwLjAwNS0yMjIuODA2LTIwLTM1LjIwMmMtMi4wODMwNS0xLjkyMzEyLTkuMTI3NzctMTAuMjIzLTEwLjk2ODYtMTEuMzc1LTAuNjcxNC0wLjcxNzMtMS4wNzk3My0xLjIyNDA5LTAuMDkzNi0xLjU5MzcyLDAuOTUzNjQtMC4zNTczLDMuMTg1OTEtMC43NTc4LDQuNjg3NDctMS4wMzEyMi00LjI0MTctNC4yNDg5LTcuODc2NjItNS42MTE1OS0xNS45MDY1LTcuOTM3MjgsMS45NTY4Ny0wLjgzMzQsMy44NjAzNy0wLjM0ODMsOS42MjUtMC42MjQ2LTIuMjg4Ni0zLjI0ODY4LTcuNDAwMjgtOC4yMjQ4Mi0xNC0xMC42MjU0LDQuMzU4NTItMy4wOTg1Miw1LjIwNzg1LTMuMzA2MTcsOS41MzEyNi02LjkzNzQ5LTcuNDg2NTYtMC41MzEtMTMuODc5OC0xLjk1NzEyLTIwLjMxMjUtMy45MDYyNS00LjA2NjkyLTEuOTAxNjEtOS43MTUzOS0zLjUxNjE1LTEyLjQ2ODctMy41NjI1MXptMC43MTkxLDguNzE4NzVjMy45NTYyMiwwLDYuNDA2MjksMS4zNTYxMiw2LjQwNjI5LDIuOTk5OTcsMCwxLjY3MjM4LTIuNDUwMDcsMy4wMzEyOS02LjQwNjI5LDMuMDMxMjktMy45Mzk3NSwwLTYuNDM3NTItMS40ODI5My02LjQzNzUyLTMuMTU2MjEsMC4wMDA3MS0xLjY0Mzg1LDIuNDk3NzctMi44NzUwNSw2LjQzNzUyLTIuODc1MDV6IiBmaWxsPSIjMDAwIi8+PHVzZSB4bGluazpocmVmPSIjaGFsZiIgdHJhbnNmb3JtPSJtYXRyaXgoLTEsMCwwLDEsNzAwLDApIi8+PC9zdmc+';
						}else if(item.unit == 'GBP'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2aWV3Qm94PSIwIDAgNjAgMzAiIGhlaWdodD0iNjAwIj4NCjxkZWZzPg0KPGNsaXBQYXRoIGlkPSJ0Ij4NCjxwYXRoIGQ9Im0zMCwxNWgzMHYxNXp2MTVoLTMwemgtMzB2LTE1enYtMTVoMzB6Ii8+DQo8L2NsaXBQYXRoPg0KPC9kZWZzPg0KPHBhdGggZmlsbD0iIzAwMjQ3ZCIgZD0ibTAsMHYzMGg2MHYtMzB6Ii8+DQo8cGF0aCBzdHJva2U9IiNmZmYiIHN0cm9rZS13aWR0aD0iNiIgZD0ibTAsMGw2MCwzMG0wLTMwbC02MCwzMCIvPg0KPHBhdGggc3Ryb2tlPSIjY2YxNDJiIiBzdHJva2Utd2lkdGg9IjQiIGQ9Im0wLDBsNjAsMzBtMC0zMGwtNjAsMzAiIGNsaXAtcGF0aD0idXJsKCN0KSIvPg0KPHBhdGggc3Ryb2tlPSIjZmZmIiBzdHJva2Utd2lkdGg9IjEwIiBkPSJtMzAsMHYzMG0tMzAtMTVoNjAiLz4NCjxwYXRoIHN0cm9rZT0iI2NmMTQyYiIgc3Ryb2tlLXdpZHRoPSI2IiBkPSJtMzAsMHYzMG0tMzAtMTVoNjAiLz4NCjwvc3ZnPg0K';
						}else if(item.unit == 'UAH'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjAwIDgwMCI+DQo8cGF0aCBmaWxsPSIjM2E3NWM0IiBkPSJtMCwwaDEyMDB2ODAwaC0xMjAweiIvPg0KPHBhdGggZmlsbD0iI2Y5ZGQxNiIgZD0ibTAsNDAwaDEyMDB2NDAwaC0xMjAweiIvPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'EUR'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHdpZHRoPSI4MTAiIGhlaWdodD0iNTQwIiB2aWV3Qm94PSIwIDAgODEwIDU0MCI+DQo8ZGVmcz48ZyBpZD0icyI+PGcgaWQ9ImMiPjxwYXRoIGlkPSJ0IiBkPSJNMCwwdjFoMC41eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCwtMSlyb3RhdGUoMTgpIi8+PHVzZSB4bGluazpocmVmPSIjdCIgdHJhbnNmb3JtPSJzY2FsZSgtMSwxKSIvPjwvZz48ZyBpZD0iYSI+PHVzZSB4bGluazpocmVmPSIjYyIgdHJhbnNmb3JtPSJyb3RhdGUoNzIpIi8+PHVzZSB4bGluazpocmVmPSIjYyIgdHJhbnNmb3JtPSJyb3RhdGUoMTQ0KSIvPjwvZz48dXNlIHhsaW5rOmhyZWY9IiNhIiB0cmFuc2Zvcm09InNjYWxlKC0xLDEpIi8+PC9nPjwvZGVmcz4NCjxyZWN0IGZpbGw9IiMwMzkiIHdpZHRoPSI4MTAiIGhlaWdodD0iNTQwIi8+PGcgZmlsbD0iI2ZjMCIgdHJhbnNmb3JtPSJzY2FsZSgzMCl0cmFuc2xhdGUoMTMuNSw5KSI+PHVzZSB4bGluazpocmVmPSIjcyIgeT0iLTYiLz48dXNlIHhsaW5rOmhyZWY9IiNzIiB5PSI2Ii8+PGcgaWQ9ImwiPjx1c2UgeGxpbms6aHJlZj0iI3MiIHg9Ii02Ii8+PHVzZSB4bGluazpocmVmPSIjcyIgdHJhbnNmb3JtPSJyb3RhdGUoMTUwKXRyYW5zbGF0ZSgwLDYpcm90YXRlKDY2KSIvPjx1c2UgeGxpbms6aHJlZj0iI3MiIHRyYW5zZm9ybT0icm90YXRlKDEyMCl0cmFuc2xhdGUoMCw2KXJvdGF0ZSgyNCkiLz48dXNlIHhsaW5rOmhyZWY9IiNzIiB0cmFuc2Zvcm09InJvdGF0ZSg2MCl0cmFuc2xhdGUoMCw2KXJvdGF0ZSgxMikiLz48dXNlIHhsaW5rOmhyZWY9IiNzIiB0cmFuc2Zvcm09InJvdGF0ZSgzMCl0cmFuc2xhdGUoMCw2KXJvdGF0ZSg0MikiLz48L2c+PHVzZSB4bGluazpocmVmPSIjbCIgdHJhbnNmb3JtPSJzY2FsZSgtMSwxKSIvPjwvZz4NCjwvc3ZnPg==';
						}else if(item.unit == 'CZK'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNjAwIiB2aWV3Qm94PSIwIDAgNiA0Ij4NCjxwYXRoIGZpbGw9IiNkNzE0MWEiIGQ9Im0wLDBoNnY0aC02eiIvPg0KPHBhdGggZmlsbD0iI2ZmZiIgZD0ibTAsMGg2djJoLTZ6Ii8+DQo8cGF0aCBmaWxsPSIjMTE0NTdlIiBkPSJtMywybC0zLTJ2NHoiLz4NCjwvc3ZnPg0K';
						}else if(item.unit == 'HRK'){
							flag = 'data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI1MDBweCIgaGVpZ2h0PSIyNTQuMnB4IiB2aWV3Qm94PSIwIDAgNTAwIDI1NC4yIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MDAgMjU0LjIiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxnPjxyZWN0IHg9IjAuMyIgeT0iMiIgZmlsbD0iI0VEMjAyNCIgd2lkdGg9IjQ5OS43IiBoZWlnaHQ9Ijg0LjciLz48cmVjdCB4PSIwLjMiIHk9Ijg0LjMiIGZpbGw9IiNGREZERkUiIHdpZHRoPSI0OTkuNyIgaGVpZ2h0PSI4NC43Ii8+PHJlY3QgeD0iMC4zIiB5PSIxNjkiIGZpbGw9IiMyRDMxODkiIHdpZHRoPSI0OTkuNyIgaGVpZ2h0PSI4NC43Ii8+PC9nPjxwYXRoIGZpbGw9Im5vbmUiIHN0cm9rZT0iI0ZERkRGRSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBkPSJNMjAzLjEsODMuMWwtMTAuNi0yNC45bDguNy0xNC4zbDEzLjcsNUwyMjUuNSwzN2wxMi41LDcuNWwxMi41LTguN2wxMS4yLDkuM2wxMy43LTYuOWwxMCwxMC42bDEzLjctNi4ybDguNywxNWwtMTEuMiwyNC45Ii8+PHBhdGggZmlsbD0iIzI0OTFEMCIgZD0iTTIwMS4zLDQ0LjFsLTguNiwxNC4xbDEwLjUsMjQuOWMwLDAsMTUuMi02LjcsMTguOC02LjdsLTcuMS0yNy41TDIwMS4zLDQ0LjF6Ii8+PHBhdGggZmlsbD0iIzJEMzE4OSIgZD0iTTIyNS42LDM3LjNMMjE0LjksNDlsNywyNy43Yy0wLjEtMC40LDEyLjMtMy4zLDE4LjgtMy43TDIzOCw0NC43TDIyNS42LDM3LjN6Ii8+PHBhdGggZmlsbD0iIzJEMzE4OSIgZD0iTTI3NS4zLDM4LjVMMjg1LjUsNDlMMjc5LDc1LjdjMC4xLTAuNC0xMy0yLjktMTkuNi0zLjRsMi4yLTI2LjlMMjc1LjMsMzguNXoiLz48cGF0aCBmaWxsPSIjRUQyMDI0IiBkPSJNMjM4LDQ0LjdsMC44LDcuMWMwLDAtMjAuNCwyLjUtMjIuMiwzLjlsLTEuNy02LjhDMjE0LjksNDguOSwyMjQuOCw0NSwyMzgsNDQuN3oiLz48cGF0aCBmaWxsPSIjRUQyMDI0IiBkPSJNMjE3LjksNjFsMS45LDcuM2MwLDAsOC44LTMuMywyMC4zLTMuOWwtMC43LTdDMjM5LjQsNTcuNCwyMjEsNTkuMywyMTcuOSw2MXoiLz48cGF0aCBmaWxsPSIjMjQ5MUQwIiBkPSJNMjM4LDQ0LjdsMTIuNC04LjhsMTEuMiw5LjRsLTIuMSwyNy4yYy00LjktMC45LTE1LjctMC4xLTE4LjgsMC40TDIzOCw0NC43eiIvPjxwYXRoIGZpbGw9IiNFRDIwMjQiIGQ9Ik0yNjcuMiw1MS45YzAsMCwyLjctMi41LDUuNy0wLjhjMCwwLDEuOCwxLjMsNC41LDEuMmwtMy40LDAuNmMwLDAsMiwxLjcsNC44LDEuOWMwLDAtNC4zLDEuMi01LjgtMS40YzAsMC0xLjEtMi01LjQtMC44TDI2Ny4yLDUxLjl6Ii8+PHBhdGggZmlsbD0iI0VBRTcxQyIgc3Ryb2tlPSIjMDMwMjAyIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTI2NC44LDUxLjVsMS42LDAuMWwwLDAuNmwzLjIsMGwxLjEsMC44bC0xLjgsMC43bC0wLjIsMS4xYzAsMCwxLjUsMyw3LjcsMy4xbDMuNiwwbC0yLjUsM2wwLjMsMmwtMS43LDIuMmwtMS41LDJsLTEuMy0wLjFsMS41LTEuNmMwLDAsMC41LTItMS4zLTEuM2wtMi41LDIuNGwtMC44LTAuNmwxLjQtMS42bC0wLjEtMS4xaC0yLjRsLTEuNCwzLjFsLTAuOS0wLjJjMCwwLDAuOC0xLjIsMS4xLTIuOGMwLDAsMC0yLTEuMS0wLjFsLTAuNCwxLjdsLTEuMi0wLjNjMCwwLDEuMy0yLjEsMS4zLTMuNGMwLDAtMS41LTIuNSwwLjEtMy42di0yLjZsLTEuMywwbC0wLjYtMC44bDEuMy0xLjNMMjY0LjgsNTEuNXoiLz48ZWxsaXBzZSBmaWxsPSIjRUQyMDI0IiBjeD0iMjY1LjYiIGN5PSI2NSIgcng9IjAuOCIgcnk9IjAuNSIvPjxlbGxpcHNlIGZpbGw9IiNFRDIwMjQiIGN4PSIyNjcuMiIgY3k9IjY2LjYiIHJ4PSIwLjgiIHJ5PSIwLjUiLz48ZWxsaXBzZSBmaWxsPSIjRUQyMDI0IiBjeD0iMjcwLjUiIGN5PSI2Ni41IiByeD0iMC44IiByeT0iMC41Ii8+PGVsbGlwc2UgZmlsbD0iI0VEMjAyNCIgY3g9IjI3NCIgY3k9IjY3LjQiIHJ4PSIwLjgiIHJ5PSIwLjUiLz48cGF0aCBmaWxsPSIjMjQ5MUQwIiBkPSJNMjk4LjksNDIuOWwtMTMuNCw2LjJsLTYuNCwyNi4zYzAsMCwxNSw0LjgsMTcuNSw2LjlsMTAuOS0yNC42TDI5OC45LDQyLjl6Ii8+PHBhdGggZmlsbD0iI0ZERkRGRSIgZD0iTTI4My4yLDU4LjRsLTAuNSwxLjhjMCwwLDE2LjIsNCwyMC42LDcuMWwwLjgtMS45QzMwNC4xLDY1LjQsMjg1LjIsNTcuNSwyODMuMiw1OC40eiIvPjxwYXRoIGZpbGw9IiNGREZERkUiIGQ9Ik0yODAuOSw2Ny45bC0wLjQsMS44YzAsMCwxNC42LDQsMTguNyw3LjFsMC43LTEuOUMyOTkuOCw3NC45LDI4Mi43LDY3LjEsMjgwLjksNjcuOXoiLz48cGF0aCBmaWxsPSIjRUQyMDI0IiBkPSJNMjgyLjUsNjEuMWwtMS41LDYuMWMwLDAsMTUuNyw0LjIsMTkuMyw2LjhsMi42LTUuOUMzMDIuOSw2OCwyODUuMSw2MC4zLDI4Mi41LDYxLjF6Ii8+PHBhdGggZmlsbD0ibm9uZSIgc3Ryb2tlPSIjRkRGREZFIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIGQ9Ik0yOTYuNiw4Mi41YzAsMC0zNy40LTIzLjctOTMuNCwwLjYiLz48cG9seWdvbiBmaWxsPSIjRjZEQjEzIiBzdHJva2U9IiNGREZERkUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRzPSIyMDQuNSw1NS45IDIwNy4yLDU1IDIwNi4xLDU3LjYgMjA4LjIsNTkuNCAyMDUuNCw1OS43IDIwNC45LDYyLjUgMjAzLjIsNjAuMyAyMDAuNSw2MS4yIDIwMS42LDU4LjYgMTk5LjUsNTYuOCAyMDIuMyw1Ni40IDIwMi44LDUzLjcgIi8+PHBhdGggZmlsbD0iI0ZERkRGRSIgc3Ryb2tlPSIjMkIzOTkwIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgZD0iTTIxMy43LDY0LjljMCwwLTMsMTQtMTMuMiw0LjhjMCwwLDIuNiw2LjQsOS4xLDQuNEMyMDkuNyw3NC4yLDIxNS44LDcyLDIxMy43LDY0Ljl6Ii8+PHBvbHlnb24gZmlsbD0iI0VBRTcxQyIgc3Ryb2tlPSIjNDk0ODFEIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRzPSIyNTEuNSw0Ny42IDI1NCw0OC4zIDI1NS43LDQ2LjYgMjU3LjMsNDguMiAyNTkuNCw0Ny4zIDI1OC4zLDQ5LjggMjYwLDQ5LjggMjU4LjksNTEuNSAyNjAsNTEuNSAyNTguOSw1Mi43IDI1OS44LDUzLjkgMjU4LjgsNTMuOCAyNTkuMSw1NC44IDI1OC4xLDU0LjcgMjU4LjQsNTUuOCAyNTcuMSw1NS41IDI1Ny4yLDU2LjUgMjU2LjIsNTUuNiAyNTYuMiw1Ni45IDI1NSw1Ni45IDI1NSw1NS43IDI1My40LDU1LjkgMjUzLjYsNTQuOSAyNTIuNiw1NS4yIDI1My4yLDU0LjQgMjUyLjEsNTQuNCAyNTIuNSw1My4zIDI1Mi41LDUyLjggMjUxLjIsNTIuOCAyNTEuMiw1MS45IDI1Mi4xLDUxLjkgMjUyLjEsNTAuNyAyNTEuNCw0OS43IDI1My4yLDQ5LjYgIi8+PGVsbGlwc2UgZmlsbD0iIzQ5NDgxRCIgY3g9IjI1NC41IiBjeT0iNTEuNSIgcng9IjAuNSIgcnk9IjAuNSIvPjxlbGxpcHNlIGZpbGw9IiM0OTQ4MUQiIGN4PSIyNTYuNiIgY3k9IjUxLjUiIHJ4PSIwLjUiIHJ5PSIwLjQiLz48ZWxsaXBzZSBmaWxsPSIjNDk0ODFEIiBjeD0iMjU1LjUiIGN5PSI1Mi44IiByeD0iMC41IiByeT0iMC41Ii8+PHBvbHlnb24gZmlsbD0iI0VBRTcxQyIgc3Ryb2tlPSIjNDk0ODFEIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRzPSIyNDAuNyw0Ny42IDI0My4yLDQ4LjMgMjQ0LjksNDYuNiAyNDYuNSw0OC4yIDI0OC42LDQ3LjMgMjQ3LjUsNDkuOCAyNDkuMiw0OS44IDI0OC4xLDUxLjUgMjQ5LjIsNTEuNSAyNDguMSw1Mi43IDI0OSw1My45IDI0OCw1My44IDI0OC4zLDU0LjggMjQ3LjMsNTQuNyAyNDcuNiw1NS44IDI0Ni4zLDU1LjUgMjQ2LjQsNTYuNSAyNDUuNCw1NS42IDI0NS40LDU2LjkgMjQ0LjIsNTYuOSAyNDQuMiw1NS43IDI0Mi42LDU1LjkgMjQyLjgsNTQuOSAyNDEuOCw1NS4yIDI0Mi40LDU0LjQgMjQxLjMsNTQuNCAyNDEuNyw1My4zIDI0MS43LDUyLjggMjQwLjQsNTIuOCAyNDAuNCw1MS45IDI0MS4zLDUxLjkgMjQxLjMsNTAuNyAyNDAuNiw0OS43IDI0Mi40LDQ5LjYgIi8+PGVsbGlwc2UgZmlsbD0iIzQ5NDgxRCIgY3g9IjI0My43IiBjeT0iNTEuNSIgcng9IjAuNSIgcnk9IjAuNSIvPjxlbGxpcHNlIGZpbGw9IiM0OTQ4MUQiIGN4PSIyNDUuOCIgY3k9IjUxLjUiIHJ4PSIwLjUiIHJ5PSIwLjQiLz48ZWxsaXBzZSBmaWxsPSIjNDk0ODFEIiBjeD0iMjQ0LjciIGN5PSI1Mi44IiByeD0iMC41IiByeT0iMC41Ii8+PHBvbHlnb24gZmlsbD0iI0VBRTcxQyIgc3Ryb2tlPSIjNDk0ODFEIiBzdHJva2Utd2lkdGg9IjAuMjUiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRzPSIyNDYuMSw1OS42IDI0OC42LDYwLjQgMjUwLjMsNTguNyAyNTEuOSw2MC4yIDI1NCw1OS40IDI1Mi45LDYxLjkgMjU0LjYsNjEuOSAyNTMuNSw2My42IDI1NC42LDYzLjYgMjUzLjUsNjQuNyAyNTQuNCw2NS45IDI1My40LDY1LjggMjUzLjcsNjYuOCAyNTIuNyw2Ni43IDI1Myw2Ny44IDI1MS43LDY3LjYgMjUxLjgsNjguNSAyNTAuOCw2Ny42IDI1MC44LDY5IDI0OS42LDY5IDI0OS42LDY3LjcgMjQ4LDY4IDI0OC4yLDY2LjkgMjQ3LjIsNjcuMyAyNDcuOCw2Ni41IDI0Ni43LDY2LjUgMjQ3LjEsNjUuNCAyNDcuMSw2NC44IDI0NS44LDY0LjggMjQ1LjgsNjQgMjQ2LjcsNjQgMjQ2LjcsNjIuNyAyNDYsNjEuNyAyNDcuOCw2MS43ICIvPjxlbGxpcHNlIGZpbGw9IiM0OTQ4MUQiIGN4PSIyNDkuMSIgY3k9IjYzLjYiIHJ4PSIwLjUiIHJ5PSIwLjUiLz48ZWxsaXBzZSBmaWxsPSIjNDk0ODFEIiBjeD0iMjUxLjIiIGN5PSI2My41IiByeD0iMC41IiByeT0iMC40Ii8+PGVsbGlwc2UgZmlsbD0iIzQ5NDgxRCIgY3g9IjI1MC4xIiBjeT0iNjQuOCIgcng9IjAuNSIgcnk9IjAuNSIvPjxwb2x5Z29uIGZpbGw9IiNGNkRCMTMiIHN0cm9rZT0iI0ZERkRGRSIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludHM9IjI5Nyw1MS4zIDI5OS43LDUyIDI5Ny4zLDUzLjUgMjk4LjEsNTYuMiAyOTUuNiw1NC45IDI5My42LDU2LjkgMjkzLjUsNTQuMSAyOTAuNyw1My40IDI5My4xLDUxLjkgMjkyLjQsNDkuMiAyOTQuOSw1MC40IDI5Ni45LDQ4LjQgIi8+PHBhdGggZD0iTTI4Mi41LDYyLjhsMCwwLjZMMjg0LDY0bDEuMywxLjloLTIuOGwwLjEsMC40bDMtMC4zbDEuNywwLjloLTEuOWwwLjEsMC42bDMuNC0wLjJsMy4yLDAuNWwtMywwLjNsMC4zLDAuOWgzLjFsMywwLjhjMCwwLDAuNSwwLjctMC42LDAuNmwwLjMsMC44bDEuMy0wLjJjMCwwLDEtMi0xLjEtMi4zbC0wLjEtMS4zbDMuOSwxLjlsMC42LTEuOGwtNC40LTEuMmMwLDAtMy4zLTEuNy01LjQtMC45bC0zLjktMS45bC0wLjMtMS40TDI4Mi41LDYyLjh6Ii8+PHBhdGggZmlsbD0iI0ZERkRGRSIgZD0iTTI1Miw4My41TDI1Miw4My41YzAsMC0wLjksMC0xLDBjLTAuMSwwLDEsMC0xLDB2MC4xYy00LDAuMy00Ny0wLjEtNDctMC4xdjY0YzEwLDM5LjgsNDQsNDEuOCw0Nyw0MS45djBjMCwwLDAuOSwwLDEsMGMwLjEsMCwxLDAsMSwwdjBjMy0wLjEsMzYtMi4yLDQ1LTQxLjl2LTY0QzI5Nyw4My41LDI1Niw4My45LDI1Miw4My41eiIvPjxyZWN0IHg9IjIwNS4xIiB5PSI4NS44IiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjQxLjkiIHk9Ijg1LjgiIGZpbGw9IiNFRDIwMjQiIHdpZHRoPSIxNy43IiBoZWlnaHQ9IjIwLjQiLz48cmVjdCB4PSIyMjMuNiIgeT0iMTA2LjMiIGZpbGw9IiNFRDIwMjQiIHdpZHRoPSIxNy43IiBoZWlnaHQ9IjIwLjQiLz48cmVjdCB4PSIyNjAiIHk9IjEwNi4zIiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjIzLjYiIHk9IjE0Ni4yIiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjYwIiB5PSIxNDYuMiIgZmlsbD0iI0VEMjAyNCIgd2lkdGg9IjE3LjciIGhlaWdodD0iMjAuNCIvPjxyZWN0IHg9IjI3OC40IiB5PSI4NS44IiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjA1LjEiIHk9IjEyNi4xIiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjQxLjkiIHk9IjEyNi4xIiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHJlY3QgeD0iMjc4LjQiIHk9IjEyNi4xIiBmaWxsPSIjRUQyMDI0IiB3aWR0aD0iMTcuNyIgaGVpZ2h0PSIyMC40Ii8+PHBhdGggZmlsbD0iI0VEMjAyNCIgZD0iTTIxMiwxNjYuNmMwLDAsNCw1LjIsMTAsMTAuNHYtMTAuNEMyMjIsMTY2LjYsMjExLjgsMTY2LjgsMjEyLDE2Ni42eiIvPjxwYXRoIGZpbGw9IiNFRDIwMjQiIGQ9Ik0yODgsMTY2LjZjMCwwLTMsNS4yLTEwLDEwLjR2LTEwLjRDMjc4LDE2Ni42LDI4OC4yLDE2Ni44LDI4OCwxNjYuNnoiLz48cGF0aCBmaWxsPSIjRUQyMDI0IiBkPSJNMjQxLjMsMTY2LjlIMjYwdjE4LjhjMCwwLTEwLjYsMy4zLTE4LjUsMC4yQzI0MS41LDE4NS44LDI0MS4zLDE2NS45LDI0MS4zLDE2Ni45eiIvPjwvc3ZnPg==';
						}else if(item.unit == 'PLN'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjgwIDgwMCI+DQo8cGF0aCBmaWxsPSIjZTllOGU3IiBkPSJtMCwwaDEyODB2NDAwaC0xMjgweiIvPg0KPHBhdGggZmlsbD0iI2Q0MjEzZCIgZD0ibTAsNDAwaDEyODB2NDAwaC0xMjgweiIvPg0KPC9zdmc+DQo=';
						}else if(item.unit == 'HUF'){
							flag = 'data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjAwIDYwMCI+DQo8cGF0aCBmaWxsPSIjY2UxMTI2IiBkPSJtMCwwaDEyMDB2NjAwaC0xMjAweiIvPg0KPHBhdGggZmlsbD0iI2ZmZiIgZD0ibTAsMjAwaDEyMDB2NDAwaC0xMjAweiIvPg0KPHBhdGggZmlsbD0iIzAwODc1MSIgZD0ibTAsNDAwaDEyMDB2MjAwaC0xMjAweiIvPg0KPC9zdmc+DQo=';
						}
						
						$('.exchange_rate_wrap ul').append(
							'<li>' +
								'<span>' +
									'<span class="flagg" style="background-image: url(' + flag + ')"></span>' +
									'<span class="dataa">' +
										'<span>' + item.nation + '</span>&nbsp;&nbsp;-&nbsp;&nbsp;<span class="unitt">' + item.unit + '</span>' +
									'</span>' +
								'</span>' +
								'<span class="exchange_ratee">' + makeComma(item.exchangeRate) + '</span>' +
							'</li>'
						);
					});
				}
			})
		}
		function convert(){
			$.ajax({
				url		: '/wallet/json/convert',
				method	: 'POST',
				headers	: {
					'Accept'		: 'Application/json',
					'Content-Type'	: 'Application/json'
				},
				data	: JSON.stringify({
					from	: $('#from').val(),
					to		: $('#to').val(),
					amount	: $('#amount').val()
				}),
				error	: function(request, status, error) {
					//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
			    },
				success	: function(JSONData, status) {
					//console.log('[SUCCESS]\nRESULT : ' + JSONData);
					
					$('#exchange_result').val(makeComma(JSONData.exchangeRate*$('#amount').val()));
				}
			});
		}
		
		// 현재 날짜 및 시간
		function currentTime() {
			var day = new Date();
			
			return day.getFullYear() + '년 ' + (day.getMonth()+1) + '월 ' + day.getDate() + '일 ' + day.getHours() + ':' + day.getMinutes();
		}
		
		// 세자리 콤마
		function makeComma(db) {
			//console.log(db);
			//console.log(db.toLocaleString(undefined, {maximumFractionDigits : 2}));
			
			return db.toLocaleString(undefined, {maximumFractionDigits : 2});
		}
	</script>
</section><!-- //exchange_rate_wrap -->