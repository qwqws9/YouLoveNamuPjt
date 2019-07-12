$(function(){
	// 모달창 오픈
	$(".modal_btn").on("click", function(){
		$(".pop_wrap_parent").hide();
		$(this).next(".pop_wrap_parent").show();
	});
	
	// 모달창 클로즈
	$(".closs_btn").on("click", function(){
		$(".pop_wrap_parent").hide();
	});
});