<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<table class="table">
						<thead>
							<tr>
								<th width="80">근태번호</th>
								<th width="200">날짜</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="b" items="${list}">
								<tr>
									<td><a id="check-" value="${b.atti_no}">${b.atti_no}</a></td>
									<td>${b.atti_date}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {

		$('a[id^="check-"]')
				.click(
						function() {

							var html = "";
							var check = $("#check-").attr('value');

							html += 'readAtti.htm?atti_no=';
							html += check;

							var url = html;

							window
									.open(url, "readAtti",
											"width=700,height=600,scrollbars=yes,resizeable=no")
						});
	});
</script>

