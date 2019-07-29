<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="/resources/javascript/getProfile.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/javascript/payIamport.js"></script>
</head>
<body>
<header><%@ include file="/layout/header.jsp" %></header>
<div class="container">
<br>
<div class="col-md-12">
<div class="row">
<div class="col-md-3">
<input type="text" id="checkin" class="form-control" placeholder="출국일" readonly>

</div>
<div class="col-md-3">
<input type="text" id="checkout" class="form-control" placeholder="귀국일" readonly>

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
<input type="text" id="startWay" class="form-control" placeholder="출발지" >
</div>
<div class="col-md-3">
<button type="button" class="btn btn-outline-primary" id="exchangeCity" ><i class="fas fa-exchange-alt"></i></button>
</div>
<div class="col-md-3">
 <select class="custom-select mr-sm-2" id="grade">
 		 <option value="Economy" >일반석</option>
 		 <option value="PremiumEconomy" >프리미엄 일반석</option>
 		 <option value="Business" >비즈니스</option>
 		 <option value="First" >일등석</option>
      </select>
</div>
<br><br>
</div>


<div class="row">
<div class="col-md-6">
<input type="text" id="endWay" class="form-control" placeholder="도착지" >
</div>
<div class="col-md-3">
<button type="button" class="btn btn-outline-primary" id="userSearch" ><i class="fas fa-search-location"></i></button>
</div>
</div>



<hr>
</div>
</div>


<div class="container">
<div class="row">
<div class="col-md-12">
<div class="row"></div>
</div>
<div id="flightAppend" class="col-md-2"></div>


	




	
	
</div>
</div>


<input type="hidden" id="way" value="">
<input type="hidden" id="startCode" value="">
<input type="hidden" id="endCode" value="">
<input type="hidden" id="userCode" value="${user.userCode }">

<jsp:include page="../guide/selectCity.jsp"></jsp:include>

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
	    
	 $('#startWay').on('click',function(){
		 $('#way').val('startWay')
		 selectCity();
	 })
	 $('#endWay').on('click',function(){
		 $('#way').val('endWay')
		 selectCity();
	 })
	 
	 $('#exchangeCity').on('click',function(){
		 var temp;
		 var sw = $('#startWay').val().trim();
		 var ew = $('#endWay').val().trim();
		 var sc = $('#startCode').val().trim();
		 var ec = $('#endCode').val().trim();
		 
		 temp = $('#startWay').val().trim();
		 $('#startWay').val(ew);
		 $('#endWay').val(temp);
		 
		 temp = $('#startCode').val().trim();
		 $('#startCode').val(ec);
		 $('#endCode').val(temp);
	 })
	 
	 $('#userSearch').on('click',function(){
		 var checkin = $('#checkin').val().trim();
		 var checkout = $('#checkout').val().trim();
		 var adult = $('#adult').val().trim();
		 var children = $('#children').val().trim();
		 var startCode = $('#startCode').val().trim();
		 var endCode = $('#endCode').val().trim();
		 var grade = $('#grade').val().trim();
		 
		 if(checkin == '') {
			 alert('출국일을 선택해주세요.');
			 return;
		 }
		 if(checkout == '') {
			 alert('귀국일을 선택해주세요.');
			 return;
		 }
		 if(checkin == checkout) {
			 alert('출국일과 귀국일이 같습니다.');
			 return;
		 }
		 if(startCode == '') {
			 alert('출발지를 선택해주세요.');
			 return;
		 }
		 if(endCode == '') {
			 alert('도착지를 선택해주세요.');
			 return;
		 }
		 if(startCode == endCode) {
			 alert('출발지와 도착지가 같습니다.');
			 return;
		 }
		 //alert("완성");
		 searchFlight(checkin,checkout,adult,children,grade,startCode,endCode);
		 
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



$(document).on('click','.flightPrice',function(){
	var checkin = $('#checkin').val().trim();
	var checkout = $('#checkout').val().trim();
	var startWay = $('#startWay').val().trim();
	var endWay = $('#endWay').val().trim();
	var startTotal = $(this).parents('div[class^=preview-]').find('.flightSTotal').text().trim();
	var endTotal = $(this).parents('div[class^=preview-]').find('.flightETotal').text().trim();
	
	var userCode = $('#userCode').val().trim();
	var cost = $(this).text().trim();
	
	FlightPayIamport(startWay,endWay,checkin,checkout,startTotal,endTotal,cost,userCode);
			
			
		
	
});

function searchFlight(checkin,checkout,adult,children,grade,startCode,endCode) {
	
	$.ajax({
		url : '/guide/json/searchFlight',
		method : 'post',
		data : JSON.stringify({
			startDay : checkin,
			endDay : checkout,
			adult : adult,
			children : children,
			grade : grade,
			startWay : startCode,
			endWay : endCode
		}),
		headers : {
			"Accpet" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data,status){
			
			$.each(data,function(index,item){
				$('#flightAppend').after(
				'<div class="col-md-12">'
				+'<div class="preview-"'+(index+1)+'>'
				+'<div class="row">'
				+'<div class="col-md-5">'
				+'<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">'
				+'<div class="col p-4 d-flex flex-column position-static">'
				+'<strong class="d-inline-block mb-2 text-secondary">'+$('#startWay').val().trim()+ '→'+ $('#endWay').val().trim()+'</strong>'
				+'<div class="mb-0 text-muted"><img alt="/resources/images/flag/multiple-airlines-34x34.jpg" src="'+item.startFlightLogo+'" width="32" height="32">'+item.startFlightName+'</div>'
				+'<div class="mb-0 text-muted"><small class="flightSTotal">'+item.startTimeTotal+'</small></div>'
				+'<p class="card-text mb-auto"><small>'+item.startGrade+'</small></p>'
				+'<p class="card-text mb-auto">'+item.startTimeone+'</p>'
				+'<p class="card-text mb-auto">'+item.startTimetwo+'</p>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="col-md-5">'
				+'<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">'
				+'<div class="col p-4 d-flex flex-column position-static">'
				+'<strong class="d-inline-block mb-2 text-secondary">'+$('#endWay').val().trim()+ '→'+ $('#startWay').val().trim()+'</strong>'
				+'<div class="mb-0 text-muted"><img alt="/resources/images/flag/multiple-airlines-34x34.jpg" src="'+item.endFlightLogo+'" width="32" height="32">'+item.endFlightName+'</div>'
				+'<div class="mb-0 text-muted"><small class="flightETotal">'+item.endTimeTotal+'</small></div>'
				+'<p class="card-text mb-auto"><small>'+item.endGrade+'</small></p>'
				+'<p class="card-text mb-auto">'+item.endTimeone+'</p>'
				+'<p class="card-text mb-auto">'+item.endTimetwo+'</p>'
				+'</div>'
				+'</div>'
				+'</div>'
				+'<div class="col-md-2"><button type="button" class="flightPrice btn btn-outline-primary" style="margin-top: 0px; height: 210px">'+item.price+'</button></div>'
				+'</div>'
				+'<hr>'
				+'</div>'
				+'</div>')
					
			}); // end each
		}
	})
}


</script>
</body>
</html>