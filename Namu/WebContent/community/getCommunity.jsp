<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	
	<script>
		$(function(){
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
			  if (width_size <= 800) {
			    alert('현재 브라우저 크기가 <= 800px');
			  }
		});
		
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
		<div class="col-12">
			<div class="col-2 order-1">
				<a href="#"><img src="/resources/images/profile/${community.writer.profileImg }"  class="rounded-circle" id="userImage" name="userImage" alt="글쓴이" width="60px" height="60px"></a>
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
				<button type="button" style="border: none; background: none;">
					<i class="far fa-heart fa-lg" ></i>
				</button>
				<span style="font-size: 11px;">20</span>
				
				
				<div class="btn-group dropright" style="height: 18px;">
					<button type="button" class="btn" style="position:relative; border: none; background: none;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-ellipsis-v fa-sm" style="position: absolute; bottom: 1px;"></i>
					</button>
					<div class="dropdown-menu">
						<a>신고하기</a>
					</div>
				</div>
				
				
			</div>
		</div>
		<div class="col-6" align="right" style="bottom: 5px;" >
			<button style="border: none; background: none;" id="update"><span style="font-size: 13px" >수정</span></button>
			<span style="font-size: 8px">|</span>
			<button style="border: none; background: none;" data-toggle="modal" data-target="#exampleModal"><span style="font-size: 13px" >삭제</span></button>
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
				<a href="#"><img class="img-thumbnail" src="/resources/images/ThumbNail/${related.communityThumbnail }" class="related" id="related" name=related alt="관련글" class="" width="230px" height="150px" style="border-radius: 6px;"></a>
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