<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!-- 주문내역 상세보기 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-10">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
						<hr>
						<div class="new-title"><i class="glyphicon glyphicon-retweet"></i>&nbsp; <b>주문 내역 상세보기</b></div>
						<hr>
						<div id="tbl">
							<table class="table table-bordered" summary="주문내역상세보기">
									<tr>
										<th width="200">주문물품이름</th>
										<td>${dto.request_name }</td>
										<th width="200">예상금액</th>
										<td>
											<i class="fa fa-won"></i>
											<fmt:formatNumber value="${dto.expact_pay}" type="number"/>
										</td>
									</tr>
									<tr>
										<th width="150">주문날짜</th>
											<td>${dto.start_date}</td>
										<th width="150">만기날짜</th>
										<td>${dto.end_date }</td>
									</tr>
									<tr>
										<th width="100">첨부파일번호</th>
										<td>${dto.data_no }</td>
										<th width="100">거래처번호</th>
										<td>${dto.cust_no }</td>
									</tr>
									<tr>
										<th width="200"> 주문내용 </th>
										<td colspan="3">${dto.request_cont }	</td>
									</tr>
								</table>
								<a href="javascript:history.go(-1)" class="btn btn-white btn-bitbucket" id="back2">
									<i class="fa fa-reply"></i>뒤로가기
								</a>
								<button type="button" id="printReq" class="btn btn-white btn-bitbucket">
									<i class="fa fa-print"></i>인쇄
								</button>
								<a href="${pageContext.request.contextPath}/goods/deliverlist.htm" class="btn btn-white btn-bitbucket" id="back2">
									<i class="fa fa-reply"></i>납품목록으로
								</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
