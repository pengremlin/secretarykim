<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function doc_write() {
		//alert("쓰기")	;
		if (document.docform.doc_title.value == "") {
			alert("문서 제목을 입력해주세요");
			document.docform.doc_title.focus();
		} else if (document.docform.doc_start.value == "") {
			alert("시작 날짜를 입력해주세요");
			document.docform.doc_start.focus();
		} else if (document.docform.doc_end.value == "") {
			alert("종료 날짜를 입력해주세요");
			document.docform.doc_end.focus();
		} else if (document.docform.doc_content.value == "") {
			alert("내용을 입력해주세요");
			document.docform.doc_content.focus();
		} else {
			document.docform.submit(); //전송
		}
	}
</script>


<div class="wrapper wrapper-content animated fadeIn">


	<div class="row">
		<div class="col-lg-6">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class=""><a data-toggle="tab" href="#tab-1">기본</a></li>
					<!-- <li class=""><a data-toggle="tab" href="#tab-2">사원(담당)등록</a></li> -->
					<!-- <li class=""><a data-toggle="tab" href="#tab-2">급여 지급 사항</a></li> -->

				</ul>
				<div class="tab-content">
					<div id="tab-1" class="tab-pane">
						<div class="panel-body">
							<div class="ibox-title">

								<div id="wrap">
									<div id="tbl">
										<form name="docform" action="${pageContext.request.contextPath}/emp/docWrite.htm" method="post">
											<table class="table">

												<tr>
													<th>문서 제목</th>
													<td class="td"><input type="text" name="doc_title"></td>
												</tr>
												<tr>
													<th>시작 날짜</th>
													<!-- <td class="td"><input type="text" name="doc_start"></td> -->
												</tr>
												<tr>
													<th>종료 날짜</th>
													<!-- <td class="td"><input type="text" name="doc_end"></td> -->
												</tr>
												<tr>
													<th>내용</th>
													<td class="td"><input type="text" name="doc_content"></td>
												</tr>
												<tr>
													<th>작성일</th>
													<!-- <td class="td"><input type="text" name="doc_date"></td> -->
												</tr>
												<tr>
													<th>승인일</th>
													<!-- <td class="td"><input type="text" name="doc_okdate"></td> -->
												</tr>




											</table>

											<button type="submit" class="btn btn-primary btn-block"
												onclick="doc_write()">입력</button>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>



				</div>


			</div>
		</div>
	</div>
</div>



<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="80">근태no</th>
								<th width="80">사원no</th>
								<th width="80">성명</th>
								<th width="80">부서</th>
								<th width="80">직급</th>

								<th width="100">작성일</th>

								<th width="100">내역조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th width="80">근태no</th>
								<th width="80">사원no</th>
								<th width="80">성명</th>
								<th width="80">부서</th>
								<th width="80">직급</th>

								<th width="100">작성일</th>

								<th width="100"><a id="check-">조회</a></th>
							</tr>
						</tbody>
					</table>
				</div>



			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	
	$('a[id^="check-"]').click(function(){

		var html ="";
		
		html+='allowCal.htm?allow_no=';
		html+= $(this).val();
		
		var url =  html;
		
		
		window.open(url, "allowCal", "width=700,height=600,scrollbars=yes,resizeable=no")
	});
});

</script>
