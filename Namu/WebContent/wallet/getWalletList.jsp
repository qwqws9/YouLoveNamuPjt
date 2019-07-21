<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
	<script type="text/javascript" src="/resources/javascript/wallet_modal.js"></script>
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
			<h3 class="skip"><span class="walletCode">${param.walletCode}</span>가계부 내역</h3>
			
			
			<form class="search_form" name="search_form">
				<input type="hidden" id="pageSize" name="pageSize" value="" />
				
				<label for="searchKeyword" class="skip">검색어</label>
				<input type="text" class="search_txt" id="searchKeyword" name="searchKeyword" placeholder="내역 항목명을 입력하세요." value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
				<button type="submit" class="search_btn">검색</button>
			</form><!-- //search_form -->
			
			<nav class="left_nav">
				<a class="day_btn rounded-circle"><span>All</span></a>
				<a class="day_btn rounded-circle"><span>준비</span></a>
				
				<span class="day_btn">8월</span>
				<a class="day_btn rounded-circle"><span>21</span><span class="skip">일</span></a>
				<a class="day_btn rounded-circle"><span>22</span><span class="skip">일</span></a>
				<a class="day_btn rounded-circle"><span>23</span><span class="skip">일</span></a>
			</nav><!-- //left_nav -->
			
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
					<span>
						<span class="page_info">총 <span class="totalCount">${resultPage.totalCount}</span> 건 중 현재 <span class="currentPage">${resultPage.currentPage}</span> 페이지</span>
						<a href="javascript:void(0);" class="modal_btn" id="income_modal">예산 추가&nbsp;&nbsp;<i class="far fa-plus-square"></i></a>
					</span>
					<form class="pop_wrap_add" id="save_income_form"></form>
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0);" class="modal_btn" id="expenditure_modal">지출 추가&nbsp;&nbsp;<i class="far fa-plus-square"></i></a>
					<form class="pop_wrap_add" id="save_expenditure_form"></form>
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
					
					<ul class="ajax-base">
						<c:forEach varStatus="status" var="wallet" items="${list}">
							<li class="ajax-${status.index+1} table_row">
								<span class="walletDetailCode">${wallet.walletDetailCode}</span>
								<a class="detail_line">
									<span class="table_col">${status.index+1}</span>
									<span class="table_col">
										${wallet.regDate}
									</span>
									<span class="table_col">
										<c:if test="${wallet.part eq 0}">
											<span>
												<c:if test="${wallet.moneyUnit eq 'KRW'}"><i class="fas fa-won-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'CHF'}">CHF</c:if>
												<c:if test="${wallet.moneyUnit eq 'GBP'}"><i class="fas fa-pound-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'CZK'}">CZK</c:if>
												<c:if test="${wallet.moneyUnit eq 'HUF'}">HUF</c:if>
												<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
												<c:if test="${wallet.payOption eq 2}">
													&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>
												</c:if>
											</span>
											<span>
												<c:if test="${wallet.moneyUnit ne 'KRW'}">
													<c:if test="${! empty wallet.exchangePrice}">
														<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.exchangePrice}" pattern="#,###.00" />
													</c:if>
												</c:if>
											</span>
										</c:if>
									</span>
									<span class="table_col">
										<c:if test="${wallet.part eq 1}">
											<span>
												<c:if test="${wallet.moneyUnit eq 'KRW'}"><i class="fas fa-won-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'CHF'}">CHF</c:if>
												<c:if test="${wallet.moneyUnit eq 'GBP'}"><i class="fas fa-pound-sign"></i></c:if>
												<c:if test="${wallet.moneyUnit eq 'CZK'}">CZK</c:if>
												<c:if test="${wallet.moneyUnit eq 'HUF'}">HUF</c:if>
												<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
												<c:if test="${wallet.payOption eq 2}">
													&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>
												</c:if>
											</span>
											<span>
												<c:if test="${wallet.moneyUnit ne 'KRW'}">
													<c:if test="${! empty wallet.exchangePrice}">
														<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.exchangePrice}" pattern="#,###.00" />
													</c:if>
												</c:if>
											</span>
										</c:if>
									</span>
									<span class="table_col">
										<c:if test="${! empty wallet.item}">
											${wallet.item}
										</c:if>
										<c:if test="${empty wallet.item}">
											<c:if test="${wallet.part eq 0}">예산 추가</c:if>
											<c:if test="${wallet.part eq 1}">지출 추가</c:if>
										</c:if>
									</span>
									<span class="table_col">
										<c:if test="${! empty wallet.walletImage}">
											<img src="/resources/images/wallet/${wallet.walletImage}" alt="${wallet.category}" class="rounded-circle">
										</c:if>
										<c:if test="${empty wallet.walletImage}">
											<c:if test="${wallet.category eq 0}"><i class="fas fa-coins"></i></c:if>
											<c:if test="${wallet.category eq 1}"><i class="fas fa-utensils"></i></c:if>
											<c:if test="${wallet.category eq 2}"><i class="fas fa-shopping-cart"></i></c:if>
											<c:if test="${wallet.category eq 3}"><i class="fas fa-landmark"></i></c:if>
											<c:if test="${wallet.category eq 4}"><i class="fas fa-plane"></i></c:if>
											<c:if test="${wallet.category eq 5}"><i class="fas fa-subway"></i></c:if>
											<c:if test="${wallet.category eq 6}"><i class="fas fa-bed"></i></c:if>
											<c:if test="${wallet.category eq 7}"><i class="fas fa-skating"></i></c:if>
											<c:if test="${wallet.category eq 8}"><i class="fas fa-ellipsis-h"></i></c:if>
										</c:if>
									</span>
								</a><!-- //detail_line -->
								
								<div class="pop_wrap_contain"></div>
							</li>
						</c:forEach>
					</ul>
				</div><!-- //detail_table -->
			</div><!-- //right_table -->
		</section><!-- //sec_wrap -->
		
		<nav class="paging_wrap">
			<jsp:include page="/wallet/pagination.jsp" />
		</nav>
	</div><!-- //wrap -->
</body>
</html>