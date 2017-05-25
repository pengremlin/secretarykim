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
											<th style="text-align:center;">제목</th>
											<th style="text-align:center;">내용</th>
											<th style="text-align:center;">작성일</th>
											<th style="text-align:center;">근태 종류</th>
											

										</tr>
										
										<c:forEach var="d" items="${d}">
										<tr>
											<td style="text-align:center; vertical-align: middle;">${d.doc_title}</td>
											<td style="text-align:center; vertical-align: middle;">${d.doc_content}</td>
											<td style="text-align:center; vertical-align: middle;">${d.doc_date}</td>
											<td style="text-align:center; vertical-align: middle;">${d.atti_kind_no}</td>
										</tr>
										</c:forEach>	
								</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
