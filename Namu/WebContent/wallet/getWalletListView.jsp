<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<script type="text/javascript">
		// Toggle
		
	</script>
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<div class="wrap">
		<h2 class="wallet_title"><span>내 가계부 목록</span></h2>
		
		<section class="wallet_box">
			<h3>진행중인 여행</h3>
			<div class="square_wrap">
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
			</div>
		</section><!-- //wallet_box -->
		
		<section class="wallet_box">
			<h3>다가오는 여행</h3>
			<div class="square_wrap clear">
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
			</div>
		</section><!-- //wallet_box -->
		
		<section class="wallet_box">
			<h3>지난 여행</h3>
			<div class="square_wrap">
				<div class="square">
					<div>
						<div class="plan_name">제목들어간다요</div>
						<div class="plan_flag">국기</div>
						<div class="plan_period">날짜들어간다요</div>
						<div class="wallet_is">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary">
									<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
								</label>
								<label class="btn btn-secondary active">
									<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
								</label>
							</div>
						</div><!-- //wallet_is -->
					</div>
				</div><!-- //square -->
			</div>
		</section><!-- //wallet_box -->
	</div><!-- //wrap -->
</body>
</html>