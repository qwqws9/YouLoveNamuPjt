<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>getCommunityBBS</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	
	<script>
		$(function(){
			var communityCode = encodeURI($("#communityCode"));
			
			$("#update").on("click",function(){
				self.location = "/community/updateCommunity?communityCode="+communityCode;
			})
			$("#delete").on("click",function(){
				self.location = "/community/deleteCommunity?communityCode="+communityCode;
			})
			
		})
		
	</script>
	
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<!-- <div class="col-xs-1"></div> -->
<div class="container-fluid col-10">

	<input id="communityCode" type="hidden" value="${community.communityCode}" >
	<div class="row">
		<div class="col-12">
		<h4 style="resize: none; display: inline-blocke">
			<strong>${community.communityTitle }&nbsp;&nbsp;</strong>
			<small style="font-size: xx-small;">${community.communityDate }&nbsp;&nbsp;</small>
		</h4>
		</div>
	</div>
	
	
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-12">
			<div class="row" id="profile" style="position: relative; ">
				<div class="col-1 order-1" id="profile-image">
					<a href="#"><img src="/resources/images/dog.JPG"  class="rounded-circle" id="userImage" name="userImage" alt="글쓴이" width="45px" height="45px"></a>
				</div>
				<div class="col order-2" id="profile-nickname" style="position: absolute; top: 10px; left: 52px;">  <!-- style="position: absolute; top: 10px; left: 52px;" -->
					<div class="text-muted" style="font-size:x-small;">Writer.</div>
					<div style="font-size:small; color:#344157;">${community.writer}</div>
				</div>
				<div class="col-1 order-last" id="getCount" style="position: absolute; font-size: x-small; right: 0px; bottom: 0px;"> 
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
			<span class="badge badge-pill" style="border: 1px solid black;">
				<button type="button" style="border: none; background: none;">
					<i class="far fa-heart" ></i>
				</button>
				<span style="font-size: 11px;">20</span>
				<button style="border: none; background: none;">
					<i class="fas fa-ellipsis-v"></i>
				</button>
			</span>
		</div>
		<div class="col-6" align="right" style="bottom: 5px;" >
			<button style="border: none; background: none;" id="update"><span style="font-size: 10px" >수정</span></button>
			<span style="font-size: 8px">|</span>
			<button style="border: none; background: none;" id="delete"><span style="font-size: 10px" >삭제</span></button>
		</div>
	</div>
	
	<br>
	
	<div class="row no-gutters">
		<div class="col-1">
			<strong style="font-size: 15px;">#Hashtag</strong>
		</div>
		<div class="col-11">
			<div class="alert alert-light" role="alert">
				<c:forEach var="hashtag" begin="0" end="40" step="1">
				    <button type="button" class="btn btn-outline-dark " style="height: 20px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
				    	<span style="font-size: 13px;">#Paris</span>
				    </button>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<br><br><br>
	
	<div class="row">
		<div class="col-6">
			<strong style="font-size: 15px;">관련글</strong>
		</div>
		<div class="col-3 offset-3" align="right">
			<span id="more" style="font-size: 10px; cursor: pointer;">관련글 더보기</span>
		</div>
	</div>
	
	<br>
	
	<div class="row" align="center">
		<c:forEach var="i" begin="0" end="3">
			<div class="col-3">
				<a href="#"><img src="/resources/images/dog.JPG" id="bbsImage1" name="userImage" alt="글쓴이" class="" width="230px" height="150px" style="border-radius: 6px;"></a>
			</div>
		</c:forEach>
	</div>
	
	<br><br><br>
	
	<div class="row" style="border: 1px solid red;" >
		<div class="col-6">
			<span><strong>댓글</strong>&nbsp;</span>
			<span><strong style="color: #3f6eba;">2</strong></span>
		</div>
	</div>
	<hr align="center">
	
	<div class="row">
		<div class="container col-12">
			<div class="row col-md-6" id="profile-box" style="border: 1px solid red;"><!-- style="position: relative; left: 20px" -->
				<div class="col-1"id="profile-image">
					<a href="#"><img src="/resources/images/dog.JPG"  class="rounded-circle" id="userImage" name="userImage" alt="글쓴이" width="45px" height="45px"></a>
				</div>
				<div class="align-self-start" id="profile-nickname"><!-- style="position: absolute; top: 10px; left: 52px;" -->
					<div class="col-10 offset-1">
						<span onclick="#" style="font-size: 13px; color:#3c64a6;">${community.writer}</span>
						<span style="font-size: 9px">19.06.27 15:26</span>
						<span style="font-size: 8px">|</span>
						<span style="font-size: 9px">신고</span>
					</div>
					<!-- <div class="row">
						<p style="font-size:small; border: 1px solid black; width: 96%">
						나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이
						나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이
						나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이
						</p>
					</div >
					<div class="row">
						<span style="font-size: 9px; right: 0px;">답글하기</span>
					</div> -->
				</div>
			</div>
		</div>
	</div>
		<br><br>
		
		
	<!-- <div>
		<div class="row">대댓글
			<div class="col-xs-12">
				<div class="row" id="profile-box" style="position: relative; left: 50px">
					<div id="profile-image">
						<a href="#"><img src="../images/dog.JPG" id="userImage" name="userImage" alt="글쓴이" class="img-circle" width="45px" height="45px"></a>
					</div>
					<div id="profile-nickname" style="position: absolute; top: 10px; left: 52px;">
						<div>
							<span onclick="#" style="font-size: 13px; color:#3c64a6;">아ㅇ라다더라ㅏㅓㅇ</span>
							<span style="font-size: 9px">19.06.27 15:26</span>
							<span style="font-size: 8px">|</span>
							<span style="font-size: 9px">신고</span>
						</div>
						<div>
							<p style="font-size:small; border: 1px solid black; width: 96%">
							나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이나무발발이
							</p>
						</div >
						<div>
							<span onclick="#" style="font-size: 10px">수정</span>
							<span style="font-size: 8px">|</span>
							<span style="font-size: 10px">삭제</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<br><br><br><br>
		<div class="row">댓글창
			<div class="col-xs-12">
				<textarea class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>
			</div>
		</div> -->
	<br><br><br>
	<br><br><br>
	
	
	
	
	
	
</div>
	
	
	
	
	
<!-- <div class="col-xs-1"></div> -->
</body>
</html>