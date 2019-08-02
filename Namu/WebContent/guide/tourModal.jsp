<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="modalTourList" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">관광지</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="tourBody modal-body">
      
	
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
//클릭한 페이지 , 키워드
// function selectTourModal(keyword) {
	
		
	function tourModal(searchKeyword) {
	$.ajax({
		url : '/guide/json/selectTourPage',
		method : 'POST',
		data : JSON.stringify({
			pageNum : '1',
			keyword : searchKeyword,
			address : 'tour'
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(JSONData , status) {
			
			$('.tourBody').empty();
			
			$.each(JSONData, function(index,item){
			
			$('.tourBody').append(
				'<div class="preview-'+(index+1)+' row mb-1">'
				+'<input type="hidden" name="tourId" value="'+item.tourId+'">'
				+'<div class="col-md-12">'
				+'<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">'
				+'<div class="col p-4 d-flex flex-column position-static">'
				+'<strong class="d-inline-block mb-2 text-primary">'+item.tourLoc+'</strong>'
				+'<h3 class="mb-0">'+item.tourName+'</h3>'
				+'<div class="mb-1 text-muted">'+item.hashtag+'</div>'
				+'<p class="card-text mb-auto">'+item.tourShortDesc+'</p>'
				+'<a href="#" class="stretched-link"></a>'
				+'</div>'
				+'<div class="col-auto d-none d-lg-block">'
				+'<img src="'+item.tourThumb+'"  width="250" height="250">'
				+'</div>'
				+'</div>'
				+'</div>'
				+'</div>'
			);
			
			})
		}
 	})
	}

// }

</script>
</body>
</html>