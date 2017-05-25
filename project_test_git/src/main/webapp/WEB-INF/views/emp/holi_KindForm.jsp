<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function holi_KindWrite() {
		//alert("쓰기")	;
		if (document.holi_KindForm.doc_title.value == "") {
			alert("문서 제목을 입력해주세요");
			document.holi_KindForm.doc_title.focus();
		} else if (document.holi_KindForm.doc_start.value == "") {
			alert("시작 날짜를 입력해주세요");
			document.docform.doc_start.focus();
		} else {
			document.holi_KindForm.submit(); //전송
		}
	}
</script>



<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title" style="width: 300px">

					<div id="wrap">
						<div id="tbl">
							<form name="holi_KindForm" action="${pageContext.request.contextPath}/emp/holi_KindWrite.htm"
								method="post">
								<table class="table">

									<tr>
										<th>휴가 코드</th>
										<td class="td"><input type="text" name="doc_title"></td>
									</tr>
									<tr>
										<th>휴가 명칭</th>
										<td class="td"><input type="text" name="doc_start"></td>
									</tr>




								</table>

								<button type="submit" class="btn btn-primary btn-block"
									onclick="holi_KindWrite()">입력</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
