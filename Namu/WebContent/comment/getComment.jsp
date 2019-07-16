<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>

<style type="text/css">
.replyAdda {width: 100%;}
.replyAdd {
 	width: 100%; padding:0 2.5rem!important;
}
.replyAdd textarea {width: 90%}
.replyAdd .btn {width: calc(10%-10px); margin-left:10px;}

</style>
</head>
<body>
<div class="container">
		<div class="col-md-12">
		
			<div class="my-3 p-3 bg-white rounded shadow-sm">
    <h6 class="border-bottom border-gray pb-2 mb-0">댓글(댓글수가 들어갈곳)</h6>
    <ul style="list-style: none; padding-left: 0px;">
		<li>
    <div class="media text-muted pt-3">
    		<input type="hidden" value="12345">
    		<img alt="" src="/resources/images/profile/7877e8c81ac0a942265a9b65a049b784.jpg" width="32" height="32">
<!--       <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg> -->
      <p class="media-body pb-3 mb-0 small">
      
      
        <span class="d-block" style="position:relative;">
        	<strong class="text-gray-dark">@닉네임들어갈곳</strong>&nbsp;&nbsp;
        	<button id="like" type="button" style="border:none; background: none">
        		<i class="far fa-heart"></i>추천수들어갈곳
        	</button>
        	<small>작성시간들어갈곳</small>&nbsp;&nbsp;&nbsp;
        	<a class="reply" href="#"><i class="fas fa-reply"></i>답글</a>&nbsp;&nbsp;
        	<a href="#" style="position: absolute; right: 0;"><i class="fas fa-bell"></i>신고</a></span>
        댓글내용 들어갈곳
      </p>
    </div>
    </li>
    
    <li style="padding-left: 30px;">
   
    <div class="media text-muted pt-3">
    <input type="hidden" value="12345">
      <img alt="" src="/resources/images/profile/7877e8c81ac0a942265a9b65a049b784.jpg" width="32" height="32">
      <p class="media-body pb-3 mb-0 small">
        <span class="d-block" style="position:relative;"><strong class="text-gray-dark">@닉네임들어갈곳</strong>&nbsp;&nbsp; <small>작성시간들어갈곳</small>&nbsp;&nbsp;&nbsp;<a href="#" style="position: absolute; right: 0;"><i class="fas fa-bell"></i>신고</a></span>
        awdawdawd댓글내용
      </p>
    </div>
    </li>
    <li class="lh-125 border-bottom border-gray"> </li>
    </ul>
  </div>
  
  <div class="replyAdda">
  <div class="replyAdd row" style="padding:0 2.5rem!important;">
<!--   <div class="col-md-8"> -->
	<textarea rows="5" class="form-control"  name="commentContent"></textarea>
<!-- 	</div> -->
<!-- 	<div class="col-md-4"> -->
	<button type="button" class="btn btn-outline-primary" style="margin-left: 10px;">등록</button>
<!-- 	</div> -->
  </div>
		</div>
		</div>
		
</div>

<input type="hidden" id="communityCode" value="커뮤니티코드">
<input type="hidden" id="communityBoard" value="게시물번호">

<script type="text/javascript">
	
	$(function(){
		$('.reply').on('click',function(){
			console.log($(this).parents('div').children().val());
			if($(this).text() == '등록취소') {
					$('.comment').remove();
					$(this).html('<i class="fas fa-reply"></i>답글').removeAttr('style');
					return;
				
			}
			$('.comment').remove();
			$('.reply').text('답글').removeAttr('style');
			$(this).text('등록취소').css('color','red');
			$(this).parent().parent().parent().parent().after('<li class="comment replyAdd">'+$('.replyAdda').html()+'<br><br></li>'.trim());
			$('.comment').attr('id', $(this).parents('div').children().val());
		});
		
// 		$('button:contains("등록")').on('click',function(){
// 			alert('adadad');
// 		})
		$(document).on("click","button:contains('등록')",function(){ 
			   alert("click"); 
			 });
		
		$('#like').on('click',function(){
			console.log($(this).children().attr('class'));
			if($(this).children().attr('class') == 'fas fa-heart') {
				$('#like').html('<i class="far fa-heart"></i>추천수들어갈곳');
			}else {
				$('#like').html('<i class="fas fa-heart" style="color:red;"></i>추천수들어갈곳');
			}
		})
		
		
	});

</script>

</body>
</html>