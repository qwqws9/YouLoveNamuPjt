<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- jQuerty -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- common -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/javascript/party.js"></script>
	<!-- 이모티콘 -->
	<script src="https://kit.fontawesome.com/b3ea0a8bf1.js"></script>
	
	
	<style>
		#map {
			height: 500px;
        	width: 1000px;
		}
	</style>
</head>

<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-1"></div><!-- 사이드바 -->
			
			
			<div class="col-md-10 col-lg-10"><!-- 메인바 -->
				<div class="row">
				</div>
				
				
				
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="row">
							<div class="col-md-2 col-lg-2 order-1">
<%-- 								<a href="#"><img src="/resources/images/profile/${party.partyWriter.profileImg }"  class="rounded-circle" id="userImage" name="userImage" alt="글쓴이" width="60px" height="60px"></a> --%>
							</div>
							<div class="col-md-2 col-lg-2 order-2" id="profile-nickname" style="position: absolute; top: 12px; left: 88px;">  <!-- style="position: absolute; top: 10px; left: 52px;" -->
								<div class="text-muted" style="font-size:medium;">Writer.</div>
								<div style="font-size:medium; color:#344157;">${party.partyWriter.nickname}</div>
							</div>
						</div>
						
						
						<div class="row" id="profile" style="position: relative; ">
							<div class="col-md-9 col-lg-9 order-1"  id="profile-image">
								<h4 style="resize: none; display: inline-blocke;">
									<strong style="font-size: xx-large;">${party.partyTitle }&nbsp;&nbsp;</strong>
									<small style="font-size: medium;">${party.regDate }&nbsp;&nbsp;</small>
								</h4>
							</div>
							<div class="col-md-3 col-lg-3 order-last" align="right" id="getCount" style="position: absolute; font-size: medium; right: 0px; bottom: 0px;"> 
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-6 col-lg-6">
								<span>기간</span>
								<span>${party.partyStart }</span>
								<span>${party.partyEnd }</span>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-6 col-lg-6">
								<span>여행지역</span>
								<span>${party.city.flagImage}</span>
								<span>${party.city.countryName }</span>
								<span>${party.city.cityName }</span>
								<span>관광지 넣을까?</span>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-10 col-lg-10">
								<div class="alert alert-success" role="alert">
									${party.partyContent }
								</div>
							</div>
						</div>
						
						<div class="row no-gutters">
							<div class="col-md-2 col-lg-2">
								<strong style="font-size: 17px;">#Hashtag</strong>
							</div>
							<div class="col-md-10 col-lg-10">
								<div class="alert alert-light" role="alert">
									<c:forEach var="hashtag" items="${hashtag}">
									    <button type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">
									    	<span class="hashtagVal" style="font-size: 13px;">${hashtag}</span>
									    </button>
									</c:forEach>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-2 col-lg-2 text-center">
								희망 나이
							</div>
							<div class="col-md-10 col-lg-10 form-group">
						    	<div class="col-6">
						    		${party.age}
						    	</div>
							</div>
						</div>	
						
						
						<div class="row">	
							<div class="col-md-2 col-lg-2 text-center">
								희망 성별
							</div>
							<div class="col-md-10 col-lg-10 form-group">
						    	<div class="col-6">
						    		${party.gender}
						    	</div>
							</div>
						</div>	
						
						
						<div class="row">	
							<div class="col-md-2 col-lg-2 text-center">
								모집 유무
							</div>
							<div class="col-md-10 col-lg-10 form-group">
						    	<div class="col-6">
						    		${party.partyRecruitment}
						    	</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
			
			
			<div class="col-lg-1"></div>
		</div>
	</div>
	<script>
	
		
	</script>
</body>
</html>