<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="/layout/head.jsp" />
	<!-- jquery bootstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  	<!-- css -->
  	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/planner.css">
      
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
<style>
form{
margin:0 auto
}

</style>
</head>
     <!--   JavaScript  -->
	<script type="text/javascript">	

	function fncUpdatePlanner(){
// 유효성 검사 
		
	 	var plannerName = $("input[name='plannerName']").val();
		var departDate =$("input[name='departDate']").val();
		
		
		if(plannerName == null || plannerName.length<1){
			 swal({ text:"플래너 제목을 입력해주세요."});
			return;
		} 
	
		if(departDate == null || departDate.length<1){
			 swal({ text:"여행시작일을 입력해주세요."});
			return;
		}
		$($("form")[1]).attr("method" , "POST").attr("action" , "/planner/updatePlanner?plannerCode=${planner.plannerCode}").attr("enctype" , "multipart/form-data").submit();
	}		
	 function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                $('#preview').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
/* 
	    $("#imgInp").change(function() {
	        readURL(this);
	    }); */
	
	$(function(){
		
		$('#file').on('change',function(){
	        var fileName = $(this).val();
	        $(this).next('.custom-file-label').html(fileName);
	        readURL(this);
	    });
		
	   
	    $("#departDate").flatpickr({ 

	    	dateFormat: "Y-m-d",
	    	
	    	/* maxDate: new Date().fp_incr(30) */
	    });
	    
	    $("#save").on("click",function(){    	
	    	fncUpdatePlanner();    	
	    });
		
	    $("a[href='#']").on("click",function(){
	    	
	    	history.go(-1);
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>

<!-- progress bar -->
	<div class="container-fluid " id="progress">
      <ul class="progressbar">
          <li class="active"> 1 Step</li>
          <li>2 Step </li>
          <li>3 Step</li>
  		</ul>
		</div>
	<br><br><br>
	
<!-- addPlanner area-->
<div class="container">

<h4 class="text-center"> 플래너 만들기 </h4>
		<br><br>
	<form class="form-horizontal">
		
<br><br><br>
<div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-2"></div>
      <div class="col-md-2">

		    <label for="plannerName"> 플래너 Title  </label>
		    </div>
		    <div class="col-md-4">
		      <input type="text" class="form-control" id="plannerName" name="plannerName"  value="${planner.plannerName}" >
		  </div>
		     <div class="col-md-2"></div>
		  </div>
		     </div>
		  
		<br/> 
		 	  
	<div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-2"></div>
      <div class="col-md-2">
		        <label for="member" > 멤버 </label> 
		        </div>
		    <div class="col-md-4">
		    <select class="custom-select mr-sm-2" id="member" name="member" >
		    <c:if test="${planner.member == '1'}">
		  		<option value="1" selected="selected"> 혼자 </option>
        		<option value="2" >연인과 </option>
        		<option value="3" >친구들과 </option>
       			<option value="4" >가족과 </option>
       		</c:if>
       		<c:if test="${planner.member == '2'}">
		  		<option value="1"> 혼자 </option>
        		<option value="2" selected="selected">연인과 </option>
        		<option value="3" >친구들과 </option>
       			<option value="4" >가족과 </option>
       		</c:if>
       		<c:if test="${planner.member == '3'}">
		  		<option value="1" > 혼자 </option>
        		<option value="2" >연인과 </option>
        		<option value="3" selected="selected">친구들과 </option>
       			<option value="4" >가족과 </option>
       		</c:if>
       		<c:if test="${planner.member == '4'}">
		  		<option value="1" > 혼자 </option>
        		<option value="2" >연인과 </option>
        		<option value="3" >친구들과 </option>
       			<option value="4" selected="selected">가족과 </option>
       		</c:if>
      </select>
    
   </div>
		     <div class="col-md-2"></div>
		  </div>
		     </div>
		  
		<br/> 
		
<%-- <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-2"></div>
      <div class="col-md-2">
		        <label for="privacy " > 공개여부 </label>
		        	   </div>
		    <div class="col-md-4">
		    <select class="custom-select mr-sm-2" id="privacy " name="privacy " >
		      <c:if test="${planner.privacy == 'p'}">
		  		<option value="p" selected="selected"> 공개  </option>
        		<option value="s" >비공개 </option>
        		<option value="w" >가계부비공개 </option>
       		</c:if>
		    <c:if test="${planner.privacy == 's'}">
		  		<option value="p" > 공개  </option>
        		<option value="s" selected="selected">비공개 </option>
        		<option value="w" >가계부비공개 </option>
       		</c:if>
       		<c:if test="${planner.privacy == 'w'}">
		  		<option value="p"> 공개  </option>
        		<option value="s" >비공개 </option>
        		<option value="w"  selected="selected">가계부비공개 </option>
       		</c:if>
		  
        </select>
   </div>
		     <div class="col-md-2"></div>
		  </div>
		     </div>
		  
		<br/>  --%>
		<div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-2"></div>
      <div class="col-md-2">
		    <label for="departDate">여행 시작일 </label>
		     </div>
		    <div class="col-md-4">
			 <input type="text" class="form-control" id="departDate" name="departDate" value="${planner.departDate}" placeholder="날짜를 선택하세요"> 
		   </div>
		   
		     <div class="col-md-2"></div>
		  </div>
		     </div>
		  
		<br/> 
		 	 <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-2"></div>
      <div class="col-md-2">
		    <label for="file" >플래너 이미지</label>
		     </div>
		    <div class="col-md-4">
		   <div class="custom-file">
			<input type="file" accept="image/*" class="custom-file-input" id="file" name="file" value="${planner.plannerImage}" style="color: black;">
			  <c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">
			<label class="custom-file-label" for="file" data-browse="Image" style="color: #ff7d75;"></label>
			</c:if>
			<c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">
				<label class="custom-file-label" for="file" data-browse="Image" style="color: #ff7d75;"></label>
			</c:if>
			</div>

		       <c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">
		       <div class="col-md-2"> &nbsp;&nbsp;[Preview]<p> <img id="preview"src="/resources/images/planner/${planner.plannerImage}" style="width:200px;height:150px" /></div>
		       </c:if>
				<c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">
				 <div class="col-md-2"> &nbsp;&nbsp;[Preview]<p> <img id="preview"src="/resources/images/planner/alternative_image.png" style="width:200px;height:150px" /></div>
		       </c:if>
		        </div>
		     </div></div>
		  
		<br/><br/> <br/>  
		  <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-8"></div>
      <div class="col-md-2">
		     <a class="btn btn-default" href="#" role="button" style="color:#868296">취&nbsp;소</a>
		  
		      <button type="button" class="btn btn-default" id="save" style="color:#868296"> 다음 단계  </button>
		      
			 </div>
		    </div>
		  </div>
		</form>	  </div>	
		
		   <br>   <br>   <br>   <br>
	
</body>

</html>