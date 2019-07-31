//무한 스크롤로 동적으로 생긴 게시물에 이벤트
$(document).ready(function(){
	
	var owl = $(".owl-carousel");
	owl.owlCarousel({
		items:4,
	    loop:true,
	    margin:10,
	    autoplay:true,
	    autoplayTimeout:3000,
	    autoplayHoverPause:true
		
	});
	$('.owl-start').on('click',function(){
	    owl.trigger('play.owl.autoplay',[3000])
	})
	$('.owl-stop').on('click',function(){
	    owl.trigger('stop.owl.autoplay')
	})
	
	
	
	
	
    $(document).on("click",".getCommunity",function(){
	    self.location="/community/getCommunity?communityCode="+$(this).parents(".row.list").find(".communityCode").val();
    });
}); // end of ready()

$(document).on('click','.profile-box',function(){
	var writerUser = $(this).children().val().trim();
	console.log('게시판 : ' + writerUser);
	getProfile(writerUser);
});


$( function() {
	//유저 클릭시 프로필 오픈
	
	
	
//	$('#profile-image').on('click',function(){
//		var writerUser = $(this).parents('#profile-box').children().val().trim();
//		getProfile(writerUser);
//	})
	
	//게시물 등록
	var user = $("#session");
	$( "#addCommunity" ).on("click" , function() {
		if(session != true){
			self.location = '/user/loginView';
		}else{
			self.location = '/community/addCommunity.jsp';
		}
	});
	//게시판 유형
    $(".board").on("click", function(){
    	if($(this).children().text() == $(".free").text()){
    		self.location = "/community/getCommunityList?communityBoard=1"			
    	}else if($(this).children().text() == $(".city").text()){
    		self.location = "/community/getCommunityList?communityBoard=2"			
    	}else if($(this).children().text() == $(".qna").text()){
    		self.location = "/community/getCommunityList?communityBoard=3"			
    	}else{
    		self.location = "/community/getCommunityList?communityBoard=0"
    	}
    })
    //모달
    $('a[href$="#Modal"]').on( "click", function() {
    	   $('#Modal').modal('show');
   	});
    //게시물 상세조회
    $(".getCommunity").on("click", function(){
    	self.location="/community/getCommunity?communityCode="+$(this).parents(".row.list").find(".communityCode").val();
    })
    //베스트 게시물 상세조회
	$(".owl-item").on("click", function(){
		//alert($(this).children(".bestCommunityCode").val());
		self.location="/community/getCommunity?communityCode="+$(this).children(".bestCommunityCode").val();								
	})		    
    
    //$(".content").text("")
    
    
    $.each($(".content"),function(){
    	$(this).text($(this).text().trim());
    })
    $.each($(".card-body"),function(){
    	$(this).text($(this).text().trim());
    })
    //도시
    $("#searchSelect").change(function(){
		var selected = $("#searchSelect option:selected").val();
		if(selected == 0){
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
	     				$("#country").append('<option value="'+index+'">'+item.countryName+'</option>');
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
			     				$("#city").append('<option value="'+index+'">'+item.cityName+'</option>');
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
});// end of ready
//무한스크롤
var page = 2;
$(window).scroll(function() {
	var scrollH = $(document).height();
	var scrollT	= $(window).scrollTop();
	var scrollP = $(window).height();
	//console.log("documentHeight:" + scrollH + " | scrollTop:" + scrollT + " | windowHeight: " + scrollP );
	
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    	callCommunityList(page);
    	page++;
    }//end of if
});//end of scroll
function callCommunityList(page){
				var url = document.location.href;
				//alert(url.indexOf('searchCondition'));
				var communityBoard = '';
				var searchCondition = '';
				var searchKeyword = '';
				if(url.indexOf('communityBoard') != -1){
					 communityBoard = document.location.href.split("=")[1].substring('0','1');
				}
				if(url.indexOf('searchCondition') != -1){
					searchCondition = document.location.href.split("=")[3];
				}
				if(url.indexOf('searchKeyword') != -1){
					searchKeyword = document.location.href.split("=")[2].split("&")[0];
				}
				
		    	console.log('communityBoard = '+communityBoard);
		    	console.log('searchCondition = '+searchCondition);
		    	console.log('searchKeyword = '+searchKeyword);
		    	if(communityBoard === undefined || communityBoard === null){
		    		communityBoard = 0;
		    	}
		    	//console.log(communityBoard);
		    	//console.log("scrollHeight"+$(document).height());
		    	//console.log("scrollPosition"+$(window).height() + $(window).scrollTop())
	      		//$(".col-10.col-md-10.append").append('<div class="big-box"><h1>Page ' + page + '</h1></div><hr>');
	      		$.ajax({
	      			url : "/community/json/getCommunityList/"+communityBoard,
	      			method : "POST",
	      			data : JSON.stringify({
	      				"currentPage" : page,
	      				"pageSize" : "3",
	      				"searchKeyword" : searchKeyword,
	      				"searchCondition" : searchCondition
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
	      					var QnA = '';
	      					var free = '';
	      					var communityBoard =  item.communityBoard;
	      					var content = $(item.communityContent).text($(item.communityContent).text().trim());
	      					
	      					if(communityBoard == 1){ appendBoard = '자유게시판';
	      					}else if(communityBoard == 2){ appendBoard = '도시별 게시판';
	      					}else if(communityBoard == 3){ appendBoard = 'QnA 게시판'; }
	      					
	      					if(communityBoard == 2){
	      						appendCity = 	'<p class="text-center" ><img alt="" class="getCommunity image" name="thumbnail" src="/resources/images/flag/'+item.city.flagImage+'" width="30px" height="20px" style="border-radius: 3px; cursor: pointer;"></p>'
	      										+'<p class="text-center" style="font-size: small; color: #344157;">['+item.city.countryName+']</p>'
	      										+'<p class="text-center"style="font-size: small; color: #344157;">['+item.city.cityName+']</p>';
	      					}else if(communityBoard == 3){
	      						QnA = '<p class="text-center" ><i class="far fa-comments fa-2x"></i></p>'
	      					}else{
	      						free = '<p class="text-center" ><i class="fab fa-fly fa-2x"></i></p>'
	      					}
	      					
	      					$(".col-10.col-md-10.append").append( '<div class="row list"><div class="col-2 col-md-2" style="top: 10px;">'
	      														+'<p class="text-center" style="font-size: small; color: #344157;">'
	      														+'<input type="hidden" class="communityCode" value="'+item.communityCode+'">'
	      														+'No.<span class="">'+item.communityCode+'</span>'
	      														+'</p>'
	      														+'<p class="text-center communityBoard" style="font-size: small; color: #344157;">'
	      														+ appendBoard
																+'</p>'
																+ appendCity
																+ QnA
																+ free
																+'</div>'
																+'<div class="col-7 col-md-7">'
																+'<div class="profile-box row" style="position: relative;">'
																+'<input type="hidden" value="'+item.writer.userCode +'">'
																+'<div class="profile-image">'
																+'<img src="/resources/images/profile/'+item.writer.profileImg+'" id="userImage" name="userImage" alt="글쓴이" class="rounded-circle" width="45px" height="45px">'
																+'</div>'
																+'<div class="profile-nickname" style="position: absolute; top: 8px; left: 52px;">'
																+'<div style="font-size: small; color: #3c64a6;">글쓴이</div>'
																+'<div style="font-size: small; color: #344157;">'+item.writer.nickname+'</div>'
																+'</div>'
																+'</div>'
																+'<div class="row" style="margin-top: 10px;">'
																+'<div style="overflow: hidden; text-overflow: ellipsis; height: 30px">'
																+'<h5 style="resize: none; display: inline-blocke">'
																+'<strong class="getCommunity title" style="cursor: pointer;">'+item.communityTitle+'&nbsp;&nbsp;</strong>'
																+'<small style="font-size: small;">'+item.communityDate+'&nbsp;&nbsp;</small>'
																+'<small style="font-size: small;">조회수&nbsp;'+item.views+'</small>'
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
	    				alert("게시물이 없습니다.");
	    				//alert( errorThrown );
	    			}
	      		});
			}

//Search Box Event
function searchCommunity(obj, evt){
	    var container = $(obj).closest('.communitySearch');
	        if(!container.hasClass('active')){
	            container.addClass('active');
	            evt.preventDefault();
	            $(".search-icon").on("click", function(){
	            	/*$("form").on( "submit", function( event ) {
					  event.preventDefault();
					  alert( $( "form" ).serialize() );
					});*/
	            	//document.location.href.replace(document.location.href,'');
	            	if(document.location.href.indexOf('communityBoard') != -1){
	            		var thisCommunityBoard = document.location.href.split('?')[1].split('=')[1]
	            	}
	            	$('#communityBoardURL').val(thisCommunityBoard);
	            	$("form").attr("method", "POST").attr("action", "/community/getCommunityList").submit();
	            })
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	            container.removeClass('active');
	            container.find('.search-input').val('');
	        }
	}

	

