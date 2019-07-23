<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
  <title>Google Maps Multiple Markers</title> 
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

		 $(function() {
			  
			  $(".previous").on("click", function(){
				 
				  history.go(-1);
				  
			  });
			  
			  
			  $("li:contains('수정')").on("click", function(){
				  
				  self.location = "/planner/updatePlanner?plannerCode=${planner.plannerCode}";
				  
			  });
	
		  

		 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
				self.location = "/planner/getPlannerList";
		 });

	});
</script>
</head> 
<body>
<div class="container" >

 
		<div class="page-header text-info">
		<br>
		<br>
	       <h3 class=" text-info"> 내플래너  </h3>
					
  </div>

<div class="row">
  
  <div class="col-md-5">
      <img class="img-thumbnail" src="/resources/images/planner/${planner.plannerImage}" alt="..." height="300" width="900">    
  </div>
  
  <div class="col-md-5">
  		
  		<div class="row">
	  		<div class="col-md-8"><strong>플래너 번호</strong></div>
			<div class="col-md-4">${planner.plannerCode}</div>
		</div>
					
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-8" ><strong>플래너 이름 </strong></div>
			<div class="col-md-4" >${planner.plannerName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-8 "><strong> 여행멤버 </strong></div>
		
				<div class="col-md-4">${planner.member}  </div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-8 "><strong> 여행출발일 </strong></div>
			<div class="col-md-4">${planner.departDate}</div>
		</div>
		
		<hr/>

		<div class="row">
	  		<div class="col-md-8 "><strong>등록일자</strong></div>
			<div class="col-md-4">${planner.regDate}</div>
		</div>
  </div>  
  
		<hr/>
		
	
				
		
				
<form role="form" method="post">
 <input type="hidden" name="plannerCode" value="${planner.plannerCode}" />
 </form>
 
 <br><br><br><br>
 <nav class="map">
			<jsp:include page="/planner/getRoute.jsp" />
		</nav>
		
 <nav class="map">
			<jsp:include page="/planner/getScheduleList.jsp" />
		</nav>
		
		<nav>
  <ul class="pager">
  
    <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span>이전</a></li>
    
    <li><a href="#">수정</a></li>
    
    <li class="next"><a href="#" class='text-danger'>취소</a></li>
  	
  </ul>
</nav>
		
</body>
</html>
