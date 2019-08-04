<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->

<jsp:include page="/layout/head.jsp" />

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
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
      <th scope="col">신고번호</th>
      <th scope="col">신고유형</th>
      <th scope="col">신고자</th>
      <th scope="col">신고대상</th>
      <th scope="col">신고일</th>
      <th scope="col">처리여부</th>
    </tr>
  </thead>
  <tbody>
  <!-- table-danger tr에 넣기 -->
  <c:forEach  var="item" items="${list }" varStatus="status">
    <tr class="policeCode${item.policeCode }">
     <td>${item.policeCode }</td>
      <td>${item.policeOption }</td>
      <td>${item.fromUser.nickname }</td>
      <td>${item.toUser.nickname }</td>
      <td>${item.policeDate } </td>
      <td>${item.processing }</td>
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
<div class="parentsPolice modal fade" id="policeCode${item.policeCode }" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<input type="hidden" value="${item.policeCode }">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">
        신고 정보
		</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type="hidden" id="policeBoardCode" value="${item.policeBoardCode }">
      <input type="hidden" id="policeDetailCode" value="${item.policeDetailCode }">
      <input type="hidden" id="fromUser" value="${item.fromUser.userCode }">
      <input type="hidden" id="toUser" value="${item.toUser.userCode }">
      
       신고 유형 :${item.policeOption }
     <hr>
    
    	신고 내용 : ${item.policeContent }
    	
    <hr>
    신고자  : ${item.fromUser.nickname }
    <br> <br>
    <label class="mr-sm-1 sr-only" for="inlineFormCustomSelect">Preference</label>
      <select class="custom-select mr-sm-1" id="inlineFormCustomSelect1">
        <option value="0" selected>선택</option>
        <option value="0">정지 해제</option>
        <option value="7">7일 정지</option>
        <option value="30">30일 정지</option>
        <option value="99">영구 정지</option>
      </select>
<hr>
	신고대상  : ${item.toUser.nickname }
	<br><br>
	<label class="mr-sm-1 sr-only" for="inlineFormCustomSelect">Preference</label>
      <select class="custom-select mr-sm-1" id="inlineFormCustomSelect2">
        <option value="0" selected>선택</option>
        <option value="0">정지 해제</option>
        <option value="7">7일 정지</option>
        <option value="30">30일 정지</option>
        <option value="99">영구 정지</option>
      </select>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="locationPolice btn btn-primary" >신고글 이동</button>
        <button type="button" class="processingPolice btn btn-primary" >처리완료</button>
      </div>
    </div>
  </div>
</div>
</c:forEach>


<script type="text/javascript">
	$(function(){
		$('tr[class^=policeCode]').on('click',function(){
			var mod = $(this).attr('class');
			$('#'+mod).modal();
		})
		
		$('.locationPolice').on('click',function(){
			var boardCode = $(this).parent().prev().children().val().trim();
			var detailCode = $(this).parent().prev().children().next().val().trim();
			self.location = '/community/getCommunity?communityCode='+detailCode;
		});
		
		$(document).on('change','#inlineFormCustomSelect1',function(){
			//alert($(this).val());
			//alert($(this).parents('tr').children('td:eq(0)').text().trim());
			//alert($(this).parents('div[class=modal-body]').children().next().next().val().trim());
			var policeCode = $(this).parents('div[class^=parentsPolice]').children().val().trim();
			blockUser($(this).val(), $(this).parents('div[class=modal-body]').children().next().next().val().trim());
			
		})
		
		$(document).on('change','#inlineFormCustomSelect2',function(){
			//alert($(this).val());
			//alert($(this).parents('tr').children('td:eq(0)').text().trim());
			//alert( $(this).parents('div[class=modal-body]').children().next().next().next().val().trim());
			var policeCode = $(this).parents('div[class^=parentsPolice]').children().val().trim();
			blockUser($(this).val(), $(this).parents('div[class=modal-body]').children().next().next().val().trim());
			
		})
		
		$(document).on('click','.processingPolice',function(){
			var policeCode = $(this).parents('div[class^=parentsPolice]').children().val().trim();
			updatePolice(policeCode);
		})


		//정지
		function blockUser(blockDay,userCode) {
			
			$.ajax({
				url : '/user/json/setUserBlock',
				method : 'post',
				data : JSON.stringify({
					userCode : userCode,
					startBlock : blockDay
				}),
				headers : {
					"Accpet" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData,status) {
					if(JSONData == true) {
						alert("처리되었습니다.")
					}
				}
			
		});
		}
		
		function updatePolice(policeCode) {
			$.ajax({
				url : '/user/json/updatePolice',
				method : 'post',
				data : JSON.stringify({
					processing : 'O',
					policeCode : policeCode
				}),
				headers : {
					"Accpet" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData,status) {
					$('body').load('/user/getPoliceList',function(){
						
					})
				}
			
		});
		}
		
		
	})
</script>
</body>
</html>