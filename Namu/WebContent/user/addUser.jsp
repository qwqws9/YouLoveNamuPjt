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

<style type="text/css">

input::placeholder {
  color: black;
  font-weight: bold;
  font-size: 12px;
}
</style>
</head>
<body>
<header><%@ include file="/layout/header.jsp" %></header>
<br><br><br>
	<div class="container">
		<div class="col-lg-12">
			<div class="row  justify-content-center">
				<form enctype="multipart/form-data">
					<div class="col">
		  				<h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
					</div>
					<div class="col">
					<img id="captcha">
					<button type="button" class="btn btn-outline-primary" id="refCaptcha" ><i class="fas fa-sync"></i></button>
					<br>
					<br>
					<div class="row">
						<div class="col-lg-8">
			  			<input type="text" class="form-control" placeholder="캡차값 입력" id="userCaptcha">
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-primary" id="captchaOk">전송</button>
			  			</div>
			  			</div>
					
					<br>
					
					
					
					
					
						<div class="row">
						<div class="col-lg-8">
			  			<input type="text" id="email" name="email"  class="form-control" placeholder="이메일" autofocus>
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-primary" name="emailCheck">인증</button>
			  			</div>
			  			</div>
			  			<br>
			  			<div style="display:none;" id="emailCheckForm" >
			  				<div class="row">
			  			
						<div class="col-lg-4">
			  			<input type="text" id="emailCheckNum" class="form-control" placeholder="전송중" readonly="readonly" >
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-primary" name="saveM">확인</button>
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-danger"  name="emailCheck">재입력</button>
			  			</div>
			  			</div>
			  			<br>
			  			</div>
			  			
			  			
			  			
			  			<div class="row">
						<div class="col-lg-8">
			  			<input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰번호 (-)제외" >
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-primary" name="phoneCheck">인증</button>
			  			</div>
			  			</div>
			  			<small id="phoneHelp" class="form-text">
 							 이메일과 휴대폰번호는 모두 아이디로 사용가능
						</small>
						<br>
						
						<div style="display: none;" id="phoneCheckForm" >
			  				<div class="row">
			  			
						<div class="col-lg-4">
			  			<input type="text" id="phoneCheckNum"  class="form-control" placeholder="전송중" readonly="readonly" >
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-primary" name="saveP">확인</button>
			  			</div>
			  			<div class="col-lg-4">
			  			<button type="button" class="btn btn-outline-danger"  name="phoneCheck">재입력</button>
			  			</div>
			  			</div>
			  			<br>
			  			</div>
			  			
			  			
			  			<input type="password" id="password" name="password"  class="form-control" placeholder="비밀번호" >
			  			<br>
			  			
			  			<input type="password" id="password2" class="form-control" placeholder="비밀번호확인" >
			  			<small id="passwordHelp" class="form-text">
 							 
						</small>
			  			<br>
			  			
			  			<input type="text" id="name" name="name" class="form-control" placeholder="이름" >
			  			<br>
			  			
			  			<img src="http://placehold.it/150" id="preImg" />
			  			<div class="custom-file">
			  				
					   	 	<input type="file" class="custom-file-input" id="profileImg" name="profileImg" aria-describedby="inputGroupFileAddon01">
					   	 	<label class="custom-file-label" for="inputGroupFile01">프로필 사진</label>
					 	</div>
			  			<br>
			  			<br>
			  			<div class="row">
						<div class="col-lg-5">
			  			<input type="text" id="birth" name="birth" class="form-control" placeholder="생년월일" >
			  			</div>
			  			-
			  			<div class="col-lg-1">
			  			<input type="text" id="gender" name="gender" class="form-control" style="height: 38px; width: 35px;">
			  			</div>
			  			
			  			<div class="col-lg-4">
			  			<label for="gender">
			  			<button type="button" class="btn btn-link btn-sm" disabled="disabled">* * * * * *</button>
			  			</label>
			  			</div>
			  			</div>
			  			<small id="passwordHelpBlock" class="form-text text-muted">
 							ex)1992-08-02 → 920802
						</small>
			  			<br>
			  			
			  			<input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임" >
			  			<small id="nicknameHelp" class="form-text">
 							 
						</small>
			  			<br>
			  			
			  			<textarea rows="10" class="form-control" id="introduce" name="introduce" placeholder="자기소개를 자유롭게 작성해주세요"></textarea>
			  			<small id="introduceHelp" class="form-text">
 							 0/1000bytes
						</small>
			  			<br>
			  			프로필공개&nbsp;&nbsp;&nbsp;
			  			<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" id="customRadioInline1" name="profileAuth" value="T" class="custom-control-input">
						  <label class="custom-control-label" for="customRadioInline1">공개</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
						  <input type="radio" id="customRadioInline2" name="profileAuth" value="F" class="custom-control-input">
						  <label class="custom-control-label" for="customRadioInline2">비공개</label>
						</div>
			  			<br>
					</div>
					
					
					
					
					
					
					
		 			
		 			<br>
					<br>
		  				<input type="button"  class="btn btn-lg-6 btn-primary btn-block" id="findInfo" value="프로필 미리보기">
		 			<br>
		 			
		  				<div class="row">
		  			<div class="col-lg-6">
		  				<input type="button"  class="btn btn-primary btn-block" id="signUp" value="회원가입">
		  				</div>
		  				<div class="col-lg-6">
		  				<input type="reset"  class="btn btn-primary btn-block" value="취소">
		  				</div>
		  				</div>
		  				<br><br><br><br><br>
		  				
		  				
		  				<input type="hidden" id= "saveM">
		  				<input type="hidden" id= "saveP">
		  				<input type="hidden" id= "captchaKey">
		  				
				</form>
			</div>
		</div>
	</div>



	<script type="text/javascript">
	
	
	//생년월일 유효성 체크
	function isValidDate(dateStr) {
	     var year = Number(dateStr.substr(0,2)); 
	     var month = Number(dateStr.substr(2,2));
	     var day = Number(dateStr.substr(4,2));
	     var today = new Date(); 
	     var yearNow = today.getFullYear();
	 
	 
	     
	     if (month < 1 || month > 12) { 
	          alert("달은 1월부터 12월까지 입력 가능합니다.");
	          $('#birth').focus();
	          return false;
	     }
	    if (day < 1 || day > 31) {
	          alert("일은 1일부터 31일까지 입력가능합니다.");
	          $('#birth').focus();
	          return false;
	     }
	     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	 $('#birth').focus();
	          alert(month+"월은 31일이 존재하지 않습니다.");
	          return false;
	     }
	     if (month == 2) {
	          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	          if (day>29 || (day==29 && !isleap)) {
	        	  $('#birth').focus();
	               alert(year + "년 2월은  " +day + "일이 없습니다.");
	               return false;
	          }
	     }
	     return true;
	}


	
	//회원가입시 유효성 체크
	function signUp() {
		var captcha = $('#userCaptcha').attr('class');
		var email = $('#email').attr('class');
		var phone = $('#phone').attr('class');
		var password = $('#password').val();
		var password2 = $('#password2').val();
		var name = $('#name').val();
		
		var birth = $('#birth').val();
		var gender = $('#gender').val();
		var introduce = $('#introduce').attr('class');
		var nickname = $('#nickname').attr('class');
		
		
		if(captcha != 'form-control is-valid') {
			$('#userCaptcha').focus();
			alert('캡차값을 확인하세요')
			return;
		}
		
		if(email != 'form-control is-valid') {
			$('#email').focus();
			alert('이메일을 확인하세요')
			return;
		}
		
		if(phone != 'form-control is-valid') {
			$('#phone').focus();
			alert('휴대폰번호를 확인하세요')
			return;
		}
		
		if(password != password2) {
			$('#password').focus();
			alert('비밀번호를 확인하세요')
			return;
		}
		
		if(name.length < 1) {
			$('#name').focus();
			alert('이름을 입력하세요')
			return;
		}
		
		if(gender.length < 1) {
			$('#gender').focus();
			alert('성별을 입력하세요')
			return;
		}
		
		if(nickname != 'form-control is-valid') {
			$('#nickname').focus();
			alert('닉네임을 확인하세요')
			return;
		}
		
		if(introduce == 'form-control is-invalid') {
			$('#introduce').focus();
			alert('자기소개는 1000bytes 이하만 입력가능합니다.')
			return;
		}
		
		
		if(birth.length < 1) {
			$('#birth').focus();
			alert('생년월일을 입력하세요')
			return;
		}else {
			isValidDate(birth);
			return;
		}
	}
	
	
		$(function(){
			
			
			//회원가입
			$('#signUp').on('click',function(){
				signUp();
			});
			
			
				// 네이버 캡차 생성
				$.ajax({
					url : '/user/json/createCaptcha',
					method : 'POST',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						//alert(JSONData.image);
						//alert(JSONData.key);
						$('#captchaKey').val(JSONData.key);
						$('#captcha').attr('src','../resources/images/captcha/'+JSONData.image).attr('width',250);
						//readURL('../resources/images/captcha/'+JSONData.image);
					}
					
				});
				
				
				//캡차 새로고침
			$('#refCaptcha').on('click',function(){
				$.ajax({
					url : '/user/json/createCaptcha',
					method : 'POST',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						//alert(JSONData.image);
						//alert(JSONData.key);
						$('#captchaKey').val(JSONData.key);
						$('#captcha').attr('src','../resources/images/captcha/'+JSONData.image).attr('width',250);
						//readURL('../resources/images/captcha/'+JSONData.image);
					}
					
				});
			});
				
				
				
			// 캡차 키 비교하기
			$('#captchaOk').on('click', function(){
				var cap = $(this).parent().prev().children().val();
				var capkey = $('#captchaKey').val();
				if(cap.length > 0) {
					
					$.ajax({
						url : '/user/json/compareCaptcha',
						method : 'POST',
						data : JSON.stringify({
							key : capkey,
							userKey : cap
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							//alert(JSONData);
							
							if(JSONData == true) {
								$('#captchaOk').attr('disabled',true).text('완료').attr('class','btn btn-outline-success');
								$('#userCaptcha').attr('readonly',true).attr('class','form-control is-valid');
								$('#refCaptcha').attr('disabled',true);
							}else {
								$('#userCaptcha').attr('class','form-control is-invalid');
								$('#userCaptcha').focus();
							}
						}
						
					});
					
				}else {
					$('#userCaptcha').attr('class','form-control is-invalid');
					$('#userCaptcha').focus();
				}
			})
		   
			

		    	
		    
		    $("#profileImg").change(function() {
		        readURL(this);
		    });
		    
		   
			
			$('button:contains("재입력")').on('click',function(){
				nodisplay($(this).attr('name'));
				var name = $(this).attr('name');
				if(name == 'emailCheck' ){
					//alert('aa');
					$('#email').removeAttr('readonly');
					$('#email').parent().next().children().removeAttr('disabled');
				}else {
					$('#phone').removeAttr('readonly');
					$('#phone').parent().next().children().removeAttr('disabled');

				}
			});
			
			//휴대폰번호 숫자만 입력가능
			$("#phone").on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			    
			    
			});
			
			//비밀번호 체크 뷰
			$('#password2').on('keyup',function(){
				var password = $('#password').val();
				var password2 = $('#password2').val();
				
				if(password == password2) {
					$('#passwordHelp').text("");
					$('#password').attr('class','form-control is-valid');
					$('#password2').attr('class','form-control is-valid');
				}else {
					$('#password2').attr('class','form-control is-invalid');
					$('#passwordHelp').text('비밀번호가 일치하지 않습니다').css('color','red');
					
				}
			})
			
			//생년월일 숫자만입력가능
			$("#birth").on("keyup", function() {
				var birth = $(this).val();
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			    if(birth.length >= 6) {
			    	$("#gender").focus();
			    }
			});
			
			//성별 숫자만 입력가능 -> 자바에서 charAt 걸러주기
			$("#gender").on("keyup focusout", function() {
				var gender = $(this).val();
			    $(this).val($(this).val().replace(/[^1-4]/g,""));
			    if(gender.length > 1) {
			    	$(this).val("");
			    	
			    }
			});

			//자기소개 bytes수 계산 이벤트
			$('#introduce').on('keyup',function(){
				var byteTxt = $(this).val();
				var byteNum = 0;
				if(byteTxt == '') {
					$('#introduceHelp').removeAttr('style');
					$('#introduce').attr('class','form-control');
				}
				for(var i = 0; i < byteTxt.length ; i++) {
					byteNum += ( byteTxt.charCodeAt(i) > 127 ) ? 2 : 1;
				}
				if(byteNum > 1000) {
					$('#introduce').attr('class','form-control is-invalid');
					$('#introduceHelp').text(byteNum+'/1000bytes').css('color','red');
				}else {
				$('#introduceHelp').text(byteNum+'/1000bytes').css('color','green');
				$('#introduce').attr('class','form-control is-valid');
				}
			});
			
			
			//인증 버튼 누르면 display block 이벤트
			$('button:contains("인증")').on('click',function(){
				var check = $(this).parent().prev().children().val();
				if(check.length > 0){
					display($(this).attr('name'));
					$(this).parent().prev().children().attr('class','form-control').attr('readonly',true);
					$(this).attr('disabled',true);
					checkNum($(this).parent().prev().children().attr('name'),$(this).parent().prev().children().val());
				}else {
					$(this).parent().prev().children().attr('class','form-control is-invalid');
				}
				
			});
			
			$('button:contains("확인")').on('click',function(){
				compareNum($(this).attr('name'),$(this).parent().prev().children().val());
			})
			
			// 닉네임 중복체크 ajax 통신
			$('#nickname').on('keyup',function(){
				
				
				var len = $(this).val();
					if(len == '' || len.length > 20) {
						$('#nicknameHelp').text('닉네임 1~20글자 사이로 입력해주세요').css('color','red');
						$('#nickname').attr('class','form-control is-invalid');
						return;
					}
				$.ajax({
					url : '/user/json/checkNick/'+$(this).val(),
					method : 'get',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						
						
						if(JSONData == true) {
							$('#nicknameHelp').text('사용가능한 닉네임 입니다').css('color','green');
							$('#nickname').attr('class','form-control is-valid');
						}else {
							$('#nicknameHelp').text('사용중인 닉네임 입니다').css('color','red');
							$('#nickname').attr('class','form-control is-invalid');
						}
						
					}
					
				})
			});
		
			
			
			
			
			
		
		});
		
		//target값 넘겨줘서 어디서 호출되었는지 판단
		function display(target) {
			$('#'+target+'Form').prop('style','display : block');
		}
		function nodisplay(target) {
			$('#'+target+'Form').prop('style','display : none');
		}
		
		
		
		
		//이미지 업로드
		function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                $('#preImg').attr('src', e.target.result).attr("width",150).attr('height',150);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
		
		//인증번호 비교 
		function compareNum(target,value) {
			var com1 = $('#'+target).val();
			if(com1 == value) {
				//alert("일치합니다");
				if(target == 'saveM'){
					nodisplay('emailCheck');
					$('button[name=emailCheck]').text('완료').attr('class','btn btn-outline-success');
				}else {
					nodisplay('phoneCheck');
					$('button[name=phoneCheck]').text('완료').attr('class','btn btn-outline-success');
				}
			}else {
				if(target == 'saveM'){
					$('#emailCheckNum').attr('class','form-control is-invalid');
				}else {
					$('#phoneCheckNum').attr('class','form-control is-invalid');
				}
			}
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
					target : check,
					receiver : value
				}),
				success : function(JSONData , status) {
					
					
					//alert(JSONData.target);
					//alert(JSONData.checkNum);
					if(JSONData.target == 'email') {
						$('#saveM').val(JSONData.checkNum);
						$('#emailCheckNum').attr('placeholder','인증번호').removeAttr('readonly');
					}else if(JSONData.target == 'phone') {
						$('#saveP').val(JSONData.checkNum);
						$('#phoneCheckNum').attr('placeholder','인증번호').removeAttr('readonly');
						$('#phoneHelp').text('이메일과 휴대폰번호는 모두 아이디로 사용가능');
						
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