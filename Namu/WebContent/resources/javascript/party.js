//mapboxgl.accessToken = 'pk.eyJ1Ijoia29zNTY2NyIsImEiOiJjank4cG8yM2cwY3VrM2ZwOTRmaXdweXRwIn0.pmirns4XMt_92FQMsndgyg';
//특수문자 유효성검사
//Space 유효성검사
$(function(){
	var str = document.getElementById('hashtag');
	$(str).on("keyup",function(){
		var special_pattern = /[`,~#!@$%^&*|\\\'\";:\/?]/gi;
		if( special_pattern.test(str.value) == true ){
			$(this).val($(this).val().replace(special_pattern,""));
			alert('특수문자는 사용할 수 없습니다.');
			return false;
		}
		var blank_pattern = /[\s]/g;
		if( blank_pattern.test( str.value) == true){
			$(this).val($(this).val().replace(blank_pattern,""));
		    alert(' 공백은 사용할 수 없습니다. ');
		    return false;
		}
	
	});
});
//Hasgtag
function remove(){
	$(".btn.btn-outline-dark").on("click",function(){
		$(this).remove();
	})
}
function addHashtag(){
	var Hashtag = $("#hashtag").val();
	var count = $(".btn.btn-outline-dark").length;
	if(Hashtag && count < 20){
		$("#hashtagContent").append(
			'<button onclick="remove()" type="button" class="btn btn-outline-dark" style="height: 25px; border-radius: 10px; padding: 0px; padding-left: 1%; padding-right: 1%;">'
		    	+'<span style="font-size: 14px;">#'+Hashtag+'</span>'
		    +'</button>'
		)
		$("#hashtag").val('');
	}else if(count => 20){
		alert("해시태그는 20개까지 지원합니다.")
	}else{
		alert("값을 입력하세요.");
	}
	console.log($(".btn.btn-outline-dark").text().trim());
}
//addParty
function addParty(){
	//제목 유효성 검사
	var title = $("#partyTitle").val();
	if(title == null || title.length<1){
		alert("제목을 입력해 주세요.");
		return;
	}
	var content = $("#partyContent").val();
	if(content == null || content.length<1){
		alert("내용을 작성해 주세요.");
		return;
	}
	var lat = $("#latitude").val();
	var lng = $("#longitude").val();
	if(lat == null & lng == null){
		alert("위치를 선택해 주세요.");
		return;
	}
	var country = $("#country").val();
	var city = $("#city").val();
	if(country == null){
		alert("국가를 선택해 주세요.");
		return;
	}
	if(city == null){
		alert("국가를 선택해 주세요.");
		return;
	}
	var partyStart = $("#partyStart").val();
	var partyEnd = $("#partyEnd").val();
	if(partyStart == null || partyStart.length<1 & partyEnd == null || partyEnd.length<1){
		alert("동행 기간을 정해주세요.");
		return;
	}
	var gender1 = $("#gender1").val();
	var gender2 = $("#gender2").val();
	var gender3 = $("#gender3").val();
	if(gender1 == null  && gender2 == null && gender3 == null){
		alert("희망성별을 선택해주세요.");
		return;
	}
	
	
	var selected = $("#communityBoard option:selected").val();
	if(selected == 2){
		if($("#city option:selected").val() == null){
			alert("도시를 선택해 주세요.")
			return;
		}
	}
	//해시태그 데이터 전송
	var Hashtag = $(".btn.btn-outline-dark").text().trim();
	$("#hashtag").val(Hashtag);
	
	/*var Role = $("#update").val();
	if(Role == "update"){
		$("form").attr("method","POST").attr("action","/community/updateCommunity").attr("enctype" , "multipart/form-data").submit();
	}else{*/
		/*$("form").on( "submit", function( event ) {
			  event.preventDefault();
			  alert( $( "form" ).serialize() );
		});*/
	$("form").attr("method","POST").attr("action","/party/addParty").submit();
	//}
}	
