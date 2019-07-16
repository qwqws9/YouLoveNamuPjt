<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>YouLovePlan</title>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    
    <!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/wallet.css">
	<script type="text/javascript" src="/resources/javascript/wallet.js"></script>
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<div class="wrap">
		<h2 class="skip">내 가계부</h2>
		
		<a href="javascript:void(0);" class="pre_btn">
			<i class="fas fa-angle-left"></i>&nbsp;&nbsp;&nbsp;<span>내 가계부 목록으로</span>
		</a>
		<a href="javascript:void(0);" class="next_btn">결산 보고서 조회</a>
		
		<section class="sec_wrap clear">
			<h3 class="skip">가계부 내역</h3>
			
			<form class="search_form" name="search_form">
				<label for="searchKeyword" class="skip">검색어</label>
				<input type="text" class="search_txt" id="searchKeyword" name="searchKeyword" placeholder="내역 항목명을 입력하세요." value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
				<button type="submit" class="search_btn">검색</button>
			</form>
			
			<nav class="left_nav">
				<a class="day_btn rounded-circle"><span>All</span></a>
				<a class="day_btn rounded-circle"><span>준비</span></a>
				
				<span class="day_btn">8월</span>
				<a class="day_btn rounded-circle"><span>21</span><span class="skip">일</span></a>
				<a class="day_btn rounded-circle"><span>22</span><span class="skip">일</span></a>
				<a class="day_btn rounded-circle"><span>23</span><span class="skip">일</span></a>
			</nav>
			
			<div class="right_table">
				<div class="total_table clear">
					<div class="total_budget">
						<span>총 예산</span><span>€ 2500.00</span>
					</div>
					<div class="total_price">
						<div class="total_floating">
							<span>쓴 돈</span><span>€ 2500.00</span>
						</div>
						<div class="total_floating">
							<span>남은 돈</span><span>€ 2500.00</span>
						</div>
					</div>
				</div><!-- //total_table -->
				
				<div class="plus_btns">
					<a href="javascript:void(0);" class="modal_btn">예산 추가 <i class="fas fa-plus-square"></i></a>
					<form class="pop_wrap_parent" id="save_income_form">
						<input type="hidden" name="walletCode" value="2" />
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
										<input type="text" class="price" name="price" value="" alt="하단 금액 입력칸에 입력해주세요.">
										<span class="krw_price">KRW 6,204.08</span>
									</div>
								</div><!-- //result_top -->
								
								<div class="apply_exchange_rate">
									<span>환율</span>
									<div>
										<span>EUR 1.00 = KRW <span>1,312.22</span></span><br/>
										<input type="hidden" class="exchange_rate" name="exchangeRate" value="1312.22">
										<input type="button" class="exchange_rate_btn" value="환율 수동 설정">
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
											<input type="radio" id="cash" class="pay_option" name="payOption" value="0" /><label for="cash"><i class="fas fa-money-bill-alt"></i><br/><span class="txt">현금</span></label>
										</span>
										<span class="pay_option_wrap">
											<input type="radio" id="card" class="pay_option" name="payOption" value="0" /><label for="card"><i class="fas fa-credit-card"></i><br/><span class="txt">카드</span></label>
										</span>
									</div>
									
									<div class="add_option_selec">
										<span class="txt">추가 입력</span>
										<span class="add_option_wrap">
											<a href="javascript:void(0);"><i class="far fa-file-alt"></i><br/><span class="txt">메모</span></a>
										</span>
										<span class="add_option_wrap">
											<label for="file" class="file"><i class="far fa-image"></i><br/><span class="txt">사진</span></label>
											<input type="file" name="file" id="file">
										</span>
									</div>
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
									<button class="act_btn save_btn">저장</button><a href="javascript:void(0);" class="act_btn closs_btn">취소</a>
								</div>
							</div><!-- //cal_btns -->
						</div><!-- //pop_wrap -->
					</form><!-- //pop_wrap_parent -->
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0);" class="modal_btn">지출 추가 <i class="fas fa-plus-square"></i></a>
					<div class="pop_wrap_parent" style="display: none;">
						<div class="pop_wrap">
							<p>
								Thank you.22222222222<br>
							    Your registration was submitted successfully.<br>
							    Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
							    Hope to see you soon!
							</p>
							<div>
								<a href="javascript:void(0);" class="closs_btn">취소</a>
							</div>
						</div><!-- //pop_wrap -->
					</div><!-- //pop_wrap_parent -->
				</div><!-- //plus_btns -->
				
				<div class="detail_table">
					<div class="table_header">
						<span class="skip">내역 조회는</span>
						<span class="table_col">번호</span>
						<span class="table_col">날짜/시간</span>
						<span class="table_col">수입 금액</span>
						<span class="table_col">지출 금액</span>
						<span class="table_col">항목명</span>
						<span class="table_col">카테고리</span>
						<span class="skip">순으로 출력</span>
					</div>
					
					<ul>
						<c:set var="i" value="0" />
						<c:forEach var="wallet" items="${list}">
							<c:set var="i" value="${i+1}" />
							<li class="table_row">
								<span class="table_col">${i}</span>
								<span class="table_col">
									${wallet.regDate}
								</span>
								<span class="table_col">
									<c:if test="${wallet.part eq 0}">
										<span>
											<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
											<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
											<c:if test="${wallet.payOption eq 2}">
												<i class="fas fa-credit-card"></i>
											</c:if>
										</span>
										<span>
											<c:if test="${wallet.moneyUnit ne 'KRW'}">
												<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.exchangePrice}" pattern="#,###.00" />
											</c:if>
										</span>
									</c:if>
								</span>
								<span class="table_col">
									<c:if test="${wallet.part eq 1}">
										<span>
											<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
											<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
										</span>
										<span>
											<c:if test="${wallet.moneyUnit ne 'KRW'}">
												<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.exchangePrice}" pattern="#,###.00" />
											</c:if>
										</span>
									</c:if>
								</span>
								<span class="table_col">
									${wallet.item}
								</span>
								<span class="table_col">
									<c:if test="${! empty wallet.walletImage}">
										<img src="/resources/images/${wallet.walletImage}" alt="${wallet.category}" class="rounded-circle">
									</c:if>
									<c:if test="${empty wallet.walletImage}">
										<c:if test="${wallet.category eq 0}"><i class="fas fa-coins"></i></c:if>
									</c:if>
								</span>
							</li>
						</c:forEach>
					</ul>
				</div><!-- //detail_table -->
			</div><!-- //right_table -->
		</section><!-- //sec_wrap -->
	</div><!-- //wrap -->
</body>
</html>