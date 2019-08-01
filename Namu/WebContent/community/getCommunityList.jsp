<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- SearchBox -->
	<link href="/resources/css/search.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script src="/resources/javascript/getProfile.js"></script>
	<script type="text/javascript" src="/resources/javascript/getCommunityList.js"></script>
	<!-- 이모티콘 -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	<!-- jQuerty -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	
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
	 	.bestTitle{ 
	 		word-break:break-all; 
	 		position: absolute; 
	 		bottom: 0px; 
	 		z-index: -1; 
		} 
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	<input type="hidden" class="side" value="getCommunityList">

	<div class="container-fluid" id="listCommunity" >
		<div class="row">
			<div class="col-md-12 col-lg-12">
			
			
				<div class="row" style="background-color: rgba(242, 192, 41, 0.1); height: 500px;">
					<div class="col-md-12 col-lg-12">
					
					
						<div class="col-md-3 offset-1">
							<h1>Community</h1>
						</div>
					
					
					</div>
				</div>
				
				<br><br><br>
			
				<div class="row justify-content-center">
					<div class="owl-carousel owl-theme owl-loaded" style="width: 90%;">
					    <div class="owl-stage-outer">
					        <div class="owl-stage">
					        	<c:forEach var="best" items="${bestlist}" begin="0" end="10">
						            <div class="owl-item" style="">
										<img src="/resources/images/ThumbNail/${best.communityThumbnail }" class="card-img-top" alt="..." style="height: 250px;">
						            	<input type="hidden" class="bestCommunityCode" value="${best.communityCode}" />
										<div class="bestTitle" style="overflow: hidden; text-overflow: ellipsis;font-size: 20px; font-weight: bold;">
											${best.communityTitle}
										</div>
						            </div>
					        	</c:forEach>
					        </div>
					    </div>
					    <div class="owl-nav">
					        <div class="owl-stop">stop</div>
					        <div class="owl-start">start</div>
					    </div>
					</div>		
				</div>
			</div>


			<div class="col-1 col-md-1"></div>
			<div class="col-10 col-md-10 col-lg-10">
				<div class="row">
					<div class="col-2 col-md-2 col-lg-2 offset-1" style="top: 8px;">
						<h5>
							<strong style="font-style: inherit;"></strong>
						</h5>
					</div>
					<div class="col-md-9 col-lg-9">
						<div class="row justify-content-end" style="padding-top: 13px;">
							<div class="col-md-2 col-lg-2 offset-4" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="all" >전체</strong></a>
							</div>
							<div class="col-md-2 col-lg-2" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="free" >자유</strong></a>
							</div>
							<div class="col-md-2 col-lg-2" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="city">도시별</strong></a>
							</div>
							<div class="col-md-2 col-lg-2" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="qna">QnA</strong></a>
							</div>
						</div>
					</div>
				</div>
				
				
				<br>
				
				
<!-- 				<div class="row justify-content-center"> -->
<!-- 					<div class="col-md-10"> -->
<!-- 						<div class="owl-carousel owl-theme owl-loaded"> -->
<!-- 						    <div class="owl-stage-outer"> -->
<!-- 						        <div class="owl-stage"> -->
<%-- 						        	<c:forEach var="best" items="${bestlist}" begin="0" end="2"> --%>
<!-- 							            <div class="owl-item"> -->
<%-- 							            	<input type="hidden" class="bestCommunityCode" value="${best.communityCode}" /> --%>
<!-- <!-- 											<div class="card bestCommunity" style="width: 350px; cursor: pointer;"> -->
<%-- 												<img src="/resources/images/ThumbNail/${best.communityThumbnail }" class="card-img-top" alt="..." style="height: 250px;"> --%>
<!-- 												<div class="card-body" style="overflow: hidden; text-overflow: ellipsis; height: 130px;font-size: 30px; font-weight: bold;"> -->
<%-- 													${best.communityTitle} --%>
<!-- 												</div> -->
<!-- <!-- 											</div> -->
<!-- 							            </div> -->
<%-- 						        	</c:forEach> --%>
<!-- 						        </div> -->
<!-- 						    </div> -->
<!-- 						    <div class="owl-nav"> -->
<!-- 						        <div class="owl-stop">stop</div> -->
<!-- 						        <div class="owl-start">start</div> -->
<!-- 						    </div> -->
<!-- 						</div>			 -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				
<!-- 				<div class="row justify-content-center"> -->
<!-- 					<div class="col-md-10"> -->
<!-- 						<div class="d-flex justify-content-center"> -->
<%-- 							<c:forEach var="best" items="${bestlist}" begin="0" end="2"> --%>
<!-- 								<div class="p-2 border"> -->
<%-- 									<input type="hidden" class="bestCommunityCode" value="${best.communityCode}" /> --%>
<!-- 									<div class="card bestCommunity" style="width: 350px; cursor: pointer;"> -->
<%-- 										<img src="/resources/images/ThumbNail/${best.communityThumbnail }" class="card-img-top" alt="..." style="height: 250px;"> --%>
<!-- 										<div class="card-body" style="overflow: hidden; text-overflow: ellipsis; height: 130px;font-size: 30px; font-weight: bold;"> -->
<%-- 											${best.communityTitle} --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<%-- 							</c:forEach> --%>
<!-- 						</div> -->
<!-- 						row -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				<br>


				<div class="row justify-content-center">
					<div class="col-10 col-md-10">
						<form><!-- Search -->
						<input type="hidden" id="communityBoardURL" name="communityBoard" value="">
						<div class="row">
							
							
							<div class="col-md-6 col-lg-6">
								<div class="communitySearch">
									<div class="community input-holder">
										<input type="text" class="search-input" name="searchKeyword" placeholder="Search" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
										<button type="button" class="search-icon" onclick="searchCommunity(this, event);">
											<span></span>
										</button>
									</div>
									<span class="close" onclick="searchCommunity(this, event);"></span>
								</div>
							</div>
							
<!-- 							<div class="col-lg-6"> -->
<!-- 								<div class="Search"> -->
<!-- 									<div class="input-holder"> -->
<%-- 										<input type="text" class="search-input" name="searchKeyword" placeholder="Search" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/> --%>
<!-- 										<button type="button" class="search-icon" onclick="searchToggle(this, event);"> -->
<!-- 											<span></span> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 									<span class="close" onclick="searchToggle(this, event);"></span> -->
<!-- 								</div> -->
<!-- 							</div> -->

							<div class="col-lg-6">
								<div class="row float-right">
									<div class="col mr-3">
										<select id="searchSelect" name="searchCondition" class="form-control" title="All" style="border: 1px solid #30a9de; background: white;">
											<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""  }>Title</option>
											<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""  }>Content</option>
											<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""  }>Location</option>
											<option value="3" ${! empty search.searchCondition && search.searchCondition==3 ? "selected" : ""  }>#HashTag</option>
											<option value="4" ${! empty search.searchCondition && search.searchCondition==4 ? "selected" : ""  }>Writer</option>
										</select>
									</div>
									<div id="selectCountry" class="col" style="display:  none;">
										<select name="country" id="country" class="form-control" title="Country" style="border: 1px solid #30a9de; background: white;">
										</select>
									</div>
									<div id="selectCity" class="col" style="display:  none;">
										<select name="city" id="city" class="form-control" title="City" style="border: 1px solid #30a9de; background: white;">
										</select>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
					
					
					<div class="col-10 col-md-10 append">
						<hr align="center">
						<c:forEach var="community" items="${list}">
							<div class="row list">
								<div class="col-2 col-md-2" style="top: 10px;">
									<p class="text-center" style="font-size: small; color: #344157;">
									<input type="hidden" class="communityCode" value="${community.communityCode}">
										No.<span class="">${community.communityCode}</span>
									</p>
									<p class="text-center communityBoard" style="font-size: small; color: #344157;">
										<c:if test="${community.communityBoard eq '1'}">자유 게시판</c:if>
										<c:if test="${community.communityBoard eq '2'}">도시별 게시판</c:if>
										<c:if test="${community.communityBoard eq '3'}">QnA 게시판</c:if>
									</p>
									<c:if test="${community.communityBoard eq '1'}">
										<p class="text-center" ><i class="fab fa-fly fa-2x"></i></p>
									</c:if>
									<c:if test="${community.communityBoard eq '2'}">
										<p class="text-center" ><img alt="" class="getCommunity image" name="thumbnail" src="/resources/images/flag/${community.city.flagImage}" width="30px" height="20px" style="border-radius: 3px; cursor: pointer;"></p>
										<p class="text-center" style="font-size: small; color: #344157;">[${community.city.countryName}]</p>
										<p class="text-center" style="font-size: small; color: #344157;">[${community.city.cityName}]</p>
									</c:if>
									<c:if test="${community.communityBoard eq '3'}">
										<p class="text-center" ><i class="far fa-comments fa-2x"></i></p>
									</c:if>
								</div>
								<div class="col-7 col-md-7">
									<div class="profile-box row"  style="position: relative;">
									<input type="hidden" value="${community.writer.userCode }">
										<div class="profile-image">
											<img src="/resources/images/profile/${community.writer.profileImg }"  name="userImage" alt="글쓴이" class="rounded-circle" width="45px" height="45px">
										</div>
										<div class="profile-nickname" style="position: absolute; top: 8px; left: 52px;">
											<div style="font-size: small; color: #3c64a6;">글쓴이</div>
											<div style="font-size: small; color: #344157;">${community.writer.nickname}</div>
										</div>
									</div>

									<div class="row" style="margin-top: 10px;">
										<div style="overflow: hidden; text-overflow: ellipsis; height: 30px">
											<h5 style="resize: none; display: inline-blocke">
												<strong class="getCommunity title" style="cursor: pointer;">${community.communityTitle }&nbsp;&nbsp;</strong>
												<small style="font-size: small;">${community.communityDate }&nbsp;&nbsp;</small>
												<small style="font-size: small;">조회수&nbsp;${community.views }</small>
											</h5>
										</div>
									</div>
									<div class="row">
										<div class="getCommunity content" style="overflow: hidden; text-overflow: ellipsis; height: 50px; cursor: pointer;">
											<span class="content" style="resize: none; display: inline-blocke;">${community.communityContent}</span>
										</div>
									</div>
								</div>
								<div class="col-3 col-md-3 col-lg-3">
									<img alt="" class="getCommunity image" name="thumbnail" src="/resources/images/ThumbNail/${community.communityThumbnail }" width="250px" height="160px" style="border-radius: 6px; cursor: pointer;">
								</div>
								
							</div>
							<hr>
						</c:forEach>
					</div>
					
				</div>
			</div>
			
			
			<div class="col-1 col-md-1">
				<c:if test=""></c:if>
				<div class="row">
					<div class="col" style="position: fixed; bottom: 30px;">
						<button type="button" id="addCommunity"
							style="border-radius: 30px; border: 2px dashed #30a9de; background: none; width: 60px; height: 60px;">
							<i class="fas fa-pencil-alt fa-2x"
								style="color: #30a9de; width: 30px; height: 30;"></i>
						</button>
					</div>
				</div>
			</div>
			<!-- modal 크롬 북마크 -->
		</div>
		<!-- Container -->
	</div>
	<!-- row of Container -->
	<div class="profilePopup" style="disaply:none;"></div>
	
<script>
	var session = <%=session.getAttribute("user") != null%>
</script>
</body>
</html>