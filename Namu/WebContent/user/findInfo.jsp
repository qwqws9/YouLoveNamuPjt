<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<jsp:include page="/layout/head.jsp" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>



</head>
<body>
<br>
			<div class="container">
		<div class="col-lg-12">
			<div class="row  justify-content-center">
				
					<div class="col" style="margin-left: 20px;">
		  				<div class="btn-group btn-group-toggle" data-toggle="buttons" >
		  				
			  <label class="status btn btn-outline-primary active">
			  	<input type="radio" name="options" id="option1" autocomplete="off" checked> 아이디 찾기
			  </label>
			  <label class="status btn btn-outline-primary">
			    <input type="radio" name="options" id="option2" autocomplete="off"> 비밀번호 찾기
			  </label>
			</div>
					</div>
					
					
					<form>
					<br>
					<div class="idFind" style="display: block">
			  			<input type="text" id="userId"  class="form-control" placeholder="이름" style="width: 400px;" autofocus>
			  			<br>
			  			<input type="text" id="phone" class="form-control" placeholder="휴대폰 번호" >
			  			<br>
			  			<small id="compareHelp" class="form-text"></small>
			  			<br>
			  			<input type="button"  class="btn btn-primary btn-block" id="idFind" value="인증번호 전송">
			  			<br>
			  			<div class="CheckId" style="display: none">
			  				<input type="text" id="numInput" class="form-control" placeholder="인증번호 입력" >
			  				<small id="checkHelp" class="form-text"></small>
			  				<input type="button"  class="btn btn-primary btn-block" id="checkNum" value="전송중">
			  				<small id="okId" class="form-text"></small>
			  			</div>
			  		</div>
			  		
			  		<div class="pwFind" style="display: none">
			  			<small class="form-text">비밀번호 찾기시 임시 비밀번호가 발급됩니다</small>
			  			<input type="text" id="userId2"  class="form-control" placeholder="이름" style="width: 400px;" autofocus>
			  			<br>
			  			<label>
			  			<input type="radio" name="choice" checked>회원정보에 등록한 휴대전화로 인증
			  			</label>
			  			<br>
			  			<label>
			  			<input type="radio" name="choice">회원정보에 등록한 이메일주소로 인증
			  			</label>
			  			<div class="choice1" style="display: block">
			  			<input type="text" id="phone2" class="form-control" placeholder="휴대폰 번호" >
			  			</div>
			  			<div class="choice2" style="display: none">
			  			<input type="text" id="email2" class="form-control" placeholder="이메일 주소" >
			  			</div>
			  			<small id="pwHelp" class="form-text"></small>
			  			<br>
			  			<br>
			  			<input type="button"  class="btn btn-primary btn-block" id="pwFind" value="인증번호 전송">
			  			<br>
			  			<div class="CheckId2" style="display: none">
			  				<input type="text" id="numInput2" class="form-control" placeholder="인증번호 입력">
			  				<small id="checkHelp" class="form-text"></small>
			  				<input type="button"  class="btn btn-primary btn-block" id="checkNum2" value="전송중">
			  				<small id="okPw" class="form-text"></small>
			  			</div>
			  		</div>
			  		<input type="hidden" id="compareCheck">		
				</form>
					</div>
		  				
			</div>
		</div>
		
			
			
			
			
			
			


<script type="text/javascript">
	$(function(){
		
		$("#phone").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$("#phone2").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		
		$('#checkNum').on('click',function(){
			var num = $(this).parent().children().val();
			var num2 = $('#compareCheck').val();
			if( num == num2) {
				compareNum('id',$('#userId').val().trim(),$('#phone').val().trim(),'')
			}else {
				$('#numInput').attr('class','form-control is-invalid');
			}
		})
		
		$('#checkNum2').on('click',function(){
			var num = $(this).parent().children().val();
			var num2 = $('#compareCheck').val();
			if( num == num2) {
				$('#checkNum2').attr('disabled',true);
				compareNum('pw',$('#userId2').val().trim(),$('#phone2').val().trim(),$('#email2').val().trim())
			}else {
				$('#numInput2').attr('class','form-control is-invalid');
			}
		})
		
		
		
		$('.status').on('click',function(){
			//console.log($(this).text().trim());
			if($(this).text().trim() == '아이디 찾기') {
				//alert('아이디 찾기');
				$('.idFind').show();
				$('.pwFind').hide();
				$('#checkNum').val('전송중');
				$('#checkNum2').val('전송중');
				$('form')[0].reset();
			}else {
				//alert('비밀번호 찾기');
				$('.pwFind').show();
				$('.idFind').hide();
				$('#checkNum').val('전송중');
				$('#checkNum2').val('전송중');
				$('form')[0].reset();
			}
		})
		
		$('#idFind').on('click',function(){
			
			
			$.ajax({
				url : '/user/json/findInfoCheck',
				method : 'post',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify ({
					name : $('#userId').val().trim(),
					phone : $('#phone').val().trim()
				}),
				success : function(JSONData , status) {
					if(JSONData == true) {
						$('.CheckId').show();
						$('#idFind').attr('disabled',true);
						$('#phone').attr('readonly',true);
						$('#userId').attr('readonly',true);
						$('#compareHelp').text("");
						sendNum('phone',$('#phone').val().trim())
					}else {
						$('#compareHelp').text('일치하는 회원정보가 없습니다.').css('color','red')
					}
				}
			})
			
		});
		
		$('#pwFind').on('click',function(){
			
			
			$.ajax({
				url : '/user/json/findInfoCheck',
				method : 'post',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify ({
					name : $('#userId2').val().trim(),
					phone : $('#phone2').val().trim(),
					email : $('#email2').val().trim()
				}),
				success : function(JSONData , status) {
					if(JSONData == true) {
						$('.CheckId2').show();
						$('#pwFind').attr('disabled',true);
						$('#phone2').attr('readonly',true);
						$('#email2').attr('readonly',true);
						$('#userId2').attr('readonly',true);
						$('input[name="choice"]').attr('disabled',true);
						$('#pwHelp').text('');
						if($('#phone2').val().trim() != '') {
							sendNum('phone',$('#phone2').val().trim());
						}else {
							sendNum('email',$('#email2').val().trim());
						}
					}else {
						$('#pwHelp').text('일치하는 회원정보가 없습니다.').css('color','red')
					}
				}
			})
		})
		
		$('input[name="choice"]').on('click',function(){
			if( $(this).parent().text().indexOf('휴대전화') != -1 ) {
				$('.choice1').show();
				$('.choice2').hide();
			}else {
				$('.choice2').show();
				$('.choice1').hide();
				
			}
		})
		
	});
	
	function sendNum(check,value) {
		
	
	$.ajax({
		url : '/user/json/sendNum',
		method : 'POST',
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			position : 'findInfo',
			target : check,
			receiver : value
		}),
		success : function(JSONData , status) {
			
			
			//alert(JSONData.target);
			//alert(JSONData.checkNum);
			if(JSONData.target == 'email') {
				$('#compareCheck').val(JSONData.checkNum);
				$('#checkNum').val('확인')
				$('#checkNum2').val('확인')
			}else if(JSONData.target == 'phone') {
				$('#compareCheck').val(JSONData.checkNum);
				$('#checkNum').val('확인')
				$('#checkNum2').val('확인')
				
			}else if(JSONData.target == 'error') {
				nodisplay('phoneCheck');
				$('#phoneCheckNum').attr('class','form-control is-invalid');
				$('#phoneHelp').text('유효하지 않은 번호입니다.').css('color','red');
			}
		}
	})
	}
	
	function compareNum(target,name,phone,email) {
		console.log(target);
		console.log(name);
		console.log(phone);
		console.log(email);
		
		$.ajax({
			url : '/user/json/findInfo',
			method : 'post',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify ({
				target : target,
				name : name,
				phone : phone,
				email : email
			}),
			success : function(JSONData , status) {
				//alert(JSONData.email);
				if(JSONData.password == '') {
					$('#okId').text(JSONData.name + ' 님의 아이디는 ' + JSONData.email + ' 입니다.');
				}else {
					$('#okPw').text(JSONData.name + ' 님의 임시비밀번호는 ' + JSONData.password + '입니다.');
				}
			}
		})
	}
	
</script>

</body>
</html>