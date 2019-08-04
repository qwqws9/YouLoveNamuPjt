<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--일정 상세 팝업  -->
<div style="display:none;"></div>
<a href="#layer2" class="btn-example"></a>
<div class="dim-layer" >
<div class="dimBg"></div>
<div id="layer2" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="schedule">
               
   <div id="getSchedule"></div>
    
 <div class="col-md-12">
 <div class="row"> 
 <div class="col-md-4"> <input type ='button' value="수정" id="update" onclick="updateSchedule();"></div> 
<div class="col-md-4"> <input type ='button' value="삭제" id="delete" onclick="deleteSchedule();"></div>
<div class="col-md-4"> <input type='button' id="close"  value='닫기' ></div>
	</div></div></div>
		</div></div> </div></div>

</body>
</html>