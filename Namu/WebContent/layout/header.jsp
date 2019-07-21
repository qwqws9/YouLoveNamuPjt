<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	//성용
	$(function(){
		$("#ooo").on("click",function(){
			if($("#beforeLogin").css("display") == "block"){
				$("#beforeLogin").hide();
				$("#afterLogin").show();
			}else{
				$("#afterLogin").hide();
				$("#beforeLogin").show();
			}
		});
		$('button:contains("로그인")').on('click',function(){
			self.location = '/user/loginView';
		})
		$("#communityList").on("click",function(){
			self.location = "/community/getCommunityList?communityBoard=0"
		})
	});
	
	//중현
	$(function(){
		$("#addParty").on("click", function(){
			self.location = '/party/addParty.jsp';
		})
		$("#getPartyList").on("click", function(){
			self.location = '/party/getPartyList';
		})
	});
</script>

<nav class="navbar navbar-dark bg-dark">
<div class="container-fluid">
	<div class="col-lg-1">
		<a class="navbar-brand" href="/">
		    <span class="brand">YOULOVE</span>
		</a>
	</div>
	<div class="col-lg-11">
		<div class="row"><!-- top -->
			<div class="col-lg-6">
				<div class="input-group" style="width: 250px;">
				    <input type="text" class="form-control" placeholder="Search">
				    <div class="input-group-append-sm" style=" height: 50px;">
					    <button class="btn btn-secondary" type="button">
					    	<i class="fa fa-search"></i>
					    </button>
				    </div>
			  	</div>
			</div>
			<c:if test ="${empty user }">
			<div class="col-lg-6" id="beforeLogin"><!-- 로그인 전 -->
				<div class="row text-right">
					<div class="col-lg-4 offset-8">
						<button type="button" style="border: 1px solid black; background: none; border-radius: 3px;">
							<span>로그인</span>
						</button>						
					</div>
				</div>
			</div>
			</c:if>
			<c:if test ="${!empty user }">
			<div class="col-lg-6" id="afterLogin"><!-- 로그인 후 -->
				<div class="row">
					<div class="col-lg-4 offset-4">
						<div class="row">
							<div class="col-lg-3" style="padding-top: 7px;">
								<button type="button" style="background: none; border: none;"><i class="fas fa-address-book fa-lg"></i></button>
							</div>
							<div class="col-lg-3" style="padding-top: 7px;">
								<button type="button" style="background: none; border: none;"><i class="far fa-calendar fa-lg"></i></button>
							</div>
							<div class="col-lg-3" style="padding-top: 7px;">
								<button type="button" style="background: none; border: none;"><i class="fas fa-money-check-alt fa-lg"></i></button>
							</div>
							<div class="col-lg-3" style="padding-top: 7px;">
								<button type="button" style="background: none; border: none;"><span class="badge" style="background: #ff7d75; color: white;">4</span></button>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="row">
							<div class="col-lg-9">
								<div class="float-right" style="padding-top: 10px;">
								<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    		<span class="align-text-bottom" style="font-size:x-small; color: white;">${user.nickname }</span>
								</button>
									<div class="dropdown-menu">
								  		<a class="dropdown-item" href="/user/getUser">내 정보</a>
									    <a class="dropdown-item" href="#">내 작성글/댓글</a>
									    <a class="dropdown-item" href="#">결제내역</a>
									    <c:if test="${user.role eq 'admin' }">
									    <div class="dropdown-divider"></div>
									    <a class="dropdown-item" href="/user/getUserList">전체회원 조회</a>
									    <a class="dropdown-item" href="#">신고목록 조회</a>
									    </c:if>
									    <div class="dropdown-divider"></div>
									    <a class="dropdown-item" href="/user/logout">로그아웃</a>
							  		</div>
								</div>
							</div>	
							<div class="col-lg-3">
								<div class="float-right" id="profile-image">
									<a href="#"><img src="<c:url value="/resources/images/profile/${user.profileImg }" />" id="userImage" name="userImage" alt="" class="rounded-circle" width="40px" height="40px"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			 </c:if>
		</div>
		<div class="row"><!-- bottom -->
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-2 offset-2">
						
						<div class="btn-group">
							<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    	<span>플래너</span>
							</button>
						  	<div class="dropdown-menu">
						  		<a class="dropdown-item" href="/planner/addPlanner">첫플래너 시작</a>
							    <div class="dropdown-divider"></div>
							    <a class="dropdown-item" href="#">플래너 공유</a>
						  	</div>
						</div>
					</div>					
					<div class="col-lg-2">
						<div class="btn-group">
							<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    	<span>커뮤니티</span>
							</button>
						  	<div class="dropdown-menu">
						  		<a id="communityList" class="dropdown-item" href="#">커뮤니티 목록</a>
							    <a class="dropdown-item" href="#">분석</a>
						  	</div>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="btn-group">
							<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    	<span>동행</span>
							</button>
						  	<div class="dropdown-menu">
						  		<a class="dropdown-item" id="addParty" href="#">동행 등록</a>
							    <a class="dropdown-item" id="getPartyList" href="#">동행 찾기</a>
						  	</div>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="btn-group">
							<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    	<span>여행 가이드</span>
							</button>
						  	<div class="dropdown-menu">
						  		<a class="dropdown-item" href="/guide/initTour">관광지</a>
							    <a class="dropdown-item" href="#">숙소</a>
							    <a class="dropdown-item" href="#">항공권</a>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- end of container -->
</nav>