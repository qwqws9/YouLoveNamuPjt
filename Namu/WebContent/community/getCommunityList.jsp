<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- SearchBox -->
<link href="/resources/css/search.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<script type="text/javascript" src="/resources/javascript/community.js"></script>
<!-- 이모티콘 -->
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>

<!-- jQuerty -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<!-- Our Own Resources -->


	<script>
		$.fn.selectpicker.Constructor.BootstrapVersion = '4';
			
		$( function() {
			$( "#addCommunity" ).on("click" , function() {
				self.location = "/community/addCommunity.jsp"
			});
		    $(".board").on("click", function(){
		    	if($(this).children().text() == $(".free").text()){
		    		self.location = "/community/getCommunityList?communityBoard=1"			
		    	}else if($(this).children().text() == $(".city").text()){
		    		self.location = "/community/getCommunityList?communityBoard=2"			
		    	}else if($(this).children().text() == $(".qna").text()){
		    		self.location = "/community/getCommunityList?communityBoard=3"			
		    	}else{
		    		self.location = "/community/getCommunityList?communityBoard=0"
		    	}
		    })
		    $('a[href$="#Modal"]').on( "click", function() {
		    	   $('#Modal').modal('show');
		   	});
		    
		    $(".getCommunity").on("click", function(){
		    	self.location="/community/getCommunity?communityCode="+$(this).parents(".row.list").find(".communityCode").text();
		    })
			$(".card.bestCommunity").on("click", function(){
				self.location="/community/getCommunity?communityCode="+$(this).prev().val();								
			})		    
		    
		    //$(".content").text("")
		    
		    
		    $.each($(".content"),function(){
		    	$(this).text($(this).text().trim());
		    })
		    $.each($(".card-body"),function(){
		    	$(this).text($(this).text().trim());
		    })
		    
		    $("#searchSelect").change(function(){
				var selected = $("#searchSelect option:selected").val();
				if(selected == 0){
					$("#selectCity").show();			
				}else{
					$("#selectCity").hide();
				}
				
			});
		 });
			
		
		var page = 2;
		$(window).scroll(function() {
			var scrollH = $(document).height();
			var scrollT	= $(window).scrollTop();
			var scrollP = $(window).height();
			console.log("documentHeight:" + scrollH + " | scrollTop:" + scrollT + " | windowHeight: " + scrollP );
			
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		    	callCommunityList(page);
		    	page++;
		    }//end of if
		});//end of scroll
				
		
		
			
			

 	</script>
	<style>
	#communityTop {
		
	}
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-lg-12">
				<div class="row"></div>
			</div>


			<div class="col-1 col-md-1"></div>
			<br>
			<div class="col-10 col-md-10 col-lg-10">
				<div class="row">
					<div class="col-2 col-md-2 col-lg-2" style="top: 8px;">
						<h5>
							<strong style="font-style: inherit;">Community</strong>
						</h5>
					</div>
					<div class="col-md-10 col-lg-9">
						<div class="row justify-content-end" style="padding-top: 13px;">
							<div class="col-1 col-xs-1" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="all" >전체</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="free" >자유</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="city">도시별</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 15px;">
								<a href="#" class="board" style="color: #282c37;"><strong class="qna">QnA</strong></a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row justify-content-center">
					<div class="col-md-10">
						<div class="row">
							<c:forEach var="best" items="${bestlist}" begin="0" end="2">
								<div class="col-md-4">
									<input type="hidden" class="bestCommunityCode" value="${best.communityCode}" />
									<div class="card bestCommunity" style="width: 350px; cursor: pointer;">
										<img src="/resources/images/ThumbNail/${best.communityThumbnail }" class="card-img-top" alt="..." style="height: 250px;">
										<div class="card-body" style="overflow: hidden; text-overflow: ellipsis; height: 130px;font-size: 30px; font-weight: bold;">
											${best.communityTitle}
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- row -->
					</div>
				</div>
				<br>


				<div class="row justify-content-center">
					<div class="col-10 col-md-10">
						<form><!-- Search -->
						<div class="row">
							<div class="col-lg-6">
								<div class="Search">
									<div class="input-holder">
										<input type="text" class="search-input" name="searchKeyword" placeholder="Search" value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
										<button type="button" class="search-icon" onclick="searchToggle(this, event);">
											<span></span>
										</button>
									</div>
									<span class="close" onclick="searchToggle(this, event);"></span>
								</div>
							</div>

							<div class="col-lg-4 offset-lg-2">
								<div class="row float-right">
									<div class="col mr-3">
										<select id="searchSelect" name="searchCondition" class="form-control" title="All" style="border: 1px solid #30a9de; background: white;">
											<option value="5" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""  }>All</option>
											<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""  }>City</option>
											<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""  }>Title</option>
											<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""  }>Content</option>
											<option value="3" ${! empty search.searchCondition && search.searchCondition==3 ? "selected" : ""  }>#HashTag</option>
											<option value="4" ${! empty search.searchCondition && search.searchCondition==4 ? "selected" : ""  }>Writer</option>
										</select>
									</div>
									<div id="selectCity" class="col" style="display:  none;">
										<select id="selectCity" class="selectpicker" data-live-search="true" data-width="100px" title="City" style="border: 1px solid #30a9de; background: white;">
											<c:set var="i" value="0"/>
											<c:forEach var="city" begin="0" end="5">
												<c:set var="i" value="${i+1}"/>
													<option value="${i}">${i}</option>
											</c:forEach>
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
								<div class="col-2 col-md-2" style="top: 30px;">
									<p class="text-center" style="font-size: small; color: #344157;">
										No.<span class="communityCode">${community.communityCode}</span>
									</p>
									<p class="text-center communityBoard" style="font-size: small; color: #344157;">
										<c:if test="${community.communityBoard eq '1'}">자유 게시판</c:if>
										<c:if test="${community.communityBoard eq '2'}">도시별 게시판</c:if>
										<c:if test="${community.communityBoard eq '3'}">QnA 게시판</c:if>
									</p>
									<c:if test="${community.communityBoard eq '2'}">
										<p class="text-center"
											style="font-size: small; color: #344157;">[${community.city}]</p>
									</c:if>
								</div>
								<div class="col-7 col-md-7">
									<div class="row" id="profile-box" style="position: relative;">
										<div id="profile-image">
											<a href="#"><img src="/resources/images/dog.JPG" id="userImage" name="userImage" alt="글쓴이" class="rounded-circle" width="45px" height="45px"></a>
										</div>
										<div id="profile-nickname" style="position: absolute; top: 8px; left: 52px;">
											<div style="font-size: small; color: #3c64a6;">글쓴이</div>
											<div style="font-size: small; color: #344157;">${community.writer}</div>
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
								<div class="col-3 col-md-3">
									<img alt="" class="getCommunity image" name="thumbnail" src="/resources/images/ThumbNail/${community.communityThumbnail }" width="250px" height="160px" style="border-radius: 6px; cursor: pointer;">
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
					
				</div>
			</div>
			<div class="col-1 col-md-1">
				<div class="row">
					<div class="col" style="position: fixed; bottom: 30px;">
						<button type="button" id="addCommunity"
							style="border-radius: 30px; border: 2px dashed #f2c029; background: none; width: 60px; height: 60px;">
							<i class="fas fa-pencil-alt fa-2x"
								style="color: #f2c029; width: 30px; height: 30;"></i>
						</button>
					</div>
				</div>
			</div>

			<!-- modal 크롬 북마크 -->

		</div>
		<!-- Container -->
	</div>
	<!-- row of Container -->
</body>
</html>