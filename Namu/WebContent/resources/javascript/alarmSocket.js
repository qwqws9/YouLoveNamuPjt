window.onload = function () {
    if (window.Notification) {
        Notification.requestPermission();
    }
}

// socket.io 서버에 접속한다
var socket;

function socketcall(writerUser) {
	//alert("adad");
	 socket.emit("timeline", { To: writerUser, msg : '회원님의 댓글을 좋아합니다.' });
	
}

$(function(){
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
		    	notify(data);
		    });
		   
		    
		}
	
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
