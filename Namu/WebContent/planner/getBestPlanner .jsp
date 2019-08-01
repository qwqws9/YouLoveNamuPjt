<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
		<div class="col-sm 12">
		 <div class="square_wrap clear" id="bestPlanner">
     <c:forEach var="planner" items="${plannerlist}" end="3">
  
						<div class="square" >
							<input type="hidden" class="plannerCode" value="${planner.plannerCode}" />
							<div
								<c:if test="${! empty planner.plannerImage && planner.plannerImage ne 'NotImage'}">style="background-image: url(/resources/images/planner/${planner.plannerImage})"</c:if>
								<c:if test="${empty planner.plannerImage || planner.plannerImage eq 'NotImage'}">style="background-image: url(/resources/images/wallet/alternative_image.png)"</c:if>
							>
								<div>
									<div class="plan_name text_shadow" id="plannerName">${planner.plannerName}</div>

									<div class="plan_period text_shadow">${planner.departDate} ~</div>
									<div class="plan_budget text_shadow"></div>
								<div class="wallet_is">
										<div class="btn-group btn-group-toggle isWallet" data-toggle="buttons" style=" visibility:hidden">
											<label class="btn btn-secondary">
												<input type="radio" name="options" id="opened" autocomplete="off"><span class="txt">사용중</span>
											</label>
											<label class="btn btn-secondary active">
												<input type="radio" name="options" id="closed" autocomplete="off" checked><span class="txt">사용안함</span>
											</label>
										</div>
									</div> 
								</div>
							</div>
						</div>
				</c:forEach>
			</div>
		</div></div>
	

</body>
</html>