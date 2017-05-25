<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="small-chat-box fadeInRight animated">
	<div class="heading" draggable="true">
	<fmt:formatDate  value="<%=new java.util.Date()%>" var="date" /> 
		<small class="chat-date pull-right"> ${date } </small> Small chat
	</div>
	<div class="content">
		<strong>Timeline activity</strong>
		<div id="smalltimeline" class="vertical-container dark-timeline">
		
	
		
		
		
		
		</div>
	</div>
</div>




<div id="small-chat">

	<span class="badge badge-warning pull-right" id="dnum"></span> <a
		class="open-small-chat"> <i class="fa fa-comments"></i>

	</a>
</div>



<script src="resources/js/jquery-2.1.1.js"></script>
<script>
	
$(document).ready(function() {
	
	
	 
		$.ajax({
			type : "POST",
			url : "timeline2.htm",
			dataType : "json",
			success : function(data) {

				var htmltext = "";
				var maxday = Array();
				
				$.each(data, function(key, value) {
					
					if(parseInt(value.calendar_end)<=0){
						maxday.push(parseInt(value.calendar_end));
					}else{
						value.calendar_end = "+"+value.calendar_end
					}

					htmltext += '<div class="vertical-timeline-block">';
					htmltext += '<div class="vertical-timeline-icon gray-bg">';
					htmltext += '<i class="fa fa-briefcase"></i>';
					htmltext += '</div>';
					htmltext += '<div class="vertical-timeline-content">';
					htmltext += '<p>' + value.calendar_content + '</p>';
					htmltext += '<span class="vertical-date small text-muted">D '
							+ value.calendar_end + 'Day </span>';
					htmltext += '</div>';
					htmltext += '</div>';
					
				});
			
				var r =(maxday.reverse())[0];
				console.log(r);

				if( r== 0){
					$('#dnum').text("D-day");
				}else{
					$('#dnum').text("D"+r);	
				}
	
				 $('#smalltimeline').html(htmltext);  
				
			
			}
		});
		
	

});
</script>


