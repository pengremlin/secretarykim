<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 주문내역 등록 -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
				<h3><i class="glyphicon glyphicon-leaf"></i> 신규 주문 입력</h3>
					<div id="wrap">
						<div id="tbl">
							<form name="reqRegForm" action="${pageContext.request.contextPath}/goods/newreg.htm"
								method="post">
								<table class="table table-bordered" summary="주문내역입력">
									<tr>
										<th width="200">주문 물품 이름</th>
										<td><input type="text" name="request_name" maxlength="40"
											class="rightnone" style="width: 200px;" required></td>
										<th width="200">예상금액 <i class="fa fa-won"></i>
										</th>
										<td><input type="text" name="before_pay"
											onkeyup="cmaComma(this);" class="rightnone"
											style="width: 200px;" required></td>
									</tr>
									<tr>
										<th width="150">주문날짜</th>
										<td><input type="text" name="start_date" id="start_date"
											class="rightnone" style="width: 150px;" required></td>
										<th width="150">만기날짜</th>
										<td><input type="text" name="end_date" id="end_date"
											class="rightnone" style="width: 150px;" required></td>
									</tr>
									<tr>
										<th width="100">첨부파일함</th>
										<td><input type="hidden" name="data_no" id="data_no">
											<a href="#" id="openFile" name="file" class="link-blue"
											style="color: #0033FF;"> <label for="lblPFile"
												style="padding: 0px"> <i
													class="glyphicon glyphicon-inbox"></i>&nbsp; 파일함
											</label>
										</a>
											<div id="showfileName" hidden></div></td>
										<th width="100">거래처 번호</th>
										<td><input type="text" name="cust_no" id="resultSearch"
											readonly required>
											<button type="button" class="btn btn-default btn-sm"
												data-toggle="modal" data-target="#searchModal">
												<span class="fa fa-search"></span>
											</button></td>
									</tr>
									<tr>
										<th width="100">프로젝트 이름</th>
										<td class="td" colspan="3"><input class="form-control"
											type="hidden" name="project_name" id="resultProName">
											<input class="form-control" type="hidden" name="project_no"
											id="resultProNo" required>
											<button type="button" class="btn btn-default btn-md"
												data-toggle="modal" data-target="#searchPro" id="pronobtn">
												<span class="fa fa-search"></span>
											</button>
											<div id="showProName" hidden></div></td>
									</tr>
									<tr>
										<th width="200">주문 내용</th>
										<td colspan="3"><textarea rows="10" cols="70"
												name="request_cont" onclick="this.value=''" required>주문내용을 입력해주세요</textarea>
										</td>
									</tr>
									</table>
									
											<button type="submit" class="btn btn-primary btn-block"
												id="regBtn">등록</button>
									
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 거래처 검색 모달창 -->
<div class="modal inmodal" id="searchModal" tabindex="-1" role="dialog"
	aria-hidden="true">
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

					검색어 입력 : <input type="text" id="searchCust"
						placeholder="거래처명을 입력해주세요">
					<button type="button" class="btn btn-default btn-sm" id="searchBtn">
						<span class="fa fa-search"></span>
					</button>
					<div class="note-editable" id="searchCustDiv" hidden>
						<table class="table">
							<thead>
								<tr>
									<th>거래처 번호</th>
									<th>거래처명</th>
									<th>대표자명</th>
									<th>전화번호</th>
								</tr>
							</thead>
							<tbody id="searchCustList">
								<!-- 여기에 찾은 데이터 뿌려주기, 선택하면  id가 resultSearch에다 값 넣어주기-->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" id="newCustReg"
					onclick="location.href='${pageContext.request.contextPath}/goods/regCust.htm'"
					class="btn btn-primary">새 거래처 등록</button>
				<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 거래처검색 끝 -->

<!-- 프로젝트 검색 모달창 -->
<div class="modal inmodal" id="searchPro" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated flipInY">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">프로젝트 검색</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="false">
					검색 종류 : <select id="findPro">
						<option>검색종류를 선택하세요</option>
						<option value="project_no">프로젝트 번호</option>
						<option value="project_name">프로젝트명</option>
					</select>&nbsp;&nbsp; 검색어 입력 : <input type="text" id="inputPro"
						placeholder="검색어를 입력하세요">
					<button type="button" class="btn btn-default btn-sm"
						id="searchProBtn">
						<span class="fa fa-search"></span>
					</button>
					<div class="note-editable" id="searchProDiv" hidden>
						<table class="table">
							<thead>
								<tr>
									<th>프로젝트 번호</th>
									<th>프로젝트 이름</th>
								</tr>
							</thead>
							<tbody id="searchProList">
								<!-- 여기에 찾은 데이터 뿌려주기, 선택하면  id가 resultProName, resultProNo에다 값 넣어주기-->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 끝 -->
