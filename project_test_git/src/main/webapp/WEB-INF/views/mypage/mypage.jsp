<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<div class="col-lg-12">
		<div class="ibox-content">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">나의 회사</h3>
				</div>
				<div class="box-body">
					<table id="example2" class="table table-bordered">
						<thead>
							<tr>
								<th>Name</th>
								<th>Link</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="font-size:1.5em;">My Company</td>
								<td><a
									class="btn btn-default btn-md" href="${pageContext.request.contextPath}/company/company.htm">
											<i class="fa fa-hand-o-right"></i> GO TO
										</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<h3 class="box-title">해야 할 일</h3>
				<div class="input-group">
					<form action="insertWork.htm" method="post">

						<div class="form-group">

							<div class="col-sm-10">
								<se:authentication property="name" var="LoginUser" />
								<input type="hidden"
									name="user_id" class="form-control" value="${LoginUser}">
								<input type="text" name="work_content" class="form-control"
									placeholder="할 일 입력..." required> 
							</div>

							<label class="col-sm-2 control-label"><input
								type="submit" class="btn btn-md btn-success" value="추가"></label>
						</div>
					</form>
				</div>
				<ul class="todo-list m-t small-list">
					<c:forEach var="w" items="${mywork}">
						<li><a href="#" class="check-link"><i
								class="fa fa-square-o"></i> </a> <span
							class="m-l-xs" style="font-size:1.2em; font-weight:bold; padding-right:50px;">${w.work_content}</span><span><fmt:formatDate value="${w.work_date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></span><a href="deleteWork.htm?work_num=${w.work_num}"> <input type="hidden"
										name="work_num" value="${w.work_num}" />
										<button type="submit" class="btn btn-white btn-md">
											<i class="fa fa-trash-o"></i>
										</button>
								</a></li>
						
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>