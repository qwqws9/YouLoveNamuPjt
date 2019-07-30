<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="pop_wrap_get">
	<div data-part="${wallet.part}">
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
							<span class="input_expresion">${wallet.expression}</span>
							<div>
								<span>
									<c:if test="${wallet.moneyUnit eq 'KRW'}"><i class="fas fa-won-sign"></i></c:if>
									<c:if test="${wallet.moneyUnit eq 'EUR'}"><i class="fas fa-euro-sign"></i></c:if>
									<c:if test="${wallet.moneyUnit eq 'CHF'}">CHF</c:if>
									<c:if test="${wallet.moneyUnit eq 'GBP'}"><i class="fas fa-pound-sign"></i></c:if>
									<c:if test="${wallet.moneyUnit eq 'CZK'}">CZK</c:if>
									<c:if test="${wallet.moneyUnit eq 'HUF'}">HUF</c:if>
									<fmt:formatNumber value="${wallet.price}" pattern="#,###.00" />
								</span>
							</div>
							<div>
								<c:if test="${wallet.moneyUnit ne 'KRW'}">
									<c:if test="${! empty wallet.krwPrice}">
										<i class="fas fa-won-sign"></i>&nbsp;<fmt:formatNumber value="${wallet.krwPrice}" pattern="#,###.##" />
									</c:if>
								</c:if>
							</div>
						</div><!-- //input_money -->
					</div><!-- //top_input -->
					<c:if test="${wallet.part eq 0}">
						<div class="what_unit">
							<div class="clear">
								<span>화폐 단위</span><span>${wallet.moneyUnit}</span>
							</div>
							<c:if test="${wallet.moneyUnit ne 'KRW'}">
								<div class="clear">
									<span>적용 환율</span><span>${wallet.moneyUnit} 1 = KRW <fmt:formatNumber value="${wallet.exchangeRate}" pattern="#,###.##" /></span>
								</div>
							</c:if>
						</div>
					</c:if>
					<div class="input_item">
						<c:if test="${! empty wallet.item}">
							${wallet.item}
						</c:if>
						<c:if test="${empty wallet.item}">
							<c:if test="${wallet.part eq 0}">예산 추가</c:if>
							<c:if test="${wallet.part eq 1}">지출 추가</c:if>
						</c:if>
					</div>
					<c:if test="${! empty wallet.content}">
						<div class="input_content">${wallet.content}</div>
					</c:if>
				</div><!-- //text_width -->
				<c:if test="${! empty wallet.walletImage}">
					<img src="/resources/images/wallet/${wallet.walletImage}" alt="${wallet.item} 이미지" class="big_image">
				</c:if>
			</div><!-- //padding_boxing -->
		</div><!-- //scroller -->
		
		<div class="act_btns">
			<a href="javascript:void(0);" class="act_btn update_btn">수정</a><a href="javascript:void(0);" class="act_btn delete_btn">삭제</a>
		</div>
		<a href="javascript:void(0);" class="close_btnn"><i class="fas fa-times-circle close_icon"></i><span class="skip">닫기</span></a>
	</div>
</div><!-- //pop_wrap_get -->