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
		new Chart(document.getElementById('myChart_pie'), {
			'type'	: 'pie',
			'data'	: {
				'labels'	: [
					'식비', '쇼핑', '관광', '항공', '교통', '숙박', '액티비티', '기타'
				],
				'datasets'	: [{
					'label' 			: 'My First Dataset',
					'data'				: [300, 50, 100, 30, 45, 60, 140, 60],
					'backgroundColor'	: [
						'rgba(255, 99, 132, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(255, 205, 86, 0.5)', 'rgba(75, 192, 192, 0.5)',
						'rgba(54, 162, 235, 0.5)', 'rgba(153, 102, 255, 0.5)', 'rgba(201, 203, 207, 0.5)', 'rgba(108, 156, 204, 0.5)'
					]
				}]
			}
		});
		
		new Chart(document.getElementById('myChart_bar'), {
			'type'		: 'bar',
			'data'		: {
				'labels'	: [
					'식비', '쇼핑', '관광', '항공', '교통', '숙박', '액티비티', '기타'
				],
				'datasets'	: [{
					'label'				: 'My First Dataset',
					'data'				: [65, 59, 80, 81, 56, 55, 40, 75],
					'fill'				: false,
					'backgroundColor'	:[
						'rgba(255, 99, 132, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(255, 205, 86, 0.5)', 'rgba(75, 192, 192, 0.5)',
						'rgba(54, 162, 235, 0.5)', 'rgba(153, 102, 255, 0.5)', 'rgba(201, 203, 207, 0.5)', 'rgba(108, 156, 204, 0.5)'
					],
					'borderColor'		: [
						'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)',
						'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)', 'rgb(108, 156, 204)'
					],
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