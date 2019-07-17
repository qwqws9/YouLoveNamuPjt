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
	//도시선택
	$("#communityBoard").change(function(){
		var selected = $("#communityBoard option:selected").val();
		if(selected == 2){
			$("#selecCity").show();			
		}else{
			$("#selecCity").hide();
		}
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
	
	/*$('#openRange').change(function() {
		if($(this).prop('checked') == true){
			//여기가 전체
			alert("off"+$("#openRange").val())
		}else{
			//여기가 회원
			alert("on"+$("#openRange").val());
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
			if($("#selecCity option:selected").val() == 0){
				alert("도시를 선택해 주세요.")
				return;
			}
		}
		//해시태그 데이터 전송
		var Hashtag = $(".btn.btn-outline-dark").text().trim();
		$("#hashtag").val(Hashtag);
		
		var Role = $("#update").val();
		if(Role == "update"){
			$("form").attr("method","POST").attr("action","/community/updateCommunity").submit();
		}else{
			$("form").attr("method","POST").attr("action","/community/addCommunity").submit();
		}
	}	


//getCommunityList
//무한 스크롤
function callCommunityList(page){
		    	var communityBoard = document.location.href.split("=")[1];
				
		    	if(communityBoard === undefined || communityBoard === null){
		    		communityBoard = 0;
		    	}
		    	console.log(communityBoard);
		    	//console.log("scrollHeight"+$(document).height());
		    	//console.log("scrollPosition"+$(window).height() + $(window).scrollTop())
	      		//$(".col-10.col-md-10.append").append('<div class="big-box"><h1>Page ' + page + '</h1></div><hr>');
	      		$.ajax({
	      			url : "/community/json/getCommunityList/"+communityBoard,
	      			method : "POST",
	      			data : JSON.stringify({
	      				"currentPage" : page,
	      				"pageSize" : "3"
	      			}),
	      			dataType : "json",
	      			headers : {
	      				 "Accept" : "application/json",
	                     "Content-Type" : "application/json"
	      			},
	      			success : function(JSONData , status){
	      				//var list = new Array();
	      				$.each(JSONData.list,function(index,item){
	      					var appendBoard = '';
	      					var appendCity = '';
	      					var communityBoard =  item.communityBoard;
	      					var content = $(item.communityContent).text($(item.communityContent).text().trim());
	      					if(communityBoard == 1){
	      						appendBoard = '자유게시판';
	      					}else if(communityBoard == 2){
	      						appendBoard = '도시별 게시판';
	      					}else if(communityBoard == 3){
	      						appendBoard = 'QnA 게시판';
	      					}
	      					if(communityBoard == 2){
	      						appendCity = '<p class="text-center"style="font-size: x-small; color: #344157;">['+item.city+']</p>';
	      					}
	      					$(".col-10.col-md-10.append").append( '<div class="row list"><div class="col-2 col-md-2" style="top: 30px;">'
	      														+'<p class="text-center" style="font-size: small; color: #344157;">'
	      														+'No.<span class="communityCode">'+item.communityCode+'</span>'
	      														+'</p>'
	      														+'<p class="text-center communityBoard" style="font-size: small; color: #344157;">'
	      														+ appendBoard
																+'</p>'
																+ appendCity
																+'</div>'
																+'<div class="col-7 col-md-7">'
																+'<div class="row" id="profile-box" style="position: relative;">'
																+'<div id="profile-image">'
																+'<a href="#"><img src="/resources/images/dog.JPG" id="userImage" name="userImage" alt="글쓴이" class="rounded-circle" width="45px" height="45px"></a>'
																+'</div>'
																+'<div id="profile-nickname" style="position: absolute; top: 8px; left: 52px;">'
																+'<div style="font-size: small; color: #3c64a6;">글쓴이</div>'
																+'<div style="font-size: small; color: #344157;">'+item.writer+'</div>'
																+'</div>'
																+'</div>'
																+'<div class="row" style="margin-top: 10px;">'
																+'<div style="overflow: hidden; text-overflow: ellipsis; height: 30px">'
																+'<h5 style="resize: none; display: inline-blocke">'
																+'<strong class="getCommunity title" style="cursor: pointer;">'+item.communityTitle+'&nbsp;&nbsp;</strong>'
																+'<small style="font-size: xx-small;">'+item.communityDate+'&nbsp;&nbsp;</small>'
																+'<small style="font-size: xx-small;">조회수&nbsp;'+item.views+'</small>'
																+'</h5>'
																+'</div>'
																+'</div>'
																+'<div class="row">'
																+'<div class="getCommunity content" style="overflow: hidden; text-overflow: ellipsis; height: 50px; cursor: pointer;">'
																+'<span class="content" style="resize: none; display: inline-blocke;">'+$(content).text()+'</span>'
																+'</div>'
																+'</div>'
																+'</div>'
																+'<div class="col-3 col-md-3">'
																+'<img alt="" class="getCommunity image" name="thumbnail" src="/resources/images/ThumbNail/'+item.communityThumbnail+'" width="250px" height="160px" style="border-radius: 6px; cursor: pointer;">'
																+'</div>'
																+'</div>'
																+'<hr>');
	      				});
	      				//$(".col-10.col-md-10.append").append('<div class="big-box"><h1>Page ' + page + '</h1></div><hr>');
	      				//alert(JSONData.list.communityCode);
	      			},
	      			error:function(jqXHR, textStatus, errorThrown){
	    				alert( textStatus );
	    				alert( errorThrown );
	    			}
	      		});
			}

//Search Box Event
function searchToggle(obj, evt){
	    var container = $(obj).closest('.Search');
	        if(!container.hasClass('active')){
	            container.addClass('active');
	            evt.preventDefault();
	            $(".search-icon").on("click", function(){
	            	$("form").attr("method", "POST").attr("action", "/community/getCommunityList").submit();
	            })
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
  	            container.removeClass('active');
  	            container.find('.search-input').val('');
	        }
	}

