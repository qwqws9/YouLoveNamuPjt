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
<script src="../resources/javascript/jquery.oLoader.min.js"></script>
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<link rel="stylesheet" href="/resources/css/common.css" >
</head>
<body>
<header><%@ include file="/layout/header.jsp" %></header>
<div class="container" id="initTour">

<br>
<div class="col-md-12">
<div class="row">
<div class="col-md-6">
<input type="text" id="inputKeyword" class="form-control" placeholder="어디로 떠나고 싶으세요?" >
</div>
<div class="col-md-6">
<button type="button" class="btn btn-outline-primary" id="userSearch" ><i class="fas fa-search-location"></i></button>
</div>
</div>
</div>
<hr>
<c:forEach varStatus="status" var="tour" items="${tourList }">
	<div class="preview-${status.index +1} row mb-1">
		<input type="hidden" name="tourId" value="${tour.tourId }">
		<div class="col-md-12">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">${tour.tourLoc }</strong>
					<h3 class="mb-0">${tour.tourName }</h3>
					<div class="mb-1 text-muted">${tour.hashtag }</div>
					<p class="card-text mb-auto">${tour.tourShortDesc }</p>
					<a href="#" class="stretched-link">Continue reading</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<img src="${tour.tourThumb }"  width="250" height="250">
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
	<input type="hidden" id="searchKeyword" value="${tourList[0].keyword }">
	<input type="hidden" id="firstPageNum" value="${tourList[0].firstPageNum }">
	<input type="hidden" id="pageCount" value="${tourList[0].pageCount }">
	
	
	
	<div class="text-xs-center">
			<nav aria-label="..." >
		  <ul class="pagination" style="justify-content: center;">
		    <li class="page-item disabled">
		      <a class="preBtn page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <c:forEach varStatus="status" begin="${tourList[0].firstPageNum }" end="${tourList[0].pageCount }">
		    <li class="pageTour-${status.index} page-item"><a class="viewPage page-link" href="#">
		    <c:if test="${tourList[0].firstPageNum == 1 }"> 
		    ${status.index}
		    </c:if>
		     <c:if test="${tourList[0].firstPageNum != 1 }"> 
		    ${status.index + (tourList[0].firstPageNum -1 ) }
		    </c:if>
		    </a></li>
		    </c:forEach>
		    
		    
		    <li class="page-item">
		      <a class="nextBtn page-link" href="#">Next</a>
		    </li>
		  </ul>
			</nav>
	</div>
</div><!-- 컨 -->
<form></form>
<script type="text/javascript">
	$(function(){
		$('body').oLoader({
			  wholeWindow: true, //makes the loader fit the window size
			  lockOverflow: true, //disable scrollbar on body
			   
			  backgroundColor: '#282c37',
			  fadeInTime: 1000,
			  fadeLevel: 0.7,
			  image: '../resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
			 
			});
		
		$('#inputKeyword').on('keydown',function(key){
			if(key.keyCode == 13) {
				userSearch();
			}
		});
		
		$('#userSearch').on('click',function(){
			userSearch();
		});
		
		
		
		$('li[class^=pageTour-1]').first().addClass('active');
		
		$('.nextBtn').on('click',function(){
			$.each($('li[class^=pageTour-'),function(index){
				$(this).children().text((parseInt($('#firstPageNum').val()) +10 + index));
				$(this).attr('class','pageTour-'+(parseInt($('#firstPageNum').val()) +10 + index)+' page-item');
			});
			$('.preBtn').parent().removeClass('disabled');
			selectTourPage(parseInt($('#firstPageNum').val()) +10,$('#searchKeyword').val().trim());
		})
		
		$('.preBtn').on('click',function(){
			$.each($('li[class^=pageTour-'),function(index){
				$(this).children().text((parseInt($('#firstPageNum').val()) -10 + index));
				$(this).attr('class','pageTour-'+(parseInt($('#firstPageNum').val()) -10 + index)+' page-item');
			});
			
			selectTourPage(parseInt($('#firstPageNum').val()) -10,$('#searchKeyword').val().trim());
		})
		
		
		//관광지 디테일 조회
		$('div[class^="preview-"]').on('click',function(){
			//self.location = '/guide/selectTourDetail/'+$(this).children().val().trim();
			
			var url = '/guide/selectTourDetail/'+$(this).children().val().trim();
			var name = "_blank";
			var option = "width = 1150,height = 1000,marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no,location = no"
			//window.open(url,name,option);
			self.location = url;
			//$('form').attr('action','/guide/selectTourDetail/'+$(this).children().val().trim()).submit();
			//self.location = '/user/addUser';
			//alert($(this).children().val().trim());
			
			//컨트롤러로 가야지.......................
// 			$.ajax({
// 				url : '/guide/json/selectTourDetail',
// 				method : 'post',
// 				data : JSON.stringify({
// 					tourId : $(this).children().val().trim()
// 				}),
// 				headers : {
// 					'Accept' : 'Application/json',
// 					'Content-Type' : 'Application/json'
// 				},
// 				success : function(JSONData, status){
// 					alert(status);
					
// 				}
// 			})
		});
		
		//페이지 이동시
		$('.viewPage').on('click',function(){
			//alert($(this).text().trim());
			//alert($('#searchKeyword').val());
			selectTourPage($(this).text().trim(),$('#searchKeyword').val());
		});
		
		
	}).ajaxStart(function(){
		$('body').oLoader({
			  wholeWindow: true, //makes the loader fit the window size
			  lockOverflow: true, //disable scrollbar on body
			   
			  backgroundColor: '#282c37',
			  fadeInTime: 1000,
			  fadeLevel: 0.7,
			  image: '../resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
			 
			});
	}).ajaxStop(function(){
		$('body').oLoader('hide');
	});
	
	$(window).load(function(){
		$('body').oLoader('hide');
	});
	
	//클릭한 페이지 , 키워드
	function selectTourPage(pageNum,keyword) {
		$.ajax({
			url : '/guide/json/selectTourPage',
			method : 'POST',
			data : JSON.stringify({
				pageNum : pageNum,
				keyword : keyword
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status) {
				
				$('li[class*=active]').removeClass('active');
				
				$('a[class^=viewPage]').each(function(idx){ // idx 0부터 시작함
		 			if(JSONData[0].pageCount < $(this).text().trim()) {
		 				$(this).parent().remove();
		 			}
		 		});
				
				
				$('.pageTour-'+JSONData[0].pageNum).addClass('active');
				
				$('#searchKeyword').val(JSONData[0].keyword);
				$('#firstPageNum').val(JSONData[0].firstPageNum);
				$('#pageCount').val(JSONData[0].pageCount);
				
				if(!JSONData[0].nextBtn) {
					$('.nextBtn').parent().addClass('disabled');
				}

				
				//관광지 정보
				$.each(JSONData, function(index,item){
					//이름을 변경하고난 후..
					//alert(index + item.tourName);
					//alert(index + item.tourId);
					$(".preview-"+(index+1)+ " > input[name='tourId']").val(item.tourId);
					$(".preview-"+(index+1)+ " > div > div > div > strong").text(item.tourLoc);
					$(".preview-"+(index+1)+ " > div > div > div > h3").text(item.tourName);
					$(".preview-"+(index+1)+ " > div > div > div > div").text(item.hashtag);
					$(".preview-"+(index+1)+ " > div > div > div > p").text(item.tourShortDesc);
					$(".preview-"+(index+1)+ " > div > div > div > a").text('이곳에는 별점');
					$(".preview-"+(index+1)+ " > div > div > div.col-auto.d-none.d-lg-block > img").attr('src',item.tourThumb);
					
				});
				//관광지 정보 삭제
					 	$("div[class^=preview-]").each(function(idx){ // idx 0부터 시작함
				 			if(JSONData.length <= idx) {
				 				$(".preview-"+(idx+1)).remove();
				 			}
				 		});
					
					 	
					 	
			}
		})
	}

	function userSearch() {
		var keyword = $('#inputKeyword').val().trim();
		if(keyword == "" ) {
			$('#inputKeyword').addClass('is-invalid');
		}else {
			$('#inputKeyword').removeClass('is-invalid');
			selectTourPage(1,keyword);
		}
	}
</script>



</body>
</html>