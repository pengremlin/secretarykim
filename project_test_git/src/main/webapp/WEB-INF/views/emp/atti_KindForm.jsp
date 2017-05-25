<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-md-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
						<div id="tbl">
							<form name="atti_KindForm"
								action="${pageContext.request.contextPath}/emp/atti_KindWrite.htm"
								method="post">
								<table class="table">
									<tr>
										<th>근태 코드</th>
										<td class="td"><input class="form-control" type="text"
											name="atti_kind_no" required></td>
									</tr>
									<tr>
										<th>근태 명칭</th>
										<td class="td"><input class="form-control" type="text"
											name="atti_kind" required></td>
									</tr>
								</table>

								<se:authorize
									access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_WRITE','ROLE_EMP_MANAGER')">
									<button type="submit" class="btn btn-primary btn-block"
										onclick="att_KindWrite()">입력</button>
								</se:authorize>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="ibox float-e-margins">
				<form
					action="${pageContext.request.contextPath}/emp/atti_KindDelete.htm?atti_kind_no=${b.atti_kind_no}"
					method="post">
					<div class="ibox-title">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="text-align: center; vertical-align: middle;">근태
										코드</th>
									<th style="text-align: center; vertical-align: middle;">근태
										명칭</th>
									<th style="text-align: center; vertical-align: middle;">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="b" items="${list}">
									<tr>
										<td style="text-align: center; vertical-align: middle;">${b.atti_kind_no}</td>
										<td style="text-align: center; vertical-align: middle;">${b.atti_kind}</td>
										<td style="text-align: center; vertical-align: middle;">
											<se:authorize
												access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_DELETE','ROLE_EMP_MANAGER')">
												<button type="submit" class="btn btn-danger btn-md">삭제</button>
											</se:authorize>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>