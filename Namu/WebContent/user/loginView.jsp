<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta name="google-signin-client_id" content="371095294403-ifvgid5e6b278eno25rqieqn32j5iu74.apps.googleusercontent.com">
<!-- <title>Insert title here</title> -->
<jsp:include page="/layout/head.jsp" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css" >
<script src="/resources/javascript/getProfile.js"></script>
 <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
 <script src="/resources/javascript/googleLogin.js"></script>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 <script src="/resources/javascript/kakaoLogin.js"></script>
 
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
</head>

<header><%@ include file="/layout/header.jsp" %></header>
<body>
<br><br><br>
	<div class="container">
		<div class="col-md-6 col-lg-12">
			<div class="row  justify-content-center text-center">
				<form >
					<div class="col">
		  				<h1 class="h3 mb-3 font-weight-normal">You Love</h1>
					</div>
					<div class="col">
			  			<input type="text" id="userId" name="userId"  class="form-control" placeholder="Email Address & Phone Number" style="width: 400px;" autofocus value="${saveId }">
			  			<br>
			  			<input type="password" id="password" name="password" class="form-control" placeholder="Password" >
			  			<br>
			  			<div id="errorMessage" style="font-size: 12px; color: red"></div>
			  			<br>
					</div>
		 			 <div class="checkbox">
		  				<label>
		     			 	<input type="checkbox" name="saveId" id="saveId"> 아이디 저장
		      			</label>
		      			&nbsp;&nbsp;&nbsp;
		     			 <label>
		      				<input type="checkbox" name="autoLogin" id="autoLogin"> 자동 로그인
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
		  				<input type="button"  class="btn btn-lg-6 btn-danger btn-block" id="googleLogin" value="구글 로그인">
		  				<input type="button"  class="btn btn-lg-6 btn-warning btn-block" id="kakaoLogin" value="카카오톡 로그인">
<!-- 		  				<button  class="btn btn-lg-6"><img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" /></button> -->
<!-- 		  				<button class="btn btn-lg-6"><img src="/resources/images/profile/googleLogin.png" /></button> -->
				</form>
			</div>
		</div>
	</div>
	
	
<%-- 	 <jsp:include page="../comment/getComment.jsp" > --%>
<%--       	<jsp:param value="${boardCode}" name="boardCode"/> --%>
<%--       	<jsp:param value="${detailCode}" name="detailCode"/> --%>
<%--       </jsp:include> --%>
		
<script type="text/javascript">
	$(function(){
		
		$(document).on('click','#kakaoLogin',function(){
			loginWithKakao();
		})
		
		$('#findInfo').on('click',function(){
			var url = '/user/findInfo';
			var name = "_blank";
			var option = "width = 500,height = 600,marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no,location = no"
			window.open(url,name,option);
		});
	
	
		$('#signUp').on('click',function(){
			self.location = '/user/addUser';
		})
		
		$("#userId").on('keyup',function(){
			$('#userId').attr('class','form-control');
		})
		
		$("#password").on('keyup',function(key){
			$('#password').attr('class','form-control');
			if(key.keyCode == 13) {
				loginClick();
			}
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
			loginClick();
			
		}); // end login event
		
	});
	
	function login() {
		$($('form')[1]).attr('method','post').attr('action','/user/login').submit();
	}
	
	function loginClick() {
		
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
					//self.location = '/';
					//alert(JSONData.userCode);
					if(JSONData.endBlock != null) {
						//alert(JSONData.startBlock+" ~ " + JSONData.endBlock+ " 까지 제한된 회원입니다.")
						swal({
							title : '정지 회원',
							text : JSONData.startBlock+" ~ " + JSONData.endBlock,
							icon : 'error'
						})
					}else {
						login();
					}
					
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
	}
</script>

</body>
</html>