<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<jsp:include page="/layout/head.jsp" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
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
      <th scope="col"><button class="ord" value="1 desc" style="border:none; background: none">회원번호</button></th>
      <th scope="col"><button class="ord" value="5 desc" style="border:none; background: none">닉네임</button></th>
      <th scope="col"><button class="ord" value="4" style="border:none; background: none">권한</button></th>
      <th scope="col">정지시작</th>
      <th scope="col">정지끝</th>
      <th scope="col">접근제한</th>
    </tr>
  </thead>
  <tbody>
  <!-- table-danger tr에 넣기 -->
  <c:forEach  var="item" items="${list }" varStatus="status">
    <tr class="pre-${status.index+1 }">
      <td>${item.userCode }</td>
      <td>${item.nickname }</td>
      <td>${item.role }</td>
      <td>${item.startBlock }</td>
      <td>${item.endBlock }</td>
	<td>      
		<label class="mr-sm-1 sr-only" for="inlineFormCustomSelect">Preference</label>
      <select class="custom-select mr-sm-1" id="inlineFormCustomSelect">
        <option value="0" selected>선택</option>
        <option value="0">정지 해제</option>
        <option value="7">7일 정지</option>
        <option value="30">30일 정지</option>
        <option value="99">영구 정지</option>
      </select>
      </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<div class="col-md-1">

</div>
</div>
</div>

<!-- 정지 또는 일반회원 조회시 정렬값 -->
<input id="role" type="hidden" value="all">
<input id="uCode" type="hidden" value="desc">
<input id="nick" type="hidden" value="desc">

<script type="text/javascript">

$(function(){
	
	$('.ord').on('click',function(){
		var order = $(this).val().trim();
		var role = $('#role').val().trim();
		var code = $('#uCode').val();
		var nick = $('#nick').val();
		
		//var asc = '1 asc';
		
		if(order == '1 desc') {
			$(this).val('1 asc');
		}else if(order == '1 asc') {
			$(this).val('1 desc');
		}
		if(order == '5 desc') {
			$(this).val('5 asc');
		}else if(order == '5 asc') {
			$(this).val('5 desc');
		}
		if(order == '4') {
			if(role == 'user'){
				$('#role').val('block');
			}else if(role == "all") {
				$('#role').val('user');
			}else if(role == 'block') {
				$('#role').val("all");
			}
		}
		
		getUser(order);
	})
});
	
	$(document).on('change','#inlineFormCustomSelect',function(){
		//alert($(this).val());
		//alert($(this).parents('tr').children('td:eq(0)').text().trim());
		blockUser($(this).val(), $(this).parents('tr').children('td:eq(0)').text().trim());
		
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
				//alert(JSONData);
				getUser(1);
			}
		
	});
	
	}
	//정렬
	function getUser(orderBy) {
		
		$.ajax({
			url : '/user/json/getUserList',
			method : 'post',
			data : JSON.stringify({
				order : orderBy,
				role : $('#role').val().trim()
			}),
			headers : {
				"Accpet" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData,status) {
				$('tbody').empty();
				$.each(JSONData,function(index,item){
					$('tbody').append(
					'<tr class="pre-'+(index+1)+'">'
				    + ' <td>'+item.userCode +'</td>'
				    +  '<td>'+item.nickname +'</td>'
				      +'<td>'+item.role +'</td>'
				      +'<td>'+item.startBlock +'</td>'
				      +'<td>'+item.endBlock +'</td>'
					+'<td>'      
					+'	<label class="mr-sm-1 sr-only" for="inlineFormCustomSelect">Preference</label>'
				    +'  <select class="custom-select mr-sm-1" id="inlineFormCustomSelect">'
				    +'    <option value="0" selected>선택</option>'
				    +'    <option value="0">정지 해제</option>'
				    +'    <option value="7">7일 정지</option>'
				    +'    <option value="30">30일 정지</option>'
				    +'    <option value="99">영구 정지</option>'
				    +'  </select>'
				    +'  </td>'
				    +'</tr>'
				    )
// 					$('.pre-'+(index+1) + '> td:nth-child(1) ').text(item.userCode);
// 					$('.pre-'+(index+1) + '> td:nth-child(2) ').text(item.nickname);
// 					$('.pre-'+(index+1) + '> td:nth-child(3) ').text(item.role);
// 					$('.pre-'+(index+1) + '> td:nth-child(4) ').text(item.startBlock);
// 					$('.pre-'+(index+1) + '> td:nth-child(5) ').text(item.endBlock);
					if(item.role == 'block') {
						$('tr[class=pre-'+(index+1)+']').addClass('table-danger');
						console.log($('tr[class=pre-'+(index+1)+']'));
					}
				})
				
				$("tr[class^=pre-]").each(function(idx){ // idx 0부터 시작함
					
		 			if(JSONData.length <= idx) {
		 				$(".pre-"+(idx+1)).remove();
		 			}
		 		});
			}
		})
		
	}

</script>
</body>
</html>