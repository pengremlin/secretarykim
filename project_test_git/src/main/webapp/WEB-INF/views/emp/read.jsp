<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<table class="table">

						<tbody>

							<tr>
								<th width="80">사원번호</th>
								<th width="80">이름</th>
								<th width="100">이메일</th>
								<th width="80">생일</th>
								<th width="80">성별</th>
								<th width="270">주소</th>
								<th width="100">전화번호</th>

							</tr>
							<tr>
								<td>${u.user_no}</td>
								<td>${u.user_name}</td>
								<td>${u.user_email}</td>
								<td>${u.user_birth}</td>
								<td>${u.user_gender}</td>
								<td>${u.user_add}</td>
								<td>${u.user_ph}</td>
							</tr>

							<tr>
								<td colspan="8" align="right"><i class="fa fa-scissors"><a
										href="update.htm?user_no=${u.user_no}">수정</a></i> <i
									class="fa fa-trash-o"><a
										href="delete.htm?user_no=${u.user_no}">삭제</a></i> <!-- <input type="button" value="답변" onclick="board_reply()"/> -->
								</td>
							</tr>
					</table>
					<table class="table">
						<tbody>
							<tr>
								<th width="80">사원번호</th>
								<th width="80">부서이름</th>
								<th width="80">직급</th>
								<th width="80">회사번호</th>
								<th width="80"></th>
								<th width="270"></th>
								<th width="100"></th>

							</tr>
							<tr>
								<td>${e.user_no}</td>
								<td>${e.dept_name}</td>
								<td>${e.job_name}</td>
								<td>${e.comp_no}</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td colspan="8" align="right"><i class="fa fa-scissors"><a
										href="update.htm?user_no=${u.user_no}">수정</a></i> <i
									class="fa fa-trash-o"><a
										href="delete.htm?user_no=${u.user_no}">삭제</a></i> <!-- <input type="button" value="답변" onclick="board_reply()"/> -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
