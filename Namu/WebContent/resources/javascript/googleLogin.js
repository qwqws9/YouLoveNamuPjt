      function checkLoginStatus(){
         
         if(gauth.isSignedIn.get()){
            
            var profile = gauth.currentUser.get().getBasicProfile();
            console.log('토큰값 : ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('이름 : ' + profile.getName());
            console.log('이메일 : ' + profile.getEmail()); // This is null if the 'email' scope is not present.
            console.log('프로필 이미지 : ' + profile.getImageUrl());
//            document.querySelector('#tokenData').innerHTML = '토큰값 : ' + profile.getId() + '<br>'
//                                                + ' 이름 : ' + profile.getName() + '<br>'
//                                                + ' 이메일 : ' + profile.getEmail() + '<br>'
//                                                + ' 프로필 이미지 :<br>' + '<img src="'+profile.getImageUrl()+'" />';
            
            //$('body').load('/user/addUser',{token:profile.getId(),name:profile.getName(),email:profile.getEmail()});
            //self.location = '/user/addUser?token='+profile.getId()+'&name='+profile.getName();
            $(location).attr('href','/user/addSNS?name='+profile.getName()+'&token='+profile.getId()+'&email='+profile.getEmail()+'&userId=G');
         }else{
        	 console.log('구글로그인실패');
         }
      }
      
      // init 메소트
      function init(){
         //console.log('init');
         
         gapi.load('auth2', function(){
            //console.log('auth2');
            // var gauth = gapi.auth2.init({ // 지역 변수
            window.gauth = gapi.auth2.init({ // 전역 변수 (window.gauth 또는 gauth)
               client_id : '371095294403-ifvgid5e6b278eno25rqieqn32j5iu74.apps.googleusercontent.com'
            })
            
            // callback 메소드
            gauth.then(function(){
            	//checkLoginStatus();
            }, function(){
               //console.log('googleAuth fail');
            })
         });
      }
            
      $(function(){
         // 로그인 버튼 클릭시
         $('#googleLogin').on('click', function(){
               gauth.signIn().then(function(){
                  //console.log('gauth.signIn()');
                  checkLoginStatus();
               });
//            }else{
//               gauth.signOut().then(function(){
//                  //console.log('gauth.signOut()');
//                  checkLoginStatus();
//               });
//            }
         });
      });
