<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
	
<!-- 납품문서 상세보기 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-10">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
						<hr>
						<div class="new-title"><i class="glyphicon glyphicon-retweet"></i>&nbsp; <b>납품문서 상세보기</b></div>
						<hr>
						
						<div id="tbl">
							<table class="table table-bordered" summary="납품물품내역상세보기">
									<tr>
										<th width="200">납품물품이름</th>
										<td>${dto.deliver_name }</td>
										<th width="200">최종가격</th>
										<td>
											<i class="fa fa-won"></i>
											<fmt:formatNumber value="${dto.deliver_pay}" type="number"/>
										</td>
									</tr>
									<tr>
										<th width="150">납기날짜</th>
										<td>
											<i class="fa fa-calendar"></i>${dto.deliver_date}
										</td>
										<th width="150">주문 내역서</th>
										<td>
											<se:authorize access="hasAnyRole('ROLE_GOODS','ROLE_EMP','ROLE_MASTER','ROLE_PROJECT')">
												<a style="color:#0033FF;" href="${pageContext.request.contextPath}/goods/detailReq.htm?request_no=${dto.request_no}" >
												<i class="fa fa-pencil-square-o"></i>${dto.request_no }
												</a>
											</se:authorize>
										</td>
									</tr>
									<tr>
										<th width="100">첨부파일</th>
										<td>
											<se:authorize access="hasAnyRole('ROLE_GOODS','ROLE_PROJECT')">
												<a href="${pageContext.request.contextPath}/goods/downFile.htm?save_name=${dto.save_name}&orign_name=${dto.orign_name}">${dto.orign_name}</a>
											</se:authorize>
										</td>
										<th width="100">거래처명</th>
										<td>${dto.cust_name }</td>
									</tr>
									<tr>
										<th width="150">납품내용</th>
										<td>${dto.deliver_cont}</td>
									</tr>
								</table>
								<a href="javascript:history.go(-1)" class="btn btn-white btn-bitbucket" id="">
									<i class="fa fa-reply"></i>뒤로가기
								</a>
								<button type="button" id="printDeliver" class="btn btn-white btn-bitbucket">
									<i class="fa fa-print"></i>인쇄
								</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
