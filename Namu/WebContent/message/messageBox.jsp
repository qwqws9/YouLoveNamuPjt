<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쪽지 보관함</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- 이모티콘 -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	
	<!-- websocket -->
  	<script src="/socket.io/socket.io.js"></script>
  	<!-- css -->
  	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
  	<link rel="stylesheet" type="text/css" href="/resources/css/message.css">
  	<script type="text/javascript" src="/resources/javascript/message.js"></script>
  	
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			
			<div class="leftbar">
				<div class="heading">
					<button type="button" id="sendMessage">쪽지쓰기</button>
				</div>
				<div id='listings' class='listings'>
					<div><a href="#">보낸쪽지함</a></div>
					<div><a href="#">받은쪽지함</a></div>
					<div><a href="#">스팸쪽지함</a></div>
					<div><a href="#">영구쪽지함</a></div>
				</div>
			</div><!-- left bar -->
			
			<div class="messageBox" style="border: 1px solid red;">
			
				<div class="header" style="padding-top: 15px;padding-left: 10px;">
					<select id="messageSearch">
						<option>전체쪽지</option>
						<option>받은쪽지</option>
						<option>보낸쪽지</option>
						<option>보관쪽지</option>
					</select>
					
					<select id="selectSearch">
						<option>No.</option>
						<option>별명</option>
						<option>내용</option>
					</select>
					
					<input type="text" id="content">
					<button type="button"><i class="fas fa-search"></i></button>
					
					<span>
						<strong>안읽은 쪽지</strong>
						<a href="#">0</a>
						<span>/</span>
						<span>0</span>
					</span>
				</div><!-- end of header -->
				
				<hr>
				
				<div class="body">
					<table class="" style="width: 100%;">
						<thead>
					    	<tr>
					      		<th><input type="checkbox"></th>
					      		<th>No.</th>
					      		<th>보낸회원</th>
					      		<th>내용</th>
					      		<th>날짜</th>
					    	</tr>
					  	</thead>
					  	<tbody >
					  		<c:forEach var="i" begin="0" end="6">
					    	<tr style="border: 1px solid red;">
					    		<td><input type="checkbox"></td>
					    		<td>1</td>
					      		<td>
					      			<a href="#">중현</a>
					      		</td>
					      		<td style="overflow: hidden; text-overflow: ellipsis;">
					      			<a href="#" style="width:320px; overflow: hidden; text-overflow:ellipsis; white-space: nowrap; float:left;">다다다다다다다다다다닫다다다다다닫다다다다다닫다다다다다닫다다다다다닫다다다다다닫다다다다다닫닫</a>
					      		</td>
					      		<td>19.09.23 16:47</td>
					    	</tr>
					  		</c:forEach>
					  	</tbody>
					</table>
				</div><!-- end of body -->
				
				<div class="navigation">
					<nav aria-label="Page navigation example" style="margin: auto;">
						<ul class="pagination" style="">
					    	<li class="page-item">
						      	<a class="page-link" href="#" aria-label="Previous">
						        	<span aria-hidden="true">&laquo;</span>
						      	</a>
					    	</li>
					    	<li class="page-item"><a class="page-link" href="#">1</a></li>
					    	<li class="page-item"><a class="page-link" href="#">2</a></li>
					    	<li class="page-item"><a class="page-link" href="#">3</a></li>
					    	<li class="page-item"><a class="page-link" href="#">4</a></li>
					    	<li class="page-item"><a class="page-link" href="#">5</a></li>
					    	<li class="page-item">
					      		<a class="page-link" href="#" aria-label="Next">
					        		<span aria-hidden="true">&raquo;</span>
					      		</a>
					    	</li>
					  	</ul>
					</nav>
				</div>
				
				<hr>
				
				<div class="footer">
					<button>답장</button>
					<button>보관</button>
					<button>삭제</button>
					<button>차단</button>
				</div><!-- end of footer -->
			</div><!-- right bar -->
		</div><!-- end of container row -->
	</div><!-- end of container -->
	
</body>
</html>