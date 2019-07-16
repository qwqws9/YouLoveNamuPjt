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
   			 <h6 class="count border-bottom border-gray pb-2 mb-0"></h6>
   			 
    <ul class="commentAjax" style="list-style: none; padding-left: 0px;">
		
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

<input type="hidden" id="boardCode" value="${boardCode1 }">
<input type="hidden" id="detailCode" value="${detailCode1 }">
<input type="hidden" id="sessionId" value="${user.userCode }">

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
		
		getComment($('#boardCode').val(),$('#detailCode').val());
		
	});
	
	$(document).on("click",".like",function(){  
		console.log($(this).children().attr('class'));
		if($(this).children().attr('class') == 'fas fa-heart') {
			$(this).html('<i class="far fa-heart"></i>추천수들어갈곳');
		}else {
			$(this).html('<i class="fas fa-heart" style="color:red;"></i>추천수들어갈곳');
		}
	});
	
	$(document).on("click",".commentDelete",function(){  
		console.log($(this).parents('div').children().val());
		var commentCode = $(this).parents('div').children().val();
		if(confirm('삭제하시겠습니까?')) {
			//document.write('삭제')
				$.ajax({
					url : '/comment/json/deleteComment',
					method : 'post',
					data : JSON.stringify({
						commentCode : commentCode
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData) {
						if(JSONData == true) {
							getComment($('#boardCode').val(),$('#detailCode').val());
						}
					}
				})
			} else {
			//document.write('취소')
			return;
			}
	});
			
	
	$(document).on("click",".commentEdit",function(){  
		
		if($(this).text() == '수정취소') {
			$('.edit').remove();
			$('.comment').remove();
			$(this).text('수정').css('color','blue');
			$(this).next().show().css('display','');
			$(this).prev().show().css('display','');
			$(this).parent().next().show().css('display','');
			return;
		
	}
		$('.edit').remove();
		$('.comment').remove();
		$('.commentEdit').text('수정').css('color','blue');
		$(this).text('수정취소').css('color','red');
		$(this).parents('li').after('<li class="edit replyAdd">'+$('.replyAdda').html()+'<br><br></li>'.trim());
		$('.edit').attr('id', $(this).parents('div').children().val());
		$(this).next().hide();
		$(this).prev().hide();
		$(this).parent().next().hide();
	
		console.log($(this).parents('div').children().val());
		console.log($(this).parents('span').next().text());
		$(this).parents('li').next().children().children().val($(this).parents('span').next().text());
				
	});
			
			
			
	$(document).on("click",".reply",function(){ 
		console.log($(this).parents('div').children().val());
		if($(this).text() == '답글취소') {
				$('.comment').remove();
				$('.edit').remove();
				$(this).html('<i class="fas fa-reply"></i>답글');
				$(this).css('color','#4285F4').css('border','none').css('background','none');
				return;
			
		}
		$('.comment').remove();
		$('.edit').remove();
		//$('.reply').text('답글').removeAttr('style');
		$(this).text('답글').removeAttr('style');
		$(this).text('답글취소').css('color','red').css('border','none').css('background','none');
		$(this).parents('li').after('<li class="comment replyAdd">'+$('.replyAdda').html()+'<br><br></li>'.trim());
		$('.comment').attr('id', $(this).parents('div').children().val());
	});
	
	$(document).on("click","button:contains('등록')",function(){ 
		//console.log($(this).prev().val().length);
		if($(this).prev().val().length < 1) {
			alert('내용을 입력하세요');
			return;
		}
		if($(this).parents('li').attr('class') == 'edit replyAdd') {
			//alert("수정창");
			//console.log($(this).parents('li').attr('id'));
			//console.log($(this).prev().val());
			editComment($(this).parents('li').attr('id'),$(this).prev().val());
		}else {
			alert("답글창");
		}
		
		return ;
		
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
		$(this).prev().val("");
		
		 });
	
	
	function editComment(commentCode,value) {
		
		$.ajax({
			url : '/comment/json/updateComment',
			method : 'post',
			data : JSON.stringify({
				commentCode : commentCode,
				commentContent : value
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData){
				if(JSONData == true) {
					getComment($('#boardCode').val(),$('#detailCode').val());
				}
			}
		});
	}
	
	
	
	
	function getComment(boardCode,detailCode) {
		console.log(boardCode);
		console.log(detailCode);
		var userCode = $('#sessionId').val();
		
		$.ajax({
			url : '/comment/json/getComment',
			method : 'post',
			data : JSON.stringify({
				detailCode : detailCode,
				boardCode : boardCode
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				
				$('.count').text("댓글("+JSONData.length+")");
				
				if(JSONData.length != 0) {
					//return;
				
					$('ul.commentAjax').empty();
				$.each(JSONData, function(index,item){
					//alert(item.commentContent + " : " + index);
					//alert(index);
					//댓글
					
					if(item.step == 0) {
						
						$('ul.commentAjax').append('<li>'
			    		+'<div class="media text-muted pt-3">'
			    		+'	<input type="hidden" value="'+item.commentCode+'">'
			    		+'	<img alt="" src="/resources/images/profile/'+item.writerComment.profileImg+'" width="32" height="32">'
			    		+'	<p class="media-body pb-3 mb-0 small">'
			    		+'		<span class="apto-'+index+' d-block" style="position:relative;">'
			    		+'        	<strong class="text-gray-dark">@'+item.writerComment.nickname+'</strong>&nbsp;&nbsp;'
			    		+'       	<button class="like" type="button" style="border:none; background: none">'
			    		+'        		<i class="far fa-heart"></i>추천수들어갈곳'
			    		+'        	</button>'
			    		+'        	<small>'+item.commentDate+'</small>&nbsp;&nbsp;&nbsp;'
			    		
			    		+'		</span>'
			    		+'		 <span>'+item.commentContent+'</span>'
			    		+'	</p>'
			    		+'</div>'
			    		+' </li>');
						if(item.commentDelete == 0 && item.writerComment.userCode != userCode ) {
							$('<button class="reportComment" style="position: absolute; right: 0; color:#4285F4; border:none; background: none;"><i class="fas fa-bell"></i>신고</button>').appendTo('.apto-'+index);
						}else if(item.commentDelete == 0 && item.writerComment.userCode == userCode) {
							$('<button class="commentEdit" style="position: absolute; right: 50px; border:none; background: none;">수정</button>').appendTo('.apto-'+index);
							$('<button class="commentDelete" style="position: absolute; right: 0px; border:none; background: none;">삭제</button>').appendTo('.apto-'+index);
						}
						if(item.commentDelete == 0) {
							$('<button class="reply" style="color:#4285F4; border:none; background: none;"><i class="fas fa-reply"></i>답글</button>&nbsp;&nbsp;').appendTo('.apto-'+index);
						}
					//대댓글
					}else {
						
						
						$('ul.commentAjax').append('<li style="padding-left: 30px;">'
					   +' <div class="media text-muted pt-3">'
					   +' 	<input type="hidden" value="'+item.commentCode+'">'
					   +'    <img alt="" src="/resources/images/profile/'+item.writerComment.profileImg+'" width="32" height="32">'
					   +'    <p class="media-body pb-3 mb-0 small">'
					   +'    	<span class="aptoo-'+index+' d-block" style="position:relative;">'
					   +'        	<strong class="text-gray-dark">@'+item.writerComment.nickname+'</strong>&nbsp;&nbsp;' 
					   +'       	<button class="like" type="button" style="border:none; background: none">'
					   +'       		<i class="far fa-heart"></i>추천수들어갈곳'
					   +'       	</button>'
					   +'       	<small>'+item.commentDate+'</small>&nbsp;&nbsp;&nbsp;'
					   +'       </span>'
					   +'   	<span>'+item.commentContent+'</span>'
					   +'	</p>'
					   +' </div>'
					   +'</li>' );
						if(item.commentDelete == 0 && item.writerComment.userCode != userCode ) {
							$('<button class="reportComment" style="position: absolute; right: 0; color:#4285F4; border:none; background: none;"><i class="fas fa-bell"></i>신고</button>').appendTo('.aptoo-'+index);
						}else if(item.commentDelete == 0 && item.writerComment.userCode == userCode) {
							$('<button class="commentEdit" style="position: absolute; right: 50px; border:none; background: none;">수정</button>').appendTo('.aptoo-'+index);
							$('<button class="commentDelete" style="position: absolute; right: 0px; border:none; background: none;">삭제</button>').appendTo('.aptoo-'+index);
						}
						//대댓글은 답글이 없음
// 						if(item.commentDelete == 0) {
// 							$('<button class="reply" style="color:#4285F4; border:none; background: none;"><i class="fas fa-reply"></i>답글</button>&nbsp;&nbsp;').appendTo('.aptoo-'+index);
// 						}
						
					}
					$('ul').append('<li class="lh-125 border-bottom border-gray"> </li>');
					
				})
				}
			},
			error:function( jqXHR, textStatus, errorThrown){
				alert(textStatus);
				alert(errorThrown);
			}
			
		})
		
	}
	
	
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
				if(JSONData == true) {
					getComment($('#boardCode').val(),$('#detailCode').val());
				}
			}
			
		})
		
	}
	

</script>

</body>
</html>