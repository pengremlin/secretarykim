<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('#connectMsgBtn').click(function() {
			var form = $("form[name=msgForm]");
			form.attr("action", "<c:url value='chattingEnter.htm'/>");
			form.attr("method", "post");
			form.submit();
		});
	});
</script>

<body>
<se:authentication property="name" var="LoginUser" />
	<div class="row border-bottom white-bg dashboard-header">

		<div class="col-md-12">
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">${LoginUser}님, K-메신저로 접속합니다. </h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								
								<form name="msgForm" id="msgForm" action="<c:url value='  '/>"
									method="post">
									<c:if test="${LoginUser != null}">
		
		<input type="button" id="connectMsgBtn" name="connectMsgBtn"
											value="메신저 접속" class="btn btn-success btn-lg"/>
									</c:if>
									<c:if test="${LoginUser == null}">
		접속 후 가능한 메뉴입니다. <br />
		로그인 후 이용해주시기 바랍니다.
	</c:if>
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