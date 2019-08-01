<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
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
	<script>
		$(document).ready(function(){
			
			var owl = $(".owl-carousel");
			owl.owlCarousel({
				items:4,
			    loop:true,
			    margin:10,
			    autoplay:true,
			    autoplayTimeout:3000,
			    autoplayHoverPause:true
				
			});
			$('.owl-start').on('click',function(){
			    owl.trigger('play.owl.autoplay',[3000])
			})
			$('.owl-stop').on('click',function(){
			    owl.trigger('stop.owl.autoplay')
			});
		});
		
		$(function (){
			$(".owl-item").on("click", function(){
				//alert($(this).children(".bestCommunityCode").val());
				self.location="/community/getCommunity?communityCode="+$(this).children(".bestCommunityCode").val();								
			})		
			
		
			$.ajax({
				url : "/community/json/bestCommunityList",
				method : "POST",
				data : JSON.stringify({
					"currentPage" : 0
				}),
				dataType : 'json',
				headers : {
	     			 "Accept" : "application/json",
	                 "Content-Type" : "application/json"
	     		},
	     		success : function(JSONData, status){
	     			//console.log(JSONData);
	     			$.each(JSONData.list,function(index,item){
	     				
	     				$(".owl-stage").append(
			     			'<div class="owl-item" style="">'+
								'<img src="/resources/images/ThumbNail/'+item.communityThumbnail+'" class="card-img-top" alt="..." style="height: 250px;">'+
			            		'<input type="hidden" class="bestCommunityCode" value="'+item.communityCode+'" />'+
								'<div class="bestTitle" style="overflow: hidden; text-overflow: ellipsis;font-size: 20px; font-weight: bold;">'+
								item.communityTitle+
								'</div>'+
			            	'</div>'
	     				);
	     				
	     			});
	     			
	     			
	     		},
	     		error:function(jqXHR, textStatus, errorThrown){
	    			alert( textStatus );
	    			alert( errorThrown );
	    		}
			});
		});
		
		
		
	
	</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-lg-12">
			
				<div class="row justify-content-center">
					<div class="owl-carousel owl-theme owl-loaded" style="width: 90%;">
					    <div class="owl-stage-outer">
					        <div class="owl-stage">
<%-- 					        	<c:forEach var="best" items="${bestlist}" begin="0" end="10"> --%>
<!-- 						            <div class="owl-item" style=""> -->
<%-- 										<img src="/resources/images/ThumbNail/${best.communityThumbnail }" class="card-img-top" alt="..." style="height: 250px;"> --%>
<%-- 						            	<input type="hidden" class="bestCommunityCode" value="${best.communityCode}" /> --%>
<!-- 										<div class="bestTitle" style="overflow: hidden; text-overflow: ellipsis;font-size: 20px; font-weight: bold;"> -->
<%-- 											${best.communityTitle} --%>
<!-- 										</div> -->
<!-- 						            </div> -->
<%-- 					        	</c:forEach> --%>
					        </div>
					    </div>
					    <div class="owl-nav">
					        <div class="owl-stop">stop</div>
					        <div class="owl-start">start</div>
					    </div>
					</div>		
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>