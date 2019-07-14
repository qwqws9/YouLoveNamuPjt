<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<script src="/resources/javascript/jquery.oLoader.min.js"></script>

</head>
<body  >
<div class="text-center">
<div class="container">
		<div class="col-md-12">
			<div class="justify-content-center">
			<div id="spot-image-carousel" class="carousel slide">
                    <div class="carousel-inner" role="listbox">
                      
                      <c:forEach varStatus="status" var="tour" items="${tour.spotImage }">
                      <div class="carousel-item" data-index=${status.index }>
                        <img  src="${tour }" height="400" width="900">
                      </div>
                      </c:forEach>
                      
                    </div>
                    
                    <a class="carousel-control-prev" href="#spot-image-carousel" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="false"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#spot-image-carousel" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="false"></span>
                      <span class="sr-only">Next</span>
                    </a>
                    <div class="carousel-counter">
                      
                    </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  </div>
                  
                   
               <div class="container"> 
               <div class="row">  
		<input type="hidden" name="tourId" value="">
		<div class="col-lg-8">
			 <span id="active-index"></span>총 <span id="total-images">${fn:length(tour.spotImage) }장</span>
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">${tour.countryTour }/${tour.cityTour }</strong>
					<h3 class="mb-0">${tour.tourName }</h3>
					<div class="mb-1 text-muted">${tour.tourShortDesc }</div>
					<hr>
					<p class="card-text mb-auto">${tour.longDesc }</p>
					<a href="#" class="stretched-link">별점과 댓글수가 들어갈곳</a>
				</div>
			</div>
		</div>
	
	
	
		<input type="hidden" id="tourId" value="${tour.tourId }">
		<input type="hidden" id="lat" value="${tour.latTour }">
		<input type="hidden" id="lng" value="${tour.lngTour }">
		<div class="col-lg-4">
		<br>
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">Information</strong>
					<c:if test="${!empty tour.address }">
					<div class="mb-1 text-muted">주소</div>
					<p class="card-text mb-auto">${tour.address }</p>
					<hr>
					</c:if>
					<c:if test="${!empty tour.openTour }">
					<div class="mb-1 text-muted">오픈시간</div>
					<p class="card-text mb-auto">${tour.openTour }</p>
					<hr>
					</c:if>
					<c:if test="${!empty tour.closeTour }">
					<div class="mb-1 text-muted">휴무일</div>
					<p class="card-text mb-auto">${tour.closeTour }</p>
					<hr>
					</c:if>
					<c:if test="${!empty tour.costTour }">
					<div class="mb-1 text-muted">비용</div>
					<p class="card-text mb-auto">${tour.costTour }</p>
					<hr>
					</c:if>
					<c:if test="${!empty tour.wayTour }">
					<div class="mb-1 text-muted">가는 방법</div>
					<p class="card-text mb-auto">${tour.wayTour }</p>
					</c:if>
				</div>
			</div>
		</div>
        </div>           
             </div>      
      
      
      <script type="text/javascript">
      		$(function(){
      			
      			$('body').oLoader({
      			  wholeWindow: true, //makes the loader fit the window size
      			  lockOverflow: true, //disable scrollbar on body
      			   
      			  backgroundColor: '#282c37',
      			  fadeInTime: 1000,
      			  fadeLevel: 0.7,
      			  image: '/resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
      			 
      			});
      			
      			
//       			$('#spot-image-carousel').on('slid.bs.carousel', function() {
// 			   			console.log('변경');
// 				});
      			
      			
      			
      			$('.carousel-item').first().addClass('active');
      		});
      		
      		$(window).load(function(){
      			$('body').oLoader('hide');
      		});
      
      </script>             
</body>
</html>