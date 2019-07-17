<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<input type="hidden" name="walletCode" value="1" />
<input type="hidden" name="part" value="0" />
<input type="hidden" name="category" value="0" />
<div class="pop_wrap clear">
	<div class="pop_left">
		<div class="result_top">
			<input type="text" class="date_time" name="regDate" readonly />
		
			<select class="unit_selec" name="moneyUnit">
				<option value="KRW">KRW</option>
				<option value="EUR">EUR</option>
			</select>
			<div class="result">
				<input type="text" class="price" name="price" value="" alt="금액 입력칸에 입력해주세요.">
				<span class="krw_price">KRW 2,644.80</span>
			</div>
		</div><!-- //result_top -->
		
		<div class="apply_exchange_rate">
			<span>환율</span>
			<div>
				<span>EUR 1.00 = KRW <span>1,322.40</span></span><br/>
				<input type="hidden" class="exchange_rate" name="exchangeRate" value="1322.40">
				<input type="button" class="exchange_rate_btn" value="환율 수동 설정">
			</div>
		</div><!-- //apply_exchange_rate -->
		
		<div class="item">
			<input type="text" name="item" placeholder="항목명을 기입해주세요." />
		</div>
		
		<div class="option_wrap clear">
			<div class="pay_option_selec">
				<span class="txt">유형 선택</span>
				<span class="pay_option_wrap">
					<input type="radio" id="no" class="pay_option" name="payOption" value="0" checked /><label for="no"><i class="fas fa-wallet"></i><br/><span class="txt">구분<br/>없음</span></label>
				</span>
				<span class="pay_option_wrap">
					<input type="radio" id="cash" class="pay_option" name="payOption" value="1" /><label for="cash"><i class="fas fa-money-bill-alt"></i><br/><span class="txt">현금</span></label>
				</span>
				<span class="pay_option_wrap">
					<input type="radio" id="card" class="pay_option" name="payOption" value="2" /><label for="card"><i class="fas fa-credit-card"></i><br/><span class="txt">카드</span></label>
				</span>
			</div><!-- //pay_option_selec -->
			
			<div class="add_option_selec">
				<span class="txt">추가 입력</span>
				<span class="add_option_wrap">
					<a href="javascript:void(0);"><i class="far fa-file-alt"></i><br/><span class="txt">메모</span></a>
				</span>
				<span class="add_option_wrap">
					<label for="file" class="file"><i class="far fa-image"></i><br/><span class="txt">사진</span></label>
					<input type="file" name="file" id="file">
				</span>
			</div><!-- //add_option_selec -->
		</div><!-- //option_wrap -->
	</div><!-- //pop_left -->
	
	<div class="cal_btns">
		<div class="clear">
			<input type="text" class="expression" name="expression" placeholder="금액을 입력해주세요."><input type="button" class="cal_btn ac" value="AC">
		</div>
		<div class="clear">
			<div class="cal_left">
				<div>
					<input type="button" class="cal_btn" value="1"><input type="button" class="cal_btn" value="2"><input type="button" class="cal_btn" value="3">
				</div>
				<div>
					<input type="button" class="cal_btn" value="4"><input type="button" class="cal_btn" value="5"><input type="button" class="cal_btn" value="6">
				</div>
				<div>
					<input type="button" class="cal_btn" value="7"><input type="button" class="cal_btn" value="8"><input type="button" class="cal_btn" value="9">
				</div>
				<div>
					<input type="button" class="cal_btn" value="0"><input type="button" class="cal_btn real" value="."><input type="button" class="cal_btn back" value="back">
				</div>
			</div>
			<div class="cal_right">
				<input type="button" class="cal_btn operator" value="+"><input type="button" class="cal_btn operator" value="-"><input type="button" class="cal_btn operator" value="*"><input type="button" class="cal_btn operator" value="/">
			</div>
		</div>
		<div class="act_btns">
			<button class="act_btn save_btn">저장</button><a href="javascript:void(0);" class="act_btn close_btn">취소</a>
		</div>
	</div><!-- //cal_btns -->
</div><!-- //pop_wrap -->