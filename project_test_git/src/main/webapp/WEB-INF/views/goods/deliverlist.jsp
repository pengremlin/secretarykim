<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<!-- 납품 물품 내역 리스트  -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
					<!-- 페이지 처리 -->
					<div class="pagination-box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/goods/deliverlist.htm?pg=${page-1}">
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
											href="${pageContext.request.contextPath}/goods/deliverlist.htm?pg=${a}">
												${a}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page>=maxpage}">
									<li class="disabled"><span><i class="fa fa-angle-right"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/goods/deliverlist.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
						
						<div id="tbl">
							<table class="table">
									<tr>
										<th>납품물품번호</th>
										<th>납품물품이름</th>
										<th>납품내용</th>
										<th>납품날짜</th>
										<th>최종가격</th>
										<th>비고</th>
									</tr>
									<c:forEach var="d" items="${list}">
									<tr>
										<td>
											<a href="${pageContext.request.contextPath}/goods/detailDeliver.htm?request_no=${d.request_no}">${d.deliver_no }</a>
										</td>
										<td>${d.deliver_name}</td>
										<td>${d.deliver_cont}</td>
										<td>${d.deliver_date}</td>
										<td><i class="fa fa-won"></i>
											<fmt:formatNumber value="${d.deliver_pay}" type="number" />
										</td>
										<td>
											<se:authorize access="hasAnyRole('ROLE_GOODS_DELETE')">
											<a href="${pageContext.request.contextPath}/goods/deldeliver.htm?deliver_no=${d.deliver_no}"><i class="fa fa-trash-o"></i> 삭제</a>
											</se:authorize>
										</td>
									</tr>
									</c:forEach>
							 </table>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- 이거 있어야 자식창 닫히고 리로드 됨!!!!!!! 있어야함!!!!!!하하하하하하하 -->
<script type="text/javascript">
	window.close(); 
	opener.parent.location.reload(); 
</script>
