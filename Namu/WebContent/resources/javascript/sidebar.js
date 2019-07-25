 	//성용
	/*$(function(){
		$("#ooo").on("click",function(){
			if($("#beforeLogin").css("display") == "block"){
				$("#beforeLogin").hide();
				$("#afterLogin").show();
			}else{
				$("#afterLogin").hide();
				$("#beforeLogin").show();
			}
		});
		$('button:contains("로그인")').on('click',function(){
			self.location = '/user/loginView';
		})
		$("#communityList").on("click",function(){
			self.location = "/community/getCommunityList?communityBoard=0"
		})
		
		
		
		//Search Box Event
		$('#searchbtn').on('click',function(){
		})
	});*/
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
			self.location = '/party/addParty.jsp';
		})
		$("#getPartyList").on("click", function(){
			self.location = '/party/getPartyList';
		})
	});





	/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
	 function openNav() {
	   document.getElementById("mySidebar").style.width = "300px";
	   document.getElementById("main").style.marginLeft = "300px";
	   document.getElementById("topbar").style.marginLeft = "300px";
	 }

	 /* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
	 function closeNav() {
	   document.getElementById("mySidebar").style.width = "0";
	   document.getElementById("main").style.marginLeft = "0";
	   document.getElementById("topbar").style.marginLeft = "0";
	 }
