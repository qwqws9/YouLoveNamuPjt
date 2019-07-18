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
</head>
<body>



<button class="userCode">3</button>

<div class="popup_wrap">
<div class="popup_contain">
	<div class="card bg-light mb-3" style="max-width: 540px;">
	  <div class="row no-gutters">
	    <div class="col-md-4">
	      <img src="/resources/images/dog.JPG" class="userProfile card-img" alt="...">
	    </div>
	    <div class="col-md-8">
	    <input type="hidden" id="inviteUserCode">
	      <div class="card-body">
	        <p class="userNick card-text">닉네임 : 나무발발이</p>
	        <p class="userGend card-text">성별 : 남</p>
	        <p class="userAge card-text">나이 : 20</p>
	        <p class="card-text">자기소개</p>
	        <p class="userIntro card-text"></p>
	        <button type="button" class="phone7 btn btn-outline-info btn-sm" >채팅초대</button>
	        <button type="button" class="phone7 btn btn-outline-info btn-sm" >쪽지전송</button>
	        <button type="button" class="phone7 btn btn-outline-info btn-sm" >친구추가</button>
	        <button type="button" class="phone7 btn btn-outline-info btn-sm" >그룹초대</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
</div>
<script type="text/javascript">

$(function(){
	$('.userCode').on('click',function(){
		getUserProfile($(this).text());
	})
	
	
	function getUserProfile(codeUser) {
		
		$.ajax({
			url : '/user/json/getUser',
			method : 'post',
			data : JSON.stringify({
				userCode : codeUser
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData,status) {
				//alert(JSONData.nickname);
				$('.profileInfo').css('display','block');
				$('.userNick').text('닉네임 : ' + JSONData.nickname);
				if(JSONData.gender == 'M') {
					$('.userGend').text('성별 : 남자');
				}else {
					$('.userGend').text('성별 : 여자');
				}
				$('.userAge').text('나이 : ' + JSONData.birth);
				$('.userIntro').text(JSONData.introduce);
				$('.userProfile').attr('src','/resources/images/profile/'+JSONData.profileImg)
				$('#inviteUserCode').val(codeUser);
				
				
			}
		})
	}
});

</script>
</body>
</html>