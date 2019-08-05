//window.onload = function () {
//    if (window.Notification) {
//        Notification.requestPermission();
//    }
//}

// socket.io 서버에 접속한다
var socket;

//받는사람 , 프로토콜
function socketcall(writerUser,protocol) {
	//alert("소켓 호출됨");
	if(protocol == '9') {
		socket.emit("timeline", { To: writerUser, msg : '회원님의 댓글을 좋아합니다.' });
	}else if(protocol == '8') {
		socket.emit("timeline", { To: writerUser, msg : '회원님의 댓글에 답글을 남겼습니다.' });
	}else if(protocol == '1') {
		socket.emit("timeline", { To: writerUser, msg : '회원님의 게시물에 댓글을 남겼습니다.' });
	}else if(protocol == '2') {
		socket.emit("timeline", { To: writerUser, msg : '회원님과 친구맺기를 원합니다.' });
	}else if(protocol == '3') {
		socket.emit("timeline", { To: writerUser, msg : '회원님의 게시물을 좋아합니다.' });
	}
}

function currentUser(searchUserCode,classLoc) {
	socket.emit("currentUser", { search: searchUserCode, loc : classLoc });
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
		    
		    socket.on('currentUser',function(data) {
		    	//notify(data);
		    	//alert(data.message);
		    	//console.log(data.message);
		    	var location = data.loc.substr(0,8);
		    	console.log('1타임라인 위치 : '+location);
		    	console.log('트루  : ? '+data.message)
		    	if(data.message) {
		    		//console.log('한명은 들어오지마');
		    		if(location == 'userNick'){
		    			console.log('2타임라인 위치 : '+location);
		    			//회원검색으로 보냄
		    			$('.'+data.loc).children().next().children().next().css('color','lawngreen');
		    		}else {
		    			console.log('3타임라인 위치 : '+location);
		    			//친구목록으로 보냄
		    			$('.'+data.loc).css('color','lawngreen');
		    		}
		    	}
		    	//console.log(data.message);
		    });
		   
		    
		}
	
	function alarmPopup(data) {
		$('.timelinePop_wrap').remove();
		$('body').append(
'<div class="timelinePop_wrap">'
+'<div class="timelinePop_contain" style="padding-top:23px;padding-left: 15px;">'
+'<img class="rounded-circle" src="/resources/images/profile/'+data.image+'" width="55" height="55" style="float:left;">'
+'<span style="float:left;padding-top: 6px;padding-left: 10px;">'
+'<strong class="d-inline-block mb-2 text-primary" style="display:inline;">@'+data.sender+'</strong>'
+'<p class="card-text mb-auto">'+data.message+'</p>'
+'</span>'

+'</div>'
+'</div>'
		);
		
		$(".timelinePop_wrap").css('display','block');
		setTimeout(function() {
			$('.timelinePop_wrap').remove();
			}, 7000);
	}
	
	
	$(document).on('click','.timelinePop_wrap',function(){
		self.location = '/timeline/getTimelineList';
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


//댓글과 추천 DB 추가
function addTimelineLike(commentCode,likeName,protocol) {
	
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
		}
	})
}


//게시물에 댓글 DB 추가
//게시판번호,게시물번호,댓글작성자,게시물작성자,프로토콜
function addTimelineCommunity(boardCode,detailCode,writerUser,boardWriter,protocol) {
	$.ajax ({
		url : '/timeline/json/addTimeline',
		method : 'post',
		data : JSON.stringify({
			boardCode : boardCode,
			detailCode : detailCode,
			protocol : protocol,
			fromUser : {
				userCode : writerUser
			},
			toUser : {
				userCode : boardWriter
			}
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data,status){
				if(data == true) {
					socketcall(boardWriter,protocol);
				}
		}
	})
}

// 프로필정보 친구추가 메시지 전달
function addTimelineFriend(senduserCode,receiverUserCode,protocol) {
	
	$.ajax ({
		url : '/timeline/json/addTimeline',
		method : 'post',
		data : JSON.stringify({
			protocol : protocol,
			fromUser : {
				userCode : senduserCode
			},
			toUser : {
				userCode : receiverUserCode
			}
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data,status){
				if(data == true) {
					socketcall(receiverUserCode,'2');
				}
		}
	})
}





