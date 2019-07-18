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
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
<style>
label {margin:0;padding:0;}
</style>
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<br><br><br>
<form>
<div class="container">
<!--  -->
<div class="row">
  <div class="col-sm-6">
<!--  -->
	<div class="card bg-light">
	  <h5 class="card-header">내 정보조회</h5>
	  <div class="card-body">
	  <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">이름</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">${user.name }</p>
	     </div>
        </div>
        
        <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">생년월일</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">${user.birth }</p>
	     </div>
        </div>
        
        <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">성별</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">
		    <c:if test="${user.gender == 'M' }">
        	남자
        	</c:if>
        	<c:if test="${user.gender == 'F' }">
        	여자
        	</c:if>
	    </p>
	     </div>
        </div>
        
        <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">SNS 연동</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">카카오</p>
	     </div>
        </div>
        
	  </div>
	</div>
	</div>
	
	
	  <div class="col-sm-6">
	
	<div class="card mb-3" style="max-width: 540px;">
  <div class="row no-gutters">
    <div class="col-md-6">
      <img src="<c:url value='/resources/images/profile/${user.profileImg }' />" class="card-img" alt="..." width="500" height="232" id="img0">
    </div>
    <div class="col-md-6">
      <div class="card-body">
        <h5 class="card-title">프로필 사진</h5>
        <p class="card-text">여기는 뭐라고 쓸까 비어있으면 허전할것같은데,..,...,.,.,.,.</p>
        <span style="display:inline-block; margin-top:50px;">
		        <button type="button" class="img2 btn btn-outline-danger btn-sm" >사진삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="file" id="img1" style="display: none">
				<label class="btn btn-outline-success btn-sm" for="img1">사진변경</label>
	        </span>
      </div>
    </div>
  </div>
</div>
	</div>
	
	
	
	
	
	
	
	</div>
	<hr>
<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">이메일 주소</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="email0 card-text" style="margin-top: 5px">${user.email }</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="email1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="email2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 이메일" id="email3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="email4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="email5">
	        <br>
	        <span>
		        <button type="button" class="email6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="email7 btn btn-outline-success btn-sm" >수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="email8" value="">
  
  
  
  
<div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">휴대폰 번호</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="phone0 card-text" style="margin-top: 5px">${user.phone }</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="phone1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="phone2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 휴대폰번호" id="phone3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="phone4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="phone5">
	        <br>
	        <span>
		        <button type="button" class="phone6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="phone7 btn btn-outline-success btn-sm" >수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="phone8" value="">  
  
  
</div> <!-- end row -->
<hr>

<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">닉네임</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="nick0 card-text" style="margin-top: 5px">${user.nickname }</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="nick1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="nick2" style="display: none">
        	<br>
		        <input type="text" class="form-control" placeholder="변경할 닉네임"  style="width:200px" id="nick5">
		        <small id="nick5Help" class="form-text"></small>
	        <br>
	        <span>
		        <button type="button" class="nick6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="nick7 btn btn-outline-success btn-sm" >수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="nick8" value="f">
  
  
  
  
<div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">비밀번호</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="pass0 card-text" style="margin-top: 5px">**********</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="pass1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="pass2" style="display: none">
        	<br>
	        <input type="password" class="form-control" placeholder="변경할 비밀번호"   style="width:200px" id="pass4">
	        <br>
	        <input type="password" class="form-control" placeholder="비밀번호 확인"   style="width:200px" id="pass5">
	         <small id="pass5Help" class="form-text"></small>
	        <br>
	        <span>
		        <button type="button" class="pass6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="pass7 btn btn-outline-success btn-sm" >수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="pass8" value="f">  
  
  
</div> <!-- end row -->
<hr>






<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">자기소개</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="intro0 card-text" style="margin-top: 5px">${user.introduce }</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="intro1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="intro2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <textarea rows="10" class="form-control" id="intro5" name="introduce"></textarea>
			  			<small id="introduceHelp" class="form-text">
 							 0/1000bytes
						</small>
		        </div>
	        </div>
	        <br>
	        <span>
		        <button type="button" class="intro6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="intro7 btn btn-outline-success btn-sm" >수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="intro8" value="f">
  
  
  
  
<div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">프로필 공개여부</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="auth0 card-text" style="margin-top: 5px">
	        	<c:if test="${user.profileAuth == 'T' }">
	        	공개
	        	</c:if>
	        	<c:if test="${user.profileAuth == 'F' }">
	        	비공개
	        	</c:if>
	        	</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="auth1 btn btn-light" style="border:none; background: none"><i class="fas fa-toggle-on"></i></button>
	        </div>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="userCode" value="${user.userCode }">
  
    
  
  
</div> <!-- end row -->
<hr>
<br><br><br><br><br><br><br><br><br>
</div>
</form>

	<script type="text/javascript">
	
	//이미지 실시간
	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#img0').attr('src', e.target.result).attr("width",150).attr('height',232);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
	
	
	$(function(){
		
		var userCode = $('#userCode').val();
	
		$('#img1').on('change',function(){
			readURL(this);
			updateImg(userCode,$('form')[0]);
		}) 
		
		$('.img2').on('click',function(){
			var value = '7877e8c81ac0a942265a9b65a049b784.jpg';
			$('#img0').attr('src', '/resources/images/profile/7877e8c81ac0a942265a9b65a049b784.jpg').attr("width",500).attr('height',232);
			updateUser(userCode,"img",value);
		})
		
		
																	// 이메일 이벤트 //
		
		//변경 클릭
		$('.email1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-primary');
			$('.email2').css('display','block');
		});
		//수정취소 클릭
		$('.email6').on('click',function(){
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.email2').css('display','none');
		});
		//인증 클릭
		$('#email4').on('click',function(){
			$('#email3').attr('readonly',true);
			$('#email5').attr('placeholder','전송 중')
			//ajax 전송완료시
			//$('#email5').removeAttr('readonly');
			//$('#email8').val("인증번호 넣어주기");
			
			
			checkNum('email',$('#email3').val());
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.email7').on('click',function(){
			var check = $('#email8').val().trim();
			var check2 = $('#email5').val().trim();
			if(check == check2) {
				updateUser(userCode,'email',$('#email3').val());
				$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
				$('.email2').css('display','none');
				$('#email3').val("").attr('readonly',false);
				$('#email5').val("").attr('readonly',true);
			}else {
				alert("인증번호 다름");
				$('#email5').focus();
			}
		});
		
		
																// 휴대폰 이벤트 //
		
		//변경 클릭
		$('.phone1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-primary');
			$('.phone2').css('display','block');
		});
		//수정취소 클릭
		$('.phone6').on('click',function(){
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.phone2').css('display','none');
		});
		
		//인증 클릭
		$('#phone4').on('click',function(){
			$('#phone3').attr('readonly',true);
			$('#phone5').attr('placeholder','전송 중');
			
			checkNum('phone',$('#phone3').val());
		});
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.phone7').on('click',function(){
			var check = $('#phone8').val().trim();
			var check2 = $('#phone5').val().trim();
			if(check == check2) {
				updateUser(userCode,'phone',$('#phone3').val());
				$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
				$('.phone2').css('display','none');
				$('#phone3').val("").attr('readonly',false);
				$('#phone5').val("").attr('readonly',true);
			}else {
				alert("인증번호 다름");
				$('#phone5').focus();
			}
		});
		
		
																	// 닉네임 이벤트 //
		
		//변경 클릭
		$('.nick1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-primary');
			$('.nick2').css('display','block');
		});
		//수정취소 클릭
		$('.nick6').on('click',function(){
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.nick2').css('display','none');
		});
		//인증 클릭
		$('#nick4').on('click',function(){
			//ajax 전송완료시
			$('#nick5').removeAttr('readonly');
			$('#nick8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.nick7').on('click',function(){
			if($('#nick8').val() == 'f'){
				return;
			}
			updateUser(userCode,'nickname',$('#nick5').val().trim());
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.nick2').css('display','none');
		});
		
		
		// 닉네임 중복체크 ajax 통신
		$('#nick5').on('keyup',function(){
			
			
			var len = $(this).val();
				if(len == '' || len.length > 20) {
					$('#nick5Help').text('닉네임 1~20글자 사이로 입력해주세요').css('color','red');
					$('#nick5').attr('class','form-control is-invalid');
					return;
				}
			$.ajax({
				url : '/user/json/checkNick/'+$(this).val().trim(),
				method : 'get',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
					
					
					if(JSONData == true) {
						$('#nick5Help').text('사용가능한 닉네임 입니다').css('color','green');
						$('#nick5').attr('class','form-control is-valid');
						$('#nick8').val('t');
					}else {
						$('#nick5Help').text('사용중인 닉네임 입니다').css('color','red');
						$('#nick5').attr('class','form-control is-invalid');
						$('#nick8').val('f');
					}
					
				}
				
			})
		});
		
		
		
		
		
		
		
		
		
		
		

																// 비밀번호 이벤트 //
		
		//변경 클릭
		$('.pass1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-primary');
			$('.pass2').css('display','block');
		});
		//수정취소 클릭
		$('.pass6').on('click',function(){
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.pass2').css('display','none');
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.pass7').on('click',function(){
			var password = $('#pass4').val();
			var password2 = $('#pass5').val();	
			
			if($('#pass8').val() == 'f') {
				return;
			}
			if(password != password2) {
				$('#pass4').focus();
				alert('비밀번호를 확인하세요')
				return;
			}
			updateUser(userCode,'password',password2);
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.pass2').css('display','none');
		});
		
		
		//비밀번호 체크 뷰
		$('#pass5').on('keyup',function(){
			var password = $('#pass4').val();
			var password2 = $('#pass5').val();
			
			if(password == password2) {
				$('#pass5Help').text("");
				$('#pass4').attr('class','form-control is-valid');
				$('#pass5').attr('class','form-control is-valid');
				$('#pass8').val('t');
			}else {
				$('#pass5').attr('class','form-control is-invalid');
				$('#pass5Help').text('비밀번호가 일치하지 않습니다').css('color','red');
				$('#pass8').val('f');
				
			}
		})
		

																		// 자기소개 이벤트 //
		
		//변경 클릭
		$('.intro1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-primary');
			$('.intro2').css('display','block');
		});
		//수정취소 클릭
		$('.intro6').on('click',function(){
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.intro2').css('display','none');
		});
		
		//수정완료 클릭
		$('.intro7').on('click',function(){
			if($('#intro8').val() == 'f'){
				return;
			}
			var value = $('#intro5').val();
			updateUser(userCode,'introduce',value);
			$(this).parents('div[class="card border-primary"]').removeClass('border-primary');
			$('.intro2').css('display','none');
		});
		
		//자기소개 bytes수 계산 이벤트
		$('#intro5').on('keyup',function(){
			var byteTxt = $(this).val();
			var byteNum = 0;
			if(byteTxt == '') {
				$('#introduceHelp').removeAttr('style');
				$('#intro5').attr('class','form-control');
			}
			for(var i = 0; i < byteTxt.length ; i++) {
				byteNum += ( byteTxt.charCodeAt(i) > 127 ) ? 2 : 1;
			}
			if(byteNum > 1000) {
				$('#intro5').attr('class','form-control is-invalid');
				$('#introduceHelp').text(byteNum+'/1000bytes').css('color','red');
				$('#intro8').val('f');
			}else {
			$('#introduceHelp').text(byteNum+'/1000bytes').css('color','green');
			$('#intro5').attr('class','form-control is-valid');
			$('#intro8').val('t');
			}
		});
		
		
		
		
																			// 프로필 공개여부 이벤트 //
		
		//변경 클릭
		$('.auth1').on('click',function(){
			var auth = $('.auth0').text().trim();
			if(auth == '공개') {
				$(this).html('<i class="fas fa-toggle-off"></i>');
				//$('.auth0').text('비공개');
				updateUser(userCode,'auth','F')
			}else {
				$(this).html('<i class="fas fa-toggle-on"></i>');
				//$('.auth0').text('공개');
				updateUser(userCode,'auth','T')
			}
		});
		
		
			
		
	})
	
	
	
	function updateImg(userCode,form) {
		
		var formData = new FormData(form);
		
		$.ajax({
			url			: '/user/json/updateImg/'+userCode,
			type		: 'POST',
			enctype		: 'multipart/form-data',
			data		: formData,
			dataType	: 'json',
			contentType	: false,
			processData	: false,
			cache		: false,
			timeout		: 600000,
			success		: function(JSONData, status){
				alert(JSONData);
			},
			error		: function(request, status, error){
				console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responseText + '\nERROR : ' + error);
		    }
		});
		
	}
	
	
	
	
	
	
	function updateUser(userCode,target,value) {
		
		
		$.ajax ({
			url : '/user/json/updateUser',
			method : 'post',
			data : JSON.stringify({
				userCode : userCode,
				target : target,
				value : value
				
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				if(JSONData != "") {
					$('.intro0').text(JSONData.introduce);
					if(JSONData.profileAuth == 'T') {
						$('.auth0').text('공개');
					}else {
						$('.auth0').text('비공개');
					}
					$('.nick0').text(JSONData.nickname);
					$('.email0').text(JSONData.email);
					$('.phone0').text(JSONData.phone);
					
				}else {
					alert("세션이 만료되었습니다.")
					self.location("/");
				}
			}
		})
	}
	
	
	
	//인증번호 발송
	function checkNum(check,value) {
		$.ajax({
			url : '/user/json/sendNum',
			method : 'POST',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				position : 'getUser',
				target : check,
				receiver : value
			}),
			success : function(JSONData , status) {
				
				
				//alert(JSONData.target);
				//alert(JSONData.checkNum);
				if(JSONData.target == 'email') {
					$('#email8').val(JSONData.checkNum);
					$('#email5').attr('placeholder','인증번호').removeAttr('readonly');
				}else if(JSONData.target == 'phone') {
					$('#phone8').val(JSONData.checkNum);
					$('#phone5').attr('placeholder','인증번호').removeAttr('readonly');
					
				}else if(JSONData.target == 'error') {
					nodisplay('phoneCheck');
					$('#phoneCheckNum').attr('class','form-control is-invalid');
					$('#phoneHelp').text('유효하지 않은 번호입니다.').css('color','red');
				}
			}
		})
	}
	
	
		
	</script>
</body>
</html>