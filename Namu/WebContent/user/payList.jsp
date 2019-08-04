<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<jsp:include page="/layout/head.jsp" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<header><%@ include file="/layout/header.jsp" %></header>
<br><br><br>
<div class="container-fluid">
<div class="row">
<div class="col-md-1">

</div>
<div class="col-md-10">
<table class="table table-hover">
  <thead>
    <tr class="table-info">
      <th scope="col">결제번호</th>
      <th scope="col">분류</th>
      <th scope="col">결제방법</th>
      <th scope="col">결제금액</th>
      <th scope="col">결제일</th>
    </tr>
  </thead>
  <tbody>
  <!-- table-danger tr에 넣기 -->
  <c:forEach  var="item" items="${list }" varStatus="status">
    <tr class="paymentCode${item.paymentCode }">
     <td>${item.paymentCode }</td>
      <td>
      <c:if test="${!empty item.hotelCode }">
      숙소
      </c:if>
      <c:if test="${empty item.hotelCode }">
      항공권
      </c:if>
      </td>
      <td>${item.paymentOption }</td>
      <td>${item.paymentPrice }</td>
      <td>${item.paymentDate } </td>
     
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<div class="col-md-1">

</div>
</div>
</div>


<c:forEach var="item" items="${list }">
<div class="modal fade" id="paymentCode${item.paymentCode }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">
			<c:if test="${!empty item.hotelName }">
			    숙소 정보
   			 </c:if>
   			 <c:if test="${empty item.hotelName }">
			    항공 정보
   			 </c:if>
		</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <c:if test="${!empty item.hotelName }">
    숙소명 : ${item.hotelName }
     <hr>
    </c:if>
   
     <c:if test="${!empty item.hotelAddress }">
    숙소 주소 : ${item.hotelAddress }
     <hr>
    </c:if>
    
     <c:if test="${!empty item.startDate }">
     <c:if test="${!empty item.hotelCode }">
    체크인 : ${item.startDate }
     <hr>
    </c:if>
     <c:if test="${empty item.hotelCode }">
    출발일 : ${item.startDate }
     <hr>
    </c:if>
    </c:if>
    
     <c:if test="${!empty item.endDate }">
     <c:if test="${!empty item.hotelCode }">
    체크아웃 : ${item.endDate }
    </c:if>
     <c:if test="${empty item.hotelCode }">
    귀국일 : ${item.endDate }
     <hr>
    </c:if>
    </c:if>
    
     <c:if test="${!empty item.startWay }">
    출발지 : ${item.startWay }
     <hr>
    </c:if>
    
     <c:if test="${!empty item.endWay }">
    도착지 : ${item.endWay }
     <hr>
    </c:if>
    
     <c:if test="${!empty item.flightTime }">
    출국 총 비행시간 : ${item.flightTime }
     <hr>
    </c:if>
    
      <c:if test="${!empty item.returnFlightTime }">
    귀국 총 비행시간 : ${item.returnFlightTime }
    </c:if>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         <c:if test="${!empty item.hotelCode }">
        <button type="button" class="hotelDetailPayView btn btn-primary" value="${item.hotelCode }">숙소 보기</button>
         </c:if>
      </div>
    </div>
  </div>
</div>
</c:forEach>


<script type="text/javascript">
	$(function(){
		$('tr[class^=paymentCode]').on('click',function(){
			var mod = $(this).attr('class');
			$('#'+mod).modal();
		})
		
		$('.hotelDetailPayView').on('click',function(){
			self.location = '/guide/selectTourDetail/'+$(this).val().trim();
		})
	})
</script>
</body>
</html>