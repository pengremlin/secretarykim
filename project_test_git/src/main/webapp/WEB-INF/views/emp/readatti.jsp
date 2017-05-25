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

									<tbody>

										<tr>
											<th style="text-align:center;">출결번호</th>
											<th style="text-align:center;">출근</th>
											<th style="text-align:center;">퇴근</th>
											<th style="text-align:center;">날짜</th>
											

										</tr>
										<tr>
										<c:forEach var="b" items="${list1}">
											<tr>
												<td style="text-align: center; vertical-align: middle;"><a href="readAtte.htm?atte_no=${b.atte_no}">${b.atte_no}</a></td>
												<td style="text-align: center; vertical-align: middle;">${b.atte_go}</td>
												<td style="text-align: center; vertical-align: middle;">${b.atte_back}</td>
												<td style="text-align: center; vertical-align: middle;">${b.atte_date}</td>
												
												
											</tr>
										</c:forEach>
										
										</tr>
										
										<tr>
											<td colspan="8" align="right">
											</td>
										</tr>
								</table>
								<table class="table">
								<tbody>
										<tr>
											<th style="text-align:center;">휴가번호</th>
											<th style="text-align:center;">휴가시작</th>
											<th style="text-align:center;">휴가종료</th>
											<th style="text-align:center;">휴가내용</th>
											

										</tr>
										<tr>
											<c:forEach var="b" items="${list2}">
											<tr>
												<td style="text-align: center; vertical-align: middle;">${b.holi_no}</td>
												<td style="text-align: center; vertical-align: middle;">${b.holi_start}</td>
												<td style="text-align: center; vertical-align: middle;">${b.holi_end}</td>
												<td style="text-align: center; vertical-align: middle;">${b.holi_content}</td>
												

											</tr>
										</c:forEach>
											
										</tr>

								</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
