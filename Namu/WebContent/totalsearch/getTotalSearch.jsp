<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<link rel="stylesheet" href="/resources/css/common.css" >
<!--  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> -->
 <script src="/resources/javascript/youtube.js"></script>
<script src="https://apis.google.com/js/client.js?onload=onClientLoad" type="text/javascript"></script>
<style type="text/css">
.totalSearchClick {
	font-size: 25px;
}
</style>
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<br><br>
<div class="container-fluid">

		<div class="row">
			<div class="col-md-12 col-lg-12">
				<div class="row"></div>
			</div>


			<div class="col-1 col-md-1">
			</div>
			<br>
			<div class="col-10 col-md-10 col-lg-10">
			<c:if test="${!empty tourList }">
			<p class="totalSearchClick">관광지<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029; " ></i></p>
				<hr>
				<div class="row mb-2">
				<c:forEach var="tour" items="${tourList }" end="3">
				    <div class="col-md-6">
				      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-primary">${tour.tourLoc }</strong>
				          <h3 class="mb-0">${tour.tourName }</h3>
				          <div class="mb-1 text-muted">${tour.hashtag }</div>
				          <p class="card-text mb-auto">${tour.tourShortDesc }</p>
				          <a href="/guide/selectTourDetail/${tour.tourId }" class="stretched-link">Continue reading</a>
				        </div>
				        <div class="col-auto d-none d-lg-block">
				        	<img alt="" src="${tour.tourThumb }" width="250" height="250">
				        </div>
				      </div>
				    </div>
				    </c:forEach>
				  </div>
				  <br>
				<br>
				  </c:if>
				<p class="totalSearchClick">YouTube<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029;" ></i></p>
				<hr>
				<div class="row mb-2">
				
					<div class= "col-md-6">
						 <iframe id="player0" type="text/html" width="550" height="400"
							  src="https://www.youtube.com/embed/fk9-FfGVt5Q" frameborder="0"></iframe>
					  </div>
<!-- 					  <div class= "col-1 col-md-1 col-lg-1"> -->
<!-- 					  </div> -->
					 <div class= "col-md-6">
						<iframe id="player1" type="text/html" width="550" height="400"
							  src="https://www.youtube.com/embed/fk9-FfGVt5Q" frameborder="0"></iframe>
							  <br><br>
					   </div>
				
							
				<div class= "col-md-6">
						 <iframe id="player2" type="text/html" width="550" height="400"
							  src="https://www.youtube.com/embed/fk9-FfGVt5Q" frameborder="0"></iframe>
					  </div>
<!-- 					  <div class= "col-1 col-md-1 col-lg-1"> -->
<!-- 					  </div> -->
				<div class= "col-md-6">
						<iframe id="player3" type="text/html" width="550" height="400"
							  src="https://www.youtube.com/embed/fk9-FfGVt5Q" frameborder="0"></iframe>
					   </div>
				</div>
				
				
				<hr>
				<br>
				<br>
				
				
				<c:if test="${!empty communityList  }">
				<p class="totalSearchClick">커뮤니티<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029;" ></i></p>
				<hr>
				</c:if>
					<c:forEach varStatus="status" var="community" items="${communityList }" end="3">
				<div class="preview-${status.index +1} row mb-1">
					<input type="hidden" name="communityCode" value="${community.communityCode }">
					<div class="col-md-12">
						<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
							<div class="col p-4 d-flex flex-column position-static">
								<strong class="d-inline-block mb-2 text-primary">@ ${community.writer.nickname }</strong>
								<h3 class="mb-0">${community.communityTitle }</h3>
								<div class="mb-1 text-muted">${community.communityDate } &nbsp;&nbsp;&nbsp;&nbsp; 조회수&nbsp;${community.views }</div>
								<p class="communityContent card-text mb-auto">${community.communityContent }</p>
								<a href="/community/getCommunity?communityCode=${community.communityCode }" class="stretched-link">Continue reading</a>
							</div>
							<div class="col-auto d-none d-lg-block">
								<img src="/resources/images/ThumbNail/${community.communityThumbnail}"  width="250" height="250">
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<br><br><br><br><br><br><br><br><br><br><br><br><br>
				
				</div>
				<div class="col-1 col-md-1">
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
				</div>
				</div>
				

	<input type="hidden" id="keyword" value="${keyword }">
	
	<script type="text/javascript">
	
	//게시글 조회시 태그로 검색되어서 텍스트만 남기는 처리
	$(window).load(function(){
		$.each($('div[class^=preview-]'),function(){
			$(this).find($('.communityContent')).next().text($(this).find($('.communityContent')).next().text());
		})
	});
		 
		function search(keyword) {
		    var request = gapi.client.youtube.search.list({
		        part: 'snippet',
		        q : keyword
		    });
		    request.execute(onSearchResponse);
		}
		function onSearchResponse(response) {
		   //var str = JSON.stringify(response.result);
		    //$('#search-container').html('<pre>' + str + '</pre>');
			var res = response.items;
		    var responseString = JSON.stringify(response, '', 2);
		    //document.getElementById('response').innerHTML = responseString;
		    //document.getElementById('response').innerHTML = res[0].id.videoId;
		    //$("#response").text(res[0].id.videoId);
		    var idx = 0;
		    $.each(response.items, function(){
		    	if(idx == 4) {
		    		return;
		    	}
		    	//$("#response").append('<iframe id="player"'+idx+' type="text/html" width="350" height="300" frameborder="0" src="http://www.youtube.com/embed/"'+response.items[idx].id.videoId+ '></iframe>');
		    	//$("#response").html('<iframe id="player" type="text/html" width="350" height="300" frameborder="0" src="http://www.youtube.com/embed/"'+response.items[idx].id.videoId+ '></iframe>');
		    	$("#player"+idx).attr("src","http://www.youtube.com/embed/"+response.items[idx].id.videoId);
		    	idx++;
		    	
		    });
		}
		
		$(function(){
			$('.totalSearchClick').on('click',function(){
				var where = $(this).text().trim();
				if(where == '관광지') {
					self.location = '/guide/initTour';
				}else if(where == '커뮤니티') {
					self.location = '/community/getCommunityList';
				}
			})
				
			})
	
	</script>
</body>
</html>