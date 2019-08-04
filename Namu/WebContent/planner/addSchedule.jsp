<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <!--일정 등록 팝업  -->

<div style="display:none;"></div>
<a href="#layer1" class="btn-example"></a>
<div class="di-layer" >
<div class="diBg"></div>
<div id="layer1" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="addSchedule">
          <form name="scheForm" id="scheForm" action="javascript:fncAddSchedule();" method="post">
          <h5 class="title"> 일정 등록  </h5> 
    		<br/><br/>
    		
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p> 날짜 </p></div> 
<div class="col-md-8"> <input type="text" name="scheDay" id="scheDay"/></div> 
 </div></div>
 
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p>   일정 </p></div> 
 <div class="col-md-8"> <input type="text" name="scheName"/> </div> 
 </div></div>
          
<div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"> <p> 일정시작시간 </p></div> 
  	<div class="col-md-8"><input type="text" id ="alarm" name="timeHour"/> </div> 
  
</div></div>

 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
  <p> 일정장소 </p></div> 
 <div class="col-md-8"><input type="text" name="schePlace"/> </div>
 </div></div>
 
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
 <p> 일정상세 </p></div>
 <div class="col-md-8"><textarea name="scheDetail"  cols="20" rows="3"></textarea></div>
 </div></div>
 
<div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
 <p> 표시 색상 선택</p></div> 
 <div class="col-md-8"> <input type="color" name="color" id="color"  style="width:100px;"></div>
 </div></div>  
<br/><br/><br/>
    
 <div class="col-md-12" >	
 <div class="row"> 
<div class="col-md-4">  
  <input type ="submit" value="등록" id="submit"></div>
    <div class="col-md-4">  
    <input type ="reset" value="취소" id="reset"> </div>
        <div class="col-md-4"> 
        <input type='button' id="close"  value='닫기'/></div>
        </div></div>
            	</form>
      <div></div>
		</div></div> </div></div></div>
</body>
</html>