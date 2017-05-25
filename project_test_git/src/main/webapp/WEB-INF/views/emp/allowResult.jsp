<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function board_write() {
		//alert("쓰기")	;
		if (document.holiform.holi_start.value == "") {
			alert("휴가 시작일을 입력해주세요");
		} else if (document.holiform.holi_end.value == "") {
			alert("휴가 종료일을 입력해주세요");
			document.holiform.holi_end.focus();
		} else if (document.holiform.atti_kind_no.value == "") {
			alert("휴가 종류를 선택해주세요");
			document.atti_kind_no.job.focus();
		} else {
			document.holiform.submit(); //전송
		}
	}
</script>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>수당 항목 등록</h5>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>



					</div>
				</div>
				<div class="ibox-content">

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>신고 귀속</th>
								<th>구분</th>
								<th>대장명칭</th>
								<th>지급일</th>
								<th>지급연월</th>
								<th>사전작업</th>
								<th>급여계산(인원)</th>
								<th>급여대장</th>
								<th>기타</th>
								<th>지급총액</th>
								<th>상여 지급율(액)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>근무기록</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>근무기록</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td>근무기록</td>
								<td>Mark</td>
								<td>Otto</td>

							</tr>

						</tbody>
					</table>

				</div>



			</div>
		</div>
	</div>
</div>
