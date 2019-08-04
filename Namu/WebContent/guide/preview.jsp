<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="../resources/javascript/jquery.oLoader.min.js"></script>
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<link rel="stylesheet" href="/resources/css/common.css" >

<style>
	.preview_wrap { width: 1100px; margin: auto; }
	.preview_wrap::after { content: ''; display: block; clear: both; }
	.three_wrap { float: left; width: 33.33%; padding: 12px 15px; }
	.preview_wrap h3 { margin: 0; padding: 0; font-size: 20px; font-weight: 700; line-height: 2.5em; border-bottom: 3px solid #282c37; }
	.preview_wrap h3 span { margin-left: 10px; }
	.preview_cont { width: 100%; margin-top: 20px; padding: 5px; border: 1px solid #cbcbcb; }
	.preview_cont::after { content: ''; display: block; clear: both; }
	.preview_cont img, .preview_cont div { float: left; }
	.preview_cont > div { width: 210px; margin-top: 5px; margin-left: 10px; }
	.img_rounded { width: 100px; height: 100px; }
	.preview_cont h4 { width: 90%; margin: 0; padding: 0; font-size: 14px; font-weight: 600; line-height: 22px; }
	.preview_cont h4 span
		{ display: inline-block; width: 82%; overflow: hidden; margin-left: 10px; text-overflow: ellipsis; box-sizing: border-box; white-space: nowrap; }
	.preview_cont div { margin-top: 5px; }
	.preview_cont p
		{ display: -webkit-box; max-height: 60px; font-size: 14px; line-height: 1.48; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
		  overflow: hidden; text-overflow:ellipsis; }
</style>

<div class="preview_wrap">
	<section class="one three_wrap">
		<h3 class="tourLocation"><span>가볼만한 곳<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029; " ></i></span></h3>
	</section>
	
	<section class="two three_wrap">
		<h3 class="foodLocation"><span>맛집<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029; " ></i></span></h3>
	</section>
	
	<section class="three three_wrap">
		<h3 class="hotelLocation"><span>숙소<i class="far fa-plus-square fa-1x" style="padding-left: 5px; color:#f2c029; " ></i></span></h3>
	</section>
</div>


<script type="text/javascript">
	$(function(){
		$('.tourLocation').on('click',function(){
			self.location = '/guide/initTour';
		})
		$('.foodLocation').on('click',function(){
			self.location = '/guide/initFood';
		})
		$('.hotelLocation').on('click',function(){
			self.location = '/guide/initHotel';
		})
		$(document).on('click','div[class^=tour]',function(){
			var code = $(this).children().val().trim();
			self.location = '/guide/selectTourDetail/'+code;
		})
		$(document).on('click','div[class^=food]',function(){
			var code = $(this).children().val().trim();
			self.location = '/guide/selectTourDetail/'+code;
		})
		$(document).on('click','div[class^=hotel]',function(){
			var code = $(this).children().val().trim();
			self.location = '/guide/selectTourDetail/'+code;
		})
		
		
		$.ajax({
			url : '/guide/json/getWishbeenPreview',
			method : 'post',
			data : JSON.stringify({
				keyword : '파리'
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data, status) {
				//alert(data.tour);
				//alert(data.food);
				//alert(data.hotel);
				
				$.each(data.tour,function(index,tour){
					if(index > 4) {
						return;
					}
					$('.one').append(
					'<div class="tour'+index+' preview_cont"><input type="hidden" value="'+tour.tourId+'">'
					+'<img class="img_rounded" src="'+tour.tourThumb+'">'
					+'<div>'
					+'<h4><img src="/resources/images/spot-type01-01.png" width="22" height="22"><span>'+tour.tourName+'</span></h4>'
					+'<div><p>'+tour.tourShortDesc+'</p></div>'
					+'</div>'
					+'</div>');
				});	
					
				
				
				$.each(data.food,function(index,food){
					if(index > 4) {
						return;
					}
					$('.two').append(
					'<div class="food'+index+' preview_cont"><input type="hidden" value="'+food.tourId+'">'
					+'<img class="img_rounded" src="'+food.tourThumb+'">'
					+'<div>'
					+'<h4><img src="/resources/images/spot-type01-02.png" width="22" height="22"><span>'+food.tourName+'</span></h4>'
					+'<div><p>'+food.tourShortDesc+'</p></div>'
					+'</div>'
					+'</div>');
				});
				
				
				$.each(data.hotel,function(index,hotel){
					if(index > 4) {
						return;
					}
					$('.three').append(
					'<div class="hotel'+index+' preview_cont"><input type="hidden" value="'+hotel.hotelId+'">'
					+'<img class="img_rounded" src="'+hotel.hotelThumb+'">'
					+'<div>'
					+'<h4><img src="/resources/images/spot-type01-03.png" width="22" height="22"><span>'+hotel.hotelName+'</span></h4>'
					+'<div><p>'+hotel.hotelShortDesc+'</p></div>'
					+'</div>'
					+'</div>');
				});
				
				
			
			}
		})
	})

</script>