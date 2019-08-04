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
          <h5 class="title"> 일정 수정  </h5> 
    		<br/><br/>
    		
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p> 날짜 </p></div> 
<div class="col-md-8"> <input type="text" name="scheDay" id="scheDay" value="${planner.scheDay}"/></div> 
 </div></div>
 
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p>   일정 </p></div> 
 <div class="col-md-8"> <input type="text" name="scheName" value="scheDay"/> </div> 
 </div></div>
          
<div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"> <p> 일정시작시간 </p></div> 
<!-- <div class="col-md-4"><select class="custom-select mr-sm-2" id="timeHour" name="timeHour">

  	 <option value='00' selected='selected'>00</option><option value='01'>01</option><option value='02'>02</option><option value='03'>03</option><option value='04'>04</option><option value='05'>05</option><option value='06'>06</option><option value='07'>07</option><option value='08'>08</option><option value='09'>09</option><option value='10'>10</option>
<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option>
  	 <option value='21'>21</option><option value='22'>22</option><option value='23'>23</option>
  	 </select> 
  	 </div>
<div class="col-md-4">:<select class="custom-select mr-sm-2" id="timeMin" name="timeMin">

  	 <option value='00' selected='selected'>00</option><option value='10'>10</option><option value='20'>20</option>
  	 <option value='30'>30</option><option value='40'>40</option><option value='50'>50</option>
  	 </select>
  	 </div> -->
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