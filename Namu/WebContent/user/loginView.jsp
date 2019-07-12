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

<body class="text-center">
<header><%@ include file="/layout/header.jsp" %></header>
<br><br><br>
	<div class="container">
		<div class="col-lg-12">
			<div class="row  justify-content-center">
				<form >
					<div class="col">
		  				<h1 class="h3 mb-3 font-weight-normal">You Love</h1>
					</div>
					<div class="col">
			  			<input type="text" id="userId"  class="form-control" placeholder="Email Address & Phone Number" style="width: 400px;" autofocus>
			  			<br>
			  			<input type="password" id="password" class="form-control" placeholder="Password" >
			  			<br>
			  			<div id="errorMessage" style="font-size: 12px; color: red"></div>
			  			<br>
					</div>
		 			 <div class="checkbox">
		  				<label>
		     			 	<input type="checkbox" id="saveId"> 아이디 저장
		      			</label>
		      			&nbsp;&nbsp;&nbsp;
		     			 <label>
		      				<input type="checkbox" id="autoLogin"> 자동 로그인
		      			</label>
		  			</div>
		  				<div class="row">
		  			<div class="col-lg-6">
		  				<input type="button"  class="btn btn-primary btn-block" id="login" value="로그인">
		  				</div>
		  				<div class="col-lg-6">
		  				<input type="button"  class="btn btn-primary btn-block" id="signUp" value="회원가입">
		  				</div>
		  				</div>
		  				<br>
		  				<input type="button"  class="btn btn-lg-6 btn-primary btn-block" id="findInfo" value="아이디/비밀번호찾기">
		  				
				</form>
			</div>
		</div>
	</div>
		
		
		<script type="text/javascript">
$(function(){
	
	$('#signUp').on('click',function(){
		self.location = '/user/addUser';
	})
	
	$("#userId").on('keyup',function(){
		$('#userId').attr('class','form-control');
	})
	
	$("#password").on('keyup',function(){
		$('#password').attr('class','form-control');
	})
	
	$("#autoLogin").on('click',function(){
		//alert($('#autoLogin').is(':checked'));
		if($('#autoLogin').is(':checked')) {
			$("#saveId").prop('disabled',true).prop('checked',true)
		}else {
			$("#saveId").prop('disabled',false).prop('checked',false)
		}
		
	})
	
	
	$('#login').on('click',function(){
		//alert('클릭');
		$('#errorMessage').text();
		
		var id = $('#userId').val();
		var pw = $('#password').val();
		
		if(id == null || id.length <1) {
			$('#errorMessage').text('아이디를 입력해주세요');
			$('#userId').attr('class','form-control is-invalid');
			$("#userId").focus();
			return false;
		}
		
		if(pw == null || pw.length <1) {
			$('#errorMessage').text('비밀번호를 입력해주세요');
			$('#password').attr('class','form-control is-invalid');
			$("#password").focus();
			return false;
		}
		
		$.ajax({
			url : "/user/json/login",
			method : "POST" ,
			//dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : id,
				password : pw
			}),
			success : function(JSONData , status) {
				//alert(status);
				//alert(JSONData);
				if(JSONData != "") {
					//alert("정보가있음");
					alert(JSONData.email);
				}else {
					//alert("정보가없음");
					$('#errorMessage').text('아이디 또는 비밀번호를 확인해주세요');
					$('#password').attr('class','form-control is-invalid');
					$('#userId').attr('class','form-control is-invalid');
				}
			}
			,
			error:function( jqXHR, textStatus, errorThrown){
				alert(textStatus);
				alert(errorThrown);
			}
		}) // end ajax 
	}); // end login event
	
});
</script>

</body>
</html>