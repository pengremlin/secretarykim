<%@page import="javax.naming.Context"%>
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
						<thead>
							<!-- <tr>
											<th width="80">사원번호</th>
											<th width="270">이름</th>
											<th width="100">직종</th>
											<th width="200">담당자번호</th>
											<th width="280">입사일</th>
											<th width="80">급여</th>
											<th width="80">수당</th>
											<th width="80">부서번호</th>
										</tr> -->
						</thead>
						<tbody>
							<c:forEach var="b" items="${list}">
								<tr>
									<td><a href="read.htm?user_no=${b.user_no}">${b.user_no}</a></td>
									<td>${b.dept_name}</td>
									<td>${b.job_name}</td>
									<td>${b.comp_no}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

