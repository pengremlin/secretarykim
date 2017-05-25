<%@ page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-content">

					<strong>Chat room </strong> can be used to create chat room in your
					app. You can also use a small chat in the right corner to provide
					live discussion.

				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">

			<div class="ibox chat-view">

				<div class="ibox-title">
					<small class="pull-right text-muted">Last message: Mon Jan
						26 2015 - 18:39:23</small> Chat room panel
				</div>


				<div class="ibox-content">

					<div class="row">

						<div class="col-md-9 ">
							<div class="chat-discussion">

								<!-- 채팅 view start -->
								<h1 style="text-align: center;">Hello World WebSocket
									Client</h1>
								<br>
								<div style="text-align: center;">
									<form action="">
										<input onclick="send_message()" value="Send" type="button">
										<input id="textID" name="message" value="Hello WebSocket!"
											type="text"><br>
									</form>
								</div>
								<div id="output"></div>



								<!-- 채팅 view end -->

							</div>

						</div>
						<div class="col-md-3">
							<div class="chat-users">


								<div class="users-list">
									<div class="chat-user">
										<img class="chat-avatar" src="img/a4.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Karl Jordan</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="img/a1.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Monica Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="pull-right label label-primary">Online</span> <img
											class="chat-avatar" src="img/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Michael Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="pull-right label label-primary">Online</span> <img
											class="chat-avatar" src="img/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Janet Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="img/a5.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Alice Smith</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="img/a6.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Monica Cale</a>
										</div>
									</div>
									<div class="chat-user">
										<img class="chat-avatar" src="img/a2.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Mark Jordan</a>
										</div>
									</div>
									<div class="chat-user">
										<span class="pull-right label label-primary">Online</span> <img
											class="chat-avatar" src="img/a3.jpg" alt="">
										<div class="chat-user-name">
											<a href="#">Janet Smith</a>
										</div>
									</div>


								</div>

							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="chat-message-form">

								<div class="form-group">

									<textarea class="form-control message-input" name="message"
										placeholder="Enter message text"></textarea>
								</div>

							</div>
						</div>
					</div>


				</div>

			</div>
		</div>

	</div>


</div>




</div>

<!-- 모달 창 -->
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
	aria-hidden="true">

	<form action="${pageContext.request.contextPath}/emp/insertlean.htm" method="post">

		<div class="modal-dialog">
			<div class="modal-content animated flipInY">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">내용 추가</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div class="note-editable" contenteditable="true">
						<textarea id="lean_content" name="lean_content"> </textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">내용 저장</button>
				</div>
			</div>
		</div>

	</form>
</div>
<!-- 모달 창 -->


<script type="text/javascript">
		var wsUri = "ws://192.168.0.138:8090/websocket/websocket/echo.do";
		//var wsUri = "ws://localhost:8090/websocket/websocket/echo.do";
		//websocket.*** 웹소켓 뒤에 붙는 함수는 제공하는 합수
		//페이지가 시작되면 WebSocket 객체를 생성해서 onopen함수를 통해 세션을 시작한다
		$(document).ready(function() {
			websocket = new WebSocket(wsUri);
			websocket.onopen = function(evt) {
				onOpen(evt)
			};
			websocket.onerror = function(evt) {
				onError(evt)
			};

		});

		//센드를 클릭하면 text값을 dosend함수에 보내준다
		function send_message() {

			doSend(textID.value);

			//websocket.onmessage를통해 메시지를 받아서 onMessage에 보네준다
			websocket.onmessage = function(evt) {
				onMessage(evt)
			};

		}

		function init() {
			output = document.getElementById("output");
		}

		function onOpen(evt) {
			writeToScreen("Connected to Endpoint!");

		}

		//입력받은것을 화면에 보여준다
		function onMessage(evt) {
			writeToScreen("상대: " + evt.data);
		}
		function onError(evt) {
			writeToScreen('ERROR: ' + evt.data);
		}

		//화면에 찍어주고 웹소켓을 통해 보낸다
		function doSend(message) {
			writeToScreen("나: " + message);

			websocket.send(message);
			//websocket.close();
		}
		function writeToScreen(message) {
			var pre = document.createElement("p");
			pre.style.wordWrap = "break-word";
			pre.innerHTML = message;

			output.appendChild(pre);
		}
		window.addEventListener("load", init, false);
	</script>
