<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	 $(function() {

		 $( "td:nth-child(1)" ).on("click" , function() {
			
				self.location ="/planner/getPlanner?plannerCode="+$(this).children("#plannerCode").text().trim();
				
		});
		 
	 });
	</script> 
	
</head>

<body>

	
<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No<br>
			<h7 >(no click:구매상세정보)</h7>
			
		</td>
		
		
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID

		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">수령자명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">물품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매일</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">상태</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="planner" items="${list}">
		<c:set var="i" value="${ i+1 }" />
	
	
	<tr class="ct_list_pop">
		<td align="center">
			${ i }<div id=plannerCode style="display:none">${planner.plannerCode}</div>
		</td>
		<td></td>
		<td align="left">
			${user.nickname}
		</td>
		<td></td>
		<td align="left">${planner.plannerName}</td>
		<td></td>
		<td align="left">${planner.plannerName}</td>
		<td></td>
		<td align="left">${planner.plannerName}</td>
		<td></td>
		<td align="left">
		
		반품완료
		
		</td>
		<td></td>
		
		<td align="left">
		d		</td>
		
	</tr>
	<tr>
	
	
		<td id="${planner.user.userCode}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   
	
    	</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>
<div id=map> </div>
</body>

</html>