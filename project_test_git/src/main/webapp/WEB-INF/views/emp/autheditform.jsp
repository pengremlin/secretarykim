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
						<h3>사원 정보</h3>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="text-align: center;">아이디</th>
								<th style="text-align: center;">사원번호</th>
								<th style="text-align: center;">입사일</th>
								<th style="text-align: center;">직급이름</th>
								<th style="text-align: center;">등록</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${emplist}">
								<tr>
									<td style="text-align: center; vertical-align: middle">${list.user_id}</td>
									<td style="text-align: center; vertical-align: middle">${list.emp_no}</td>
									<td style="text-align: center; vertical-align: middle">${list.emp_date}</td>
									<td style="text-align: center; vertical-align: middle">${list.job_name}</td>
								<%-- 	<td style="text-align: center; vertical-align: middle">${list.user_gender}</td>
									<td style="text-align: center; vertical-align: middle">${list.user_ph}</td> --%>
									<td style="text-align: center; vertical-align: middle">
										<button name="subemp-${list.user_id}" value="${list.user_id}"
											class="btn btn-info" data-toggle="modal"
											data-target="#subuserDialog">추가 권한 등록</button>
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
<div class="modal inmodal fade inl" id="subuserDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="subuserlist"
		action="${pageContext.request.contextPath}/emp/subsubmit.htm"
		method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">추가권한 부여</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div id="userBody">
						<h4>이 계정에게 추가 권한을 부여 하시겠습니까?</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td><input class="form-control" type="text" id="user_id"
									name="user_id" readonly value="" size="60"></td>
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
							<tr>
								<th>권한 부여</th>
								<td><select name="auth_name" class="form-control">
										<se:authorize
											access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_GOODS_MANAGER')">
											<option value="ROLE_GOODS_WRITE">영업팀 쓰기 권한</option>
											<option value="ROLE_GOODS_DELETE">영업팀 삭제 권한</option>
											<option value="ROLE_GOODS_MODI">영업팀 수정 권한</option>
										</se:authorize>
										<se:authorize
											access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_MANAGER')">
											<option value="ROLE_EMP_WRITE">인사팀 쓰기 권한</option>
											<option value="ROLE_EMP_DELETE">인사팀 삭제 권한</option>
										</se:authorize>
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