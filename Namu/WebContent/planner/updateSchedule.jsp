<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<!--일정 수정 팝업  -->
<div style="display:none;"></div>
<a href="#layer3" class="btn-example"></a>
<div class="d-layer" >
<div class="dBg"></div>
<div id="layer3" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="updateSchedule2">
                <form name="scheForm2" id="scheForm2" action="javascript:fncUpdateSchedule();" method="post"> 
   <div id="updateSchedule"></div>

<div class="col-md-12" ><div class="row"> 
								 <div class="col-md-4"> <p> 표시 색상 선택</p></div>
								 <div class="col-md-8"> <input type="color" name="color" id="ucolor"  style="width:100px;" ></div>
								 </div></div>
	<br/><br/><br/>
<div class="col-md-12" >	
 <div class="row"> 
<div class="col-md-4">  
  <input type ="submit" value="등록" id="submit" ></div>
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