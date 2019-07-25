<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색/친구목록</title>

</head>
<body>
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle"><button class="btn btn-secondary" id="userSearchBlock">회원 검색&nbsp;<i class="fas fa-user"></i></button>&nbsp;&nbsp;<button class="btn btn-secondary" id="friendSearchBlock">친구목록&nbsp;<i class="fas fa-users"></i></button></h5>
            
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!-- 회원검색 부분 -->
      <div class="userSearchList" style="display: block; margin-top: 20px">
      <input type="text" class="form-control" id="searchUser" placeholder="닉네임을 입력하세요">
      <br>
      <div class="onCheckUser">
		    </div>
		    
       
      
      <div class="userList col-md-4">
      
      
       </div>
       </div>
       
       
       <!-- 친구목록 부분 -->
       <div class="friendSearchList" style="display: none; margin-top: 20px">
    		 <div class="list-group text-center">
			  <button type="button" class="list-group-item list-group-item-action">친구 목록</button>
			  <button type="button" class="list-group-item list-group-item-action">동행 목록</button>
			  <button type="button" class="list-group-item list-group-item-action">일행 목록</button>
			</div>
       </div>
       
       
      <div class="modal-footer" style="padding-top: 100px">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	
	$('#userSearchBlock').on('click',function(){
		$('.userSearchList').css('display','block');
		$('.friendSearchList').css('display','none');
	});
	
	$('#friendSearchBlock').on('click',function(){
		$('.userSearchList').css('display','none');
		$('.friendSearchList').css('display','block');
	});
	
	
	
	
	
	
	
	
	
	$('#searchUser').on('keyup',function(){
		var nick = $(this).val();
		if(nick != '') {
			$('.userList').empty();
		searchUser(nick);
		}else {
			return;
		}
	});
})

$(document).on('click','.userCheck',function(){
	var nick = $(this).next().text().trim();
	var check = true;
	$.each($('.uploadNick'),function(){
		console.log('들어옴')
		var nick2 = $(this).text().trim();
		console.log(nick);
		console.log(nick2);
		
		if(nick == nick2) {
			check = false;
		}else {
			
		}
	})
	if(check){
	$('.onCheckUser').append(
					 '<button type="button" class="uploadNick btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">'
				    	+'<span style="font-size: 12px;">'+nick+'&nbsp;<i class="far fa-times-circle"></i></span> </button>&nbsp;');
	}
})

$(document).on('click','.uploadNick',function(){
	$(this).remove();
});

$(document).on('click','.getUserCode',function(){
	//alert($(this).children('input').val().trim());
	var userCode = $(this).children('input').val().trim();
	var url = '/user/searchUserClick/'+userCode;
	var name = "_blank";
	var option = "width = 810,height = 320,marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no,location = no"
	window.open(url,name,option);
});

	function searchUser(nick) {
	
	$.ajax({
		url : '/user/json/getUser',
		method : 'post',
		data : JSON.stringify({
			nick : nick
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data, status) {
			if(data != '') {
				//alert("데이터있음");
				$('.userList').append(
						'<div class="userNick">'
					    +' <input class="userCheck" type="checkbox">'
					    +'<button class="getUserCode" style="border:none; background: none">'
					     +' <small>'+data.nickname+'</small>'
					     +'<input type="hidden" value="'+data.userCode+'"'
					     +'</button>'
					      +' </div>'
				);
			}	else {
				//alert("데이터없음");
			}
			
		}
	})
}

</script>
</body>
</html>