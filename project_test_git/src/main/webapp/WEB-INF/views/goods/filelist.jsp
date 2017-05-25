<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<!-- 파일리스트  -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-8">
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
									<li class="active"><a href="${pageContext.request.contextPath}/goods/openFilelist.htm?pg=${page-1}">
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
											href="${pageContext.request.contextPath}/goods/openFilelist.htm?pg=${a}">
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
										href="${pageContext.request.contextPath}/goods/openFilelist.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
						
						<div id="tbl">
							<table class="table">
									<tr>
										<th style="text-align: center;">파일번호</th>
										<th style="text-align: center;">파일명</th>
										<th style="text-align: center;">파일설명</th>
										<th style="text-align: center;">비고</th>
									</tr>
									<c:forEach var="d" items="${dlist}">
									<tr>
										<td style="text-align: center;">
											<a href="javascript:sendFileValue('${d.data_no}','${d.orign_name}')">${d.data_no }</a>
										</td>
										<td>
										<se:authorize access="hasAnyRole('ROLE_GOODS','ROLE_PROJECT')">
											<a href="${pageContext.request.contextPath}/goods/downFile.htm?save_name=${d.save_name}&orign_name=${d.orign_name}">
											<i class="fa fa-download"></i> ${d.orign_name}</a>
										</se:authorize>
										</td>
										<td>${d.data_content}</td>
										<td style="text-align: center; vertical-align: middle;">
											<!-- 비동기로 파일 삭제해야함  -->
											<se:authorize access="hasAnyRole('ROLE_GOODS_DELETE')">
												<a href="${pageContext.request.contextPath}/goods/delFile.htm?data_no=${d.data_no}">
												<i class="fa fa-trash-o"></i>삭제</a>
											</se:authorize>
										</td>
									</tr>
									</c:forEach>
							 </table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="pull-left">
				<button class="btn btn-outline btn-success  dim" type="button" data-toggle="modal" data-target="#fileModal">
					<i class="fa fa-upload"></i>신규 파일
				</button>
				
			</div>
			
		</div>
	</div>
</div>

<!-- hasAnyRole('ROLE_INVEN') inven이면서 수정, write권한이면 올릴수 있음 -->
<se:authorize access="hasAnyRole('ROLE_GOODS','ROLE_GOODS_WRITE','ROLE_GOODS_MODI')">
<!-- 새로운 자료 등록 -->
<div class="modal inmodal" id="fileModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated flipInY">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">새 파일 등록</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div class="note-editable" contenteditable="false">
					<div id="tbl">
							<form action="${pageContext.request.contextPath}/goods/uploadFile.htm" method="post" id="uploadFile" enctype="multipart/form-data">
								<table class="table table-bordered">
									<tr>
										<th><label for="orign_file"> 첨부 파일 </label></th>
										<td><input type="file" name="file" 
										multiple="multiple" placeholder="첨부할 파일"></td>
									</tr>
									<tr>
										<th><label for="data_content"> 파일 설명 </label></th>
										<td><input type="text" name="data_content" placeholder="파일에 대한 설명을 해주세요"></td>
									</tr>
								</table>
								<button type="submit" class="btn btn-success">
									<i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">파일등록</span></button>
								<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
							</form>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
</se:authorize>