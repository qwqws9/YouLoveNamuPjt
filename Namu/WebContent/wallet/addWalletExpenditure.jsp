<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" name="walletCode" value="1" />
<input type="hidden" name="part" value="1" />

<div class="pop_wrap clear">
	<div class="pop_left">
		<div class="result_top">
			<input type="text" class="date_time" name="regDate" readonly />

			<select class="unit_selec" name="moneyUnit">
				<option value="KRW">KRW</option>
				<option value="EUR">EUR</option>
			</select>
			<div class="result">
				<input type="text" class="price" id="price" name="price" value="" alt="하단 금액 입력칸에 입력해주세요.">
				<span class="krw_price"><span>KRW 14,564.00</span></span>
			</div>
		</div><!-- //result_top -->
		
		<div class="category_wrap">
			<div>
				<span class="category_selec">
					<input type="radio" id="category_1" class="category" name="category" value="1" /><label for="category_1"><i class="fas fa-utensils"></i><br/><span class="txt">식비</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_2" class="category" name="category" value="2" /><label for="category_2"><i class="fas fa-shopping-cart"></i><br/><span class="txt">쇼핑</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_3" class="category" name="category" value="3" /><label for="category_3"><i class="fas fa-landmark"></i><br/><span class="txt">관광</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_4" class="category" name="category" value="4" /><label for="category_4"><i class="fas fa-plane"></i><br/><span class="txt">항공</span></label>
				</span>
			</div>
			<div>
				<span class="category_selec">
					<input type="radio" id="category_5" class="category" name="category" value="5" /><label for="category_5"><i class="fas fa-subway"></i><br/><span class="txt">교통</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_6" class="category" name="category" value="6" /><label for="category_6"><i class="fas fa-bed"></i><br/><span class="txt">숙박</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_7" class="category" name="category" value="7" /><label for="category_7"><i class="fas fa-skating"></i><br/><span class="txt">액티비티</span></label>
				</span>
				<span class="category_selec">
					<input type="radio" id="category_8" class="category" name="category" value="8" checked /><label for="category_8"><i class="fas fa-ellipsis-h"></i><br/><span class="txt">기타</span></label>
				</span>
			</div>
		</div>
		
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
			<input type="text" class="expression" id="expression" name="expression" placeholder="금액을 입력해주세요."><input type="button" class="cal_btn ac" value="AC">
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