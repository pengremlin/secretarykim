<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	
<se:authentication property="name" var="LoginUser" />	

<!-- Favicon -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var websocket = null;
	var first = "true";
	$('#sendBtn').attr("disabled", true);
	
	
	$(document).ready(function() {
		//var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/'+'${roomId}'; // 원본
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/mypage/'+'${roomId}';
		websocket = connection(url);
		
		websocket.onopen = function(){
			send('${LoginUser}');
			$('#sendBtn').attr("disabled", false);
		};

		websocket.onmessage = function(message) {
			processMessage(message);
			//console.log(message); //나중에 지우자
		};
		
		websocket.onclose = function() {
			//console.log('Info: WebSocket closed.');
		};
		
		websocket.onerror = function(message) {
			processError(message);
		};
		
		$('#sendBtn').click(function() {
			send(textMessage.value);
			textMessage.value = "";
		});
		
		$('#textMessage').keypress(function(e) {
			if(e.which==13) {
				send(textMessage.value);
				textMessage.value = "";
			}
		});
		
		$('#leaveBtn').click(function() {
			websocket.close();
			window.close();
		});
	});

	function processMessage(message) {
		
		var jsonData = JSON.parse(message.data);
		
		//alert("jsonData: " + jsonData.messageType + "," + jsonData.name +  "," + jsonData.message + "," + jsonData.users  );
		if (jsonData.messageType == "ChatMessageDTO") {
			message = jsonData.name + " : "+ jsonData.message + '\n';
			//display(message);
			
			displaybubble(jsonData);
		} else if (jsonData.messageType == "UsersMessageDTO") {
			var other = "";
			for(var i = 0; i<jsonData.ids.length; i++) {
				if ("${LoginUser}"!=jsonData.ids[i]) {
					$('#ids').append(jsonData.ids[i]+"님과 대화를 시작합니다.");
					other = jsonData.ids[i];
					first = "false";
				}
			}
			if(first=="false" && other=="") {
				$('#ids').empty();
				$('#ids').append("대화를 종료합니다.");
			} 
		}
	}
	
	function connection(url) {
		var websocket = null;
		if ('WebSocket' in window) {
			websocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return websocket;
	}

	function send(message) {
		websocket.send(JSON.stringify({ 'message' : message , 'room' : "${roomId}"}));
	}
	
	function display(message) {
		
	}
	
	function displaybubble(data) {
		
		//message = jsonData.name + " : "+ jsonData.message + '\n';
		if (data.name == "${LoginUser}") {
			
			$('#chat').append("<div class='messageR' style='background-color: #f8ac59; font-size:1.2em; font-weight:bold;'>"+data.name+"(나)<div class='chat-message right'>"+data.message +"</div></div>");
	      	    
		} else {
		    $('#chat').append("<div class='messageL' style='background-color: #1ab394; font-size:1.2em; font-weight:bold;'>"+data.name+"(상대)<div class='chat-message left'>"+data.message+"</div></div>");
		}
		$("#chat").scrollTop($("#chat")[0].scrollHeight + 20);
	}

	function processError(message) {
	}

 	window.onbeforeunload = function() {
		websocket.close();
		
	};  
</script>




	<div class="container">
	<div class="chat-discussion" id="chat">

	       <div id="ids" style="font-size:1.5em;"></div>

	    <hr/>
	</div>
	<br/>
	<table>
	<tr>
		<td>
			<div class="top-padding center">
			<input placeholder="입력" class="form-control" id="textMessage" type="text" style="width: 340px; position:absolute;">
			<input style="position:absolute; float:right; left:360px;" type="button" class="btn btn-success btn-md" id="sendBtn" value="전송">
			<input style="position:absolute; float:right; left:417px;" type="button" class="btn btn-danger btn-md" id="leaveBtn" value="나가기">
			</div>
		</td>
		<td>
			<div class="livicon block" data-n="rocket" data-s="48" data-op="0" data-c="#738d00" data-hc="0"></div>
		</td>
		<td>
			<div class="livicon block" data-n="rocket" data-s="48" data-op="0" data-c="#738d00" data-hc="0"></div>
		</td>
	</tr>
	</table>
	</div>
	


