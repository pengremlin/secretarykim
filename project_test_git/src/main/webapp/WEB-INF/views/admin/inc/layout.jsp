<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title><tiles:getAsString name="title" /></title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<link href="../resources/css/bootstrap.min.inspinia.css"
	rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">


</head>

<body>
	<div id="wrapper">
		<!-- Navi 영역 -->
		<tiles:insertAttribute name="navi" />

		<!-- Header  영역  -->
		<tiles:insertAttribute name="header" />

		<!-- Main 영역 -->
		<tiles:insertAttribute name="content" />

		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="../resources/js/lib/jquery-2.1.1.js"></script>
<script
	src="../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Mainly scripts -->
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<!-- Flot -->
<script src="../resources/js/plugins/flot/jquery.flot.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="../resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../resources/js/demo/peity-demo.js"></script>

<!-- iCheck -->
<script src="../resources/js/plugins/iCheck/icheck.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="../resources/js/inspinia.js"></script>
<script src="../resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="../resources/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="../resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../resources/js/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="../resources/js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="../resources/js/plugins/toastr/toastr.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$('button[name^="admin-"]').click(function() {
		
		$.ajax({	
			type : "post",
			url : "masterlist.htm", 
			data : {"user_id" : $(this).val()},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var dataAuth = data.authlist;
			
				$('#listmodi').remove();
				
				var html = '';
                html += '<form id="authlist" name="authlist" action="${pageContext.request.contextPath}/admin/mastersubmit.htm" method="post">';
                html += '<table class="table">';
                html += '<tr>';
				html += '<th>아이디</th><td class="td">';	
                html += '<input type="text" name="user_id" readonly value="'+dataAuth.user_id+'">';
                html += '</td></tr>';
                html +=	'<tr><th>이름</th><td class="td">';
				html += '<input type="text" name="user_name" readonly value="'+dataAuth.user_name+'">';
				html += '</td></tr>';
				html +=	'<tr><th>핸드폰번호</th><td class="td">';
				html += '<input type="text" name="user_ph" readonly value="'+dataAuth.user_ph+'">';
				html += '</td></tr>';
				html +=	'<tr><th>주소</th><td class="td">';
				html += '<input type="text" name="user_add" readonly value="'+dataAuth.user_add+'">';
				html += '</td><h4>이 계정에 권한을 부여 하시겠습니까?</h4></tr>';
				html += '</table>';
				html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="authlist()">권한 등록</button>';
				html += '<button type="reset" class="btn btn-primary btn-block" onclick="authlist()">취소</button>';
				html += '</form>';
				
                $("#modiBody").html(html);
                $('#buyDialog').modal('show'); 
			}
		});
	});
});
</script>
</body>
</html>