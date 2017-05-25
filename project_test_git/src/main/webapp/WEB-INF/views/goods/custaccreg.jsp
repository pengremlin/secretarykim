<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 거래처 통장 등록 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
				<h3>거래처 통장 등록</h3>
					<div id="wrap">
						<div id="tbl">
							<form name="custaccreg" action="${pageContext.request.contextPath}/goods/regCustAcc.htm" method="post">
								<table class="table">
									<thead>
									<tr>
										<th style="text-align:center;" colspan="2">거래처 번호</th>
										<th></th>
										<th style="text-align:center;">은행명</th>
										<th style="text-align:center;">계좌번호</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td class="td" colspan="2">
											<input class="form-control" type="text" name="cust_no" id="resultSearch" required>
											</td><td><button type="button" class="btn btn-default btn-md" data-toggle="modal" data-target="#searchModal">
												<span class="fa fa-search"></span>
											</button>
										</td>
										<td class="td"><input class="form-control" type="text" name="cust_acc_bank" required></td>
										<td class="td"><input class="form-control" type="text" name="cust_acc_num" required></td>
									</tr>
									</tbody>
									<tfoot>
									<tr><button type="submit" class="btn btn-primary btn-md" data-dismiss="modal" style="float:right;">등록</button> 
									</tr></tfoot>
								</table>
									
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

		<!-- 거래처 검색 모달창 -->
<div class="modal inmodal" id="searchModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated flipInY">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">거래처 검색</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="false">
				
					검색어 입력 : <input type="text" id="searchCust" >
					<button type="button" class="btn btn-default btn-sm" id="searchBtn">
						<span class="fa fa-search"></span>
					</button>
					<div class="note-editable" id = "searchCustDiv" hidden>
					<table class="table">
						<thead>
							<th>거래처번호</th>
							<th>거래처명</th>
							<th>대표자명</th>
							<th>전화번호</th>
						</thead>
						<tbody id="searchCustList">
							<!-- 여기에 찾은 데이터 뿌려주기, 선택하면  id가 resultSearch에다 값 넣어주기-->
					</tbody>
				</table>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" id="newCustReg" onclick="location.href='${pageContext.request.contextPath}/goods/regCust.htm'" class="btn btn-primary">새 거래처 등록</button>
				<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>