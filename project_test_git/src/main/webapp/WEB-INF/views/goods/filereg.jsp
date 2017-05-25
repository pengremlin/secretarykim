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
						<div class="new-title"><i class="fa fa-folder-open-o"></i><b>&nbsp; 파일등록</b></div>
						 <hr>
						<div id="tbl">
							<form action="${pageContext.request.contextPath}/goods/uploadFile.htm" method="post" id="uploadFile" enctype="multipart/form-data">
								<table class="table table-bordered">
									<tr>
										<th><label for="orign_file"> 첨부 파일 </label></th>
										<td><input type="file" name="file" placeholder="첨부할 파일" required></td>
									</tr>
									<tr>
										<th><label for="data_content"> 파일 설명 </label></th>
										<td><input type="text" name="data_content" placeholder="파일에 대한 설명을 해주세요" required></td>
									</tr>
									<tr align="center">
										<td>
											<button class="btn btn-success" type="submit">
												<i class="fa fa-check">등록</i>
											</button>
										</td>
										<td>
											<button class="btn btn-primary" type="reset" data-dismiss="modal">
												<i class="fa fa-close">취소</i>
											</button>
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


		