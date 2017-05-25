<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	
<se:authentication property="name" var="LoginUser" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <script src="resource/js/json2.js"></script>-->
<script>
	//chat 팝업창을 여러개 띄우기 위함	
	var webSocket = null;
	
	$(document).ready(function() {
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint';
		webSocket = connection(url);
		var connectionType;
		
		webSocket.onopen = function(){ processOpen(); };
		webSocket.onmessage = function(message) { processMessage(message); };
		webSocket.onerror = function(message) { processError(message); };
		
	});
	//var webSocket = new WebSocket('ws://' + window.location.host + '/egov-messenger/usersServerEndpoint');
	
	
	function connection(url) {
		var webSocket = null;
		if ('WebSocket' in window) {
			webSocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			webSocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return webSocket;
	}
	
	function processOpen() {
		connectionType = "firstConnection";
		id = "${LoginUser}";
		webSocket.send(JSON.stringify({ "connectionType" : connectionType, "id" : id }));
	}
		
	//server에서 메시지가 넘어왔을때
	function processMessage(message) {
		var jsonData = JSON.parse(message.data);
		
		if (jsonData.allUsers != null) {
			//다른 사용자 접속 시,
			displayUsers(jsonData.allUsers);
		} 
		
		if (jsonData.disconnectedUser != null) {
			//다른 사용자가 접속을 끊을 때,
			$("#"+jsonData.disconnectedUser).remove();
		}
		
		//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
		if (jsonData.enterChatId != null) {
			var roomId = jsonData.enterChatId;
			$("#roomId").val(roomId);
			$("#id").val(jsonData.id);
			openPopup(roomId);
		}
	}
	
	function openPopup(roomId) {
		var popOptions = "width= 500, height= 480, resizable=yes, status= no, scrollbar= yes"; 
		var targetTitle = random(roomId); //두명의 사용자가 다른 팝업으로 뜨기 위해서 targetTitle을 랜덤으로 만들어준다.
		popupPost("<c:url value='/mypage/chattingRoom.htm'/>", targetTitle, popOptions);
	}
	
	function popupPost(url, target, option) {
		window.open("", target, option);
		
		var form = $("form[name=usersForm]");
		form.attr("target", target);
		form.attr("action", url);
		form.attr("method", "post");
		form.submit();
	}
	
	
	function displayUsers(userList) {
		var id;
		$("#ids tr:not(:first)").remove();
		for (var i=0; i<userList.length; i++) {
			if("${LoginUser}"==userList[i]) {
				id = userList[i]+"(나)";
			} else {
				id = userList[i];
			}
			$.newTr = $("<tr style='font-size:1.5em;' id="+userList[i]+" onclick='trClick(this)'><td>"+ id +"</td></tr>");
			//append
			$("#ids").last().append($.newTr);
			
		}
	}
	
	//다른 사용자 선택 시, 선택한 사용자 값을 서버에 전달
	function trClick(selectedTr) {
		if (selectedTr.id != null) {
				connectionType = "chatConnection";
				webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTr.id }));
			}
	}
	
	function random(roomId) {
		<%
			String rUid = "";
			for(int i=0; i<8; i++) {
				rUid += (char)((Math.random()*26)+97);
			}
		%>
		return roomId+"."+"<%=rUid%>";
	}
	
	function processError(message) {
		/* messagesTextArea.value += "error...\n"; */
	}

	window.onbeforeunload = function() {
		webSocket.close();
	};
</script>
</head>
<body>
<div class="row border-bottom white-bg dashboard-header">

		<div class="col-md-12">
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header">
								<h2 class="box-title">${LoginUser}님, K-메신저에 오신 것을 환영합니다. </h2>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								
								<form name="usersForm">
		<input type="hidden" id="roomId" name="roomId"/>
		<input type="hidden" id="id" name="id"/>
	<br/>
	note) 본인 외에 대화 상대를 선택하면 대화를 시작 할 수 있습니다. <br/><br/>
	<!-- List -->
	<table id="ids" name="ids" cellspacing='0' style="cursor: pointer;" class="table table-hover"><!-- cellspacing='0' is important, must stay -->
    	<thead><tr><th style="font-size:1.5em;" class="active">접속 중인 사람</th></tr></thead><!-- Table Header -->
    	<tbody><tr><td>접속 중인 사람이 없습니다.</td></tr></tbody>
    </table>
	</form>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
		</div>
	</div>
	

