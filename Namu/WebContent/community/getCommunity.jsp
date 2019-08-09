<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	<!-- common -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<style type="text/css">
		.img-thumbnail{
		
			width: 200px;
			height: 150px;
		}
	</style>
	<script>
		$(function(){
			
			$('.profile-box').on('click',function(){
				var writerUser = $('#communityUserCode').val().trim();
				console.log('게시판 : ' + writerUser);
				getProfile(writerUser);
			})
			
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
						//0801 추가
						$('.boardLike').addClass('activeLike');
						
						$('.boardLike').html('<i class="fas fa-heart fa-lg" style="color:red;"></i>');
						//$('.boardLike').children().attr('class','fas fa-heart fa-lg').css('color','red');
					}else {
						//0801 변경
						$('.boardLike').removeClass('activeLike');
						$('.boardLike').html('<i class="far fa-heart fa-lg" style="color:black;"></i>');
						//$('.boardLike').children().attr('class','far fa-heart fa-lg').css('color','black');
					}
				}
			})
			
			
			//신고하기
			var session =  '${user.nickname}';
			var check = <%=session.getAttribute("user") != null%>
			$("#from").val(session);
			$("#goPolice").on("click",function(){
				if(check == false){
					self.location = '/user/loginView';
				}else{
					var content = $('#policeContent').val().trim();
					if(content.length <= 0) {
						alert('내용을 입력하세요.');
						return;
					}else {
						$.ajax({
							url : '/user/json/addPolice',
							method  : 'post',
							data : JSON.stringify ({
								fromUser : {
									userCode : $('#fromUser').val().trim()
								},
								toUser : {
									userCode : $('#toUser').val().trim()
								},
								policeBoardCode : $('#policeBoardCode').val().trim(),
								policeDetailCode : $('#policeDetailCode').val().trim(),
								policeOption : $('#policeOption').val().trim(),
								policeContent : $('#policeContent').val().trim()
							}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(data,status) {
								//alert('신고가 완료되었습니다.');
								swal({
									title : '신고 완료',
									icon : 'success'
								})
								$('#policeClose').trigger('click');
							}
						});
					}
					
				}
				
			})
			
			
			var communityCode = $("#communityCode").val();
			$("#update").on("click",function(){
				self.location = "/community/updateCommunityView?communityCode="+$("#communityCode").val();
			})
			$("#delete").on("click",function(){
				self.location = "/community/deleteCommunity?communityCode="+$("#communityCode").val();
			})
			
			$(".btn.btn-outline-dark").on("click", function(){
				var hash = $(this).children().text();
				var last = hash.length;
				var hashtag = hash.substring(1,last);
				self.location = "/community/getCommunityList?communityBoard=0&searchCondition=5&searchKeyword="+hashtag;
				//alert(hashtag);
			})
			
			$(".col-3.related").on("click", function(){
				alert($(this).children(".relatedCode").val());
				self.location="/community/getCommunity?communityCode="+$(this).children(".relatedCode").val();
			})
			
		});//end of ready
		$(window).resize(function (){
			  // width값을 가져오기
			  var widthSize = window.outerWidth;
			  
			  // 800 이하인지 if문으로 확인
			  if (widthSize <= 800) {
			    alert('현재 브라우저 크기가 <= 800px');
			  }
		});
		
		//게시물 좋아요
		$(document).on('click','.boardLike',function(){
			//0801  변경
			var heart = $(this).attr('class');
//			var heart = $(this).children().attr('class').substr(0,3);
			var boardCode = $('#boardCode').val().trim();
			var detailCode = $('#detailCode').val().trim();
			var writerUser = $('#communityUserCode').val().trim();
			var sessionUser = $('#nodeUserCode').val().trim();
			
			
			if(heart == 'boardLike') {
				//좋아요
				//0801 추가
				$(this).addClass('activeLike');
				//0801 변경
				$('.boardLike').html('<i class="fas fa-heart fa-lg" style="color:red;"></i>');
				//$(this).children().attr('class','fas fa-heart fa-lg').css('color','red');
				addLikeBoard(boardCode,detailCode,sessionUser,writerUser);
			}else {
				//좋아요 취소
				//0801 추가
				$(this).removeClass('activeLike');
				//0801 변경
				$('.boardLike').html('<i class="far fa-heart fa-lg" style="color:black;"></i>');
				//$(this).children().attr('class','far fa-heart fa-lg').css('color','black');
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
							addTimelineCommunity(boardCode,detailCode,sessionUser,writerUser,'3');
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
		
		
		
	</script>
	<style>
		.btn.btn-outline-dark:not(:last-child){
  			margin-right:5px;
  		}
	</style>
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<br><br><br><br><br>

<!-- 신고하기 -->
<div class="col-lg-1">
</div><!-- 사이드바 -->


<form id="policeform">
<div class="modal fade" id="police" tabindex="-1" role="dialog" aria-labelledby="policeLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="exampleModalLabel">신고</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
      		<div class="modal-body">
      			<div>
      				<input type="hidden"  id="fromUser" value="${user.userCode }">
      				<input type="hidden"  id="toUser" value="${community.writer.userCode}">
      				작성자 : <input type="text"  value="${community.writer.nickname}" style="outline: none;background: none;border: none; width: 30%">
      				<input type="hidden" id="policeBoardCode" name="policeBoardCode" value="${community.communityBoard }">
      				게시물번호 : <input type="text" id="policeDetailCode" value="${community.communityCode}" style="outline: none;background: none;border: none; width: 30%">
      			</div>
      			<div>
      				<div class="form-group">
					    <label for="policeOption">신고 유형</label>
					    <select name="policeOption" class="form-control" id="policeOption">
					      <option value="홍보 게시글">홍보 게시글</option>
					      <option value="명예훼손/사생활 침해">명예훼손/사생활 침해</option>
					      <option value="부적절한게시물">부적절한 게시물</option>
					      <option value="기타">기타</option>
					    </select>
					  </div>
      			</div>
      			<div>
	      			<textarea name="policeContent" id="policeContent" style="width:100%;height: 100px;"></textarea>
      			</div>
      			
		    </div>
      		<div class="modal-footer">
        		<button type="button" id="policeClose" class="btn btn-secondary" data-dismiss="modal">취소</button>
        		<button type="button" class="btn btn-primary" id="goPolice">신고</button>
      		</div>
    	</div>
  	</div>
</div>
</form>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	게시물을 삭제 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="delete" >삭제</button>
        <button type="button" class="btn btn-primary"  data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<div class="container-fluid col-md-8">

	<input id="communityCode" type="hidden" value="${community.communityCode}" >
	<div class="row">
		<div class="profile-box col-12">
			<div class="col-2 order-1">
				<img src="/resources/images/profile/${community.writer.profileImg }"  class="rounded-circle" id="userImage" name="userImage" alt="글쓴이" width="60px" height="60px">
			</div>
			<div class="col-2 order-2" id="profile-nickname" style="position: absolute; top: 12px; left: 88px;">  <!-- style="position: absolute; top: 10px; left: 52px;" -->
				<div class="text-muted" style="font-size:medium;">Writer.</div>
				<div style="font-size:medium; color:#344157;">${community.writer.nickname}</div>
				<!-- 용 : 유저코드 가져오기위해 추가함 -->
				<input type="hidden" id="communityUserCode" value="${community.writer.userCode} ">
			</div>
		</div>
	</div>
	
	
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-12">
			<div class="row" id="profile" style="position: relative; ">
				<div class="col-9 order-1"  id="profile-image">
					<h4 style="resize: none; display: inline-blocke;">
						<strong style="font-size: xx-large;">${community.communityTitle }&nbsp;&nbsp;</strong>
						<small style="font-size: medium;">${community.communityDate }&nbsp;&nbsp;</small>
					</h4>
				</div>
				<div class="col-3 order-last" align="right" id="getCount" style="position: absolute; font-size: medium; right: 0px; bottom: 0px;"> 
					조회수&nbsp;${community.views}
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="card">
			  <div class="card-body">
			  	${community.communityContent}
			  </div>
			</div>
		</div>
	</div>
	
	<div class="row" style="margin-top: 8px;">
		<div class="col-6">
			<div class="badge badge-pill" style="border: 1px solid black;">
				<button class="boardLike" type="button" style="border: none; background: none;">
					<i class="far fa-heart fa-lg" ></i>
				</button>
				<span class="likeCountBoard" style="font-size: 11px;">${likeCountBoard }</span>
				
				
				<div class="btn-group dropright" style="height: 18px;">
					<button type="button" class="btn" style="position:relative; border: none; background: none;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-ellipsis-v fa-sm" style="position: absolute; bottom: 1px;"></i>
					</button>
					<div class="dropdown-menu">
						<button type="button" data-target="#police"  data-toggle="modal" style="border: none;background: none; outline: none;">신고하기</button>
					</div>
				</div>
				
				
			</div>
		</div>
		<div class="col-6" align="right" style="bottom: 5px;" >
			<c:if test="${community.writer.userCode == user.userCode}">
				<button style="border: none; background: none;" id="update"><span style="font-size: 13px" >수정</span></button>
				<span style="font-size: 8px">|</span>
				<button style="border: none; background: none;" data-toggle="modal" data-target="#exampleModal"><span style="font-size: 13px" >삭제</span></button>
			</c:if>
		</div>
	</div>
	
	<br>
	
	<div class="row no-gutters">
		<div class="col-3 col-sm-12">
			<strong style="font-size: 17px;">#Hashtag</strong>
		</div>
		<div class="col-9 col-sm-12">
			<div class="alert alert-light" role="alert">
				<c:forEach var="hashtag" items="${hashtag}">
				    <button type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
				    	<span class="hashtagVal" style="font-size: 13px;">${hashtag}</span>
				    </button>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="row">
		<div class="col-3">
			<strong style="font-size: 17px;">관련글</strong>
		</div>
	</div>
	
	<br>
	<!-- 관련글 -->
	<div class="row" data-target="#relatedGrid">
		<div>
		
		</div>
	</div>
	<div class="row" align="center" id="relatedGrid">
		<c:forEach var="related" items="${related}">
			<div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 related">
				<input type="hidden" class="relatedCode" value="${related.communityCode }" >
				<a href="#"><img class="" src="/resources/images/ThumbNail/${related.communityThumbnail }" class="related" id="related" name=related alt="관련글" class="" width="230px" height="160px" style="border-radius: 6px;"></a>
				<div class="related" style="">
					${related.communityTitle }
				</div>
			</div>
		</c:forEach>
	</div>
	<br><br><br>
	<!-- 댓글 -->
	<jsp:include page="../comment/getComment.jsp" >
      	<jsp:param value="${boardCode}" name="boardCode"/>
      	<jsp:param value="${detailCode}" name="detailCode"/>
    </jsp:include>
	<br><br><br>
	
	
	
	
	
	
</div>
	
	
	
	
<!-- <div class="col-xs-1"></div> -->
</body>
</html>