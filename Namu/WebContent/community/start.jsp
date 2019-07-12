<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<html lang="ko">
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		$(function(){
			$("button.btn.btn-success").on("click",function(){
				self.location = "/community/getCommunityList"
			})
		})
		</script>
	
	</head>


	<body>
		<div>
			<button type="button" class="btn btn-success">Success</button>
		</div>
	</body>
</html>