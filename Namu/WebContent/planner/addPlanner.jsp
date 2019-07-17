<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
form{
margin:0 auto
}
</style>
</head>
     <!--   JavaScript  -->
	<script type="text/javascript">	

	function fncAddPlanner(){
		// 유효성 검증
		$("form").attr("method" , "POST").attr("action" , "/planner/addPlanner").attr("enctype" , "multipart/form-data").submit();
	}		
	
	$(function(){
		
	    $( "#departDate" ).datepicker({
	    	changeMonth: true,
	        changeYear: true,
	        dateFormat: 'yy-mm-dd'			        
	    });
	    
	    $("button").on("click",function(){    	
	    	fncAddPlanner();    	
	    });
		
	    $("a[href='#']").on("click",function(){
	    	
	    	history.go(-1);
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>

	<div class="container">

		<h4 class="text-center"> 플래너 만들기 </h4>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<br/>
		  <div class="form-group">
		    <label for="plannerName" class="control-label col-sm-2"> 플래너 Title  </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="plannerName" name="plannerName" >
		    </div>
		  </div>
		<br/>  
		  <div class="form-group">
		        <label for="member" class="control-label col-sm-2"> 멤버 </label>
		            <div class="col-sm-4">
		    <select class="custom-select mr-sm-2" id="member" name="member" >
		  	<option value="1" selected="selected"> 혼자 </option>
        	<option value="2">연인과 </option>
        	<option value="3">친구들과 </option>
       		<option value="4">가족과 </option>
      </select>
    </div>
	<br/>  
	
			  <div class="form-group">
		        <label for="member" class="control-label col-sm-2"> 공개여부 </label>
		            <div class="col-sm-4">
		    <select class="custom-select mr-sm-2" id="member" name="member" >
		  	<option value="1" selected="selected"> 비공개  </option>
        	<option value="2">공개  </option>
        	<option value="3">가계부 비공개  </option>
     
      </select>
    </div>
	<br/>  

		  
		  <div class="form-group">
		    <label for="departDate" class="control-label col-sm-2">여행 시작일 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="departDate" name="departDate" >
		    </div>
		  </div>
		<br/> 
		 	  
		  <div class="form-group">
		    <label for="file" class="control-label col-sm-2">플래너 이미지</label>
		    <div class="col-sm-4">
		  <div class="custom-file">
 		<input type="file" class="custom-file-input" id="file" name="file" value="">
  		<label class="custom-file-label" for="customFile">Choose file</label>
		</div>
		  	  </div>
		<br/>  
		  <div class="form-group">
		    <div class=""col-sm-offset-1 col-sm-3 control-label">
		     <a class="btn btn-default" href="#" role="button">취&nbsp;소</a>
		      <button type="button" class="btn btn-default"  > 다음 단계  </button>
			 
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>