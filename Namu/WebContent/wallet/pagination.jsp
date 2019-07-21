<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 양쪽 방향 버튼만 -->
<ul>
	<li class="left disabled">
		<a href="javascript:void(0);">PREV</a>
	</li>
	<li class="right">
		<a href="javascript:void(0);">NEXT</a>
	</li>
</ul>

<!-- 양쪽 방향 버튼 display:none 버전 -->
<!--
<ul>
	<c:if test="${resultPage.currentPage > resultPage.pageUnit}">
		<li class="left">
			<a href="javascript:void(0);">&lt;</a>
		</li>
	</c:if>
	<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<li class="<c:if test="${resultPage.currentPage == i}">current_page</c:if> num_page">
			<a href="javascript:void(0);">${i}</a>
		</li>
	</c:forEach>
	<c:if test="${resultPage.endUnitPage < resultPage.maxPage}">
		<li class="right">
			<a href="javascript:void(0);">&gt;</a>
		</li>
	</c:if>
</ul>
-->

<!-- 양쪽 방향 버튼 disabled 버전 -->
<!--
<ul>
	<li <c:if test="${resultPage.currentPage <= resultPage.pageUnit}">class="disabled_a"</c:if>>
		<a href="javascript:void(0);">&lt;</a>
	</li>
	<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<li <c:if test="${resultPage.currentPage == i}">class="current_page"</c:if>>
			<a href="javascript:void(0);">${i}</a>
		</li>
	</c:forEach>
	<li <c:if test="${resultPage.endUnitPage >= resultPage.maxPage}">class="disabled_a"</c:if>>
		<a href="javascript:void(0);">&gt;</a>
	</li>
</ul>
-->