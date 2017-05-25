<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!-- admin view -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div  class="ibox float-e-margins">
				<div class="ibox-title">
					<div  class="ibox-title">
						<h3>직급 수정</h3>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="text-align: center">회사 번호</th>
								<th style="text-align: center">사원 번호</th>
								<th style="text-align: center">입사일</th>
								<th style="text-align: center">직급 이름</th>
								<th style="text-align: center">아이디</th>
								<th style="text-align: center">등록</th>
						</thead>
						<tbody>
							<c:forEach var="list" items="${emplist}">
								<tr>
									<td style="text-align: center; vertical-align: middle">${list.emp_no}</td>
									<td style="text-align: center; vertical-align: middle">${list.dept_no}</td>
									<td style="text-align: center; vertical-align: middle">${list.emp_date}</td>
									<td style="text-align: center; vertical-align: middle">${list.job_name}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_id}</td>
									<td style="text-align: center; vertical-align: middle">
										<button name="job-${list.user_id}" value="${list.user_id}"
											class="btn btn-primary" data-toggle="modal"
											data-target="#writeDialog">등록</button> <%-- <button
											onclick="location.href='${pageContext.request.contextPath}/emp/userDel.htm?user_id=${list.user_id}'"
											id="delRet" class="btn btn-danger">삭제</button> --%>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- master가 권한 부여 다이얼로그 -->
<div class="modal inmodal fade inl" id="writeDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="writelist"
		action="${pageContext.request.contextPath}/emp/write.htm"
		method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">직급 수정</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div id="writeBody">
						<h4>직급을 수정 하시겠습니까?</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td><input class="form-control" type="text" id="user_id"
									name="user_id" readonly value="" size="60"></td>
							</tr>
							<tr>
								<th>부서 선택</th>
								<td><select class="form-control" name="auth_name">
										<option value="ROLE_EMP">인사부</option>
										<option value="ROLE_PROJECT">개발부</option>
								</select></td>
							</tr>
							<tr>
								<th>직급선택</th>
								<td><select id="job_name" class="form-control">
										<option value="">직급선택</option>
										<c:forEach items="${job_list }" var="joblist">
											<option value="${job_list.job_name}"
												id="${job_list.job_name}">${job_list.job_name }</option>
										</c:forEach>

								</select><input type="hidden" id="job_name_list_selected" name="job_name"></td>
							</tr>
							<tr>
								<th>권한 리스트</th>
								<td><select id="auth_name" class="form-control">
										<option value="">부여된 권한</option>
										<c:forEach items="${auth_list}" var="authlist">
											<option value="${auth_list.auth_name}"
												id="${auth_list.auth_name}">${auth_list.auth_name}</option>
										</c:forEach>
								</select>
							</tr>
						</table>
						<button style="margin-top:20px;" type="submit" class="btn btn-primary btn-block">사원
							등록</button>
						<button type="reset" class="btn btn-warning btn-block"
							 onclick="writelist()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
