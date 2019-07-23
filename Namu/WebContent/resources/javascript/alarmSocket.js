window.onload = function () {
    if (window.Notification) {
        Notification.requestPermission();
    }
}

// socket.io 서버에 접속한다
var socket;

function socketcall(writerUser,protocol) {
	//alert("adad");
	if(protocol == '9') {
	 socket.emit("timeline", { To: writerUser, msg : '회원님의 댓글을 좋아합니다.' });
	}else if(protocol == '8') {
	 socket.emit("timeline", { To: writerUser, msg : '회원님의 댓글에 답글을 남겼습니다.' });
	}
}

$(function(){
	
	// 수입/지출 추가 모달창 닫기 버튼
	$('.timelinePop_wrap').on('click', function(e) {
		var container = $('.timelinePop_wrap');
		console.log(container.has(e.target).length);
		if(container.has(e.target).length === 0){
			$(".timelinePop_wrap").css('display','none');
		}
	});
	
	
	var userCode = $('#nodeUserCode').val().trim();
	var nickname = $('#nodeNickname').val().trim();
	var profileImg = $('#nodeprofileImg').val().trim();
	
	if(userCode  != '') {
		
		socket = io("http://192.168.0.94:3000");
		    // 서버로 자신의 정보를 전송한다.
		    socket.emit("login", {
		      // name: "ungmo2",
		      userCode : userCode,
		      nickname : nickname,
		      profileImg : profileImg
		    });
		    
		    socket.on('timeline',function(data) {
		    	//notify(data);
		    	alarmPopup(data);
		    });
		   
		    
		}
	
	function alarmPopup(data) {
		$('.timelinePop_wrap').remove();
		$('body').append(
'<div class="timelinePop_wrap">'
+'<div class="timelinePop_contain">'
+'<img src="/resources/images/profile/'+data.image+'" width="50" height="50" style="float:left;">'
+'<span style="float:left;">'
+'<strong class="d-inline-block mb-2 text-primary" style="display:inline;">@'+data.sender+'</strong>'
+'<p class="card-text mb-auto">'+data.message+'</p>'
+'</span>'

+'</div>'
+'</div>'
		);
		
		$(".timelinePop_wrap").css('display','block');
		setTimeout(function() {
			$('.timelinePop_wrap').remove();
			}, 5000);
	}
	
	
	$(document).on('click','.timelinePop_wrap',function(){
		self.location = '/user/loginView';
	})
	
	function notify(data) {
		//alert(data.image);
        if (Notification.permission !== 'granted') {
            alert('notification is disabled');
        }
        else {
            var notification = new Notification('@'+data.sender, {
                icon: 'http://localhost:8080/resources/images/profile/'+data.image,
                body: data.message
            });

            notification.onclick = function () {
                window.open('http://google.com');
            };
        }
    }
	
	
});



function addTimelineLike(commentCode,likeName,protocol) {
	console.log("댓글 번호 : " + commentCode);
	console.log("로그인한 유저  : " + likeName);
	console.log("프로토콜 : " + protocol);
	
	$.ajax ({
		url : '/timeline/json/addTimeline',
		method : 'post',
		data : JSON.stringify({
			commentCode : commentCode,
			protocol : protocol,
			fromUser : {
				userCode : likeName
			}
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data,status){
				alert(data);
		}
	})
}

function addTimelineReply() {
	
}