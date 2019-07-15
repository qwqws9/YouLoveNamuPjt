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
	
	<!-- Select Picker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
	<!-- jQuerty -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	
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
										  <option value="1" >자유 게시판</option>
										  <option value="2" id="selectedCity">도시별 게시판</option>
										  <option value="3" >QnA 게시판</option>
										</select>
									</div>
							  		<div class="col-lg-10 input-group" style="float:left;">
							      		<input type="text" class="form-control" id="title" name="communityTitle" placeholder="제목">
									</div>
					  			</div>
					  			
					  			<br>
					  			
					  			<div class="row">
					  				<div class="col-lg-12">
										<textarea class="form-control" name="communityContent" id="communityContent" rows="10" cols="80" >
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
								  		<input type="text" class="form-control" id="hashtag" name="hashtag" placeholder="#태그를 입력하세요. ex) #파리#에펠탑#abc">
							  		</div>
						  		</div>
						  		
						  		<br>
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<span class="align-middle"><strong style="font-style: inherit;" >Thumbnail</strong></span>
						  			</div>
						  			<div class="col-lg-10 input-group mb-3">
										<div class="custom-file">
										 	<input type="file" accept="image/*" class="custom-file-input" id="Thumbnail" name="Thumbnail" style="color: black;">
											<label class="custom-file-label" for="thumbnail" data-browse="Image" style="color: #ff7d75;"></label>
										</div>
									</div>
						  		</div>
						  		
						  		<div class="row">
						  			<div class="col-lg-2">
						  				<strong style="font-style: inherit;" >공개설정</strong>
						  			</div>
						  			<div class="col-lg-10 text-right">
						  				<input type="checkbox" id="openRange" name="openRange" checked data-toggle="toggle"  data-on="전체" data-off="회원" data-onstyle="light" data-offstyle="light">
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
	CKEDITOR.scriptLoader.load( '/resources/ckeditor/ckeditor.js', function( success ) {
		if(success != true){
    		alert( success );
		}
	} );
	CKEDITOR.replace('communityContent', {
		width: '100%',
		height: 500,
		uiColor: '#ff7d75',
		filebrowserUploadUrl: '/community/fileUpload'
	});
	/* ${pageContext.request.contextPath} */
	
	/* $(".form-control").on("",function(){
	var oldvalue=$(this).val();
	var field=this;
	setTimeout(function () {
	    if(field.value.indexOf('http://') !== 0) {
	        $(field).val(oldvalue);
	    } 
	}, 1);
	}); */
	/* function countBytesNoTrim(o){ // Byte 수를 계수한다
		 var str = o.value;
		 if(str=='') return 0;

		 var bytes = 0;
		 for(var i=0,s=str.length; i<s; i++){
		  var chr = str.charCodeAt(i);
		  if(chr>31 && chr<127) bytes++; // 32~47 과 58~64 특수기호, 48~57 숫자,  65~90 영문 대문자, 91~96 과 123~126 특수문자, 97~122 영문 소문자
		  else if(escape(chr).length>1) bytes += 2; // \n 의 경우 \r\n 으로 DB 에 들어갑니다. 따라서 4Bytes
		  else bytes++;
		 }

		 return bytes;
		} */

	/* function textCheckByte(obj,maxByte){
		var str = obj.value;
		var str_length = str.length;
		var bytes = 0;
		
		var onechar="";
		if(str=='') return 0;
		for(var i=0;i < str_length;i++){
			onechar = str.charAt(i);
			if(onechar <= 0x0007FF){
				console.log("1");
				return 1;
			}else if(onechar <= 0x0007FF){
				console.log("2");
				return 2;
			}else if(onechar <= 0x00FFFF){
				console.log("3");
				return 3;
			}else{
				return 4;
			}
		}
	}
	 */
	$(function(){
		$(".btn.btn-outline-secondary.add").on("click",function(){
			addCommunity();
		});
		$("#cancel").on("click",function(){
			history.go(-1);
		});
		
		//도시
		$("#communityBoard").change(function(){
			var selected = $("#communityBoard option:selected").val();
			if(selected == 2){
				$("#selecCity").show();			
			}else{
				$("#selecCity").hide();
			}
			
		});
		if( document.getElementById("Thumbnail").files.length == 0 ){
		    $("Thumbnail").val("noThumbnail.png");
		}
		
		var str = document.getElementById('hashtag');
		/* (str).on("change keyup paste", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    alert("changed!");
		});
 */
		
		$(str).on("keyup",function(){
			var aa = this;
			var blank_pattern = /[\s]/g;
			if( blank_pattern.test(str.value) == true){
				str.value.slice(0,-1);
			    alert('해시태그에 공백은 사용할 수 없습니다. ');
			    return false;
			};
			//aa.value.text('#');
			//alert(aa.value.indexOf('#'));
		})
	});
	
	
	function addCommunity(){
		var title = $("#title").val();
		var content = $("#content").val();
		var str = document.getElementById('hashtag');
		
		if(title == null || title.length<1){
			alert("제목을 입력해 주세요.");
			return;
		}
		
		$('#openRange').change(function() {
			if($(this).prop('checked') == true){
				$("#openRange").val('1');
			}else{
				$("#openRange").val('2');
			}
	    });
		
		var special_pattern = /[`~!@$%^&*|\\\'\";:\/?]/gi;
		if( special_pattern.test(str.value) == true ){
			alert('특수문자는 사용할 수 없습니다.');
			return false;
		}
		var hash_pattern = /[#]/;
		/* if( hash_pattern.test(str.value) == false){
			alert('#을 입력해주세요.');
			return false;
		} */
		if( hash_pattern.length > 20){
			alert('#해시태그는 20개까지 입력 할 수 있습니다.')
		}
		
		$("form").attr("method","POST").attr("action","/community/addCommunity").submit();
	}	
</script>
</body>
</html>