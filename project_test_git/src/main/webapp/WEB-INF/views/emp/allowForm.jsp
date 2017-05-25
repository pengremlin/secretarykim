<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="l" value="${list }" />
<c:set var="h" value="allowCal.htm?allow_no=" />

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">

					<h3>수당 항목 등록</h3>
				</div>
				<div class="ibox-content">
					<!-- <form name="writeform" action="allowFormWrite.htm" method="post"> -->

					<table class="table table-condensed">
						<thead>
							<tr>
								<th style="text-align: center; vertical-align: middle">수당번호</th>
								<th style="text-align: center; vertical-align: middle">수당명</th>
								<th style="text-align: center; vertical-align: middle">고정급 상여</th>
								<th style="text-align: center; vertical-align: middle">변동급 상여</th>
								<th style="text-align: center; vertical-align: middle">근무기록</th>
								<th style="text-align: center; vertical-align: middle">배율</th>
								<th style="text-align: center; vertical-align: middle">계산식</th>
								<th colspan="2" style="text-align: center; vertical-align: middle">계산내역</th>
								

							</tr>
						</thead>

						<c:forEach var="b" items="${l}">
							<form name="writeform"
								action="${pageContext.request.contextPath}/emp/allowFormWrite.htm?allow_no=${b.allow_no }"
								method="post">

								<tbody>
									<tr>
										<td style="text-align: center; vertical-align: middle">${b.allow_no}</td>
										<td style="text-align: center; vertical-align: middle"><input type="text" name="allow_name"
											style="width: 150px" value="${b.allow_name }"></td>
										<td style="text-align: center; vertical-align: middle"><c:choose>
												<c:when test="${b.allow_division==11}">
													<input type="checkbox" checked="checked">
												</c:when>
												<c:otherwise>
													<input type="checkbox" value=1>
												</c:otherwise>
											</c:choose></td>
										<td style="text-align: center; vertical-align: middle"><c:choose>
												<c:when test="${b.allow_division==22}">
													<input type="checkbox" checked="checked">
												</c:when>
												<c:when test="${b.allow_division==23}">
													<input type="checkbox" checked="checked">
												</c:when>
												<c:otherwise>
													<input type="checkbox">
												</c:otherwise>
											</c:choose></td>
										<td style="text-align: center; vertical-align: middle"><c:choose>
												<c:when test="${b.allow_division==11}">
													<select class="y" name="allow_division">
														<option value=11 selected="selected">고정</option>
														<option value=22>변동(일)</option>
														<option value=23>변동(시간)</option>
													</select>
												</c:when>
												<c:when test="${b.allow_division==22}">
													<select class="y" name="allow_division">
														<option value=11>고정</option>
														<option value=22 selected="selected">변동(일)</option>
														<option value=23>변동(시간)</option>
													</select>
												</c:when>
												<c:when test="${b.allow_division==23}">
													<select class="y" name="allow_division">
														<option value=11>고정</option>
														<option value=22>변동(일)</option>
														<option value=23 selected="selected">변동(시간)</option>
													</select>
												</c:when>
												<c:otherwise>
													<select class="y" name="allow_division">
														<option value=11 selected="selected">고정</option>
														<option value=22>변동(일)</option>
														<option value=23>변동(시간)</option>
													</select>
												</c:otherwise>
											</c:choose></td>
										<td style="text-align: center; vertical-align: middle"><input type="text" name="allow_mag"
											style="width: 50px" value=1></td>
										<td style="text-align: center; vertical-align: middle"><c:choose>
												<c:when test="${b.allow_c1=='원'}">
													<select class="y" name="allow_c1">
														<option value="원" selected="selected">원</option>
														<option value="십원">십원</option>
													</select>
												</c:when>
												<c:when test="${b.allow_c1=='십원'}">
													<select class="y" name="allow_c1">
														<option value="원">원</option>
														<option value="십원" selected="selected">십원</option>
													</select>
												</c:when>

												<c:otherwise>
													<select class="y" name="allow_c1">
														<option value="원" selected="selected">원</option>
														<option value="십원">십원</option>
													</select>
												</c:otherwise>
											</c:choose> <c:choose>
												<c:when test="${b.allow_c2=='반올림'}">
													<select class="y" name="allow_c2">
														<option value="반올림" selected="selected">반올림</option>
														<option value="올림">올림</option>
													</select>
												</c:when>
												<c:when test="${b.allow_c2=='올림'}">
													<select class="y" name="allow_c2">
														<option value="반올림">반올림</option>
														<option value="올림" selected="selected">올림</option>
													</select>
												</c:when>

												<c:otherwise>
													<select class="y" name="allow_c2">
														<option value="반올림" selected="selected">반올림</option>
														<option value="올림">올림</option>
													</select>
												</c:otherwise>
											</c:choose></td>
										<td style="text-align: center; vertical-align: middle"><c:set var="p" value="${b.allow_no }" /> <%-- <button onclick="location.href='allowCal.htm?allow_no='${b.allow_no }'" type="submit" class="btn btn-primary btn-block" onclick="board_write()" style="width: 50px">계산 내역</button> --%>
											<button type="button" class="btn btn-primary btn-md"
												id="check-${b.allow_no }" value="${b.allow_no }">계산
												내역</button></td>
										<td style="text-align: center; vertical-align: middle">

											<button type="submit" class="btn btn-success btn-md"
												onclick="board_write()">입력</button>
										</td>
									</tr>

								</tbody>
							</form>
						</c:forEach>
					</table>


					<!-- </form> -->
				</div>



			</div>
		</div>
	</div>
</div>


