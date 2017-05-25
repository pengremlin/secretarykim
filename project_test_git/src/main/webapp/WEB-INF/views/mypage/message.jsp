<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">데스크탑 알림 권한 요청</button>
<hr /> -->
<div id="notificationBlock" class="form-group">
	<label class="control-label">알림 메시지</label>
	<div class="input-group">
		<span class="input-group-addon">메시지</span> <input
			id="notificationMessage" type="text" class="form-control" /> <span
			class="input-group-btn">
			<button id="notificationButton" class="btn btn-info" type="button">알림</button>
		</span>
	</div>
</div>


<script type="text/javascript">

var requestPermissionButton = $("#requestPermissionButton");
var notificationButton = $("#notificationButton");
var notificationMessage = $("#notificationMessage");
var iconDataURI = "resources/img/a6.jpg";

/* //데스크탑 알림 권한 요청 버튼을 누르면,
requestPermissionButton.on("click", function () {
	//데스크탑 알림 권한 요청
    Notification.requestPermission(function (result) {

        //요청을 거절하면,
        if (result === 'denied') {
            return;
        }
        //요청을 허용하면,
        else {
            //데스크탑 알림 권한 요청 버튼을 비활성화
            requestPermissionButton.attr('disabled', 'disabled');
            //데스크탑 메시지 입력폼을 활성화
            notificationMessage.removeAttr('disabled');
            //데스크탑 메시지 요청 버튼을 활성화
            notificationButton.removeAttr('disabled');
            return;
        }
    });
}); */


//데스크탑 알림 버튼을 누르면,
notificationButton.on("click", function () {
    var message = notificationMessage.val();
    
    //메시지를 입력한 경우에만,
    if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        }
       
        //데스크탑 알림 요청
        var notification = new Notification("메세지가 왔습니다.", options);
        
        //알림 후 5초 뒤,
        setTimeout(function () {
            //얼람 메시지 닫기
            notification.close();
        }, 5000);
    }
});
</script>
