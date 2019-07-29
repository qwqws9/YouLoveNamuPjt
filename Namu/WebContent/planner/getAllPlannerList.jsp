<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>YouLovePlan</title>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- Font Awesome SVG with JavaScript -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
	<!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/wallet.css">
	<style type="text/css">
	#searchKeyword{
		outline: none;
		border: none;
		background: none;
		border-bottom: 2px solid #F2C029;
	}
	#searchKeyword:focus{
		border-bottom: 2px solid #a3daff;
		transition: 0.5s;
	}
	
	</style>
	<script type="text/javascript">
var locations=[];

$(function() {	
	
	
	
	 $.ajax({
	url : "/guide/json/getCityList/all",
	method : "get",
	dataType : "json",
	async:"false",
	headers : {
	"Accept" : "application/json",
	"Content-Type" : "application/json"
	},

	success : function(JSONData){
		$.each(JSONData,function(index,item){
			locations.push(item.cityName);
	console.log(locations);
			});
		$("#searchKeyword").autocomplete({
		 	source : locations
		});
		}
	 });
});
	  
	function fncGetList(currentPage) {
		//var ser = $(this).val();
		//alert(ser);
		//option.selected;
		$("#currentPage").val(currentPage);
		
		
		//alert($("form").serialize());
		 $($("form")[1]).attr("method", "POST").attr("action","/planner/getAllPlannerList").submit();
	}
	
	$(document).ready(function(){
		$(document).on()
		
		
	})
	
	$(function() {
		
		//alert(${search.searchCondition2});
		
		//$("#searchCondition2 option:eq(3)").attr("selected", "selected");
		//$("#searchCondition2").option.selectedIndex(${search.searchCondition2});
		//var ddd = $("#searchCondition2").val();
		//console.log(ddd);
		//ddd.prop("selected", true);
		
		
		
		$('.wallet_box .square').on('click', function(e) {
			var plannerCode = $(this).children(':eq(0)').val();
			
			if(plannerCode != null && plannerCode != '' && plannerCode != 0){
				
					self.location = '/planner/getPlanner?plannerCode=' + plannerCode;
			}
		});
		
		$("button.btn.btn-default").on("click", function() {
			fncGetList(1);
			});
		
 		$("select[name='searchCondition'],select[name='searchCondition2']").on("change", function(){
			fncGetList(1);
		}); 
	
 		/* $("select[name='searchCondition2']").on("change", function(){
			fncGetList(1);
		});  */
	});
	
	

</script>
</head>
<body>
	<header><jsp:include page="/layout/header.jsp" /></header>
	
	<!--  Search  -->

<%-- <div class="col-md-6 text-right">

<div class="form-group">
<label class="sr-only" for="searchKeyword">검색</label> <input
type="text" class="form-control" id="searchKeyword"
name="searchKeyword" placeholder="도시 검색 "
value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
</div>

<button type="button" class="btn btn-default">Search</button>
<br><br>
 --%>

<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
<input type="hidden" id="currentPage" name="currentPage" value="" />

<div class="wrap">
		<h2 class="wallet_title"><span>내 플래너 목록</span></h2>
		
		<section class="wallet_box">
	
<form class="form-inline" name="detailForm">


<div class="col-md-12" >	
<div class="row">
<div class="col-md-4">
<input type="text" class="" id="searchKeyword" name="searchKeyword" placeholder="도시명을 입력하세요 "
value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
<button type="button" class="btn btn-default">Search</button>
</div>

<div class="col-md-2">

</div>

<div class="col-md-1">
</div>

<div class="col-md-2">
 <select class="custom-select mr-sm-2" id="searchCondition2" name="searchCondition2">
  	 <option value="0" ${! empty search.searchCondition2 && search.searchCondition2==0 ? "selected" : ""  }> 전체 </option>
 	<c:forEach begin="1" end="12" varStatus="status">
 		 <option value="${status.index }" ${! empty search.searchCondition2 && search.searchCondition2 == '${status.index }' ? "selected" : "" } >${status.index} 월 </option> 
 	</c:forEach>
 	
      </select>
      </div>
      
<div class="col-md-1">
</div>

<div class="col-md-2">
 <select class="custom-select mr-sm-2" id="searchCondition" name="searchCondition">
<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""  }>전체 </option>
	<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""  }>혼자 </option>
		<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""  }>연인과 </option>
			<option value="3" ${! empty search.searchCondition && search.searchCondition==3 ? "selected" : ""  }>친구들과 </option>
				<option value="4" ${! empty search.searchCondition && search.searchCondition==4? "selected" : ""  }>가족들과</option>
 </select>

</div>
</div>
</div>
</form>


			<div class="square_wrap clear">
				<c:forEach var="planner" items="${list}">
					<%-- <c:if test="${planner.departDate >= today}"> --%>
						<div class="square" >
							<!-- <input type="hidden" class="walletCode" /> -->
							<input type="hidden" class="plannerCode" value="${planner.plannerCode}" />
							<div
								<c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">style="background-image: url(/resources/images/planner/${planner.plannerImage})"</c:if>
								<c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">style="background-image: url(/resources/images/wallet/alternative_image.png)"</c:if>
							>
								<div>
									<div class="plan_name text_shadow" id="plannerName">${planner.plannerName}<%-- <div id=plannerCode style="display: none">${planner.plannerCode}</div> --%></div>
									<div class="plan_flag">국기</div>
									<div class="plan_period text_shadow">${planner.departDate} ~</div>
								<div class="wallet_is">
										<div class="btn-group btn-group-toggle isWallet" data-toggle="buttons" style=" visibility:hidden">
											<label class="btn btn-secondary">
												<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
											</label>
											<label class="btn btn-secondary active">
												<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
											</label>
										</div>
									</div> <!-- //wallet_is -->
								</div>
							</div>
						</div><!-- //square -->
					<%-- </c:if> --%>
				</c:forEach>
			</div><!-- //square_wrap -->
		</section><!-- //wallet_box -->
		
		
		
		
		
		</div>
</body>
</html>