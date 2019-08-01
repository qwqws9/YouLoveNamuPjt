<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script> -->

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	
<!-- <script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>-->
 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

	
	<!-- fullcalendar-->
 	<script type="text/javascript"  src="/resources/javascript/moment.min.js"></script>  
	<script type="text/javascript"  src="/resources/javascript/fullcalendar.js"></script>
	<link  rel="stylesheet"  href="/resources/css/fullcalendar.css" /> 

 	<!-- Font Awesome  -->
	<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
	
	 <!-- bootstrap css-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

	
	<!-- css-->
  	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/planner.css">

	<!-- spectrum -->
	<link rel="stylesheet" type="text/css" href="/resources/css/spectrum.css">
	<script type="text/javascript" src="/resources/javascript/spectrum.js"></script>

<style type="text/css">
input{
background: none; border: 0 none;
}
 .calendar {
  float:left; width:200px; height:100px; background-color:#234234;}
 . {
  display:inline-block; width:200px; height:100px; background-color:#666666; margin-left:10px;}  

    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
   /*  .fc-time{
   display : none;
} */

* {
  margin: 0;
  padding: 0;
}

body {
  margin: 100px;
}

.pop-layer .pop-container {
  padding: 20px 25px;
 
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
background-color: white; 
border-radius:5px ;
 border: 5px solid #a3daff; 
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
   top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  z-index:100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
/*   border: 1px solid #304a8a; */
  background-color: #cbcbcb;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
/*   border: 1px solid #091940; */
  background-color: #cbcbcb;
  color: #fff;
}
.input{
		outline:2px solid ##a3daff;
	}
	$(':focus').blur();  
.input:focus {outline:2px solid ##a3daff;}
	
	h5 {
    width: 100%;
    text-align:center;
}
#submit, #reset, #close{
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
 /*  border: 1px solid #304a8a; */
  background-color: #a3daff;
  font-size: 13px;
  color: #fff;
  line-height: 25px;}
  
#submit:hover, #reset:hover, #close:hover {
/*   border: 1px solid #091940; */
  background-color: #f2c029;
  color: #fff;
}

</style>

<script>
function onchangeDay(yy,mm,dd,ss){ 
	 $("#nows").html(yy+"."+mm+"."+dd+".("+ss+")"); 
	}
function deleteSchedule(){

	 self.location = "/planner/deleteSchedule?scheCode="+$("#scheCode").val();
	}
	    

function layer_open(el){
	//var temp = $('#'+el);
    var $el = $('#'+el);    //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('#close').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); 
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}

/* 
$(document).ready(function(){
	$(document).mousedown(function(e){
		$('.dim-layer').each(function(){
		        if( $(this).css('display') == 'block' )
		        {
		            var l_position = $(this).offset();
		            l_position.right = parseInt(l_position.left) + ($(this).width());
		            l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());


		            if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
		                && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
		            {
		                //alert( 'popup in click' );
		            }
		            else
		            {
		                //alert( 'popup out click' );
		                $(this).hide("fast");
		            }
		        }
		    });
		}); 
		})
 */
function fncAddSchedule(){
	// 유효성 검사 
	
 	var scheName = $("input[name='scheName']").val();
	
	if(scheName == null || scheName.length<1){
		alert("일정명을 입력해주세요.");
		return;
	} 

	$($("#scheForm")).attr("method" , "POST").attr("action" , "/planner/addSchedule").attr("enctype" , "multipart/form-data").submit();
}		


function fncUpdateSchedule(scheCode){
	$.ajax({
		type :"post",
		url :"/planner/updateSchedule",
		data : {id:event.id},
		success : function(contents){
			var lay = $('#layer2');lay.fadeOut();
        	var con = $('#main-container');con.fadeOut();
       		var insert = $('#insertForm-container');insert.fadeIn();
       		$(".insertForm-sdate-li").html("<input type=date name=sdate value="+contents.cl_sdate+"></input><input type=time name=stime step=1800 value="+contents.cl_stime+"></input>");
       		$(".insertForm-edate-li").html("<input type=date name=edate value="+contents.cl_edate+"></input><input type=time name=etime step=1800 value="+contents.cl_etime+"></input>");
       		$(".insertForm-name-li").html("<select name=title><optgroup label=업무일정><option value=회사일정>회사일정</option><option value=지점일정>지점일정</option><option value=부서일정>부서일정</option><option value=개인업무>개인업무</option></optgroup><optgroup label=개인일정><option value=출장>출장</option><option value=연차>연차</option></optgroup></select>");
       		$(".insertForm-suject-li").html("<input type=text placeholder= 제목 name=subject class=subject value="+contents.cl_subject+"></input>");
       		$(".insertForm-place-li").html("<input type=text placeholder= 장소 name=place class=place value="+contents.cl_place+"></input>");
       		
       		$(".insertForm-contents-li2").html("<textarea name=contents class=insertForm-contents placeholder= 내용 >"+contents.cl_contents+"</textarea>");
       		$(".insertForm-hidden").html("<input type=hidden name=num value="+contents.cl_num+"></input>");
		}, 
		error : function(){
			alert("error");
		}
		});
}

 
$(function () {
	
		   $('#calendar').fullCalendar({
			   
			    events: function(start, end, timezone, callback) {  

	        	console.log('1번째');
	        $.ajax({
	   	                url: "/planner/getScheduleList",
	   	                type : 'post',
	   	                data : { startDate :  start.format('yyyy-MM-dd HH:mm:ss'),endDate :  end.format('yyyy-MM-dd HH:mm:ss') },
	   	                dataType: 'json',
	   	               	/* async:false, */
	   	                success: function(data) {
	   	              	console.log('2번째');
	   	                   var events2 = [];
	   	                   $(data).each(function() {
	   	                        events2.push({
	   	                           title: $(this).attr('title'),
	   	                            start: $(this).attr('start'),
	   	                         color: $(this).attr('color'),
	   	                            id: $(this).attr('id') ,
	   	                         end: $(this).attr('end'),
	   	                       allDay: $(this).attr('allDay')
	   	                     
	   	                        });
	   	                     
	   	                     
	   	                    });
	   	                 console.log(data);
	   	              
	                    callback(events2);
	                }
	                   }); 
	     }, 	 
	        
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month,agendaWeek,listDay'
		      },
		     
		      editable: true,
		      droppable: true, 
				
		   		 dayClick: function(date, allDay, jsEvent, view) {
		        	   var yy=date.format("YYYY");
		        	   var mm=date.format("MM");
		        	   var dd=date.format("DD");
		        	   var ss=date.format("dd");
		        	  var date = (moment(date).format('YYYY-MM-DD'));
		        	  document.getElementById("scheDay").value=date;
		        	   layer_open('layer1');
		        	   onchangeDay(yy,mm,dd,ss);
		        	     },  

		    			 eventLimit: true,
		    			  
		    		    eventDrop: function(event, delta, revertFunc) {
		    			
		    		            alert(event.title + "를 " + event.start.format() + " 로 이동합니다");
		    		            if (!confirm("수정하시겠습니까?")) {
		    		                revertFunc();
		    		            } 
		    		        },
		    		    
		     ////////////////////////////////////////////////////////
		  			 eventClick: function(event, element) {
		    	/*  alert(event.id); */
		    		 var scheCode=event.id;
		    	   	console.log('3번째');
		
					$.ajax( 
			
							{
								url : "/planner/json/getSchedule/"+event.id ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								/* async:false, */
								success : function(JSONData , status) {
								   	console.log('4번째');
									var displayValue = 
														'<h5 class="title">일정 보기 </h5><br/><br/>'
														 +'<div class="col-md-12" ><div class="row">'
														+'<div class="col-md-4"><p> 날짜 </p></div>'
														+'<div class="col-md-8"> <input type="date" name="scheDay" id="scheDay" value="'+JSONData.scheDay+'"/></div>' 
														+'</div></div>'
														 
														 +'<div class="col-md-12" ><div class="row">'
														+'<div class="col-md-4"><p>   일정 </p></div> '
														 +'<div class="col-md-8"> <input type="text" name="scheName" value="'+JSONData.scheName+'"readonly/> </div>'
														 +'</div></div>'
														          
														+'<div class="col-md-12" ><div class="row">' 
														+'<div class="col-md-4"> <p> 일정시작시간 </p></div>' 
														+'<div class="col-md-4"><input type="text" name="timeHour" value="'+JSONData.timeHour+'"readonly/></div>'
														+'<div class="col-md-4"><input type="text" name="timeMin" value="'+JSONData.timeMin+'"readonly/></div>'
														+'</div></div>'

														+' <div class="col-md-12" ><div class="row">'
														+'<div class="col-md-4"><p> 일정장소 </p></div>'
														+' <div class="col-md-8"><input type="text" name="schePlace" value="'+JSONData.schePlace+'"readonly/> </div>'
														+'</div></div>'
														 
														 +'<div class="col-md-12" ><div class="row"> '
														+'<div class="col-md-4"> <p> 일정상세 </p></div>'
														 +'<div class="col-md-8"><textarea name="scheDetail"  cols="20" rows="3" readonly> '+JSONData.scheDetail+'" </textarea></div>'
														 +'</div></div>'
														 +'<div class><input type="hidden" id="scheCode" name="scheCode" value="'+JSONData.scheCode+'"></div>'
														+'<br/><br/><br/>';
								
												
																 $('#getSchedule' ).html(displayValue);
			
					/* alert(displayValue); */
				
								}
						});
					 layer_open('layer2');
				
		      }, 
					/////////////////////////////////////////////////////
	
		      drop: function() {
		 
		        if ($('#drop-remove').is(':checked')) {
		         
		          $(this).remove();
		        }
		      }
		
		  });
		  

  $("#color").spectrum({
   flat: false,
   showInput: true,
   preferredFormat: "hex",
   color: "#000000"
  });


 
	 $("a[href='#']").on("click",function(){
	 	
	 	history.go(-1);
	 });
	
	 $("#save").on("click",function(){
		
			var plannerCode  =<%= (int)session.getAttribute("plannerCode")%>
				 self.location = "/planner/getPlanner?plannerCode="+plannerCode;
		 	
		 });
	 });

/* 
$(document).on('click','#delete',function(){

	 tourModal(tourId);
	 $('#tourModalShow').trigger('click');
}) */

</script>
</head>

<body>
	 <header><jsp:include page="/layout/header.jsp" /></header> 
<!-- progress bar  -->
	<div class="container-fluid " id="progress">
      <ul class="progressbar">
          <li > 1 Step</li>
          <li >2 Step </li>
          <li class="active">3 Step</li>
  		</ul>
		</div>
	<br><br><br>
<h4 class="text-center"> 상세 플랜 짜기 </h4>
		<br><br>
<!--캘린더  -->
<div  id="calendar"><!-- <p class="date" id="nows"></p> -->
 </div>

<br><br><br><br>
	 <div class="col-md-10 col-lg-12" >
<div class="row">
   <div class="col-md-6"></div>
      <div class="col-md-4" >
		     <a class="btn btn-default" href="#" role="button"> 이전 단계 </a>
		  
		      <button type="button" class="btn btn-default"  id="save"> 내 플래너 보기  </button>
		      </div></div></div>
		      
		      
		      
<!--일정 등록 팝업  -->

<div style="height: 300px;"></div>
<a href="#layer1" class="btn-example"></a>
<div id="layer1" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="addSchedule">
          <form name="scheForm" id="scheForm" action="javascript:fncAddSchedule();" method="post">
          <h5 class="title"> 일정 등록  </h5> 
    		<br/><br/>
    		
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p> 날짜 </p></div> 
<div class="col-md-8"> <input type="text" name="scheDay" id="scheDay"/></div> 
 </div></div>
 
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"><p>   일정 </p></div> 
 <div class="col-md-8"> <input type="text" name="scheName"/> </div> 
 </div></div>
          
<div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4"> <p> 일정시작시간 </p></div> 
<div class="col-md-4"><select class="custom-select mr-sm-2" id="timeHour" name="timeHour">

  	 <option value='00' selected='selected'>00</option><option value='01'>01</option><option value='02'>02</option><option value='03'>03</option><option value='04'>04</option><option value='05'>05</option><option value='06'>06</option><option value='07'>07</option><option value='08'>08</option><option value='09'>09</option><option value='10'>10</option>
<option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option>
  	 <option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option>
  	 </select>
  	 </div>
<div class="col-md-4"><select class="custom-select mr-sm-2" id="timeMin" name="timeMin">

  	 <option value='00' selected='selected'>00</option><option value='10'>10</option><option value='20'>20</option>
  	 <option value='30'>30</option><option value='40'>40</option><option value='50'>50</option>
  	 </select>
  	 </div>
</div></div>

 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
  <p> 일정장소 </p></div> 
 <div class="col-md-8"><input type="text" name="schePlace"/> </div>
 </div></div>
 
 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
 <p> 일정상세 </p></div>
 <div class="col-md-8"><textarea name="scheDetail"  cols="20" rows="3"></textarea></div>
 </div></div>
 
<div class="col-md-12" >	
<div class="row"> 
<div class="col-md-4">  
 <p> 표시 색상 선택</p></div> 
 <div class="col-md-8"> <input type="color" name="color" id="color"  style="width:100px;"></div>
 </div></div>  
<br/><br/><br/>
       
 <div class="col-md-12" >	
<div class="col-md-4">  
  <input type ="submit" value="등록" id="submit"></div>
    <div class="col-md-4">  
    <input type ="reset" value="취소" id="reset"> </div>
        <div class="col-md-4"> <input type='button' id="close"  value='닫기'/></div>
        </div></div>
       
</div> </div>
        	</form>
		</div></div> 
<br/><br/>




<!--일정 상세 팝업  -->
<div style="height: 300px;"></div>
<a href="#layer2" class="btn-example"></a>
<div class="dim-layer">
<div class="dimBg"></div>
<div id="layer2" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="schedule">
               
   <div id="getSchedule"></div>
    	
<div class="row"> 
 <div class="col-md-4"> <input type ="submit" value="수정" id="update"></div> 
<div class="col-md-4"> <input type ="submit" value="삭제" id="delete" onclick="deleteSchedule();"></div>
<div class="col-md-4"> <input type='button' id="close"  value='닫기' ></div>
	</div></div>
		</div></div> </div></div>
<br/><br/>


<!-- 일정수정 팝업  -->





</body>
</html>