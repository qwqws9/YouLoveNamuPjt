<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="get_report">
	<div class="charts">
		<canvas id="myChart_pie" width="600" height="600"></canvas>
	</div>
	<div class="charts">
		<canvas id="myChart_bar" width="600" height="600"></canvas>
	</div>
	<a href="javascript:void(0);" class="close_btnn"><i class="fas fa-times-circle close_icon"></i><span class="skip">닫기</span></a>
	
	<script>
		var label = [];
		var data = [];
		var background = [];
		var border = [];
	
		$(function() {
			var walletCode = $('#wallet_detail_section').data('walletCode');
			//console.log('walletCode : ' + walletCode);
			
			getChartAjax(walletCode);
		});
		
		// getWalletChart Business Logic
		function getChartAjax(walletCode) {
			//console.log('walletCode :: ' + walletCode);
			
			$.ajax({
				url			: '/wallet/json/getWalletChart/' + walletCode,
				type		: 'GET',
				headers		: {
					'Accept'		: 'Application/json',
					'Content-Type'	: 'Application/json'
				},
				dataType	: 'json',
				error		: function(request, status, error) {
					//console.log('[ERROR]\nCODE : ' + request.status + '\nMESSAGE : ' + request.responsehtml + '\nERROR : ' + error);
				},
				success		: function(JSONData, status) {
					//console.log(status);
					
					$.each(JSONData, function(index, item) {
						if(item.category == 1){
							label.push('식비');
							background.push('rgba(255, 99, 132, 0.5)');
							border.push('rgb(255, 99, 132)');
						}else if(item.category == 2){
							label.push('쇼핑');
							background.push('rgba(255, 159, 64, 0.5)');
							border.push('rgb(255, 159, 64)');
						}else if(item.category == 3){
							label.push('관광');
							background.push('rgba(255, 205, 86, 0.5)');
							border.push('rgb(255, 205, 86)');
						}else if(item.category == 4){
							label.push('항공');
							background.push('rgba(75, 192, 192, 0.5)');
							border.push('rgb(75, 192, 192)');
						}else if(item.category == 5){
							label.push('교통');
							background.push('rgba(54, 162, 235, 0.5)');
							border.push('rgb(54, 162, 235)');
						}else if(item.category == 6){
							label.push('숙박');
							background.push('rgba(153, 102, 255, 0.5)');
							border.push('rgb(153, 102, 255)');
						}else if(item.category == 7){
							label.push('액티비티');
							background.push('rgba(201, 203, 207, 0.5)');
							border.push('rgb(201, 203, 207)');
						}else if(item.category == 8){
							label.push('기타');
							background.push('rgba(108, 156, 204, 0.5)');
							border.push('rgb(108, 156, 204)');
						}
						data.push(item.krwPrice);
					});
					
					//console.log('labels :: ' + label);
					//console.log('datas :: ' + data);
					//console.log('backgrounds :: ' + background);
					//console.log('borders :: ' + border);
				}
			});
		}
	
		new Chart(document.getElementById('myChart_pie'), {
			'type'	: 'pie',
			'data'	: {
				'labels'	: label,
				'datasets'	: [{
					'label' 			: '카테고리별 지출 차트',
					'data'				: data,
					'backgroundColor'	: background
				}]
			}
		});
		
		new Chart(document.getElementById('myChart_bar'), {
			'type'		: 'bar',
			'data'		: {
				'labels'	: label,
				'datasets'	: [{
					'label'				: '카테고리별 지출 차트',
					'data'				: data,
					'fill'				: false,
					'backgroundColor'	: background,
					'borderColor'		: border,
					'borderWidth'		: 1
				}]
			},
			'options'	: {
				'scales'	: {
					'yAxes'				:[{
						'ticks'	: {
							'beginAtZero'	: true
						}
					}]
				}
			}
		});
	</script>
</div>