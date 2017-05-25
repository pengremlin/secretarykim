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

<link rel="shortcut icon" href="../resources/img/favicon.ico"/>

<link href="../resources/css/bootstrap.min.inspinia.css" rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">


</head>

<body>
		<!-- Navi 영역 -->
		<tiles:insertAttribute name="navi" />

		<!-- Header  영역  -->
		<tiles:insertAttribute name="header" />

		<!-- Main 영역 -->
		<tiles:insertAttribute name="content" />

		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
</body>

<!-- Mainly scripts -->
<script src="../resources/js/jquery-2.1.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../resources/js/plugins/flot/jquery.flot.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="../resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../resources/js/demo/peity-demo.js"></script>

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



<!-- <script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#myBtn").click(function() {
							$("#myModal").modal();
						});

						$("#btnLogin")
								.click(
										function() {
											var comp_name = $('#comp_name'), licence = $('#licence'), comp_email = $('#comp_email');

											if (comp_name.val() == "") {
												alert('회사명을 입력해주세요.');
												comp_name.focus();
												return false;

											} else if (licence.val() == "") {
												alert('사업자 번호를 입력해주세요');
												licence.focus();
												return false;

											} else if (comp_email.val() == "") {
												alert('이메일을 입력해주세요');
												comp_email.focus();
												return false;

											}
										});

						//회사이름 중복확인 
						$("#comp_name")
								.keyup(
										function() {

											var comp_name = $('#comp_name')

											$
													.post(
															"cname_check.htm",
															{
																comp_name : $(
																		'#comp_name')
																		.val()
															},
															function(data) {
																console
																		.log(data);
																if (data > 0) {
																	$(
																			"#help_text")
																			.html(
																					'<b> 이미 등록된 회사명입니다.</b>');
																	comp_name
																			.focus();
																	return false;

																} else {
																	$(
																			"#help_text")
																			.html(
																					'<i class="fa fa-check"></i>');
																}
															});
										});

						//사업자 번호 중복확인
						$("#licence")
								.keyup(
										function() {

											var licence = $('#licence')

											$
													.post(
															"licence_check.htm",
															{
																licence : $(
																		'#licence')
																		.val()
															},
															function(data) {
																console
																		.log(data);
																if (data > 0) {
																	$(
																			"#licence_text")
																			.html(
																					'<b> 이미 등록된 사업자번호 입니다.</b>');
																	licence
																			.focus();
																	return false;

																} else {
																	$(
																			"#licence_text")
																			.html(
																					'<i class="fa fa-check"></i>');
																}
															});
										});

						//이메일 중복확인 
						$("#comp_email")
								.keyup(
										function() {

											var comp_email = $('#comp_email')
											var reg_email = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

											$
													.post(
															"email_check.htm",
															{
																comp_email : $(
																		'#comp_email')
																		.val()
															},
															function(data) {
																console
																		.log(data);
																if (data > 0) {
																	$(
																			"#email_check")
																			.html(
																					'<b> 중복된 email 입니다.</b>');
																	comp_email
																			.focus();
																	return false;

																} else if (!reg_email
																		.test(comp_email
																				.val())) {
																	$(
																			"#email_check")
																			.html(
																					'<b> 이메일 형식이 맞지 않습니다.</b>');
																	comp_email
																			.focus();
																} else {
																	$(
																			"#email_check")
																			.html(
																					'<i class="fa fa-check"></i>');
																}

															});
										});

						$("#registerBtn").click(function() {
							$("#registerModal").modal();
						});

						$("#registerLogin").click(function() {
							$("#registerform").submit();
						});
					});
</script> -->

</html>