<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="utf-8">
	<!-- 타임라인을 위한 노드 서버 연결 -->
<!-- 	<script src="http://192.168.0.94:3000/socket.io/socket.io.js"></script> -->
<!-- 	<script src="/resources/javascript/alarmSocket.js"></script> -->
	<!-- 지우지 말것...... -->
	
	<link href="/resources/css/sidebar.css" rel="stylesheet">
	<script src="/resources/javascript/sidebar.js"></script>
	<!-- bootstrap -->
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> -->
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script> -->
	<!-- jQuerty -->
<!-- 	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
<!--   	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/css/bootstrap4-toggle.min.css" rel="stylesheet"> -->
<!--   	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/js/bootstrap4-toggle.min.js"></script> -->
  	<!-- fontAwsome -->
<!--   	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script> -->
  	
  	
	<script>
	
	 
	</script>
</head>
<body>
<jsp:include page="../user/searchUser.jsp"></jsp:include>
<input type="hidden" id="nodeUserCode" value="${user.userCode }">
<input type="hidden" id="nodeNickname" value="${user.nickname }">
<input type="hidden" id="nodeprofileImg" value="${user.profileImg }">

	<!-- 사이드바 -->
	<div id="mySidebar" class="sidebar">
		<div class="container">
			<div class="col-lg-3" style="padding-top: 23px;">
				<c:if test ="${!empty user }">
					<button type="button" style="background: none; border: none;" onclick="location.href='/timeline/getTimelineList'"><span class="badge" style="background: #ff7d75; color: white;">4</span></button>
				</c:if>
			</div>
			
		  	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  	
			<br><br><br>
			<div class="container">
				<div class="row justify-content-center">
					<br><br><br>
				
					<c:if test ="${empty user }"><!-- 로그인 전 -->
						<div class="col-12 text-center" id="beforeLogin">
							<div id="logingogo">
							<a href="#">
								<img src="/resources/images/profile/img_login.gif" alt="..." class="rounded-circle" style="border:2px solid white; height: 100px; width: 100px; padding-right: 0px;">
							</a>
							<a href="#">
								<span>로그인</span>
							</a>
							</div>
						</div>
					</c:if>
					<c:if test ="${!empty user }"><!-- 로그인 후 -->
						<div class="col-12 text-center" id="afterLogin">
							<a href="#">
								<img src="/resources/images/profile/${user.profileImg }" alt="..." class="rounded-circle" style="border:2px solid white; height: 100px; width: 100px; padding-right: 10px;">
							</a>
						
							<div class="row">
								<div class="col-lg-12">
									<div class="dropright" style="padding-top: 10px;">
										<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    			<span class="align-text-bottom" style="font-size:small; color: white;">${user.nickname }</span>
										</button>
										<div class="dropdown-menu">
									  		<a class="dropdown-item" href="/user/getUser">내 정보</a>
										    <a class="dropdown-item" href="#">내 작성글/댓글</a>
										    <a class="dropdown-item" href="/user/getPayList">결제내역</a>
										    <c:if test="${user.role eq 'admin' }">
										    <div class="dropdown-divider"></div>
										    <a class="dropdown-item" href="/user/getUserList">전체회원 조회</a>
										    <a class="dropdown-item" href="#">신고목록 조회</a>
										    </c:if>
										    <div class="dropdown-divider"></div>
										    <a class="dropdown-item" href="/user/logout">로그아웃</a>
								  		</div>
									</div>
								</div>
							</div>
								
								
							<div class="row">
								<div class="col-lg-3 offset-2" style="padding-top: 7px;">
									<button type="button" style="background: none; border: none; cursor: pointer;" data-toggle="modal" data-target="#exampleModalCenter"><i class="fas fa-address-book fa-lg"></i></button>
								</div>
								<div class="col-lg-3" style="padding-top: 7px;">
									<button type="button" style="background: none; border: none; cursor: pointer;" onclick="location.href='/planner/getPlannerList'"><i class="far fa-calendar fa-lg" ></i></button>
								</div>
								<div class="col-lg-3" style="padding-top: 7px;">
									<button type="button" style="background: none; border: none; cursor: pointer;"><i class="fas fa-money-check-alt fa-lg"></i></button>
								</div>
							</div>
						</div><!-- end of profile -->
					</c:if>
					<div class="col-12 text-center">
					
						<br>
						<div class="row"><!-- 플래너 -->
							<div class="col-lg-12 text-left">
								<div class="accordion" id="Planner">
							        <button class="btn" type="button" data-toggle="collapse" data-target="#PlannerMenu" aria-expanded="true" aria-controls="collapseOne">
							    		<strong><span>플래너</span></strong>
							        </button>
								    <div id="PlannerMenu" class="collapse" aria-labelledby="headingOne" data-parent="#Planner">
								      	<div class="card-body">
							  				<a href="/planner/addPlanner">첫플래너 시작</a>
								    		<a href="/planner/getAllPlannerList">플래너 공유</a>
								      	</div>
								    </div>
								</div>
							</div>
						</div>
						
						
						<div class="row"><!-- 커뮤니티 -->
							<div class="col-lg-12 text-left">
								<div class="accordion" id="Community">
							        <button class="btn" type="button" data-toggle="collapse" data-target="#CommunityMenu" aria-expanded="true" aria-controls="collapseOne">
							    		<strong><span>커뮤니티</span></strong>
							        </button>
								    <div id="CommunityMenu" class="collapse" aria-labelledby="headingOne" data-parent="#Community">
								      	<div class="card-body">
									  		<a id="communityList" href="#">커뮤니티 목록</a>
										    <a href="#">분석</a>
								      	</div>
								    </div>
								</div>
							</div>
						</div>
						
						
						<div class="row"><!-- 동행 -->
							<div class="col-lg-12 text-left">
								<div class="accordion" id="Party">
							        <button class="btn" type="button" data-toggle="collapse" data-target="#PartyMenu" aria-expanded="false" aria-controls="collapseOne">
							    		<strong><span>동행</span></strong>
							        </button>
								    <div id="PartyMenu" class="collapse" aria-labelledby="headingOne" data-parent="#Party">
								      	<div class="card-body">
									  		<a id="addParty" href="#">동행 등록</a>
										    <a id="getPartyList" href="#">동행 찾기</a>
								      	</div>
								    </div>
								</div>
							</div>
						</div>
						
						
						<div class="row"><!-- 여행 가이드 -->
							<div class="col-lg-12 text-left">
								<div class="accordion" id="Guide">
							        <button class="btn" type="button" data-toggle="collapse" data-target="#GuideMenu" aria-expanded="false" aria-controls="collapseOne">
							    		<strong><span>여행 가이드</span></strong>
							        </button>
								    <div id="GuideMenu" class="collapse" aria-labelledby="headingOne" data-parent="#Guide">
								      	<div class="card-body">
									  		<a href="/guide/initTour">관광지</a>
										    <a href="/guide/initHotel">숙소</a>
										    <a href="/guide/searchFlight">항공권</a>
								      	</div>
								    </div>
								</div>
							</div>
						</div>
						
						
						<div class="row"><!-- 채팅 -->
							<div class="col-lg-12 text-left">
								<a href="#">
									<span class="talk">
										<img src="/resources/images/youlovetalk_logo.png" alt="유럽톡" class="talk_img"  style="height: 60px;">
									</span>
								</a>
							</div>
						</div>
						
						
					</div><!-- end of menu -->
				</div><!-- end of row -->
			</div><!-- end of container -->
			
			<br><br>
			
			
			
			<form method="post" action="/totalSearch/getTotalSearch">
				<div class="Search">
					<div class="input-holder">
						<input type="text" class="search-input" name="searchKeyword" placeholder="Search" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
						<button id="searchbtn" type="button" class="search-icon" onclick="searchToggle(this, event);">
							<span></span>
						</button>
					</div>
					<span class="close" onclick="searchToggle(this, event);"></span>
				</div>
			</form>	  	
			
		
		</div>
	</div>
	
	
	<!-- 탑바 -->
	<div class="pos-f-t" id="topbar">
	  	<div class="collapse" id="topbarContent">
		    <div class="bg p-6">
      			<div class="navbar-nav">
      				<div class="row">
	      				<div class="col-2 text-center">
					      	<h5 class="text h4">HOME</h5>
	      				</div>
	      				<div class="col-2">
			      			<span class="text-muted">추가예정</span>
	      				</div>
	      				<div class="col-2">
			      			<span class="text-muted">추가예정</span>
	      				</div>
	      				<div class="col-2">
			      			<span class="text-muted">추가예정</span>
	      				</div>
	      				<div class="col-2">
			      			<span class="text-muted">추가예정</span>
	      				</div>
	      				<div class="col-2">
			      			<span class="text-muted">추가예정</span>
	      				</div>
      				</div>
			    </div>
		    </div>
	  	</div>
	  	
	  	<nav class="navbar">
		    <a href="#" class="navbar"  data-toggle="collapse" data-target="#topbarContent" aria-controls="topbarContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="brand main_logo">
			    	<img src="/resources/images/youloveplan_logo.png" alt="유럽플랜" class="logo_img" style="height: 100px;">
			    </span>
			</a>
	  	</nav>
	</div>
	
	<!-- 메인 -->
	<div id="main">
	  <button class="openbtn" onclick="openNav()">&#9776;</button> 
	</div>
	
	
</body>
</html>