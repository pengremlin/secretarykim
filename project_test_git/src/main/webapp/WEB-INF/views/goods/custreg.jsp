<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 거래처등록 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
				<h3>거래처 등록</h3>
					<div id="wrap">
						<div id="tbl">
							<form name="custreg" action="${pageContext.request.contextPath}/goods/regCust.htm" method="post">
								<table class="table">
									<thead>
									<tr>
										<th style="text-align: center;">거래처명</th>
										<th style="text-align: center;">대표자명</th>
										<th style="text-align: center;">전화번호</th>
										<th style="text-align: center;">핸드폰번호</th>
										<th style="text-align: center;">주소</th>
										<th style="text-align: center;">팩스</th>
										</tr>
									</thead>
									<tbody>
									<tr>
									
										<td class="td"><input class="form-control" type="text" name="cust_name" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_pre" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_ph1" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_ph2" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_add" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_fax" required></td>
									</tr>
									</tbody>
									<tfoot>
									<tr><button type="submit" class="btn btn-primary btn-md" style="float:right;">등록</button></tr>
									</tfoot>
								</table>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
