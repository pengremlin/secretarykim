<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 마일스톤 점수 content -->

<div class="wrapper wrapper-content animated fadeInRight">

	<div class="row">
		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div class="ibox-tools">
						<table class="table table-striped">
							<tr>
								<td class="alph_cate" rowspan="1" colspan="2" align="center">이해관계자</td>
							</tr>
							<tr>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
									이름</td>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
							</tr>
							<c:forEach var="b" items="${list}">
								<c:if
									test="${b.alph_cate eq '이해관계자' && b.alph_loc != 'base' && b.alph_loc ne null}">
									<tr>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>



		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div class="ibox-tools">
						<table class="table table-striped">
							<tr>
								<td class="alph_cate" rowspan="1" colspan="2" align="center">기회</td>
							</tr>
							<tr>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
									이름</td>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
							</tr>
							<c:forEach var="b" items="${list}">
								<c:if
									test="${b.alph_cate eq '기회' && b.alph_loc != 'base'  && b.alph_loc ne null}">
									<tr>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>


		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div class="ibox-tools">
						<table class="table table-striped">
							<tr>
								<td class="alph_cate" rowspan="1" colspan="2" align="center">요구사항</td>
							</tr>
							<tr>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
									이름</td>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
							</tr>
							<c:forEach var="b" items="${list}">
								<c:if
									test="${b.alph_cate eq '요구사항' && b.alph_loc != 'base'  && b.alph_loc ne null}">
									<tr>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div class="ibox-tools">
						<table class="table table-striped">
							<tr>
								<td class="alph_cate" rowspan="1" colspan="2" align="center">소프트웨어시스템</td>
							</tr>
							<tr>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
									이름</td>
								<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
							</tr>
							<c:forEach var="b" items="${list}">
								<c:if
									test="${b.alph_cate eq '소프트웨어시스템' && b.alph_loc != 'base'  && b.alph_loc ne null}">
									<tr>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
										<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- 첫번째 로우 -->

	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="ibox-tools">
							<table class="table table-striped">
								<tr>
									<td class="alph_cate" rowspan="1" colspan="2" align="center">팀</td>
								</tr>
								<tr>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
										이름</td>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
								</tr>
								<c:forEach var="b" items="${list}">
									<c:if
										test="${b.alph_cate eq '팀' && b.alph_loc != 'base'  && b.alph_loc ne null}">
										<tr>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="ibox-tools">
							<table class="table table-striped">
								<tr>
									<td class="alph_cate" rowspan="1" colspan="2" align="center">작업방식</td>
								</tr>
								<tr>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
										이름</td>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
								</tr>
								<c:forEach var="b" items="${list}">
									<c:if
										test="${b.alph_cate eq '작업방식' && b.alph_loc != 'base'  && b.alph_loc ne null}">
										<tr>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="ibox-tools">
							<table class="table table-striped">
								<tr>
									<td class="alph_cate" rowspan="1" colspan="2" align="center">작업</td>
								</tr>
								<tr>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">알파카드
										이름</td>
									<td class="alph_cate" rowspan="1" colspan="1" align="center">점수</td>
								</tr>
								<c:forEach var="b" items="${list}">
									<c:if
										test="${b.alph_cate eq '작업' && b.alph_loc != 'base' && b.alph_loc ne null}">
										<tr>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_title }</td>
											<td class="alph_cate" rowspan="1" colspan="1" align="center">${b.alph_total }</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>



</div>


			<%
				pageContext.include("inc/chat2.jsp");
			%>
