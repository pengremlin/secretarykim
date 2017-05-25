<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
	
<!-- 주문내역 상세보기 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-10">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
						<hr>
						<div class="new-title"><i class="glyphicon glyphicon-retweet"></i>&nbsp; <b>주문 내역 수정</b></div>
						<hr>
						<div id="tbl">
							<form name="reqRegForm" action="${pageContext.request.contextPath}/goods/modiReq.htm" method="post">
								<table class="table table-bordered" summary="주문내역수정">
									<tr>
										<th width="200">주문물품이름</th>
										<td>
											<input type="text" name="request_name" maxlength="40" class="rightnone" style="width: 200px;" value="${reqdto.request_name }" 
											readonly required/>
										</td>
										<th width="200">예상금액</th>
										<td>
											<input type="text" name="expact_pay" value="${reqdto.expact_pay}" hidden required>
											<i class="fa fa-won"></i>
											<fmt:formatNumber value="${reqdto.expact_pay}" type="number"/>
										</td>
									</tr>
									<tr>
										<th width="150">주문날짜</th>
											<td>
												<input type="text" name="start_date" id="start_date" 
												class="rightnone" style="width: 150px;" value="${reqdto.start_date}" readonly required/>
											</td>
										<th width="150">만기날짜</th>
											<td>
												<input type="text" name="end_date" id="end_date" class="rightnone"
												 style="width: 150px;" value="${reqdto.end_date }" required/>
											</td>
									</tr>
									<tr>
										<th width="100">첨부파일함</th>
										<td>
											<input type="hidden" name="data_no" id="data_no" value="${reqdto.data_no }" required> 
											<input type="text" value="${reqdto.data_no }" id="first_no" readonly/> 
											<a href="#" id="openFile" name="file" class="link-blue" style="color:#23527c;">
												<i class="glyphicon glyphicon-inbox"></i>&nbsp; 파일수정
											</a>
											
											<div id="showfileName" hidden>
											</div>
										</td>
										<th width="100">거래처번호</th>
										<td>
											<input type="text" name="cust_no" id="cust_no" value="${reqdto.cust_no }" readonly required>
										</td>
									</tr>
									<tr>
										<th width="200"> 주문내용 </th>
										<td>
											<input type="text" name="request_cont" value="${reqdto.request_cont }" style="width: 400px;" required>
     									</td>
     									<th width="100">해당 프로젝트이름</th>
     									<td>
     										<a href="${pageContext.request.contextPath}/project/milestone.htm?project_no=${reqlist.project_no}" style="color:#23527c;">${reqlist.project_name }</a>
     									</td>
									</tr>
									<tr>
										<td>
											<input type="hidden" name="request_no" value=${reqdto.request_no } >
										</td>
										<td colspan="3">
											<se:authorize access="hasAnyRole('ROLE_GOODS_MODI','ROLE_GOODS_DELETE')">
											<button type="submit" class="btn btn-warning btn-block" value="${reqdto.request_no }">수정</button>
											</se:authorize>
										</td>
									</tr>
								</table>
								</form>
								
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
