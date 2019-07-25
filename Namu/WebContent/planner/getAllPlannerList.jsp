<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    
    <!-- Our Own Resources -->
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">


<script type="text/javascript">
function fncGetList(currentPage) {

	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action","/planner/getPlannerList").submit();
	}

$(function() {

	$('h5').on("click",function(){

self.location = "/planner/getPlanner?plannerCode="+$(this).children("#plannerCode").text().trim();


});
});
</script>

<!--  //////////////////////////////////////////////////////////////////////////////////// -->

<style>
body {
padding-top: 70px;
}

.dropdown:hover .dropdown-menu {
display: block;
}
</style>

</head>
<!-- NAVBAR
================================================== -->
<body>
<!--  /////////////////////////////////////-->
<header><jsp:include page="/layout/header.jsp" /></header>

<div class="container">
<div class="page-header text-info">
<h3></h3>
</div>

<!-- table 위쪽 검색 Start /////////////////////////////////////-->

<form class="form-inline" name="detailForm">

<div class="col-md-6 text-left">
<p class="text-primary">전체  ${resultPage.totalCount } 건, 현재
${resultPage.currentPage} 페이지</p>
</div>

<input type="hidden" id="currentPage" name="currentPage" value="" />

</form>
</div>

<!-- table 위쪽 검색 Start /////////////////////////////////////-->
<br>
<br>

<div class="container marketing">
<div class="row">


<c:forEach var="planner" items="${list}">
<div class="col-lg-4">
<c:set var="i" value="0" />
<c:set var="i" value="${ i+1 }" />

<img class="img-square"
src="/resources/images/planner/${planner.plannerImage}"
alt="Generic placeholder image" width="350" height="350" id="img">

<h5> &nbsp;${planner.plannerName}<div id=plannerCode style="display: none">${planner.plannerCode}</div>
</h5>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/resources/images/profile/${planner.plannerWriter.profileImg}"  class="rounded-circle" id="userProfile" name="userProfile"  width="55px" height="40px">
${planner.plannerWriter.nickname}</p>
<p>

</div>

</c:forEach>


</div>

<!-- FOOTER -->
<footer>
<p class="pull-right" role="button">
<a href="#"> back to top </a>
</p>

</footer>

</div>


<!-- /.container -->

</body>
</html>

