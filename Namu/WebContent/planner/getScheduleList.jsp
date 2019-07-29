<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
	
	
<!-- <script src="http://maps.google.com/maps/api/js?key=AIzaSyBbf0HKJJ4i60j9RDc4qMj_bNR7prq4FxI"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

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
/*  . {
  display:inline-block; width:200px; height:100px; background-color:#666666; margin-left:10px;}  
 */
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
	background-color: #a3daff; 
/*   border: 5px solid #3571B5; */
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
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
  background-color: #232c37;
  color: #fff;
}

#submit, #reset, #close{
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
 /*  border: 1px solid #304a8a; */
  background-color: #cbcbcb;
  font-size: 13px;
  color: #fff;
  line-height: 25px;}
  
#submit:hover, #reset:hover, #close:hover {
/*   border: 1px solid #091940; */
  background-color: #232c37;
  color: #fff;
}

</style>

<script>
function onchangeDay(yy,mm,dd,ss){ 
	 $("#nows").html(yy+"."+mm+"."+dd+".("+ss+")"); 
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
$(function () {
	//initialize  calendar
	
		//alert(departDate);
/* 		var ddd = String(departDate);	
		var yyyy = ddd.substring(0,4);
		var mm = ddd.substring(4,6)
		var dd = ddd.substring(6,8) 
		var ddate= new Date();  */

		/* var dd = departDate.getDate();
		var mm = departDate.getMonth()+1; //January is 0! */
		/* var yyyy = departDate.getFullYear(); */
		/* ddate=yyyy+'-'+mm+'-'+dd; */
		/* alert(ddd.substring(0,4)); */
		
		
/* 	  var plannerCode=${planner.plannerCode}; */
		   $('#calendar').fullCalendar({
			   
			    events: function(start, end, timezone, callback) {  
		         /* $.ajax({
		                url: '/planner/getRouteList',
		                type : 'post',
		                data : { startDate :  start.format('YYYY-MM-DD'), endDate : end.format('YYYY-MM-DD') },
		                dataType: 'json',
		               	
		                success: function(data) {
		                   var events = [];
		                   $(data).each(function() {
		                	    alert(data);
		                        events.push({
		                           title: $(this).attr('title'),
		                            start:moment( $(this).attr('start')),
		                            end: $(this).attr('end'),
		                            color: $(this).attr('color'),
		                            id: $(this).attr('id'),
		                        
		                        });
		                    });
		                   
		                   
		                   
		                   callback(events);
		                }
		            });
			    },  */
			        /* $.ajax({
	   	                url: '/planner/getRouteList',
	   	                type : 'post',
	   	                data : { startDate :  start.format('YYYY-MM-DD HH:MM'), endDate :  end.format('YYYY-MM-DD HH:MM') },
	   	                dataType: 'json',
	   	               	
	   	                success: function(data) {
	   	                   var events2 = [];
	   	                   $(data).each(function() {
	   	                        events2.push({
	   	                           title: $(this).attr('title'),
	   	                            start:moment( $(this).attr('start')),
	   	                         color: $(this).attr('color'),
	   	                            id: $(this).attr('id') ,
	   	                         end:  moment($(this).attr('end')) 
	   	                  
	   	                    });
	                    callback(events2);
	                }
	                   }); 
	       
	     }, 	 */
	        /////////////////////////////////////////////////////////////////
	       $.ajax({
	   	                url: "/planner/getScheduleList",
	   	                type : 'post',
	   	                data : { startDate :  start.format('YYYY-MM-DD HH:MM'),endDate :  end.format('YYYY-MM-DD HH:MM') },
	   	                dataType: 'json',
	   	               	
	   	                success: function(data) {
	   	                   var events2 = [];
	   	                   $(data).each(function() {
	   	                        events2.push({
	   	                           title: $(this).attr('title'),
	   	                            start:moment( $(this).attr('start')),
	   	                         color: $(this).attr('color'),
	   	                            id: $(this).attr('id') ,
	   	                         end: $(this).attr('end') ,
	   	                      allDay:$(this).attr('allDay') 
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
		     
		      /* defaultDate: ddate,  */
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		     /* dayClick: function(date) { */
		    /*       var date = (moment(date).format('YYYY-MM-DD'));
		          document.getElementById("startDate").value=date;
		          layer_open("layer1");
		         },   */ 
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
		    
		     ////////////////////////////////////////////////////////
		   eventClick: function(event, element) {
		    	/*  alert(event.id); */
		    	 var scheCode=event.id;
	
					$.ajax( 
							{
								url : "/planner/json/getSchedule/"+event.id ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"일정 : "+JSONData.scheName+"<br/>"
																+"장소 : "+JSONData.scheDetail+"<br/>"
																+"일정상세내용 : "+JSONData.scheDetail+"<br/>"
																;
																 $('#getSchedule' ).html(displayValue);
			
							/* 		alert(displayValue); */
				
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
		  });
		  
		
</script>


<script type="text/javascript">
 $(function() {
  $("#color").spectrum({
   flat: false,
   showInput: true,
   preferredFormat: "hex",
   color: "#000000"
  });
 });
</script>
</head>

<body>
	<%-- <header><jsp:include page="/layout/header.jsp" /></header> --%>
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
<div  id="calendar"><p class="date" id="nows"></p>
 </div>


<!--일정 등록 팝업  -->
<div style="height: 300px;"></div>
<a href="#layer1" class="btn-example"></a>
<div id="layer1" class="pop-layer">
<div class="pop-container">
        <div class="pop-conts">
            <div class="addSchedule">
          <form name="scheForm" id="scheForm" action="/planner/addSchedule" method="post">
          <h3 class="title"> 일정 등록  </h3> 
    		<br/><br/>
           <p> 날짜 &nbsp;&nbsp;&nbsp;&nbsp;  <input type="date" name="scheDay" id="scheDay"/> 
          <p>  일정 &nbsp;&nbsp;&nbsp;&nbsp;  <input type="text" name="scheName"/>    
           <p> 일정시작시간 &nbsp;&nbsp;&nbsp;<input type="text" step="1800" name="timeHour"/>
           <p> 일정장소 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="schePlace"/>
           <p> 일정상세 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="scheDetail"/>
           <p> 표시 색상 선택&nbsp;&nbsp; <input type="color" name="color" id="color"  style="width:100px;">
          <br/><br/><br/>
        <p><input type ="submit" value="등록" id="submit">
        <input type ="reset" value="취소" id="reset">	
       	<input type='button' id="close"  value='닫기'/>
		</form>
		</div></div> </div></div></div>
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
          <h3 class="title"> 일정 상세   </h3> 
    		<div id="getSchedule"></div>
        <p><input type ="submit" value="수정" id="submit">
       	<input type='button' id="close"  value='닫기'/>
	
		</div></div> </div></div></div>
<br/><br/>

<!--  모 -->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>