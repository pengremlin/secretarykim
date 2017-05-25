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
				  <div class="ibox-title">
						<h3>팀장급 직급 부여</h3>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<!-- <th>권한</th> -->
								<th style="text-align: center">이름</th>
								<th style="text-align: center">등록</th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${userlist}">
								<tr>
									<%-- <td>${list.auth_name}</td> --%>
									<td style="text-align: center; vertical-align: middle;">${list.user_id}</td>
									<td style="text-align: center; vertical-align: middle;">
										<button name="auth-${list.user_id}" value="${list.user_id}"
											class="btn btn-primary btn-md" data-toggle="modal"
											data-target="#authDialog">등록</button>
										<%-- <button name="authdel-${list.user_id}" value="${list.user_id}"
											class="btn btn-danger btn-md" data-toggle="modal"
											data-target="#authdelDialog">삭제</button> --%>
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

<!-- admin이 master에게 권한 부여  다이얼로그 -->
<div class="modal inmodal fade inl" id="authDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="authlist" action="authSumbit.htm" method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">팀장 권한 부여</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div class="note-editable" contenteditable="true" id="authBody">
						<h4>이 계정에 권한을 부여 하시겠습니까?</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td class="td"><input class="form-control" type="text"
									id="user_id" name="user_id" readonly value="" size="60"></td>
							</tr>
							<tr>
								<th>권한 리스트</th>
								<td><select id="auth_name" class="form-control">
										<option value="">부여된 권한 목록</option>
										<c:forEach items="${authlist }" var="auth_list">
											<option value="${auth_list.auth_name}"
												id="${auth_list.auth_name}">${auth_list.auth_name}</option>
										</c:forEach>
								</select><!-- <input type="hidden" id="auth_list_selected" name="auth_name"> --></td>
							</tr>
							<tr>
								<th>권한 부여</th>
								<td class="td"><select id="auth_name" name="auth_name"
									class="form-control">
										<option value="ROLE_GOODS_MANAGER">영업부 팀장</option>
										<option value="ROLE_EMP_MANAGER">인사부 팀장</option>
								</select></td>
							</tr>
						</table>
						<button type="submit" class="btn btn-primary btn-block"
							onclick="authlist()" style="margin-top:20px">권한 등록</button>
						<button type="reset" class="btn btn-warning btn-block"
							onclick="authlist()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<!-- admin이 master에게 권한 부여 다이얼로그 -->
<div class="modal inmodal fade inl" id="authdelDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="authdellist" action="authDelSumbit.htm" method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">권한 삭제</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div class="note-editable" contenteditable="true" id="authdelBody">
						<h4>이 계정에 권한을 삭제 하시겠습니까?</h4>
						<table>
							<tr>
								<th>아이디</th>
								<td class="td"><input class="form-control" type="text"
									id="user_id1" name="user_id" readonly value=""></td>
							</tr>
							<tr>
								<th>권한 리스트</th>
								<td><select id="auth_name1" class="form-control">
										<option value="">삭제할 권한 목록</option>
										<c:forEach items="${authlist }" var="auth_list">
											<option value="${auth_list.auth_name}"
												id="${auth_list.auth_name}">${auth_list.auth_name}</option>
										</c:forEach>
								</select><input type="hidden" id="user_list_selected" name="user_id">
								<input type="hidden" id="auth_name_selected" name="auth_name">
								</td>
							</tr>
						</table>
						<button type="submit" class="btn btn-primary btn-block"
							onclick="authlist()">권한 삭제</button>
						<button type="reset" class="btn btn-primary btn-block"
							onclick="authlist()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>