<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<!-- 거래처 통장 리스트 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
				<h3>거래처 통장 목록</h3>
					<!-- 페이지 처리 -->
					<div class="pagination-box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i
											class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/goods/custacclist.htm?pg=${page-1}">
											<i class="fa fa-angle-left"></i>
									</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:choose>
									<c:when test="${a==page}">
										<li class="active"><span>${a}</span></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/goods/custacclist.htm?pg=${a}">
												${a}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page>=maxpage}">
									<li class="disabled"><span><i
											class="fa fa-angle-right"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/goods/custacclist.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="text-align: center;">거래처번호</th>
								<th style="text-align: center;">은행</th>
								<th style="text-align: center;">계좌번호</th>
								<th style="text-align: center;">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="custal" items="${list}">
								<tr>
									<td style="text-align: center; vertical-align: middle">${custal.cust_no}</td>
									<td style="text-align: center; vertical-align: middle">${custal.cust_acc_bank}</td>
									<td style="text-align: center; vertical-align: middle">${custal.cust_acc_num}</td>
									<td style="text-align: center; vertical-align: middle">
									<se:authorize access="hasAnyRole('ROLE_GOODS_MODI ', 'ROLE_GOODS_DELETE')">
											<button name="acc-${custal.cust_acc_no }" value="${custal.cust_acc_no }"
											class="btn btn-primary" data-toggle="modal" data-target="#custAccDialog"><i class="fa fa-pencil"></i> 
											수정</button>
											<button
												onclick="location.href='${pageContext.request.contextPath}/goods/custaccDel.htm?cust_acc_no=${custal.cust_acc_no}'"
												id="delRet" class="btn btn-danger">
												<i class="fa fa-trash-o"></i> 삭제
											</button>
										</se:authorize>
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

<!-- 구매물품 수정 다이얼로그 -->
<div class="modal inmodal fade inl" id="custAccDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content animated flipInY">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">거래처통장 수정하기</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="false" id="CustAcBody">

				</div>
			</div>

		</div>
	</div>
</div>





