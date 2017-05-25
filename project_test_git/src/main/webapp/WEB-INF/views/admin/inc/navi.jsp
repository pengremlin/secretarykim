<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#myBtn").click(function() {
							$("#myModal").modal();
						});

						//회사등록요청 유효성 
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

						/*  //회사등록 유효성----------------------------------------------- 
						   $("#registerLogin").click(function(){
						   			var comp_no =$('#comp_no'),
						   			dept_no = $('#dept_no'),
						   			emp_no = $('#emp_no');
						   			
								if(comp_no.val()==""){
									alert('회사번호를 입력해주세요.');
									comp_no.focus();
									return false;
									
								}else if (dept_no.val()=="") {
									alert('부서번호를 입력해주세요');
									dept_no.focus();
									return false;
								
								}else if (emp_no.val()==""){
									alert('대표사원번호를 입력해주세요');
									emp_no.focus();
									return false;
								}else{
									$("#registerform").submit();
								}
								
						   }); */
						/* 	//회사번호 DB에 있는지 확인 
							 $("#comp_no").keyup(function() {

								var comp_no = $('#comp_no')

								$.post("compno_check.htm", {
									comp_no : $('#comp_no').val()
								}, function(data) {
									console.log(data);
									if (data > 0) {
										$("#comp_notest").html('<i class="fa fa-check"></i>');
										comp_no.focus();
										return false;
									
									} else {
						                $("#comp_notest").html('<b> 등록되지 않은 회사번호 입니다.<b>');
						            }
								});
							}); */

						//부서번호 중복확인 
						/*   $("#dept_no").keyup(function() {

							var dept_no = $('#dept_no')

							$.post("deptno_check.htm", {
								dept_no : $('#dept_no').val()
							}, function(data) {
								console.log(data);
								if (data > 0) {
									$("#dept_notest").html('<b> 이미 등록된 부서번호 입니다.</b>');
									dept_no.focus();
									return false;
								}else if(dept_no.val()==""){
									$("#dept_notest").html('<i class="fa fa-ban"></i>');
									dept_no.focus();
									return false;
								} else {
						              $("#dept_notest").html('<i class="fa fa-check"></i>');
						          }
							});
						}); */

						//대표사원번호 중복확인
						/*  $("#emp_no").keyup(function() {

							var emp_no = $('#emp_no')

							$.post("empno_check.htm", {
								emp_no : $('#emp_no').val()
							}, function(data) {
								console.log(data);
								if (data > 0) {
									$("#emp_notest").html('<b> 이미 등록된 대표사원번호 입니다.</b>');
									emp_no.focus();
									return false;
								}else if(emp_no.val()==""){
									$("#emp_notest").html('<i class="fa fa-ban"></i>');
									emp_no.focus();
									return false;
								}  else {
						             $("#emp_notest").html('<i class="fa fa-check"></i>');
						         }
							});
						}); */

						//계정 세션값 유효성 			
						/*   $("#registerBtn").click(function(){
						  	
						  	$.ajax({
						  		url : "userid_check.htm",
						  		type : "post",
						  		dataType : "json",
						  		success : function(data){
						  			console.log(data.user_id);
						  			$('#user_id').val(data.user_id);
						  		}
						  	});
						  	
						      $("#registerModal").modal(); 
						      
						  }); */

						//부서등록 유효성 -----------------------------------------
						$('#deptCheck')
								.click(
										function() {
											var dept_no = $('#dept_notwo'), dept_name = $('#dept_nametwo'), dept_ph = $('#dept_phtwo'), comp_no = $('#comp_no');

											if (dept_no.val() == "") {
												alert('부서번호를 입력해주세요.');
												dept_no.focus();
												return false;

											} else if (dept_name.val() == "") {
												alert('부서이름을 입력해주세요');
												dept_name.focus();
												return false;

											} else if (dept_ph.val() == "") {
												alert('부서전화번호를 입력해주세요');
												dept_ph.focus();
												return false;

											} else if (comp_no.val() == "") {
												alert('회사번호를 입력해주세요');
												comp_no.focus();
												return false;
											} else {
												alert('부서등록 완료');
												document.deptreg.submit();
											}
										});

						//부서등록시 부서번호 중복확인 
						$("#dept_notwo")
								.keyup(
										function() {

											console.log("여기 타는거니?");

											var dept_no = $('#dept_notwo')

											$
													.post(
															"deptno_check.htm",
															{
																dept_no : $(
																		'#dept_notwo')
																		.val()
															},
															function(data) {
																console
																		.log("가져온 데이터 : "
																				+ data);
																if (data > 0) {
																	$(
																			"#dept_notest")
																			.html(
																					'<b> 이미 등록된 부서번호입니다.</b>');
																	dept_no
																			.focus();
																	return false;

																} else if (dept_no
																		.val() == "") {
																	$(
																			"#dept_notest")
																			.html(
																					'<i class="fa fa-ban"></i>');
																	dept_no
																			.focus();
																	return false;

																} else {
																	$(
																			"#dept_notest")
																			.html(
																					'<i class="fa fa-check"></i>');
																}
															});
										});

						//회사번호 DB에 있는지 확인 
						$("#comp_no")
								.keyup(
										function() {

											var comp_no = $('#comp_no')

											$
													.post(
															"compno_check.htm",
															{
																comp_no : $(
																		'#comp_no')
																		.val()
															},
															function(data) {
																console
																		.log(data);
																if (data > 0) {
																	$(
																			"#comp_notest")
																			.html(
																					'<i class="fa fa-check"></i>');
																	comp_no
																			.focus();
																	return false;

																} else {
																	$(
																			"#comp_notest")
																			.html(
																					'<b> 등록되지 않은 회사번호 입니다.<b>');
																}
															});
										});

					});
</script>

<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav metismenu" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<span> <a
						href="${pageContext.request.contextPath}/mypage/mypage.htm"
						class="page-scroll"> <img alt="image" class=""
							src="../resources/img/klogo.png" width=150 height=50 />
					</a>

					</span> <!-- <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"> <strong
								class="font-bold"></strong>
						</span> <span class="text-muted text-xs block">Developer <b
								class="caret"></b></span>
					</span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a href="profile.html">Profile</a></li>
						<li><a href="contacts.html">Contacts</a></li>
						<li><a href="mailbox.html">Mailbox</a></li>
						<li class="divider"></li>
					</ul> -->
				</div>
				<div class="logo-element">K'BS</div>
			</li>
			<li><a href=""><i class="fa fa-star"></i> <span
					class="nav-label">나의 회사</span> <span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li class="active"><a href="${pageContext.request.contextPath}/company/company.htm">KOSTA<span
							class="label label-primary pull-right">NEW</span></a></li>

				</ul></li>
			<li><a href="${pageContext.request.contextPath}/mypage/messageBox.htm"><i
					class="fa fa-envelope"></i> <span class="nav-label">메세지 함</span></a></li>
			<li><a
				href="${pageContext.request.contextPath}/mypage/chatting.htm"><i
					class="fa fa-comment"></i> <span class="nav-label">채팅 하기</span></a></li>
			<se:authorize access="hasAnyRole('ROLE_WAITING','ROLE_ADMIN')">
				<li><a href=""><i class="fa fa-edit"></i> <span
						class="nav-label">회사 관리자 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li id="myBtn"><a>회사 등록 요청<span
								class="label label-primary pull-right">NEW</span></a></li>
						<!-- <li id="registerBtn"><a>회사 등록</a></li> -->
						<li><a href="#" data-toggle="modal" data-target="#deptModal">부서
								등록</a></li>
						<li><a href="#">회사 정보 수정</a></li>
						<li><a href="#">회사 삭제</a></li>

					</ul></li>
			</se:authorize>
			<se:authorize access="hasRole('ROLE_ADMIN')">
				<li class="active"><a href=""><i class="fa fa-edit"></i> <span
						class="nav-label">김비서 관리자 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li id=""><a
							href="${pageContext.request.contextPath}/admin/masterlist.htm">관리자
								권한 등록 리스트</a></li>
						<li><a href="#">회사 정보 수정</a></li>
						<li><a href="#">회사 삭제</a></li>

					</ul></li>
			</se:authorize>
		</ul>

	</div>
</nav>
<!-- email modal -->
<div class="modal fade" id="myModal" role="dialog">
	<form id="emailform" action="email.htm" method="post">
		<fieldset>
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 회사 등록 요청
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>회사명</label> <input type="text"
								class="form-control" id="comp_name" name="comp_name"
								placeholder=""> <span id="help_text"></span>
						</div>
						<div class="form-group">
							<label for="psw"><span class="glyphicon glyphicon-phone"></span>사업자
								번호</label> <input type="text" class="form-control" id="licence"
								name="licence" placeholder=""> <span id="licence_text"></span>
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-phone-alt"></span>이메일</label> <input
								type="text" class="form-control" id="comp_email"
								name="comp_email" placeholder=""> <span id="email_check"></span>
						</div>
						<button type="submit" class="btn btn-success btn-block"
							id="btnLogin" style="background-color: #1AB394" value="">
							<span class="glyphicon glyphicon-off"></span>확인
						</button>
						<a href="index.htm" class="btn btn-success btn-block"
							style="background-color: #1AB394"><span
							class="glyphicon glyphicon-remove">취소</span></a>
					</div>
				</div>

			</div>
		</fieldset>
	</form>
</div>
<!-- 부서등록 -->

<div class="modal fade" id="deptModal" role="dialog">
	<form name="deptreg" action="deptreg.htm" method="post">
		<fieldset>
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 부서 등록
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<table class="table">
							<tr>
								<th><span class="glyphicon glyphicon-th-large"></span>부서번호</th>
								<td class="td"><input type="text" id="dept_notwo"
									name="dept_no"> <br>
								<span id="dept_notest"></span></td>

							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-th-large"></span>부서이름</th>
								<td class="td"><input type="text" id="dept_nametwo"
									name="dept_name"></td>
							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-th-large"></span>부서전화번호</th>
								<td class="td"><input type="text" id="dept_phtwo"
									name="dept_ph"></td>
							</tr>
							<tr>
								<th><span class="glyphicon glyphicon-th-large"></span>회사번호</th>
								<td class="td"><input type="text" id="comp_no"
									name="comp_no"><br> <span id="comp_notest"></span></td>
							</tr>

						</table>

						<button type="submit" class="btn btn-primary btn-block"
							id="deptCheck" data-dismiss="modal">등록</button>
					</div>
				</div>

			</div>
		</fieldset>
	</form>
</div>


<!-- <!-- company register modal -->
<!-- <div class="modal fade" id="registerModal" role="dialog">
	<form id="registerform" action="register.htm" method="post">
		<fieldset>
			<div class="modal-dialog">
				Modal content
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 회사 등록
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>회사 번호</label> <input type="text"
								class="form-control" id="comp_no" name="comp_no"
								placeholder="회사번호를 정확히 입력해 주시기 바랍니다.">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>부서 번호</label> <input type="text"
								class="form-control" id="dept_no" name="dept_no"
								placeholder="회사에 처음 부여될 부서번호 입니다.">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>부서 이름</label> <input type="text"
								class="form-control" id="dept_name" name="dept_name"
								placeholder="처음 회사에 부여될 부서이름 입니다.">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>대표 사원 번호</label> <input
								type="text" class="form-control" id="emp_no" name="emp_no"
								placeholder="대표에게 처음 부여될 사원번호 입니다.">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-home"></span>계정</label> <input type="text"
								class="form-control" id="user_id" name="user_id"
								placeholder="회사 등록을 위해 계정을 정확히 입력해 주시기 바랍니다.">
						</div>
						<button type="submit" class="btn btn-success btn-block"
							id="registerLogin" style="background-color: #1AB394" value="">
							<span class="glyphicon glyphicon-off"></span>확인
						</button>
						<a href="index.htm" class="btn btn-success btn-block"
							style="background-color: #1AB394"><span
							class="glyphicon glyphicon-remove">취소</span></a>
					</div>
				</div>

			</div>
		</fieldset>
	</form>
</div>
 -->
