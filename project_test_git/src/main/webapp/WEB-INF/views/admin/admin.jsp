<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- admin view -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<table class="table table-bordered">
						<thead>
						    <th>아이디</th>
							<th>이름</th>
							<th>Email</th>
							<th>생일</th>
							<th>PASSWORD</th>
							<th>성별</th>
							<th>핸드폰 번호</th>
							<th>등록</th>
						</thead>
						<tbody>
							<c:forEach var="list" items="${masterlist}">
								<tr>
									<td>${list.user_id}</td>
									<td>${list.user_name}</td>
									<td>${list.user_email}</td>
									<td>${list.user_birth}</td>
									<td>${list.user_pwd}</td>
									<td>${list.user_gender}</td>
									<td>${list.user_ph}</td>
									<td>
										<button name="admin-${list.user_id}"value="${list.user_id}" 
											class="btn btn-primary" data-toggle="modal"
											data-target="#buyDialog">등록</button>
										<button
											onclick="location.href='${pageContext.request.contextPath}/admin/adminDel.htm?user_id=${list.user_id}'"
											id="delRet" class="btn btn-danger">삭제</button>
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

<!-- admin이 master에게 권한 부여 다이얼로그 -->
<div class="modal inmodal fade inl" id="buyDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">관리자 권한 부여</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="true" id="modiBody">
			</div>

		</div>
	</div>
	</div>
</div>