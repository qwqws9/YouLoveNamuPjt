<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- map -->
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  
<!-- Our Own Resources -->
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
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
<header><jsp:include page="/layout/header.jsp" /></header>
 
<div class="container" >

		<div class="page-header text-info">
		<br>
		<br>
	       <h5 > 내플래너  </h5>
					
  </div>
</div>

 <div class="container">
<div class="row">
<div class="col-md-12 col-lg-12" >
      <img class="img-thumbnail"src="/resources/images/planner/${planner.plannerImage}" alt="..." height="400" width="700">    
  		
</div></div>
</div>
  <%-- <div class="container">
<div class="row">
<div class="col-md-12 col-lg-12">
<strong>플래너 번호</strong></div>
			<div class="col-md-4">${planner.plannerCode}</div>
		</div>
		</div>
		
		<hr/> --%>
		<div class="container">
		<div class="row">
	  	<div class="col-md-12 col-lg-12"><strong>플래너 이름 </strong></div>
			<div class="col-md-4" >${planner.plannerName}</div>
		</div></div>
		
		<hr/>
		  <div class="container">
<div class="row">
<div class="col-md-12 col-lg-12">
		<strong> 여행멤버 </strong></div>
			<div class="col-md-4" >
		<c:if test="${! empty planner.member && (planner.member eq '1')}">
		혼자 </c:if>
		<c:if test="${! empty planner.member && (planner.member eq '2')}">
		연인과 </c:if>
		<c:if test="${! empty planner.member && (planner.member eq '3')}">
		친구들과 </c:if>
		<c:if test="${! empty planner.member && (planner.member eq '4')}">
		가족들과 </c:if>
		</div>
		</div></div>
		<hr/>

	  <div class="container">
<div class="row">
<div class="col-md-12 col-lg-12">
<strong> 여행출발일 </strong></div>
			<div class="col-md-4">${planner.departDate}</div>
		</div>
		</div>
		<hr/>

	  <div class="container">
<div class="row">
<div class="col-md-12 col-lg-12">
	  	<strong>등록일자</strong></div>
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
		<br><br><br><br>
 <nav class="map">
			<jsp:include page="/planner/getScheduleList2.jsp" />
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
