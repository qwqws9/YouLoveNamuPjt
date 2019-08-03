<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.preview_wrap { width: 1100px; margin: auto; }
	.preview_wrap::after { content: ''; display: block; clear: both; }
	.three_wrap { float: left; width: 33.33%; padding: 12px 15px; }
	.preview_wrap h3 { margin: 0; padding: 0; font-size: 20px; font-weight: 700; line-height: 2.5em; border-bottom: 3px solid #282c37; }
	.preview_wrap h3 span { margin-left: 10px; }
	.preview_cont { margin-top: 20px; padding: 5px; border: 1px solid #cbcbcb; }
	.preview_cont::after { content: ''; display: block; clear: both; }
	.preview_cont img, .preview_cont div { float: left; }
	.preview_cont div { margin-left: 10px; }
	.img_rounded { width: auto; height: 100px; }
</style>

<div class="preview_wrap">
	<section class="three_wrap">
		<h3><span>가볼만한 곳</span></h3>
		<div class="preview_cont">
			<img class="img_rounded" src="/resources/images/wallet/alternative_image.png">
			<div>
				<h5>타이틀</h5>
				<p>내용</p>
			</div>
		</div>
	</section>
	<section class="three_wrap">
		<h3><span>맛집</span></h3>
		<div class="preview_cont">
			<img class="img_rounded" src="/resources/images/wallet/alternative_image.png">
			<div>
				<h5>타이틀</h5>
				<p>내용</p>
			</div>
		</div>
	</section>
	<section class="three_wrap">
		<h3><span>숙소</span></h3>
		<div class="preview_cont">
			<img class="img_rounded" src="/resources/images/wallet/alternative_image.png">
			<div>
				<h5>타이틀</h5>
				<p>내용</p>
			</div>
		</div>
	</section>
</div>