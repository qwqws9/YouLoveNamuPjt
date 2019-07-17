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
<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
</head>
<body>
<header><jsp:include page="/layout/header.jsp" /></header>
<br><br><br>
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
	    <p class="card-text">용용</p>
	     </div>
        </div>
        
        <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">생년월일</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">920802</p>
	     </div>
        </div>
        
        <div class="row">
	        <div class="col-sm-4">
	    <h5 class="card-title">성별</h5>
	     </div>
	        <div class="col-sm-2">
	    <p class="card-text">남자</p>
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
    <div class="col-md-4">
      <img src="/resources/images/dog.JPG" class="card-img" alt="..." width="500" height="232">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">프로필 사진</h5>
        <p class="card-text">여기는 뭐라고 쓸까 비어있으면 허전할것같은데,..,...,.,.,.,.</p>
        <span>
		        <button type="button" class="email6 btn btn-outline-danger btn-sm" >사진삭제</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="email7 btn btn-outline-success btn-sm" id="captchaOk">사진변경</button>
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
    <div class="card bg-light">
      <div class="card-body">
        <h5 class="card-title">이메일 주소</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="email0 card-text" style="margin-top: 5px">qwqws9@naver.com</p>
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
		        <button type="button" class="email7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="email8" value="qwej123jw">
  
  
  
  
<div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">휴대폰 번호</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="phone0 card-text" style="margin-top: 5px">01090720802</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="phone1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="phone2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 이메일" id="phone3">
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
		        <button type="button" class="phone7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="phone8" value="qwej123jw">  
  
  
</div> <!-- end row -->
<hr>

<div class="row">
  <div class="col-sm-6">
    <div class="card border-secondary">
      <div class="card-body text-secondary">
        <h5 class="card-title">닉네임</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="nick0 card-text" style="margin-top: 5px">요로로용용</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="nick1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="nick2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 닉네임" id="nick3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="nick4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="nick5">
	        <br>
	        <span>
		        <button type="button" class="nick6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="nick7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="nick8" value="qwej123jw">
  
  
  
  
<div class="col-sm-6">
    <div class="card bg-light">
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
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 이메일" id="pass3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="pass4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="pass5">
	        <br>
	        <span>
		        <button type="button" class="pass6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="pass7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="pass8" value="qwej123jw">  
  
  
</div> <!-- end row -->
<hr>






<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">자기소개</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="intro0 card-text" style="margin-top: 5px">안녕요요몽안녕요요몽안녕요요몽안녕요요몽안녕요요몽안녕요요몽안녕요요몽</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="intro1 btn btn-light" style="border:none; background: none"><i class="far fa-edit"></i></button>
	        </div>
        </div>
        <div class="intro2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 닉네임" id="intro3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="intro4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="intro5">
	        <br>
	        <span>
		        <button type="button" class="intro6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="intro7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="intro8" value="qwej123jw">
  
  
  
  
<div class="col-sm-6">
    <div class="card bg-light">
      <div class="card-body">
        <h5 class="card-title">프로필 공개여부</h5>
        <div class="row">
	        <div class="col-sm-4">
	        	<p class="auth0 card-text" style="margin-top: 5px">공개</p>
	        </div>
	        <div class="col-sm-2">
	        	<button type="button" class="auth1 btn btn-light" style="border:none; background: none"><i class="fas fa-toggle-on"></i></button>
	        </div>
        </div>
        <div class="auth2" style="display: none">
        	<br>
	        <div class="row" >
		        <div class="col">
			        <input type="text" class="form-control" placeholder="변경할 이메일" id="auth3">
		        </div>
		        <div class="col">
			        <button type="button" class="btn btn-outline-primary" id="auth4">인증</button>
		        </div>
	        </div>
	        <br>
	        <input type="text" class="form-control" placeholder="인증번호"  readonly style="width:200px" id="auth5">
	        <br>
	        <span>
		        <button type="button" class="auth6 btn btn-outline-danger btn-sm" >수정취소</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		        <button type="button" class="auth7 btn btn-outline-success btn-sm" id="captchaOk">수정완료</button>
	        </span>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="auth8" value="qwej123jw">  
  
  
</div> <!-- end row -->
<hr>
<br><br><br><br><br><br><br><br><br>
</div>
	<script type="text/javascript">
	$(function(){
		
																	// 이메일 이벤트 //
		
		//변경 클릭
		$('.email1').on('click',function(){
			$('.email2').css('display','block');
		});
		//수정취소 클릭
		$('.email6').on('click',function(){
			$('.email2').css('display','none');
		});
		//인증 클릭
		$('#email4').on('click',function(){
			//ajax 전송완료시
			$('#email5').removeAttr('readonly');
			$('#email8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.email7').on('click',function(){
			var check = $('#email8').val().trim();
			var check2 = $('#email5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.email0').text('변경된 값으로 입력되어야함');
				$('.email2').css('display','none');
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
			//ajax 전송완료시
			$('#phone5').removeAttr('readonly');
			$('#phone8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.phone7').on('click',function(){
			var check = $('#phone8').val().trim();
			var check2 = $('#phone5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.phone0').text('변경된 값으로 입력되어야함');
				$('.phone2').css('display','none');
			}else {
				alert("인증번호 다름");
				$('#phone5').focus();
			}
		});
		
		
																	// 닉네임 이벤트 //
		
		//변경 클릭
		$('.nick1').on('click',function(){
			$('.nick2').css('display','block');
		});
		//수정취소 클릭
		$('.nick6').on('click',function(){
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
			var check = $('#nick8').val().trim();
			var check2 = $('#nick5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.nick0').text('변경된 값으로 입력되어야함');
				$('.nick2').css('display','none');
			}else {
				alert("인증번호 다름");
				$('#nick5').focus();
			}
		});
		
		

																// 비밀번호 이벤트 //
		
		//변경 클릭
		$('.pass1').on('click',function(){
			$('.pass2').css('display','block');
		});
		//수정취소 클릭
		$('.pass6').on('click',function(){
			$('.pass2').css('display','none');
		});
		//인증 클릭
		$('#pass4').on('click',function(){
			//ajax 전송완료시
			$('#pass5').removeAttr('readonly');
			$('#pass8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.pass7').on('click',function(){
			var check = $('#pass8').val().trim();
			var check2 = $('#pass5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.pass0').text('변경된 값으로 입력되어야함');
				$('.pass2').css('display','none');
			}else {
				alert("인증번호 다름");
				$('#pass5').focus();
			}
		});
		

																		// 자기소개 이벤트 //
		
		//변경 클릭
		$('.intro1').on('click',function(){
			$(this).parents('div[class="card"]').addClass('border-success');
			$('.intro2').css('display','block');
		});
		//수정취소 클릭
		$('.intro6').on('click',function(){
			$(this).parents('div[class="card border-success"]').removeClass('border-success');
			$('.intro2').css('display','none');
		});
		//인증 클릭
		$('#intro4').on('click',function(){
			//ajax 전송완료시
			$('#intro5').removeAttr('readonly');
			$('#intro8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.intro7').on('click',function(){
			var check = $('#intro8').val().trim();
			var check2 = $('#intro5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.intro0').text('변경된 값으로 입력되어야함');
				$('.intro2').css('display','none');
			}else {
				alert("인증번호 다름");
				$('#intro5').focus();
			}
		});		
		
		
																			// 프로필 공개여부 이벤트 //
		
		//변경 클릭
		$('.auth1').on('click',function(){
			var auth = $('.auth0').text().trim();
			if(auth == '공개') {
				$(this).html('<i class="fas fa-toggle-off"></i>');
				$('.auth0').text('비공개');
			}else {
				$(this).html('<i class="fas fa-toggle-on"></i>');
				$('.auth0').text('공개');
			}
			
			
			//$('.auth2').css('display','block');
		});
		//수정취소 클릭
		$('.auth6').on('click',function(){
			$('.auth2').css('display','none');
		});
		//인증 클릭
		$('#auth4').on('click',function(){
			//ajax 전송완료시
			$('#auth5').removeAttr('readonly');
			$('#auth8').val("인증번호 넣어주기");
		
		});
		
		
		//수정완료 클릭 ( ~7 hidden 인증번호 비교 )
		$('.auth7').on('click',function(){
			var check = $('#auth8').val().trim();
			var check2 = $('#auth5').val().trim();
			if(check == check2) {
				alert("인증번호 같음");
				$('.auth0').text('변경된 값으로 입력되어야함');
				$('.auth2').css('display','none');
			}else {
				alert("인증번호 다름");
				$('#auth5').focus();
			}
		});	
			
		
	})
		
	</script>
</body>
</html>