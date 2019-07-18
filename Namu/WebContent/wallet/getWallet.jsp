<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pop_wrap_get">
	<div class="scroller">
		<div class="padding_boxing">
			<div class="text_width">
				<div class="input_date">${wallet.regDate}</div>
				<div class="top_input clear">
					<div class="input_category">
						<c:if test="${wallet.category eq 0}"><i class="fas fa-coins"></i></c:if>
						<c:if test="${wallet.category eq 1}"><i class="fas fa-utensils"></i></c:if>
						<c:if test="${wallet.category eq 2}"><i class="fas fa-shopping-cart"></i></c:if>
						<c:if test="${wallet.category eq 3}"><i class="fas fa-landmark"></i></c:if>
						<c:if test="${wallet.category eq 4}"><i class="fas fa-plane"></i></c:if>
						<c:if test="${wallet.category eq 5}"><i class="fas fa-subway"></i></c:if>
						<c:if test="${wallet.category eq 6}"><i class="fas fa-bed"></i></c:if>
						<c:if test="${wallet.category eq 7}"><i class="fas fa-skating"></i></c:if>
						<c:if test="${wallet.category eq 8}"><i class="fas fa-ellipsis-h"></i></c:if>
					</div>
					<div class="input_money">
						<div>
							<span>
								<c:if test="${wallet.moneyUnit eq 'KRW'}"><i class="fas fa-won-sign"></i></c:if>
								<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
								<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
							</span>
						</div>
						<div>
							<span>
								<c:if test="${wallet.moneyUnit ne 'KRW'}">
									<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.exchangePrice}" pattern="#,###.00" />
								</c:if>
							</span>
						</div>
					</div>
					<%-- <c:if test="${! empty wallet.payer}"> --%>
						<div class="input_payer">
							<span>결제자</span><span>미니미니</span>
						</div>
					<%-- </c:if> --%>
				</div><!-- //top_input -->
				<c:if test="${wallet.part eq 0}">
					<div>
						<span>화폐 단위</span><span>${wallet.moneyUnit}</span>
						<c:if test="${wallet.moneyUnit ne 'KRW'}">
							<span>적용 환율</span><span>${wallet.moneyUnit} = KRW <fmt:formatNumber value="${wallet.exchangeRate}" pattern="#,###.00" /></span>
						</c:if>
					</div>
				</c:if>
				<div class="input_item">
					<c:if test="${! empty wallet.item}">
						${wallet.item}
					</c:if>
					<c:if test="${empty wallet.item}">
						<c:if test="${wallet.part eq 0}">예산</c:if>
						<c:if test="${wallet.part eq 1}">지출</c:if>
						추가
					</c:if>
				</div>
				<%-- <c:if test="${! empty wallet.content}"> --%>
					<div class="input_content">아이스아메리카노 먹고싶은데 디카페인 파는데가 근처에 없어ㅠㅠㅠㅠㅠ<%-- ${wallet.content} --%></div>
				<%-- </c:if> --%>
			</div><!-- //text_width -->
			<c:if test="${! empty wallet.walletImage}">
				<img src="/resources/images/wallet/${wallet.walletImage}" alt="${wallet.item} 이미지" class="big_image">
			</c:if>
		</div><!-- //scroller -->
	</div><!-- //padding_boxing -->
	
	<div class="act_btns">
		<a href="javascript:void(0);"class="act_btn update_btn">수정</a><a href="javascript:void(0);" class="act_btn close_btn">닫기</a>
		<!-- <a href="javascript:void(0);" class="act_btn close_btn">닫기</a> -->
	</div>
</div><!-- //pop_wrap_get -->