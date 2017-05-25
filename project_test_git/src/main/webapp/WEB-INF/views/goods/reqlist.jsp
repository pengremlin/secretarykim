<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<!-- 주문내역 리스트 -->
<div class="wrapper wrapper-content animated fadeIn">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox-title">
				<h3>주문 내역</h3>
				<div class="tabs-container" id="tabs">
					<ul class="nav nav-tabs">
						<li><a data-toggle="tab" href="#tab-1">보류</a></li>
						<li class="active"><a data-toggle="tab" href="#tab-2">진행중</a></li>
						<li><a data-toggle="tab" href="#tab-3">전체</a></li>
						<li><a data-toggle="tab" href="#tab-4">완료</a></li>
					</ul>

					<!-- 보류 리스트 -->
					<div class="tab-content">
						<div id="tab-1" class="tab-pane">
							<div class="panel-body">
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
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg=${page-1}">
														<i class="fa fa-angle-left"></i>
												</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="a" begin="${startpage}" end="${endpage}"
											step="1">
											<c:choose>
												<c:when test="${a==page}">
													<li class="active"><span>${a}</span></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/goods/reqlist.htm?pg=${a}">
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
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg=${page+1}">
														<i class="fa fa-angle-right"></i>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<h3>
									<i class="fa fa-minus-circle"></i> 보류
								</h3>
								<div class="ibox-title">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="text-align: center">주문번호</th>
												<th style="text-align: center">주문날짜</th>
												<th style="text-align: center">만기날짜</th>
												<th style="text-align: center">거래처명</th>
												<!-- <th>담당자</th>  -->
												<th style="text-align: center">주문물품이름</th>
												<th style="text-align: center">금액</th>
												<th style="text-align: center">처리상태</th>
											</tr>
										</thead>
										<tbody>
											<!-- appr_no 4는 처리중 5는 종결 6은 보류 -->
											<c:forEach var="postl" items="${postlist}">
												<tr>
													<td style="text-align: center; vertical-align: middle;">${postl.request_no }</td>
													<td style="text-align: center; vertical-align: middle;">${postl.start_date}</td>
													<td style="text-align: center; vertical-align: middle;">${postl.end_date}</td>
													<td style="text-align: center; vertical-align: middle;">${postl.cust_name}</td>
													<%-- <td>${alll.user_name}</td> --%>
													<td style="text-align: center; vertical-align: middle;">${postl.request_name }</td>
													<td style="text-align: center; vertical-align: middle;"><i class="fa fa-won"></i> <fmt:formatNumber
															value="${postl.expact_pay}" type="number" /></td>
													<td style="text-align: center; vertical-align: middle;">${postl.appr_name }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>

					<!-- 진행중리스트  -->
					<div class="tab-content">
						<div id="tab-2" class="tab-pane">
							<div class="panel-body">
								<!-- 페이지 처리 -->
								<div class="pagination-box">
									<ul class="pagination">
										<c:choose>
											<c:when test="${page3<=1}">
												<li class="disabled"><span><i
														class="fa fa-angle-left"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg=${page3-1}">
														<i class="fa fa-angle-left"></i>
												</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="c" begin="${startpage3}" end="${endpage3}"
											step="1">
											<c:choose>
												<c:when test="${c==page3}">
													<li class="active"><span>${c}</span></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/goods/reqlist.htm?pg3=${c}">
															${c}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${page3>=maxpage3}">
												<li class="disabled"><span><i
														class="fa fa-angle-right"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg3=${page3+1}">
														<i class="fa fa-angle-right"></i>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<h3>
									<i class="fa fa-spinner"></i> 진행중
								</h3>
								<div class="ibox-title">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="text-align: center">주문번호</th>
												<th style="text-align: center">주문날짜</th>
												<th style="text-align: center">만기날짜</th>
												<th style="text-align: center">거래처명</th>
												<!-- <th>담당자</th>  -->
												<th style="text-align: center">주문물품이름</th>
												<th style="text-align: center">금액</th>
												<th style="text-align: center">처리상태</th>
												<th style="text-align: center" colspan="2">승인처리</th>
											</tr>
										</thead>
										<tbody>
											<!-- 주문 진행중인 state='진행중' -->
											<c:forEach var="ingl" items="${inglist}">
												<tr>
													<td style="text-align: center; vertical-align: middle;"><a style="color: #0033FF;"
														href="${pageContext.request.contextPath}/goods/modiReq.htm?request_no=${ingl.request_no}">
															<i class="fa fa-pencil-square-o"></i>${ingl.request_no }
													</a></td>
													<td style="text-align: center; vertical-align: middle;">${ingl.start_date}</td>
													<td style="text-align: center; vertical-align: middle;">${ingl.end_date}</td>
													<td style="text-align: center; vertical-align: middle;">${ingl.cust_name}</td>
													<%-- <td>${ingl.user_name}</td> --%>
													<td style="text-align: center; vertical-align: middle;">${ingl.request_name }</td>
													<td style="text-align: center; vertical-align: middle;"><i class="fa fa-won"></i> <fmt:formatNumber
															value="${ingl.expact_pay}" type="number" /></td>
													<td style="text-align: center; vertical-align: middle;">${ingl.appr_name }</td>
													<td style="text-align: center; vertical-align: middle;"><se:authorize
															access="hasAnyRole('ROLE_GOODS_MODI ','ROLE_GOODS_DELETE')">
															<a style="color: #0033FF;"
																href="${pageContext.request.contextPath}/goods/changeReqPostponse.htm?request_no=${ingl.request_no }"><button
																	class="btn btn-primary btn-sm">보류</button></a>
															<button
																onclick="location.href='${pageContext.request.contextPath}/goods/changeReqEnd.htm?request_no=${ingl.request_no }'"
																type="button" value="${ingl.request_no }"
																id="endReqA-${ingl.request_no }"
																class="btn btn-warning btn-sm" style="color: #fff;">종결</button>
														</se:authorize></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>

					<!-- 전체 리스트 -->
					<div class="tab-content">
						<div id="tab-3" class="tab-pane">
							<div class="panel-body">
								<!-- 전체 리스트 페이지처리 -->
								<div class="pagination-box">
									<ul class="pagination">
										<c:choose>
											<c:when test="${page2<=1}">
												<li class="disabled"><span><i
														class="fa fa-angle-left"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg2=${page2-1}">
														<i class="fa fa-angle-left"></i>
												</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="b" begin="${startpage2}" end="${endpage2}"
											step="1">
											<c:choose>
												<c:when test="${b==page2}">
													<li class="active"><span>${b}</span></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/goods/reqlist.htm?pg2=${b}">
															${b}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${page2>=maxpage2}">
												<li class="disabled"><span><i
														class="fa fa-angle-right"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg2=${page2+1}">
														<i class="fa fa-angle-right"></i>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>

								<h3>
									<i class="fa fa-bars"></i> 전체
								</h3>
								<div class="ibox-title">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="text-align: center">주문번호</th>
												<th style="text-align: center">주문날짜</th>
												<th style="text-align: center">만기날짜</th>
												<th style="text-align: center">거래처명</th>
												<!-- <th>담당자</th>  -->
												<th style="text-align: center">주문물품이름</th>
												<th style="text-align: center">금액</th>
												<th style="text-align: center">처리상태</th>
											</tr>
										</thead>
										<tbody>
											<!-- appr_no 4는 처리중 5는 종결 6은 보류 -->
											<c:forEach var="alll" items="${alllist}">
												<tr>
													<td style="text-align: center; vertical-align: middle;">
														<!-- a 태그 appr_no가 4일때만 나타나게 처리 --> <a
														style="color: #0033FF;"
														href="${pageContext.request.contextPath}/goods/modiReq.htm?request_no=${alll.request_no}">
															<i class="fa fa-pencil-square-o"></i>${alll.request_no }
													</a>
													</td>
													<td style="text-align: center; vertical-align: middle;">${alll.start_date}</td>
													<td style="text-align: center; vertical-align: middle;">${alll.end_date}</td>
													<td style="text-align: center; vertical-align: middle;">${alll.cust_name}</td>
													<%-- <td>${alll.user_name}</td> --%>
													<td style="text-align: center; vertical-align: middle;">${alll.request_name }</td>
													<td style="text-align: center; vertical-align: middle;"><i class="fa fa-won"></i> <fmt:formatNumber
															value="${alll.expact_pay}" type="number" /></td>
													<td style="text-align: center; vertical-align: middle;">${alll.appr_name }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>

					<!-- 종결리스트  -->
					<div class="tab-content">
						<div id="tab-4" class="tab-pane">
							<div class="panel-body">
								<!-- 종결리스트 페이지 처리 -->
								<div class="pagination-box">
									<ul class="pagination">
										<c:choose>
											<c:when test="${page4<=1}">
												<li class="disabled"><span><i
														class="fa fa-angle-left"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg4=${page-1}">
														<i class="fa fa-angle-left"></i>
												</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="d" begin="${startpage4}" end="${endpage4}"
											step="1">
											<c:choose>
												<c:when test="${d==page4}">
													<li class="active"><span>${d}</span></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/goods/reqlist.htm?pg4=${d}">
															${d}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${page4>=maxpage4}">
												<li class="disabled"><span><i
														class="fa fa-angle-right"></i></span></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a
													href="${pageContext.request.contextPath}/goods/reqlist.htm?pg4=${page4+1}">
														<i class="fa fa-angle-right"></i>
												</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<h3>
									<i class="fa fa-times-circle"></i> 완료
								</h3>
								<div class="ibox-title">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="text-align: center">주문번호</th>
												<th style="text-align: center">주문날짜</th>
												<th style="text-align: center">만기날짜</th>
												<th style="text-align: center">거래처명</th>
												<!-- <th>담당자</th>  -->
												<th style="text-align: center">주문물품이름</th>
												<th style="text-align: center">금액</th>
												<th style="text-align: center">처리상태</th>
											</tr>
										</thead>
										<tbody>
											<!-- 종결된 데이터들 appr_no = 5 -->
											<c:forEach var="endl" items="${endlist}">
												<tr>
													<td style="text-align: center; vertical-align: middle;">${endl.request_no }</td>
													<td style="text-align: center; vertical-align: middle;">${endl.start_date}</td>
													<td style="text-align: center; vertical-align: middle;">${endl.end_date}</td>
													<td style="text-align: center; vertical-align: middle;">${endl.cust_name}</td>
													<%-- <td>${endl.user_name}</td> --%>
													<td style="text-align: center; vertical-align: middle;">${endl.request_name }</td>
													<td style="text-align: center; vertical-align: middle;"><i class="fa fa-won"></i> <fmt:formatNumber
															value="${endl.expact_pay}" type="number" /></td>
													<td>${endl.appr_name }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<%-- <div class="pull-left">
				<se:authorize
					access="hasAnyRole('ROLE_GOODS','ROLE_GOODS_WRITE', 'ROLE_GOODS_MODI', 'ROLE_GOODS_DELETE')">
					<button id="NewReqBtn" class="btn btn-outline btn-info  dim"
						type="button">
						<i class="fa fa-paste"></i> 주문내역 신규
					</button>
				</se:authorize>
			</div> --%>
		</div>
	</div>
</div>

<!-- 이거 있어야 자식창 닫히고 리로드 됨!!!!!!! 있어야함!!!!!!하하하하하하하 -->
<script type="text/javascript">
	window.close();
	opener.parent.location.reload();
</script>

