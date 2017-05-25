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







