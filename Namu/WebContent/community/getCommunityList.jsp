<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- SearchBox -->
<link href="../resources/css/search.css" rel="stylesheet">
<!-- 이모티콘 -->
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>

<!-- jQuerty -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

<script>
		$.fn.selectpicker.Constructor.BootstrapVersion = '4';
		
	  	function searchToggle(obj, evt){
	  	    var container = $(obj).closest('.Search');
	  	        if(!container.hasClass('active')){
	  	            container.addClass('active');
	  	            evt.preventDefault();
	  	        }
	  	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	  	            container.removeClass('active');
	  	            // clear input
	  	            container.find('.search-input').val('');
	  	        }
	  	}
		
		$( function() {
			$( "#addCommunity" ).on("click" , function() {
				self.location = "/community/addCommunity.jsp"
			});
		    
		   // $("#City").selectmenu();
		    
		    $('a[href$="#Modal"]').on( "click", function() {
		    	   $('#Modal').modal('show');
		   	});
		    
		    $("#bestCommunity").on("click", function(){
			    alert($("#bestCommunity").val());
		    	//self.location="/community/getCommunity?communityCode="+$(this).find(":hidden").val();
		    })
		    $(".getCommunity.image").on("click", function(){
		    	alert($("#communityCodelist").index(this));
		    	
		    	//alert($("card input:nth-child(1)").html());
		    	//self.location="/community/getCommunity?communityCode="+$("#communityCodelist").val();
		    })
		    $(".getCommunity.title").on("click", function(){
		    	alert($("#communityCodelist").index(this));
		    })
		    	//self.location="/community/getCommunity?communityCode="+$("#communityCodelist").val();
		    })
		    $(".getCommunity.content").on("click", function(){
		    	alert($("#communityCodelist").val());
		    	//self.location="/community/getCommunity?communityCode="+$("#communityCodelist").val();
		    })
		    
		    $('.card ')
		   // $( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
               var prodNo = $( $('.ct_list_pop td:nth-child(1)')[$('.ct_list_pop td:nth-child(1)').index(this)]).text().trim();
		    
		    /* $("#content").text($("#content")val());
		    $("#content").html();
		    var list = '${list}';
		    for(var i=0; i< '${list}';i++){
		    	console.log($("#content").text());
		    }
		    $("#content").text("값변경")
		    alert($("#content").html());
		     */
		    
		    
		    $("#searchSelect").change(function(){
				var selected = $("#searchSelect option:selected").val();
				if(selected == 1){
					$("#selectCity").show();			
				}else{
					$("#selectCity").hide();
				}
				
			});
		 });
		
		
		

 	</script>
<style>
#communityTop {
	
}
</style>
</head>

<body>

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
							<div class="col-1 col-xs-1" style="font-size: 14px;">
								<a href="#" style="color: #ff7d75;"><strong>전체</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 14px;">
								<a href="#" style="color: #ff7d75;"><strong>자유</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 14px;">
								<a href="#" style="color: #ff7d75;"><strong>도시별</strong></a>
							</div>
							<div class="col-1 col-xs-1" style="font-size: 14px;">
								<a href="#" style="color: #ff7d75;"><strong>QnA</strong></a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row justify-content-center">
					<div class="col-md-10">
						<div class="row">
							<c:forEach var="best" items="${list}" begin="0" end="2">
								<div class="col-md-4">
									<div class="card" id="bestCommunity"
										style="width: 350px; cursor: pointer;">
										<input type="hidden" id="communityCode" name="communityCode"
											value="${best.communityCode}" /> <img
											src="/resources/images/ThumbNail/${best.communityThumbnail }"
											class="card-img-top" alt="..." style="height: 250px;">
										<div class="card-body"
											style="overflow: hidden; text-overflow: ellipsis; height: 130px;">
											<h5 class="card-title">${best.communityTitle}</h5>
											<p class="card-text">${best.communityContent }</p>
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
						<div class="row">


							<div class="col-lg-6">
								<div class="Search">
									<div class="input-holder">
										<input type="text" class="search-input" placeholder="Search" />
										<button type="button" class="search-icon"
											onclick="searchToggle(this, event);">
											<span></span>
										</button>
									</div>
									<span class="close" onclick="searchToggle(this, event);"></span>
								</div>
							</div>

							<div class="col-lg-4 offset-lg-2">
								<div class="row float-right">
									<div class="col mr-3">
										<select id="searchSelect" class="selectpicker" multiple
											data-actions-box="true" title="All"
											style="border: 1px solid #ff7d75; background: white;">
											<option value="1">City</option>
											<option value="2">Title</option>
											<option value="3">Content</option>
											<option value="4">#HashTag</option>
											<option value="5">Writer</option>
										</select>
									</div>
									<div id="selectCity" class="col" style="display: none;">
										<select id="selectCity" class="selectpicker"
											data-live-search="true" data-width="100px" title="City">
											<option>파리</option>
											<option>구리</option>
											<option>보리</option>
										</select>
									</div>
								</div>
							</div>

						</div>
						<hr align="center">
						<c:forEach var="community" items="${list}">
							<input class="communityCode" type="hidden" id="communityCodelist"
								name="communityCode" value="${community.communityCode}" />
							<div class="row">
								<div class="col-2 col-md-2" style="top: 30px;">

									<p class="text-center"
										style="font-size: x-small; color: #344157;">No.${community.communityCode}</p>
									<p class="text-center"
										style="font-size: x-small; color: #344157;">
										<c:if test="${community.communityBoard eq '1'}">자유 게시판</c:if>
										<c:if test="${community.communityBoard eq '2'}">도시별 게시판</c:if>
										<c:if test="${community.communityBoard eq '3'}">QnA 게시판</c:if>
									</p>
									<c:if test="${community.communityBoard eq '2'}">
										<p class="text-center"
											style="font-size: x-small; color: #344157;">[${community.city}]</p>
									</c:if>
								</div>
								<div class="col-7 col-md-7">
									<div class="row" id="profile-box" style="position: relative;">
										<div id="profile-image">
											<a href="#"><img src="/resources/images/dog.JPG"
												id="userImage" name="userImage" alt="글쓴이"
												class="rounded-circle" width="45px" height="45px"></a>
										</div>
										<div id="profile-nickname"
											style="position: absolute; top: 10px; left: 52px;">
											<div style="font-size: x-small; color: #3c64a6;">글쓴이</div>
											<div style="font-size: small; color: #344157;">
												${community.writer}</div>
										</div>
									</div>

									<div class="row" style="margin-top: 10px;">
										<div
											style="overflow: hidden; text-overflow: ellipsis; height: 30px">
											<h5 style="resize: none; display: inline-blocke">
												<strong class="getCommunity title" style="cursor: pointer;">${community.communityTitle }&nbsp;&nbsp;</strong>
												<small style="font-size: xx-small;">${community.communityDate }&nbsp;&nbsp;</small>
												<small style="font-size: xx-small;">조회수&nbsp;${community.views }</small>
											</h5>
										</div>
									</div>
									<div class="row">
										<div class="getCommunity content"
											style="overflow: hidden; text-overflow: ellipsis; height: 50px; cursor: pointer;">
											<span id="content"
												style="resize: none; display: inline-blocke">
												${community.communityContent} </span>
										</div>
									</div>
								</div>
								<div class="col-3 col-md-3">
									<img alt="" class="getCommunity image"
										src="/resources/images/ThumbNail/${community.communityThumbnail }"
										width="250px" height="160px"
										style="border-radius: 6px; cursor: pointer;">
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
							style="border-radius: 30px; border: 2px dashed #ff7d75; background: none; width: 60px; height: 60px;">
							<i class="fas fa-pencil-alt fa-2x"
								style="color: #ff7d75; width: 30px; height: 30;"></i>
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