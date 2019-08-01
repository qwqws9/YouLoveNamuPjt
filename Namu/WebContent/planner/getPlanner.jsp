<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<!-- 이모티콘 -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	<!-- map -->
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<!-- owlCarousel -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	
	
	<style>
		.owl-item{
	 		position: relative;
	 		height: 330px; 
	 		border: 1px solid rgba(0, 0, 0, 0.25);
	 	}
	</style>
	<script type="text/javascript">
	
	$(function(){
		
		//로드될때 현재 세션 사용자가 좋아요를 눌렀으면 체크되는 로직
		$.ajax ({
			url : '/like/json/checkLike',
			method : 'post',
			async : false,
			data : JSON.stringify({
				boardCode : $('#boardCode').val().trim(),
				detailCode : $('#detailCode').val().trim(),
				likeName : $('#nodeUserCode').val().trim()
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				if(data == true) {
					//현재 접속자가 좋아요를 누른상태
					$('.boardLike').children().attr('class','fas fa-heart fa-lg').css('color','red');
				}else {
					$('.boardLike').children().attr('class','far fa-heart fa-lg').css('color','black');
				}
			}
		})
		
		
			$("#updatep").on("click",function(){    	
			 self.location = "/planner/updatePlanner?plannerCode=${planner.plannerCode}";
			  });
			
			/* $("#delete").on("click",function(){    	
			 self.location = "/planner/deletePlanner?plannerCode=${planner.plannerCode}";
			  }); /* */ 
			$("a[href='#']").on("click",function(){
			  	
			 self.location = "/planner/deletePlanner?plannerCode=${planner.plannerCode}";
			  	
			});

		});
		 
	
	//게시물 좋아요
	$(document).on('click','.boardLike',function(){
		var heart = $(this).children().attr('class').substr(0,3);
		var boardCode = $('#boardCode').val().trim();
		var detailCode = $('#detailCode').val().trim();
		var writerUser = $('#communityUserCode').val().trim();
		var sessionUser = $('#nodeUserCode').val().trim();
		console.log(heart);
		
		
		if(heart == 'far') {
			//좋아요
			$(this).children().attr('class','fas fa-heart fa-lg').css('color','red');
			addLikeBoard(boardCode,detailCode,sessionUser,writerUser);
		}else {
			//좋아요 취소
			$(this).children().attr('class','far fa-heart fa-lg').css('color','black');
			deleteLikeBoard(boardCode,detailCode,sessionUser);
		}
	});
	
	function addLikeBoard(boardCode,detailCode,sessionUser,writerUser) {
		
		$.ajax ({
			url : '/like/json/addLike',
			method : 'post',
			data : JSON.stringify({
				detailCode : detailCode,
				boardCode : boardCode,
				likeName : {
					userCode : sessionUser
				}
				
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				if(data == true) {
					if(sessionUser != writerUser){
						addTimelineCommunity(boardCode,detailCode,sessionUser,writerUser,'4');
					}
						var count = $('.likeCountBoard').text().trim();
						$('.likeCountBoard').text((Number(count)+1));
				}
			}
		})
	}
	
	
	function deleteLikeBoard(boardCode,detailCode,sessionUser) {
		
		$.ajax ({
			url : '/like/json/deleteLike',
			method : 'post',
			data : JSON.stringify({
				detailCode : detailCode,
				boardCode : boardCode,
				likeName : {
					userCode : sessionUser
				}
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				var count = $('.likeCountBoard').text().trim();
					$('.likeCountBoard').text((Number(count)-1));
			}
		})
	}
	
	
	
		 
// 		 $(document).ready(function(){
// 			var owl = $(".owl-carousel");
// 			owl.owlCarousel({
// 			 	margin:10,
// 		        loop:true,
// 		        autoWidth:true,
// 		        items:4
// 			});
// 		 });
	</script>

</head> 
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	
	<input type="hidden" name="plannerCode" value="${planner.plannerCode}" />
		<input type="hidden" id="communityUserCode" value="${planner.plannerWriter.userCode} ">

	
	
	<br><br><br>
	<div class="container-fluid" >
		<div class="row">
			<div class="col-md-12 col-lg-12">
			
			
				<div class="row"><!-- title -->
					<div class="col-md-1 col-lg-1"></div>
					<div class="col-md-10 col-lg-10">
						<div class="row">
							<div class="col-md-7 col-lg-7">
								<img class="thumb"src="/resources/images/planner/${planner.plannerImage}" style="width: 100%; ">
							</div>
							<div class="col-md-5 col-lg-5">
								<div class="row text-left" style="padding-left: 15px;">
									<span>
<%-- 										<img src="/resources/images/profile/${planner.plannerWriter.profileImg}"  class="rounded-circle" id="userProfile" name="userProfile"  width="40px" height="40px"> --%>
										<img src="/resources/images/profile/img_login.gif"  class="rounded-circle" id="userProfile" name="userProfile"  width="40px" height="40px">
										<span style="padding-left: 10px;">${planner.plannerWriter.nickname}</span>
									</span>
								</div>
								<br>
								<div>
									<h4><strong>플래너 이름 : </strong>${planner.plannerName} </h4>
								</div>
								<br>
								<div>
									<h4>
									<strong> 여행멤버 </strong>
									<c:if test="${! empty planner.member && (planner.member eq '1')}">
									혼자 </c:if>
									<c:if test="${! empty planner.member && (planner.member eq '2')}">
									연인과 </c:if>
									<c:if test="${! empty planner.member && (planner.member eq '3')}">
									친구들과 </c:if>
									<c:if test="${! empty planner.member && (planner.member eq '4')}">
									가족들과 </c:if>
									</h4>
								</div>
								<br>
								<div>
									<h4>
									<strong> 여행출발일 </strong>
									${planner.departDate}
									</h4>
								</div>
								<br>
								<div>
									<h4>
									<strong>등록일자</strong>
									${planner.regDate}
									</h4>
								</div>
							</div>
						</div>
						
						<br>
						<div class="row" style="margin-top: 8px;">
		<div class="col-6">
			<div class="badge badge-pill" style="border: 1px solid black;">
				<button class="boardLike" type="button" style="border: none; background: none;">
					<i class="far fa-heart fa-lg" ></i>
				</button>
				<span class="likeCountBoard" style="font-size: 11px;">${likeCountBoard }</span>
				
				</div></div></div></div>
						<div class="row"><!-- map -->
							<div class="col-md-12 col-lg-12">
								<jsp:include page="/planner/getRoute.jsp" />
							</div>
							
							
						</div>
						
						<br>
						
						<div class="row"><!-- 달력 -->
							<!-- month -->
							<div class="col-md-12">
								<jsp:include page="/planner/getScheduleList2.jsp" />
							</div>
							<!-- list -->
						
						</div>
						
						<br>
						
						<c:if test="${user.userCode == planner.plannerWriter.userCode}">
							<div class="row">
								<div class="col-md-4">
									<button type="button" class="btn btn-default" id="updatep"> 수정 </button>
									 <a onclick="return confirm('플래너를 삭제하시겠습니까?')" href="#" class="btn btn-default">삭제</a> 
								</div>
							</div>
						</c:if>
						
						<div class="row">
							<div class="owl-carousel owl-theme owl-loaded">
								<div class="owl-stage-outer" style="height: 300px;">
									<div class="owl-carousel owl-theme">
									    <div class="item" style="width:250px">
									    	<img class="d"src="/resources/images/planner/${planner.plannerImage}">
									    </div>
									    <div class="item" style="width:100px">
									    	<img class="d"src="/resources/images/planner/${planner.plannerImage}">
									    </div>
									    <div class="item" style="width:500px">
									    	<img class="d"src="/resources/images/planner/${planner.plannerImage}">
									    </div>
									    <div class="item" style="width:100px">
									    	<img class="d"src="/resources/images/planner/${planner.plannerImage}">
									    </div>
									</div>
								</div>
								<div class="owl-nav">
							        <div class="owl-prev">prev</div>
							        <div class="owl-next">next</div>
							    </div>
							    <div class="owl-dots">
							        <div class="owl-dot active"><span></span></div>
							        <div class="owl-dot"><span></span></div>
							        <div class="owl-dot"><span></span></div>
							    </div>
							</div>	
						</div>
						
						<div class="row">
							<!-- 댓글 -->
						    <jsp:include page="../comment/getComment.jsp" >
						    	<jsp:param value="${boardCode}" name="boardCode"/>
						    	<jsp:param value="${detailCode}" name="detailCode"/>
						    </jsp:include>
						</div>
						
					</div><!-- end of center -->
					
					
					<div class="col-md-1 col-lg-1"></div>
					
				</div>
			</div>
		</div>

	
 
 
		
	<%-- <input type="hidden" id="sessionId" value="${user.userCode }"> --%>


<%-- 
<input type="hidden" class="plannerWriter" name="plannerWriter" value="${planner.plannerWriter}"> 

      
       --%>
	
</body>
</html>
