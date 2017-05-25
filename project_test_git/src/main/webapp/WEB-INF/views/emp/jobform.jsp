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
					<div class="ibox-title">
						<h3>사원 등록</h3>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="text-align: center;">아이디</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">Email</th>
								<th style="text-align: center;">생일</th>
								<th style="text-align: center;">성별</th>
								<th style="text-align: center;">핸드폰 번호</th>
								<th style="text-align: center;">등록</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td style="text-align: center; vertical-align: middle">${list.user_id}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_name}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_email}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_birth}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_gender}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_ph}</td>
									<td style="text-align: center; vertical-align: middle">
										<button name="emp-${list.user_id}" value="${list.user_id}"
											class="btn btn-primary" data-toggle="modal"
											data-target="#userDialog">등록</button>
										<%-- <button name="subemp-${list.user_id}" value="${list.user_id}"
											class="btn btn-info" data-toggle="modal"
											data-target="#subuserDialog">추가 권한 등록</button> --%>
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
<div class="modal inmodal fade inl" id="userDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="userlist"
		action="${pageContext.request.contextPath}/emp/jobsubmit.htm"
		method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">사원 등록</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div id="userBody">
						<h4>이 계정을 사원으로 등록 하시겠습니까?</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td><input class="form-control" type="text" id="user_id"
									name="user_id" readonly value="" size="60"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input class="form-control" type="text" id="user_name"
									name="user_name" readonly value=""></td>
							</tr>
							<tr>
								<th>핸드폰 번호</th>
								<td><input class="form-control" type="text" id="user_ph"
									name="user_ph" readonly value=""></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input class="form-control" type="text" id="user_add"
									name="user_add" readonly value=""></td>
							</tr>
							<tr>
								<th>사원 번호</th>
								<td><input class="form-control" type="text" id="emp_no"
									name="emp_no" value=""></td>
							</tr>
							<tr>
								<th>직급선택</th>
								<td><select id="job_name" class="form-control">
										<option value="">직급선택</option>
										<c:forEach items="${job_list }" var="joblist">
											<option value="${job_list.job_name}"
												id="${job_list.job_name}">${job_list.job_name }</option>
										</c:forEach>
								</select><input type="hidden" id="job_list_selected" name="job_name"></td>
							</tr>
							<tr>
								<th>권한 부여</th>
								<td><select name="auth_name" class="form-control">
										<option value="ROLE_EMP">인사팀</option>
										<option value="ROLE_PROJECT">개발팀</option>
										<option value="ROLE_INVEN">영업팀</option>
								</select>
							</tr>
						</table>
						<button style="margin-top:20px;" type="submit" id="job_button"
							class="btn btn-primary btn-block">사원 등록</button>
						<button type="reset" class="btn btn-warning btn-block"
							 onclick="userlist()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>