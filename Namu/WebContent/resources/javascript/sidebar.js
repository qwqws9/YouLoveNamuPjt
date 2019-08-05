 	//성용
	$(function(){
		$("#ooo").on("click",function(){
			if($("#beforeLogin").css("display") == "block"){
				$("#beforeLogin").hide();
				$("#afterLogin").show();
			}else{
				$("#afterLogin").hide();
				$("#beforeLogin").show();
			}
		});
		$('#logingogo').on('click',function(){
			self.location = '/user/loginView';
		})
		$("#communityList").on("click",function(){
			self.location = "/community/getCommunityList?communityBoard=0"
		})
		
		$('body').on('click', function(e) {
			var width = $('#mySidebar').css('width');
			if(width == '300px') {
				var container = $('#mySidebar');
				console.log(container.has(e.target).length);
				if(container.has(e.target).length === 0){
					closeNav();
				}
			}
		});
		
		
		
		/*//Search Box Event
		$('#searchbtn').on('click',function(){
		})*/
	});
	//메인 서치 연결
	function searchToggle(obj, evt){
		var container = $(obj).closest('.Search');
		if(!container.hasClass('active')){
			container.addClass('active');
			evt.preventDefault();
			$(".search-icon").on("click", function(){
				/*$("form").on( "submit", function( event ) {
		 					  event.preventDefault();
		 					  alert( $( "form" ).serialize() );
		 					});*/
				//document.location.href.replace(document.location.href,'');
				//if(document.location.href.indexOf('communityBoard') != -1){
				//	var thisCommunityBoard = document.location.href.split('?')[1].split('=')[1]
				//}
				//$('#communityBoardURL').val(thisCommunityBoard);
				//$("form").attr("method", "POST").attr("action", "/community/getCommunityList").submit();
				var keyword = $('input[name=searchKeyword]').val().trim();
				if(keyword.length > 0) {
					$($('form')[0]).attr('method','post').attr('action','/totalSearch/getTotalSearch').submit();
				}else {
					return;
				}
			})
		}
		else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
			container.removeClass('active');
			container.find('.search-input').val('');
		}
	}
	
	
	//중현
	$(function(){
		$("#addParty").on("click", function(){
			self.location = '/party/addPartyView';
		})
		$("#getPartyList").on("click", function(){
			self.location = '/party/getPartyList';
		})
	});
	
	function messageBox(){
		var url = '../message/messageBox.jsp';
		var option = 'width=1100px, height=600px, top=200, left=400, toolbar=no, menubar=no, location=no, directories=no, status=no, resizable=no';
		window.open(url,"",option);
	}

	
	 function openNav() {
	   var page = $('.side').val();
	   
	   document.getElementById("mySidebar").style.width = "300px";
	   document.getElementById("main").style.marginLeft = "300px";
	   document.getElementById("topbar").style.marginLeft = "300px";
	   if(page == 'getCommunityList'){
		   document.getElementById("listCommunity").style.marginLeft = "300px";
	   }
//	   document.getElementById("initTour").style.marginLeft = "300px";
//	   document.getElementById("tourDetailJsp").style.marginLeft = "300px";
//	   document.getElementById("initHotelJsp").style.marginLeft = "0px";
	   
	   $('#main').css('display','none');
	 }
	 function closeNav() {
	   var page = $('.side').val();
	   
	   document.getElementById("mySidebar").style.width = "0";
	   document.getElementById("main").style.marginLeft = "0";
	   document.getElementById("topbar").style.marginLeft = "0";
	   if(page == 'getCommunityList'){
		   document.getElementById("listCommunity").style.marginLeft = "0";
	   }
//	   document.getElementById("initTour").style.marginLeft = "230px";
//	   document.getElementById("tourDetailJsp").style.marginLeft = "0";
//	   document.getElementById("initHotelJsp").style.marginLeft = "250px";
	   
	   
	   $('#main').css('display','block');
	 }

	// 가계부
	$(function(){
		$('#wallet-btn').on('click', function(){
			self.location = '/wallet/getWalletListView';
		})
	});