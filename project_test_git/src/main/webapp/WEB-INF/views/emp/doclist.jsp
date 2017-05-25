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
							<tr>
								<th width="80">근태문서no</th>
								<th width="100">제목</th>
								<th width="100">작성일</th>
								<th width="100">승인일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="b" items="${list}">
								<tr>
									<td><a href="readDoc.htm?doc_no=${b.doc_no}">${b.doc_no}</a></td>
									<td>${b.doc_title}</td>
									<td>${b.doc_date}</td>
									<td>${b.doc_okdate}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

