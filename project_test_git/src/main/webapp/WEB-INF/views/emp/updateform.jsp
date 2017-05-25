<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">

					<form name="updateform"  action="${pageContext.request.contextPath}/emp/updateok.htm" method="post">
						<table class="table">
							<tbody>
								<tr>
									<th>사원번호</th>
									<th>이름</th>
									<th>직종</th>
									<th>담당자번호</th>


								</tr>
								<tr>
									<td><input type="text" value="${b.empno}" name="empno"
										readonly="readonly"></td>
									<td><input type="text" value="${b.ename}" name="ename"></td>
									<td><input type="text" value="${b.job}" name="job"></td>
									<td><input type="text" value="${b.mgr}" name="mgr"></td>

								</tr>
								<tr>
									<th>급여</th>
									<th>수당</th>
									<th>부서번호</th>
								</tr>
								<tr>
									<td><input type="text" value="${b.sal}" name="sal"></td>
									<td><input type="text" value="${b.comm}" name="comm"></td>
									<td><input type="text" value="${b.deptno}" name="deptno"></td>

								</tr>
						</table>
						<button type="submit" class="btn btn-primary">완료</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>
