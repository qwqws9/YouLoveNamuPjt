function hotelPayIamport(tourName,cost,email,name,phone,tourId,checkin,checkout,address,userCode) {
        	 // window.IMP 변수를 초기화
            var IMP = window.IMP; // 생략가능
            IMP.init('imp51469588'); // 가맹점 식별 코드
            var cost2 = cost.substr(1,cost.length).replace(/,/gi,'');
            console.log(cost2+"결제금액 이다다")
            // 결제 요청
            IMP.request_pay({
               pg            : 'html5_inicis',                  // 결제 방식
               pay_method      : 'card',                        // 결제 수단
               merchant_uid   : 'merchant_' + new Date().getTime(),
               name         : tourName,                  // order 테이블에 들어갈 주문명 혹은 주문번호
               amount         : '100',               // 결제 금액
               buyer_email      : email,               // 구매자 email
               buyer_name      : name,                     // 구매자 이름
               buyer_tel      : phone,                  // 구매자 전화번호
               buyer_addr      : '서울특별시 강남구 삼성동',               // 구매자 주소
               buyer_postcode   : '123-456',                        // 구매자 우편번호
              // m_redirect_url   : '/user/getPayList'						 // 결제 완료 후 보낼 컨트롤러의 메소드명
               
            }, function(rsp){
               if(rsp.success){ // 성공
                  $.ajax({
   					url : '/user/json/addPay',
   					method : 'post',
   					data : JSON.stringify({
   						hotelCode : tourId,
   						hotelName : tourName,
   						startDate : checkin,
   						endDate : checkout,
   						hotelAddress : address,
   						paymentPrice : cost,
   						paymentUser : {
   							userCode : userCode
   						},
   						paymentOption : rsp.pay_method
   					}),
   					headers : {
   						"Accept" : "application/json",
   						"Content-Type" : "application/json"
   					},
   					success : function(data, status){
   						if(data == true) {
   							self.location = '/user/getPayList'
   						}
   					}
   				})
               }else{ // 실패
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  alert(msg);
               }
               
               
            });
         }    




function FlightPayIamport(startWay,endWay,checkin,checkout,startTotal,endTotal,cost,userCode) {
	 // window.IMP 변수를 초기화
   var IMP = window.IMP; // 생략가능
   IMP.init('imp51469588'); // 가맹점 식별 코드
   var cost2 = cost.substr(1,cost.length).replace(/,/gi,'');
   console.log(cost2+"결제금액 이다다")
   // 결제 요청
   IMP.request_pay({
      pg            : 'html5_inicis',                  // 결제 방식
      pay_method      : 'card',                        // 결제 수단
      merchant_uid   : 'merchant_' + new Date().getTime(),
      name         : startWay+'->'+endWay,                  // order 테이블에 들어갈 주문명 혹은 주문번호
      amount         : '100',               // 결제 금액
      buyer_email      : "qwqws9@naver.com",               // 구매자 email
      buyer_name      : 'test',                     // 구매자 이름
      buyer_tel      : '010-9072-0802',                  // 구매자 전화번호
      buyer_addr      : '서울특별시 강남구 삼성동',               // 구매자 주소
      buyer_postcode   : '123-456',                        // 구매자 우편번호
     // m_redirect_url   : '/user/getPayList'						 // 결제 완료 후 보낼 컨트롤러의 메소드명
      
   }, function(rsp){
      if(rsp.success){ // 성공
    	  $.ajax({
				url : '/user/json/addPay',
				method : 'post',
				data : JSON.stringify({
					startWay : startWay,
					endWay : endWay,
					startDate : checkin,
					endDate : checkout,
					flightTime : startTotal,
					returnFlightTime : endTotal,
					paymentPrice : cost,
					paymentUser : {
						userCode : userCode
					},
					paymentOption : rsp.pay_method
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data, status){
					if(data == true) {
							self.location = '/user/getPayList'
						}
				}
			})
      }else{ // 실패
         var msg = '결제에 실패하였습니다.';
         msg += '에러내용 : ' + rsp.error_msg;
         alert(msg);
      }
      
      
   });
}    