<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>YouLovePlan</title>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
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
		
		<section class="sec_wrap">
			<h3 class="skip">가계부 내역</h3>
			
			<form class="search_form" name="search_form">
				<label for="searchKeyword" class="skip">검색어</label>
				<input type="text" class="search_txt" id="searchKeyword" name="searchKeyword" placeholder="내역 항목명을 입력하세요." value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
				<button type="submit" class="search_btn">검색</button>
			</form>
			
			<nav class="left_nav">
				<span class="day_btn">All</span>
				<span class="day_btn">준비</span>
				
				8월
				<span class="day_btn">21일</span>
				<span class="day_btn">22일</span>
				<span class="day_btn">23일</span>
			</nav>
			
			<div class="right_table">
				<div class="total_table">
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
					<div class="pop_wrap_parent">
						<div class="pop_wrap">
							<select class="unit_selec">
								<option value="KRW">KRW</option>
								<option value="EUR">EUR</option>
							</select>
							<input type="text" class="result">
							
							<div class="cal_btns">
								<div>
									<input type="text" class="formular">
									<input type="button" class="cal_btn ac" value="AC">
								</div>
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
							</div><!-- //cal_btns -->
							<a href="javascript:void(0);" class="closs_btn">취소</a>
						</div><!-- //pop_wrap -->
					</div><!-- //pop_wrap_parent -->
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0);" class="modal_btn">지출 추가 <i class="fas fa-plus-square"></i></a>
					<div class="pop_wrap_parent">
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
						<span class="table_col">날짜/시간</span>
						<span class="table_col">수입 금액</span>
						<span class="table_col">지출 금액</span>
						<span class="table_col">항목명</span>
						<span class="table_col">카테고리</span>
						<span class="skip">순으로 출력</span>
					</div>
					
					<ul>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								<img src="/resources/images/uploadFiles/AHlbAAAAtBqyWAAA.jpg" alt="기타" class="rounded-circle">
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
						<li class="table_row">
							<span class="table_col">
								<span>2018-08-23</span> <span>오후 11:00</span>
							</span>
							<span class="table_col">
								<span>€ 25.00</span> <span>￦ 32,879.16</span>
							</span>
							<span class="table_col">
							</span>
							<span class="table_col">
								응급실
							</span>
							<span class="table_col">
								기타
							</span>
						</li>
					</ul>
				</div><!-- //detail_table -->
			</div><!-- //right_table -->
		</section><!-- //sec_wrap -->
	</div><!-- //wrap -->
</body>
</html>