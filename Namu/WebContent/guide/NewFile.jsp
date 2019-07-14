<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="../resources/javascript/jquery.oLoader.min.js"></script>
</head>
<body>
<div class="container">

<c:forEach varStatus="status" begin="1" end="10">
	<div class="pre-${status.index +1} row mb-1">
		<input type="hidden" name="tourId" value="${status.index +1}">
		<div class="col-md-12">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<strong class="d-inline-block mb-2 text-primary">qweqwrqwrqrqwerqrtesyr</strong>
					<h3 class="mb-0">esryesryeyr</h3>
					<div class="mb-1 text-muted">esryesry</div>
					<p class="card-text mb-auto">esryesryesryeyr</p>
					<a href="#" class="stretched-link">이곳에는 별점과 댓글수가 들어갈거야</a>
				</div>
				<div class="col-auto d-none d-lg-block">
				<img src="../resources/images/dog.JPG"  width="250" height="250">
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
	<input type="hidden" id="searchKeyword" value="ㅋㅋㅋㅋㅋ">
	<div class="text-xs-center">
	<nav aria-label="..." >
  <ul class="pagination" style="justify-content: center;">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <c:forEach varStatus="status" begin="1" end="10">
    <li class="page-item"><a class="viewPage page-link" href="#">${status.index}</a></li>
    </c:forEach>
    
    
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
</div>

<script type="text/javascript">
	//관광지 디테일 조회
	$('div[class^="pre"]').on('click',function(){
		alert( $( $('input[name="tourId"]')[$(this).index()]).val());
	});
	
	//페이지 이동시
	$('.viewPage').on('click',function(){
		alert($(this).text());
		alert($('#searchKeyword').val());
	});
	
	
	$('body').oLoader({
		  wholeWindow: true, //makes the loader fit the window size
		  lockOverflow: true, //disable scrollbar on body
		   
		  backgroundColor: '#282c37',
		  fadeInTime: 1000,
		  fadeLevel: 0.7,
		  image: '../resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
		 
		});

</script>




</body>
</html>