$(function(){
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
});


//addCommunity ,updateCommunity
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
	      														+'<p class="text-center" style="font-size: x-small; color: #344157;">'
	      														+'No.<span class="communityCode">'+item.communityCode+'</span>'
	      														+'</p>'
	      														+'<p class="text-center communityBoard" style="font-size: x-small; color: #344157;">'
	      														+ appendBoard
																+'</p>'
																+ appendCity
																+'</div>'
																+'<div class="col-7 col-md-7">'
																+'<div class="row" id="profile-box" style="position: relative;">'
																+'<div id="profile-image">'
																+'<a href="#"><img src="/resources/images/dog.JPG" id="userImage" name="userImage" alt="글쓴이" class="rounded-circle" width="45px" height="45px"></a>'
																+'</div>'
																+'<div id="profile-nickname" style="position: absolute; top: 10px; left: 52px;">'
																+'<div style="font-size: x-small; color: #3c64a6;">글쓴이</div>'
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
																+'<span class="content" style="resize: none; display: inline-blocke;">'+item.communityContent+'</span>'
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

