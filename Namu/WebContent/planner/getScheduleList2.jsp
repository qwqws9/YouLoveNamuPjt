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



  display:inline-block; width:200px; height:100px; background-color:#666666; margin-left:10px;}  
 */
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 600px;
        margin : 0 auto;
    }
    #calendar2 {
        max-width : 600px;
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

function layer_open(el){
	
    var $el = $('#'+el);   
    var isDim = $el.prev().hasClass('dimBg');   
    var isDi = $el.prev().hasClass('diBg');  
    
    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
    isDi ? $('.di-layer').fadeIn() : $el.fadeIn();
    
    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

   /*  $el.css({
    	"top": (($(window).height() -$elHeight )/2+$(window).scrollTop())+"px",
       "left":  (($(window).width()-$elWidth) /2+$(window).scrollLeft())+"px"
    }); */

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
        isDi ? $('.di-layer').fadeOut() : $el.fadeOut(); 
        return false;
    });

/*     $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });
 */
}



$(function () {
	//initialize  calendar
	console.log("출발일"+departDate);
	var plannerCode=${planner.plannerCode};
	var departDate=${planner.departDate};

	var ddd = String(departDate);	
	var yyyy = ddd.substring(0,4);
	var mm = ddd.substring(4,6);
	var dd = ddd.substring(6,8) ;
	
	var ddate= new Date(); 
	ddate=yyyy+'-'+mm+'-'+dd;
		   $('#calendar').fullCalendar({
			   
			   events: function(start, end, timezone, callback) {  
			        /////////////
				    	$.ajax({
		   	                url: "/planner/json/getScheduleList/"+plannerCode,
		   	                type : 'GET',
		   	            	 data : { startDate :  start.format('yyyy-MM-dd HH:mm:ss'),endDate :  end.format('yyyy-MM-dd HH:mm:ss') },
		   	                dataType: 'json',
		   	                success: function(data) {
		   	                   var events = [];
		   	                $(data).each(function() {
	   	                        events.push({
	   	                           title: $(this).attr('title'),
	   	                            start: $(this).attr('start'),
	   	                         color: $(this).attr('color'),
	   	                            id: $(this).attr('id') ,
	   	                         	end: $(this).attr('end'),
	   	                      		allDay:  $(this).attr('allDay') 
		   	                        });
	   	                   
		   	                     console.log(events);
		   	                  
		   	                    });
		                    callback(events);
		                }
		                   }); 
		       
		     }, 	 
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month'
		      },
		     
		      defaultDate: ddate,  
		      editable: true,
		      droppable: true, 
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
		        	   layer_open('#layer1');
		        	   onchangeDay(yy,mm,dd,ss);
		        	     },  

		     eventLimit: true,
		    
		     ////////////////////////////////////////////////////////
		    eventClick: function(event, element) {
		    	if(event.end!=null){
  					var displayValue = 
  					'<button type="button" style="border-radius:10px;border:0;width:200px;height:60px;background:#F2C029;color:#ffffff; " id="tourModal" >'+event.id+'<p> 관광지 살펴보기 </button><input type="hidden" value="'+event.id+'">'
  					$('#getSchedule' ).html(displayValue);
  				
			layer_open('layer2');
  			
  				}else{
  				
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
														+'<div class="col-md-8"><input type="text" id ="alarm" name="timeHour" value="'+JSONData.timeHour+'"/> </div> '
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
			
				/* 	alert(displayValue); */
				
								}
						});
					 layer_open('layer2');
  				}
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
$(function () {
	//initialize  calendar
	
var departDate=${planner.departDate};
	console.log(departDate); 
	var ddd = String(departDate);	
	var yyyy = ddd.substring(0,4);
	var mm = ddd.substring(4,6);
	var dd = ddd.substring(6,8) ;
	
	var ddate= new Date(); 
	ddate=yyyy+'-'+mm+'-'+dd;
	  var plannerCode=${planner.plannerCode};
	  
		   $('#calendar2').fullCalendar({
			   
			    events: function(start, end, timezone, callback) {  
		        /////////////
			    	$.ajax({
	   	                url: "/planner/json/getScheduleList/"+plannerCode,
	   	                type : 'GET',
	   	             	data : { startDate :  start.format('yyyy-MM-dd HH:mm:ss'),endDate :  end.format('yyyy-MM-dd HH:mm:ss') },
	   	                dataType: 'json',
	   	                success: function(data) {
	   	                   var events = [];
	   	                $(data).each(function() {
   	                        events.push({
   	                           title: $(this).attr('title'),
   	                            start: $(this).attr('start'),
   	                         color: $(this).attr('color'),
   	                            id: $(this).attr('id') ,
   	                         end: $(this).attr('end'),
   	                      allDay: $(this).attr('allDay')
	   	                        });
	   	                     
	   	                    });
	                    callback(events);
	                }
	                   }); 
	       
	     }, 	 
	     defaultView: 'agendaWeek',
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'agendaWeek,listDay'
		      },
		      defaultDate: ddate,  
		      editable: true,
		      droppable: true, 
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
		    	if(event.end!=null){
  					var displayValue = 
  					'<button type="button" style="border-radius:10px;border:0;width:200px;height:60px;background:#F2C029;color:#ffffff; " id="tourModal" >'+event.id+'<p> 관광지 살펴보기 </button><input type="hidden" value="'+event.id+'">'
  					$('#getSchedule' ).html(displayValue);
  				
			layer_open('layer2');
  			
  				}else{
  				
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
			
				console.log(displayValue);
				
								}
			
						});
					 layer_open('layer2');
		    }
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
</head>

<body>


<!--캘린더  -->
<br><br><br><br>

 <div class="col-md-12" >	
<div class="row"> 
<div class="col-md-1"></div>
<div class="col-md-5 ">
<div  id="calendar">
 </div></div>

 <div class="col-md-5">
 <div  id="calendar2">
 </div> </div>
  <div class="col-md-1"></div>
 </div></div>
 <jsp:include page="/planner/getSchedule2.jsp" />
</body>
</html>