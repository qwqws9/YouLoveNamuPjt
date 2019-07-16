<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="ko">
<head>
	<meta charset="utf-8">
	<!-- Ckeditor -->
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
  	<script type="text/javascript" src="/resources/javascript/community.js"></script>
	<!-- Select Picker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.5.0/js/bootstrap4-toggle.min.js"></script>
  	
  	<style>
	  body {
            padding-top : 50px;
        }
    </style>
	 
</head>
<body>

<div class="container-fluid">
<div class="row justify-content-center">
	<div class="col-lg-1"></div><!-- 추가예정(Side bar) -->
	<div class="col-lg-10">
			<br>
			<form enctype="multipart/form-data" method="post">
				<div class="row justify-content-center">
					<div class="col-lg-10">
						<div class="card">
					  		<div class="card-body" style="border: 1px solid #ff7d75;">
					  			<div class="row">
									<div class="col-lg-2">
										<select class="selectpicker form-control" id="communityBoard" name="communityBoard">
										<c:if test="${community.communityBoard eq '1' }">
										  <option value="1" selected="selected" >자유 게시판</option>
										  <option value="2" id="selectedCity">도시별 게시판</option>
										  <option value="3" >QnA 게시판</option>
										</c:if>
										<c:if test="${community.communityBoard eq '2' }">
										  <option value="1" >자유 게시판</option>
										  <option value="2" id="selectedCity" selected="selected" >도시별 게시판</option>
										  <option value="3" >QnA 게시판</option>
										</c:if>
										<c:if test="${community.communityBoard eq '3' }">
										  <option value="1" >자유 게시판</option>
										  <option value="2" id="selectedCity">도시별 게시판</option>
										  <option value="3" selected="selected" >QnA 게시판</option>
										</c:if>
										</select>
									</div>
							  		<div class="col-lg-10 input-group" style="float:left;">
							      		<input type="text" class="form-control" id="title" name="communityTitle" placeholder="제목" value="${community.communityTitle }">
									</div>
					  			</div>
					  			
					  			<br>
					  			
					  			<div class="row">
					  				<div class="col-lg-12">
										<textarea class="form-control" name="communityContent" id="communityContent" rows="10" cols="80" >
											${community.communityContent }
										</textarea>
					  				</div>
					  			</div>
						  	</div>
						  	
						  	<div class="card-footer" style="background: rgba(255,125,117,0.2); border: 1px solid #ff7d75;">
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<span class="align-middle"><strong style="font-style: inherit;" >#HashTag</strong></span>
						  			</div>
							  		<div class="col-lg-10 input-group">
								  		<input type="text" class="form-control" id="hashtag" name="hashtag" value="${community.communityHashtag }" placeholder="#태그를 입력하세요. ex) #파리#에펠탑#abc" 
								  				onkeypress="javascript:if(event.keyCode==13 || event.keyCode==32){addHashtag();}"/>
							  		</div>
						  		</div>
						  		
						  		<div class="row">
						  			<div class="col-lg-2"></div>
						  			<div class="col-lg-10">
						  				<div class="alert alert-light" role="alert">
						  					<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 20px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
										    	<span style="font-size: 14px;">#Paris</span>
										    </button>
										</div>
						  			</div>
						  		</div>
						  		
						  		<br>
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<span class="align-middle"><strong style="font-style: inherit;" >Thumbnail</strong></span>
						  			</div>
						  			<div class="col-lg-10 input-group mb-3">
										<div class="custom-file">
										 	<input type="file" accept="image/*" class="custom-file-input" id="Thumbnail" name="Thumbnail" style="color: black;" value="${community.communityThumbnail }">
											<label class="custom-file-label" for="Thumbnail" data-browse="Image" style="color: #ff7d75;"></label>
										</div>
									</div>
						  		</div>
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<strong style="font-style: inherit;" >공개설정</strong>
						  			</div>
						  			<div class="col-lg-10 text-right">
						  				<input type="checkbox" id="openRange" name="openRange" value="off" checked data-toggle="toggle"  data-on="전체" data-off="회원" data-onstyle="light" data-offstyle="light">
						  			</div>
						  		</div>
						  		
						  		<br>
						  		
						  		<div class="row" id="selecCity" style="display: none;">
						  			<div class="col-lg-2">
						  				<strong style="font-style: inherit;" >도시 선택</strong>
						  			</div>
						  			<div class="col-lg-10 text-right">
										<select class="selectpicker" data-live-search="true" title="city" name="city" style="right: 0px;">
											<option value="0" selected="selected" disabled="disabled">검색</option>
										  	<option value="1">파리</option>
										  	<option value="2">구리</option>
										  	<option value="3">보리</option>
										</select>
						  			</div>
						  		</div>
						  		
						  		<br>
						  		
							  	<div class="row">
							  		<div class="col-lg-12 text-right">
							  			<button type="button" class="btn btn-outline-secondary add">등록</button>
							  			<button id="cancel" type="button" class="btn btn-outline-secondary cancel">취소</button>
							  		</div>
							  	</div>
						  	</div>
						</div><!-- end of card -->
						<br>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-1"></div><!-- 추가예정(Side bar) -->
</div><!-- container -->

<script>
	
	$(function(){
		
		$(".btn.btn-outline-secondary.add").on("click",function(){
			addCommunity();
		});
		$("#cancel").on("click",function(){
			history.go(-1);
		});
		
		//Thumbnail text show
		$('#Thumbnail').on('change',function(){
            var fileName = $(this).val();
            $(this).next('.custom-file-label').html(fileName);
        })
		//도시 선택
		$("#communityBoard").change(function(){
			var selected = $("#communityBoard option:selected").val();
			if(selected == 2){$("#selecCity").show();			
			}else{$("#selecCity").hide();}
		});
		//thumbnail 유효성
		if( document.getElementById("Thumbnail").files.length == 0 ){
		    $("Thumbnail").val("noThumbnail.png");
		}
		
		var str = document.getElementById('hashtag');
		var special_pattern = /[`~!@$%^&*|\\\'\";:\/?]/gi;
		if( special_pattern.test(str.value) == true ){
			alert('특수문자는 사용할 수 없습니다.');
			return false;
		}
		
		/* (str).on("change keyup paste", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    alert("changed!");
		}); */		
		
		
 
 		//Hashtag space 유효성 검사
		/*$(str).on("keyup",function(){
			var aa = this;
			var blank_pattern = /[\s]/g;
			if( blank_pattern.test(str.value) == true){
				str.value.slice(0,-1);
			    alert('해시태그에 공백은 사용할 수 없습니다. ');
			    return false;
			};
			//aa.value.text('#');
			//alert(aa.value.indexOf('#'));
		}) */
		
	});
	function remove(){
		$(".btn.btn-outline-dark").on("click",function(){
			$(this).remove();
		})
	}
	
	function addHashtag(){
		var Hashtag = $("#hashtag").val();
		
		
		if(Hashtag){
			$(".alert.alert-light").append(
				'<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 20px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">'
			    	+'<span style="font-size: 14px;">#'+Hashtag+'</span>'
			    +'</button>&nbsp;'
			)
			$("#hashtag").val('');
		}else{
			alert("값을 입력하세요.");
			
		}
 		//$('#hashtag').val('원하는 값');		
		console.log(Hashtag);
	}
	
	
	
</script>
</body>
</html>