<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty user}">
	<jsp:forward page="/user/loginView" />
</c:if>

<!DOCTYPE html>
<html>
<head>
   <jsp:include page="/layout/head.jsp" />
   
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   
   <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
   
   <!-- Font Awesome SVG with JavaScript -->
   <script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
   
   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
   
   <!-- Our Own Resources -->
   <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/wallet.css">
   <script type="text/javascript" src="/resources/javascript/wallet.js"></script>
   <script type="text/javascript" src="/resources/javascript/wallet_ajax.js"></script>
</head>
<body>
   <header><jsp:include page="/layout/header.jsp" /></header>
   
   <div class="wrap">
      <h2 class="wallet_title"><span>내 가계부 목록</span></h2>
      
      <section class="wallet_box">
         <h3>다가오는 여행</h3>
         <div class="square_wrap clear">
            <c:forEach var="planner" items="${list}">
               <c:if test="${planner.departDate >= today}">
                  <div class="square" data-planner-code="${planner.plannerCode}">
                     <div
                        <c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">style="background-image: url(/resources/images/planner/${planner.plannerImage})"</c:if>
                        <c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">style="background-image: url(/resources/images/wallet/alternative_image.png)"</c:if>
                     >
                        <div>
                           <div class="plan_name text_shadow">${planner.plannerName}</div>
                           <div class="plan_flag">국기 들어갈 곳</div>
                           <div class="plan_period text_shadow">${planner.departDate} ~</div>
                           <div class="wallet_is">
                              <div class="btn-group btn-group-toggle isWallet" data-toggle="buttons">
                                 <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
                                 </label>
                                 <label class="btn btn-secondary active">
                                    <input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
                                 </label>
                              </div>
                           </div><!-- //wallet_is -->
                        </div>
                     </div>
                  </div><!-- //square -->
               </c:if>
            </c:forEach>
         </div><!-- //square_wrap -->
      </section><!-- //wallet_box -->
      
      <section class="wallet_box">
         <h3>지난 여행</h3>
         <div class="square_wrap clear">
            <c:forEach var="planner" items="${list}">
               <c:if test="${planner.departDate < today}">
                    <div class="square" data-planner-code="${planner.plannerCode}">
                     <div
                        <c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">style="background-image: url(/resources/images/planner/${planner.plannerImage})"</c:if>
                        <c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">style="background-image: url(/resources/images/wallet/alternative_image.png)"</c:if>
                     >
                        <div>
                           <div class="plan_name text_shadow">${planner.plannerName}</div>
                           <div class="plan_flag">국기 들어갈 곳</div>
                           <div class="plan_period text_shadow">${planner.departDate} ~</div>
                           <div class="wallet_is">
                              <div class="btn-group btn-group-toggle isWallet" data-toggle="buttons">
                                 <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
                                 </label>
                                 <label class="btn btn-secondary active">
                                    <input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
                                 </label>
                              </div>
                           </div><!-- //wallet_is -->
                        </div>
                     </div>
                  </div><!-- //square -->
               </c:if>
            </c:forEach>
         </div><!-- //square_wrap -->
      </section><!-- //wallet_box -->
   </div><!-- //wrap -->
</body>
</html>