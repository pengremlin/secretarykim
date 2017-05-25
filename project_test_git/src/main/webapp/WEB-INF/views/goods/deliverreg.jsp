<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!-- 주문내역 등록 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-8">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<div id="wrap">
						<hr>
						<div class="new-title"><i class="glyphicon glyphicon-leaf"></i><b>&nbsp; 신규 납품 문서</b></div>
						 <hr>
						<div id="tbl">
							<form name="deliverRegForm" action="${pageContext.request.contextPath}/goods/deliverreg.htm" method="post">
								<table class="table table-bordered" summary="납품내역입력">
									<tr>
										<th width="200">납품 물품이름</th>
											<td>
												<input type="text" name="deliver_name"
												style="width: 200px;" 
												value="${deliver_name }" readonly required>
										<th width="100">주문물품번호</th>
										<td>
											<input type="text" name="request_no" id="resultRequest" 
												value="${request_no }"readonly required>
										</td>
									</tr>
									<tr>
										<th width="150">납품날짜</th>
										<td>
											<input type="text" name="deliver_date" id="deliver_date" class="rightnone" style="width: 150px;" 
											value="${end_date}" required required>
										</td>
										<th width="150">최종가격</th>
										<td>
											<input type="text" name="before_deliver" value="${before_pay }" 
											onkeyup="cmaComma(this);" style="width: 150px;" required>
										</td>
									</tr>
									<tr>
										<th width="100">거래처번호</th>
										<td>
											<input type="text" name="cust_no" id="cust_no"
											readonly style="width: 150px;" value="${cust_no }" required>
										</td>
										</tr>
										<tr>
											<th width="200"> 납품 내용 </th>
											<td colspan="3">
												<textarea rows="10" cols="50" name="deliver_cont" onclick="this.value=''" required>납품물품내역을 입력해주세요</textarea>
      										</td>
									</tr>
									<tr>
										<td colspan="2">
											<button type="submit" class="btn btn-primary btn-block" >등록</button>
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

