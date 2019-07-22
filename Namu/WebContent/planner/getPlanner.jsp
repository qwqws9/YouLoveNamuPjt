<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      <img class="img-thumbnail" src="/images/uploadFiles/${planner.plannerImage}" alt="..." height="300" width="300">    
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
 
				 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     
		      <button type="button" class="addPurchase_btn" id="addPurchase"> 수정하기  </button>
		      
		   <button type="button" class="addCart_btn" id="addCart">카트에 담기 </button>
		   <button type="button" class="previus_btn" id="previous">이&nbsp;전 </button>
		   
		    
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>
