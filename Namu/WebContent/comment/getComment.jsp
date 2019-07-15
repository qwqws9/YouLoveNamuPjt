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
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<script src="/resources/javascript/jquery.oLoader.min.js"></script>

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
      			<p class="media-body pb-3 mb-0 small">
        			<span class="d-block" style="position:relative;">
			        	<strong class="text-gray-dark">@닉네임들어갈곳</strong>&nbsp;&nbsp;
			        	<button class="like" type="button" style="border:none; background: none">
			        		<i class="far fa-heart"></i>추천수들어갈곳
			        	</button>
			        	<small>작성시간들어갈곳</small>&nbsp;&nbsp;&nbsp;
			        	<button class="reportComment" style="position: absolute; right: 0; color:#4285F4; border:none; background: none;"><i class="fas fa-bell"></i>신고</button>
			        	<button class="reply" style="color:#4285F4; border:none; background: none;"><i class="fas fa-reply"></i>답글</button>&nbsp;&nbsp;
			        	<button class="commentEdit" style="position: absolute; right: 150px; border:none; background: none;">수정</button>
				        <button class="commentDelete" style="position: absolute; right: 100px; border:none; background: none;">삭제</button>
        			</span>
        			 <span>댓글내용</span>
      			</p>
    		</div>
   		 </li>
    
    		<li style="padding-left: 30px;">
			    <div class="media text-muted pt-3">
			    	<input type="hidden" value="12345">
				    <img alt="" src="/resources/images/profile/7877e8c81ac0a942265a9b65a049b784.jpg" width="32" height="32">
				    <p class="media-body pb-3 mb-0 small">
				    	<span class="d-block" style="position:relative;">
				        	<strong class="text-gray-dark">@닉네임들어갈곳</strong>&nbsp;&nbsp; 
				        	<button class="like" type="button" style="border:none; background: none">
				        		<i class="far fa-heart"></i>추천수들어갈곳
				        	</button>
				        	<small>작성시간들어갈곳</small>&nbsp;&nbsp;&nbsp;
				        	<button class="reportComment" style="position: absolute; right: 0; color:#4285F4; border:none; background: none;"><i class="fas fa-bell"></i>신고</button>
				        	<button class="commentEdit" style="position: absolute; right: 150px; border:none; background: none;">수정</button>
				        	<button class="commentDelete" style="position: absolute; right: 100px; border:none; background: none;">삭제</button>
				        </span>
			        	<span>awdawdawd댓글내용</span>
			     	</p>
			    </div>
    		</li>
    		
		    <!-- 선긋기 -->
		    <li class="lh-125 border-bottom border-gray"> </li>
	</ul>
    
    
    
		     <div class="replyAdda">
				  <div class="replyAdd row" style="padding:0 2.5rem!important;">
					<textarea rows="5" class="form-control"  name="commentContent"></textarea>
					<button type="button" class="btn btn-outline-primary" style="margin-left: 10px;">등록</button>
				  </div>
			</div>
 		</div>
	</div>
</div>

<input type="hidden" id="boardCode" value="5">
<input type="hidden" id="detailCode" value="10675">

<div class="text-xs-center">
			<nav aria-label="..." >
		  <ul class="pagination" style="justify-content: center;">
		    <li class="page-item disabled">
		      <button class="preBtn page-link" href="#" tabindex="-1" aria-disabled="true">Prev</button>
		    </li>
		    <c:forEach varStatus="status" begin="1" end="5">
			    <li class="pageTour-${status.index} page-item">
			    	<button class="viewPage page-link">${status.index}</button>
			    </li>
		    </c:forEach>
		    <li class="page-item">
		      <button class="nextBtn page-link">Next</button>
		    </li>
		  </ul>
			</nav>
	</div>
	<br><br><br><br><br><br>

<script type="text/javascript">
	
	$(function(){
		$('.reply').on('click',function(){
			console.log($(this).parents('div').children().val());
			if($(this).text() == '답글취소') {
					$('.comment').remove();
					$(this).html('<i class="fas fa-reply"></i>답글');
					$(this).css('color','#4285F4').css('border','none').css('background','none');
					return;
				
			}
			$('.comment').remove();
			$('.reply').text('답글').removeAttr('style');
			$(this).text('답글취소').css('color','red').css('border','none').css('background','none');
			$(this).parents('li').after('<li class="comment replyAdd">'+$('.replyAdda').html()+'<br><br></li>'.trim());
			$('.comment').attr('id', $(this).parents('div').children().val());
		});
		
// 		$('button:contains("등록")').on('click',function(){
// 			alert('adadad');
// 		})
		$(document).on("click","button:contains('등록')",function(){ 
			if($(this).parents('li').length > 0) {
				//alert("있으므로 대댓글");
				//alert($(this).parents('li').attr('id'));
				//alert($(this).prev().val());
				addComment($(this).parents('li').attr('id'),$(this).prev().val());
			}else {
				//alert("없으므로 댓글")
				//alert($(this).prev().val());
				addComment(0,$(this).prev().val());
			}
			
			 });
		
		$('.like').on('click',function(){
			console.log($(this).children().attr('class'));
			if($(this).children().attr('class') == 'fas fa-heart') {
				$(this).html('<i class="far fa-heart"></i>추천수들어갈곳');
			}else {
				$(this).html('<i class="fas fa-heart" style="color:red;"></i>추천수들어갈곳');
			}
		})
		
		$('.commentEdit').on('click',function() {
			if($(this).text() == '수정취소') {
				$('.comment').remove();
				$(this).text('수정').css('color','blue');
				$(this).next().show().css('display','');
				$(this).prev().show().css('display','');
				$(this).parent().next().show().css('display','');
				return;
			
		}
			$('.comment').remove();
			$('.commentEdit').text('수정').css('color','blue');
			$(this).text('수정취소').css('color','red');
			$(this).parents('li').after('<li class="comment replyAdd">'+$('.replyAdda').html()+'<br><br></li>'.trim());
			$('.comment').attr('id', $(this).parents('div').children().val());
			$(this).next().hide();
			$(this).prev().hide();
			$(this).parent().next().hide();
			
			
			
			//console.log($(this).parents('div').children().val());
			
			
		});
		$('.commentDelete').on('click',function() {
			console.log($(this).parents('div').children().val());
			if(confirm('삭제하시겠습니까?')) {
				//document.write('삭제')
				} else {
				//document.write('취소')
				return;
				}
		});
		
		
		
	});
	
	
	function addComment(replyCode,commentContent) {
		var boardCode = $('#boardCode').val();
		var detailCode = $('#detailCode').val();
		
		$.ajax({
			url : '/comment/json/addComment',
			method : 'post',
			data : JSON.stringify({
				replyCode : replyCode,
				commentContent : commentContent,
				detailCode : detailCode,
				boardCode : boardCode
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				alert(JSONData);
			}
			
		})
		
	}
	

</script>

</body>
</html>