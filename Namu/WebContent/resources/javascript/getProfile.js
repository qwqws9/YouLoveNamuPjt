//////
		$(function(){
		//$('.prof').on('click',function(){
		//getUserProfile($(this).val());
		//$(".popup_wrap").css('display','block');
		//centerPopUp($(".popup_contain"), $(".popup_contain").width(), $(".popup_contain").height() );
		
		
		// 수입/지출 추가 모달창 닫기 버튼
		$('.popup_wrap').on('click', function(e) {
			var container = $('.popup_wrap');
			console.log(container.has(e.target).length);
			if(container.has(e.target).length === 0){
				$(".popup_wrap").css('display','none');
			}
		});
		
		
		
	})
function getProfile(userCode) {
			console.log("여기로 들어왔음 닉네임클릭");
			getUserProfile(userCode);
			$(".popup_wrap").css('display','block');
			centerPopUp($(".popup_contain"), $(".popup_contain").width(), $(".popup_contain").height() );
		}
	
	
	// 팝업 중앙에 띄우기
function centerPopUp(modal, modalWidth, modalHeight) {
	console.log('모달창 넓이 : ' + modalWidth + 'px, 높이 : ' + modalHeight + 'px');

	var left = Math.ceil((window.screen.width - modalWidth) / 2);
	var top = Math.ceil(((window.screen.height - modalHeight) / 2) - 50);
	
	modal.css({'display':'block'});
	modal.css({'top':top, 'left':left});
}
	
	
	function getUserProfile(codeUser) {
		
		$.ajax({
			url : '/user/json/getUser',
			method : 'post',
			data : JSON.stringify({
				userCode : codeUser
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData,status) {
				//alert(JSONData.nickname);
				$('.profileInfo').css('display','block');
				$('.userNick').text('닉네임 : ' + JSONData.nickname);
				if(JSONData.gender == 'M') {
					$('.userGend').text('성별 : 남자');
				}else {
					$('.userGend').text('성별 : 여자');
				}
				$('.userAge').text('나이 : ' + JSONData.birth);
				$('.userIntro').text(JSONData.introduce);
				$('.userProfile').attr('src','/resources/images/profile/'+JSONData.profileImg)
				$('#inviteUserCode').val(codeUser);
				
				
			}
		})
	}
		
		/////
		
		