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
						<tr>
						    <th>권한</th>
							<th>이름</th>
							<th>등록</th>
						</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${authlist}">
								<tr>
									<td>${list.auth_name}</td>
									<td>${list.user_id}</td>
									<td>
										<button name="subauth-${list.user_id}"value="${list.user_id}" 
											class="btn btn-primary" data-toggle="modal"
											data-target="#subauthDialog">등록</button>
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
<div class="modal inmodal fade inl" id="subauthDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="projectlist" action="subauthSumbit.htm" method="post">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">서브 권한 부여</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="true" id="subauthBody">
				<h4>이 계정에 권한을 부여 하시겠습니까?</h4>
				<table>
                <tr>
				<th>아이디</th><td class="td">
                <input class="form-control" type="text" id="user_id" name="user_id" readonly value="">
                </td></tr>
                <tr><th>권한 부여</th><td class="td">
                <select id="auth_name" name="auth_name" class="form-control">
                <option value="ROLE_PROJECT_USER">프로젝트 팀원</option>
                <option value="ROLE_EMP_USER">인사 팀원</option>
                </select>
                </td></tr>
				</table>
				<button type="submit" class="btn btn-primary btn-block">권한 등록</button>
				<button type="reset" class="btn btn-primary btn-block">취소</button>
			</div>
		</div>
	</div>
	</div>
	</form>
</div>