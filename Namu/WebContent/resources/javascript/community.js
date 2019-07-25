$(function(){
	CKEDITOR.scriptLoader.load( '/resources/ckeditor/ckeditor.js', function( success ) {
		if(success != true){
    		alert( success );
		}
	} );
	CKEDITOR.replace('communityContent', {
		width: '100%',
		height: 500,
		uiColor: '#282c37',
		filebrowserUploadUrl: '/community/fileUpload'
	});
	//등록
	$(".btn.btn-outline-secondary.add").on("click",function(){
		addCommunity();
	});
	//취소
	$("#cancel").on("click",function(){
		history.go(-1);
	});
	//Thumbnail text show
	$('#Thumbnail').on('change',function(){
        var fileName = $(this).val();
        $(this).next('.custom-file-label').html(fileName);
    });
	//Default Thumbnail
	if( document.getElementById("Thumbnail").files.length == 0 ){
	    $("Thumbnail").val("noThumbnail.png");
	}
	//특수문자 유효성검사
	//Space 유효성검사
	var str = document.getElementById('hashtag');
	$(str).on("keyup",function(){
		var special_pattern = /[`,~#!@$%^&*|\\\'\";:\/?]/gi;
		if( special_pattern.test(str.value) == true ){
			$(this).val($(this).val().replace(special_pattern,""));
			alert('특수문자는 사용할 수 없습니다.');
			return false;
		}
		var blank_pattern = /[\s]/g;
		if( blank_pattern.test( str.value) == true){
			$(this).val($(this).val().replace(blank_pattern,""));
		    alert(' 공백은 사용할 수 없습니다. ');
		    return false;
		}

	});
	//도시선택
	$("#communityBoard").change(function(){
		var selected = $("#communityBoard option:selected").val();
		if(selected == 2){
			$("#selecCity").show();			
		}else{
			$("#selecCity").hide();
		}
	});
	//도시
    $("#communityBoard").change(function(){
		var selected = $("#communityBoard option:selected").val();
		if(selected == 2){
			$("#selectCountry").show();
			$.ajax({
				url : "/guide/json/getCityList/country",
			    method : "POST",
			    dataType : "json",
			    headers : {
	     			 "Accept" : "application/json",
	                 "Content-Type" : "application/json"
	     		},
	     		success : function(JSONData, status){
	     			$.each(JSONData,function(index,item){
	     				$("#country").append('<option value="'+item.cityName+'">'+item.countryName+'</option>');
	     			});
	     		},
	     		error:function(jqXHR, textStatus, errorThrown){
	    			alert( textStatus );
	    			alert( errorThrown );
	    		}
			});
			var selectCountryBofore;
			$("#selectCountry").on("click", function(){
				selectCountryBofore = $("option:selected", this).text();
			}).change(function(){
				var selectCountryAfter = $("#selectCountry option:selected").text();
				$("#selectCity").show();
					
				if(selectCountryBofore != selectCountryAfter){
					$("#city").empty();
					$.ajax({
						url : "/guide/json/getCityList/"+selectCountryAfter,
					    method : "POST",
					    dataType : "json",
					    headers : {
			     			 "Accept" : "application/json",
			                 "Content-Type" : "application/json"
			     		},
			     		success : function(JSONData, status){
			     			$.each(JSONData,function(index,item){
			     				$("#city").append('<option value="'+item.cityName+'">'+item.cityName+'</option>');
			     			});
			     		},
			     		error:function(jqXHR, textStatus, errorThrown){
			    			alert( textStatus );
			    			alert( errorThrown );
			    		}
					});
				}
			});
		}else{
			$("#selectCity").hide();
		}
		 
	});//end of city
	
	/*$('#openRange').change(function() {
		if($(this).prop('checked') == true){
			//여기가 전체
			alert("전체"+$("#openRange").val())
		}else{
			//여기가 회원
			alert("회원"+$("#openRange").val());
		}
	});*/
	
	
}); //end of Ready

//Hasgtag
function remove(){
	$(".btn.btn-outline-dark").on("click",function(){
		$(this).remove();
	})
}

function addHashtag(){
	var Hashtag = $("#hashtag").val();
	var count = $(".btn.btn-outline-dark").length;
	if(Hashtag && count < 20){
		$(".alert.alert-light").append(
			'<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">'
		    	+'<span style="font-size: 14px;">#'+Hashtag+'</span>'
		    +'</button>'
		)
		$("#hashtag").val('');
	}else if(count => 20){
		alert("해시태그는 20개까지 지원합니다.")
	}else{
		alert("값을 입력하세요.");
	}
	//openRange 유효성체크
	$('#openRange').change(function() {
		if($(this).prop('checked') == true){ $("#openRange").val('1');
		}else if('#openRange' == null){ $("#openRange").val('1');
		}else{ $("#openRange").val('2') }
	});

	
	console.log($(".btn.btn-outline-dark").text().trim());
}


//addCommunity ,updateCommunity
function addCommunity(){
		var title = $("#title").val();
		//제목 유효성 검사
		if(title == null || title.length<1){
			alert("제목을 입력해 주세요.");
			return;
		}
		var selected = $("#communityBoard option:selected").val();
		if(selected == 2){
			if($("#city option:selected").val() == null){
				alert("도시를 선택해 주세요.")
				return;
			}
		}
		//해시태그 데이터 전송
		var Hashtag = $(".btn.btn-outline-dark").text().trim();
		$("#hashtag").val(Hashtag);
		
		var Role = $("#update").val();
		if(Role == "update"){
			$($("form")[1]).attr("method","POST").attr("action","/community/updateCommunity").attr("enctype" , "multipart/form-data").submit();
		}else{
			/*$("form").on( "submit", function( event ) {
				  event.preventDefault();
				  alert( $( "form" ).serialize() );
			});*/
			$($("form")[1]).attr("method","POST").attr("action","/community/addCommunity").attr("enctype" , "multipart/form-data").submit();
		}
	}	


