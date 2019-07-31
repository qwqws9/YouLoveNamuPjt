<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/layout/head.jsp" />
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	
	<!-- Chart.js built files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Chart.js built files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	
	<!-- jQuery, Moment.js and Date Range Picker's files -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    
    <!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/wallet.css">
	<script type="text/javascript" src="/resources/javascript/wallet.js"></script>
	<script type="text/javascript" src="/resources/javascript/wallet_ajax.js"></script>
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<div class="wrap">
		<h2 class="skip">내 가계부</h2>
		
		<div class="btnns">
			<a href="javascript:void(0);" class="pre_btn">
				<i class="fas fa-angle-left"></i>&nbsp;&nbsp;&nbsp;<span>내 가계부 목록으로</span>
			</a>
			<a href="javascript:void(0);" class="report_btn">결산 보고서 조회</a>
			<div class="report_wrap"></div>
		</div>
		
		<div class="recall_wrap">
			<section class="sec_wrap clear" id="wallet_detail_section" data-wallet-code="${param.walletCode}">
				<h3 class="skip">가계부 내역</h3>
				<nav class="left_nav">
					<a class="day_btn rounded-circle${ empty search.searchCondition ? ' active' : '' }">All</a>
					<span>
						<c:forEach var="wallet" items="${days}">
							<a class="dates day_btn rounded-circle" data-date="${wallet.regDate}"></a>
						</c:forEach>
					</span>
				</nav><!-- //left_nav -->
				
				<div class="right_table">
					<div class="total_table clear">
						<div class="total_budget">
							<span>총 예산</span><span><i class="fas fa-won-sign"></i>&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${totalIncome}" pattern="#,###.##" /></span>
						</div>
						<div class="total_price">
							<div class="total_floating">
								<span>쓴 돈</span><span><i class="fas fa-won-sign"></i>&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${totalExpenditure}" pattern="#,###.##" /></span>
							</div>
							<div class="total_floating">
								<span>남은 돈</span><span><i class="fas fa-won-sign"></i>&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${balance}" pattern="#,###.##" /></span>
							</div>
						</div>
					</div><!-- //total_table -->
					
					<div class="plus_btns">
						<span>
							<span class="page_info">총 <span class="totalCount">${resultPage.totalCount}</span> 건 중 현재 <span class="currentPage" id="currentPage">${resultPage.currentPage}</span> 페이지</span>
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
						
						<ul class="ajax-base" id="ajax-base">
							<c:forEach varStatus="status" var="wallet" items="${list}">
								<li class="ajax-${status.index+1} table_row" data-wallet-detail-code="${wallet.walletDetailCode}">
									<a class="detail_line">
										<span class="table_col">${status.index+1}</span>
										<span class="table_col">
											${wallet.regDate} ${wallet.regTime}
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
													<fmt:formatNumber value="${wallet.price}" pattern="#,###.##" />
													<c:if test="${wallet.payOption eq 2}">
														&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>
													</c:if>
												</span>
												<span>
													<c:if test="${wallet.moneyUnit ne 'KRW'}">
														<c:if test="${! empty wallet.krwPrice}">
															<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.krwPrice}" pattern="#,###.##" />
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
													<fmt:formatNumber value="${wallet.price}" pattern="#,###.##" />
													<c:if test="${wallet.payOption eq 2}">
														&nbsp;&nbsp;&nbsp;<i class="fas fa-credit-card"></i>
													</c:if>
												</span>
												<span>
													<c:if test="${wallet.moneyUnit ne 'KRW'}">
														<c:if test="${! empty wallet.krwPrice}">
															<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.krwPrice}" pattern="#,###.##" />
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
												<span>
													<c:if test="${wallet.category eq 0}"><i class="fas fa-coins fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 1}"><i class="fas fa-utensils fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 2}"><i class="fas fa-shopping-cart fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 3}"><i class="fas fa-landmark fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 4}"><i class="fas fa-plane fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 5}"><i class="fas fa-subway fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 6}"><i class="fas fa-bed fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 7}"><i class="fas fa-skating fa-2x"></i></c:if>
													<c:if test="${wallet.category eq 8}"><i class="fas fa-ellipsis-h fa-2x"></i></c:if>
												</span>
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
		</div><!-- //recall_wrap -->
	</div><!-- //wrap -->
</body>
</html>