$(function(){
	
	
	
	
	$('#callCountry').on('click',function(){
				selectCity();
	});
	
	$(document).on('click','.wCity',function(){
		
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
				alert(data[0].lat);
				alert(data[0].lng);
			}
		})
	});

		
		
	$(document).on('click','.weatherCountry',function(){
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
	
	
	
	
	
});

