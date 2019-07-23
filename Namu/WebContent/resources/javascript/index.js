$(function(){
	
	$('body').oLoader({
		  wholeWindow: true, //makes the loader fit the window size
		  lockOverflow: true, //disable scrollbar on body
		   
		  backgroundColor: '#282c37',
		  fadeInTime: 1000,
		  fadeLevel: 0.7,
		  image: '../resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
		 
		});
	
	// 날씨 init
	getWeather("37.499427","127.029422");
	// 37.499427, 127.029422
	$('#callCountry').on('click',function(){
				selectCity();
	});
	
	$(document).on('click','.wCity',function(){
		$('#weatherCity').val($(this).text().trim());
		$.ajax({
			url : '/guide/json/getCity',
			method : 'post',
			data : JSON.stringify ({
				cityName : $(this).text().trim()
			}),
			headers : {
				"Accpet":"application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				//alert(data[0].lat);
				//alert(data[0].lng);
				getWeather(data[0].lat,data[0].lng)
			}
		})
	});
	
	
	function getWeather(lat,lng) {
		
		$.ajax({
			url : '/guide/json/getWeather',
			method : 'post',
			data : JSON.stringify ({
				lat : lat,
				lng : lng
			}),
			headers : {
				"Accpet":"application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				//alert(data);
				
				$('.weatherImg').attr('src','http://openweathermap.org/img/wn/'+data.icon+'@2x.png');
				$('.mainTemp').text(data.temp);
				//$('.mainMinMaxTemp').text(data.tempMin+'/'+data.tempMax);
				$('.mainMinMaxTemp span:first-child').text(data.tempMin);
				$('.mainMinMaxTemp span:last-child').text(data.tempMax);
				
				$('.humidity').text(data.humidity);
				$('.weatherCity').text($('#weatherCountry').val() +'-' + $('#weatherCity').val() );
				$(".popup_wrap").css('display','none');
				
			}
		})
	}

		
		
	$(document).on('click','.weatherCountry',function(){
		$('#weatherCountry').val($(this).text().trim());
		$.each($('.wCity'),function(){
			//alert("안들어오나?")
			$(this).remove();
			$(this).css('display','none');
			$(this).empty();
		})
		
		if($(this).hasClass('active') === true) {
			//alert("액티브있음")
			$.each($('button[class*=weatherCountry'),function(){
				$(this).removeClass('active');
				$(this).css('display','block');
			});
			return;
		}else {
			//alert("액티브없음")
			$.each($('button[class*=weatherCountry'),function(){
				$(this).removeClass('active');
				$(this).css('display','none');
				
			});
			$(this).addClass('active');
			$(this).css('display','block');
		}
		
		
		
		
		
		
		var countryName = $(this).text().trim();
		
		$.ajax({
			url : '/guide/json/getCity',
			method : 'post',
			data : JSON.stringify ({
				countryName : countryName
			}),
			headers : {
				"Accpet":"application/json",
				"Content-Type" : "application/json"
			},
			success : function(data,status){
				
				$.each(data,function(index,item){
//					if(index == 0) {
//					$('.popup_wrap').after(
//						'<div class="'+item.countryCode+'" style="display:none">'
//						+'</div>'
//					);
//					};
					
					$('button[class^='+item.countryCode).after(
					'<button type="button" class="wCity list-group-item list-group-item-action">'
					+'<small>'+item.cityName+'</small>'
					+'</button>'
					);
				})
			}
		});
	})
	
	$('.weatherCountry').on('click',function(){
		
	})
	
	
}).ajaxStart(function(){
	$('body').oLoader({
		  wholeWindow: true, //makes the loader fit the window size
		  lockOverflow: true, //disable scrollbar on body
		   
		  backgroundColor: '#282c37',
		  fadeInTime: 1000,
		  fadeLevel: 0.7,
		  image: '../resources/images/ownageLoader/430377_e43058e053634b499f67c63cd1e3ba02_mv2.gif',  
		 
		});
}).ajaxStop(function(){
	$('body').oLoader('hide');
});

$(window).load(function(){
	$('body').oLoader('hide');
});;

// 환율 정보 .jsp 온로드
$(function() {
	// innerHTML
	$($('#exchange_container')).load('/wallet/exchangeRates.jsp', function(data) {
		//console.log(data);
		
		exchangeRatesData();
	});
});