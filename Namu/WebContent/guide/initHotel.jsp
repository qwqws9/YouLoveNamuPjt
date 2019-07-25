<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
  src="https://code.jquery.com/jquery-2.1.4.js"
  integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
  crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script src="../resources/javascript/jquery.oLoader.min.js"></script>
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<link rel="stylesheet" href="/resources/css/common.css" >
</head>
<body>
<header><%@ include file="/layout/header.jsp" %></header>
<div class="container" id="initHotelJsp">
<br>
<div class="col-md-12">
<div class="row">
<div class="col-md-3">
<input type="text" id="checkin" class="form-control" placeholder="체크인" readonly value="${hotelList[0].checkin }">

</div>
<div class="col-md-3">
<input type="text" id="checkout" class="form-control" placeholder="체크아웃" readonly value="${hotelList[0].checkout }">

</div>
<div class="col-md-3">
 <select class="custom-select mr-sm-2" id="adult">
 	<c:forEach begin="1" end="10" varStatus="status">
 		 <option value="${status.index }" >성인 ${status.index}명</option>
 	</c:forEach>
      </select>
      
</div>
<div class="col-md-3">
 <select class="custom-select mr-sm-2" id="children">
       <c:forEach begin="0" end="4" varStatus="status">
 		 <option value="${status.index }" >아동 ${status.index}명</option>
 		</c:forEach>
      </select>
</div>

<br><br>
</div>
<div class="row">
<div class="col-md-6">
<input type="text" id="inputKeyword" class="form-control" placeholder="어디로 떠나시나요?" >
</div>
<div class="col-md-6">
<button type="button" class="btn btn-outline-primary" id="userSearch" ><i class="fas fa-search-location"></i></button>
</div>
</div>
</div>
<hr>
<c:forEach varStatus="status" var="hotel" items="${hotelList }">
	<div class="preview-${status.index +1} row mb-1">
		<input type="hidden" name="tourId" value="${hotel.hotelId }">
		<div class="col-md-12">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">${hotel.hotelLoc }</strong>
					<h3 class="mb-0">${hotel.hotelName }</h3>
					<div class="cost mb-1 text-muted">${hotel.price }</div>
					<p class="card-text mb-auto">${hotel.hotelShortDesc }</p>
					<a href="#" class="stretched-link">Continue reading</a>
				</div>
				<div class="col-auto d-none d-lg-block">
					<img src="${hotel.hotelThumb }"  width="250" height="250">
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>
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
		
		
		
		
		 $.datepicker.setDefaults($.datepicker.regional['ko']); 
		 $( "#checkin" ).datepicker( { dateFormat: 'yy-mm-dd',
			 minDate : 1,
			 onClose: function( selectedDate ) {    
                 // 시작일(fromDate) datepicker가 닫힐때
                 // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                 $("#checkout").datepicker( "option", "minDate", selectedDate );
             }   
		 });
		 
		 
		 $( "#checkout" ).datepicker( { dateFormat: 'yy-mm-dd',
			 minDate : 1 ,
			 onClose: function( selectedDate ) {    
                 // 시작일(fromDate) datepicker가 닫힐때
                 // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                 $("#checkin").datepicker( "option", "maxDate", selectedDate );
             }   	 
		 });
		    
		 
		 $('#adult').on('change',function() {
			 alert($(this).val());
		 })
		
		$('#children').on('change',function() {
			alert($(this).val());
		 })
		 
		 $('#inputKeyword').on('keydown',function(key){
			if(key.keyCode == 13) {
				 search();
			}
		});
		 
		 $('#userSearch').on('click',function(){
			 search();
		});
		 
		 function search() {
			 var adult = $('#adult').val().trim();
			 var children = $('#children').val().trim();
			 var checkin = $('#checkin').val().trim();
			 var checkout = $('#checkout').val().trim();
			 var keyword = $('#inputKeyword').val().trim();
			 
			 if(checkin == '') {
				 alert("체크인 날짜를 선택해주세요.")
				 return;
			 }
			 if(checkout == '') {
				 alert("체크아웃 날짜를 선택해주세요.")
				 return;
			 }
			 if(keyword == '') {
				 alert("키워드를 입력해주세요.")
				 return;
			 }
			 
			 searchHotel(adult,children,checkin,checkout,keyword);
		 }
		 
		 function searchHotel(adult,children,checkin,checkout,keyword) {
			 
		 
			 $.ajax({
					url : '/guide/json/searchHotel',
					method : 'POST',
					data : JSON.stringify({
						adult : adult,
						children : children,
						checkin : checkin,
						checkout : checkout,
						keyword : keyword
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						
						$.each(JSONData, function(index,item){
							//이름을 변경하고난 후..
							//alert(index + item.tourName);
							//alert(index + item.tourId);
							$(".preview-"+(index+1)+ " > input[name='tourId']").val(item.hotelId);
							$(".preview-"+(index+1)+ " > div > div > div > strong").text(item.hotelLoc);
							$(".preview-"+(index+1)+ " > div > div > div > h3").text(item.hotelName);
							$(".preview-"+(index+1)+ " > div > div > div > div").text(item.price);
							$(".preview-"+(index+1)+ " > div > div > div > p").text(item.hotelShortDesc);
							$(".preview-"+(index+1)+ " > div > div > div > a").text('이곳에는 별점');
							$(".preview-"+(index+1)+ " > div > div > div.col-auto.d-none.d-lg-block > img").attr('src',item.hotelThumb);
							
						});
						//관광지 정보 삭제
							 	$("div[class^=preview-]").each(function(idx){ // idx 0부터 시작함
						 			if(JSONData.length <= idx) {
						 				$(".preview-"+(idx+1)).remove();
						 			}
						 		});
						
					}
			 
		 });
		 }	
		
		
		
		//관광지 디테일 조회
			$('div[class^="preview-"]').on('click',function(){
				
				//alert($(this).find('div[class^=cost]').text().trim());
				//self.location = '/guide/selectTourDetail/'+$(this).children().val().trim();
				//alert($(this).children().val().trim());
				var url = '/guide/selectTourDetail/'+$(this).children().val().trim()+'/'+$(this).find('div[class^=cost]').text().trim()+'/'+$('#checkin').val().trim()+'/'+$('#checkout').val().trim();
				var name = "_blank";
				var option = "width = 1150,height = 1000,marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no,location = no"
				//window.open(url,name,option);
				self.location = url;
			
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
	
	
					
					 	
	
	
</script>



</body>
</html>