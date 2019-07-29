//<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

//<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>


  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2833ac88aa2ab3a049c6c59d3c6a8933');
    function loginWithKakao() {
         // 로그인 창을 띄웁니다.
       Kakao.Auth.login({
            success: function(authObj) {
              //카카오 API를 호출한다
              Kakao.API.request({
                 url : "/v2/user/me",
                 success : function(res){
                    $(location).attr('href','/user/addSNS?token='+res.id+'&nickname='+res.properties.nickname+'&email='+res.kakao_account.email+'&userId=K');
                 }
              });
              //로그인 후 토큰값 가져오기
//              Kakao.Auth.getAccessToken();
//              alert("토큰값 가져오기");
            },
            fail: function(err) {
              alert(JSON.stringify(err));
              alert("카카오 로그인 실패!!");
            }
          });
        };
        
        //로그아웃
        function logoutWithKakao(){
           Kakao.Auth.logout();
           alert("카카오 로그아웃");
           location.href='https://accounts.kakao.com/logout?continue=https://pf.kakao.com/logged_out';
        }
