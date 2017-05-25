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
						    <th style="text-align: center">아이디</th>
							<th style="text-align: center">이름</th>
							<th style="text-align: center">등록</th>
						</tr>
						<thead>
						<tbody>
							<c:forEach var="list" items="${User_info}">
								<tr>
									<td style="text-align: center; vertical-align: middle;">${list.user_id}</td>
									<td style="text-align: center; vertical-align: middle;">${list.user_name }</td>
									<td style="text-align: center; vertical-align: middle;">
										<button name="project-" id="give_auth-${list.user_id}" value="${list.user_id}" 
											class="btn btn-primary" data-toggle="modal"
											data-target="#projectDialog">등록</button>
										<%-- <button
											onclick="location.href='${pageContext.request.contextPath}/admin/adminDel.htm?user_id=${list.user_name}'"
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

<!-- admin이 master에게 권한 부여 다이얼로그 -->
<div class="modal inmodal fade inl" id="projectDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">프로젝트 권한 부여</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="true" id="projectBody">
				<h4>이 계정에 권한을 부여 하시겠습니까?</h4>
				<table>
                <tr>
				<th>아이디</th><td class="td">
                <input class="form-control" type="text" id="user_id" name="user_id" readonly value="">
                </td></tr>
                <tr><th>권한 부여</th><td class="td">
                <select id="project_name" name="project_name" class="form-control">
		                
                </select>
                </td></tr>
				</table>
				<button type="button" id="give_auth" class="btn btn-primary btn-block">권한 등록</button>
			
			</div>
		</div>
	</div>
	</div>
	
</div>