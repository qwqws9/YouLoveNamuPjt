<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="ko">
<head>
	<meta charset="utf-8">
	<!-- Ckeditor -->
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
  	<script type="text/javascript" src="/resources/javascript/community.js"></script>
	<!-- Select Picker -->
  	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/js/bootstrap4-toggle.min.js"></script>
  	<!-- fontAwsome -->
  	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
  	
  	<style>
  	.btn.btn-outline-dark:not(:first-child){
  			margin-left:5px;
  		}
    </style>
	 
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<br><br>
<input type="hidden" id="update" value="update">
<div class="container-fluid">
<div class="row justify-content-center">
	<div class="col-lg-1"></div><!-- 추가예정(Side bar) -->
	<div class="col-lg-10">
			<br>
			<div class="row">
				<div class="col offset-1">
					<h4><strong>게시물 수정</strong></h4>
				</div>
			</div>
			<br>
			<form enctype="multipart/form-data">
			<input type="hidden" name="communityCode" value="${community.communityCode }">
				<div class="row justify-content-center">
					<div class="col-lg-10">
						<div class="card">
					  		<div class="card-body" style="border: 1px solid #cbcbcb;">
					  			<div class="row">
									<div class="col-lg-2">
										<select class="form-control" id="communityBoard" name="communityBoard">
										<c:if test="${community.communityBoard eq '1' }">
										  <option value="1" selected="selected" >자유 게시판</option>
										  <option value="2" id="selectedCity">도시별 게시판</option>
										  <option value="3" >QnA 게시판</option>
										</c:if>
										<c:if test="${community.communityBoard eq '2' }">
										  <option value="1" >자유 게시판</option>
										  <option value="2" id="searchSelect" selected="selected" >도시별 게시판</option>
										  <option value="3" >QnA 게시판</option>
										</c:if>
										<c:if test="${community.communityBoard eq '3' }">
										  <option value="1" >자유 게시판</option>
										  <option value="2" id="selectedCity">도시별 게시판</option>
										  <option value="3" selected="selected" >QnA 게시판</option>
										</c:if>
										</select>
									</div>
							  		<div class="col-lg-10 input-group" style="float:left;">
							      		<input type="text" class="form-control" id="title" name="communityTitle" placeholder="제목" value="${community.communityTitle }">
									</div>
					  			</div>
					  			
					  			<br>
					  			
					  			<div class="row">
					  				<div class="col-lg-12">
										<textarea class="form-control" name="communityContent" id="communityContent" rows="10" cols="80" >
											${community.communityContent }
										</textarea>
					  				</div>
					  			</div>
						  	</div>
						  	
						  	<div class="card-footer" style="background: none; border: 1px solid #cbcbcb;">
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<span class="align-middle"><strong style="font-style: inherit;" >#HashTag</strong></span>
						  			</div>
							  		<div class="col-lg-10 input-group">
								  		<input type="text" class="form-control" id="hashtag" name="hashtag" placeholder="#태그를 입력하세요. ex) #파리#에펠탑#abc" 
								  				onkeypress="javascript:if(event.keyCode==13){addHashtag();}"/>
							  		</div>
						  		</div>
						  		
						  		<div class="row">
						  			<div class="col-lg-2"></div>
						  			<div class="col-lg-10">
						  				<div class="alert alert-light" role="alert" style=" background: none; border: none;">
						  					<c:forEach var="hashtag" items="${hashtag}">
							  					<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
											    	<span style="font-size: 14px;">${hashtag}</span>
											    </button>
						  					</c:forEach>
										</div>
						  			</div>
						  		</div>
						  		
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<span class="align-middle"><strong style="font-style: inherit;" >Thumbnail</strong></span>
						  			</div>
						  			<div class="col-lg-10 input-group mb-3">
										<div class="custom-file">
										 	<input type="file" accept="image/*" class="custom-file-input" id="Thumbnail" name="Thumbnail" style="color: black;" value="${community.communityThumbnail }">
											<label class="custom-file-label" for="Thumbnail" data-browse="Image" style="color: #ff7d75;"></label>
										</div>
									</div>
						  		</div>
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<strong style="font-style: inherit;" >공개설정</strong>
						  			</div>
						  			<div class="col-lg-10 text-right">
						  				<select class="selectpicker form-control" id="openRange" name="openRange">
						  				<c:if test="${community.openRange eq '1' }">
										  	<option value="1" selected="selected" >전체</option>
										  	<option value="2" >회원만</option>
						  				</c:if>
						  				<c:if test="${community.openRange eq '2' }">
						  					<option value="1" >전체</option>
										  	<option value="2" selected="selected" >회원만</option>
						  				</c:if>
										</select>
						  			</div>
						  		</div>
						  		
						  		<br>
						  		<c:if test="${community.communityBoard eq '2' }">
							  		<div class="row" id="selecCity">
							  			<div class="col-lg-2">
							  				<strong style="font-style: inherit;" >위치 선택</strong>
							  			</div>
							  			<div class="col-lg-10">
							  				<span>나의 이전 위치는? : ${community.city.cityName}</span>
							  				<div class="row float-right">
												<div id="selectCountry" class="col" style="display:  none;">
													<select name="countryName" id="country" class="form-control" data-live-search="true" data-width="100px" title="City" style="border: 1px solid #30a9de; background: white;">
														<option>Country</option>
													</select>
												</div>
												<div id="selectCity" class="col" style="display:  none;">
													<select name="cityName" id="city" class="form-control" data-live-search="true" data-width="100px" title="City" style="border: 1px solid #30a9de; background: white;">
														<option style="display: none;" value="${community.city.cityName }" selected="selected" >Country</option>
													</select>
												</div>
							  				</div>
							  			</div>
							  		</div>
						  		</c:if>
						  		
						  		<br>
						  		
							  	<div class="row">
							  		<div class="col-lg-12 text-right">
							  			<button type="button" class="btn btn-outline-secondary add">등록</button>
							  			<button id="cancel" type="button" class="btn btn-outline-secondary cancel">취소</button>
							  		</div>
							  	</div>
						  	</div>
						</div><!-- end of card -->
						<br>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-1"></div><!-- 추가예정(Side bar) -->
</div><!-- container -->

<script>
	
	
</script>
</body>
</html>