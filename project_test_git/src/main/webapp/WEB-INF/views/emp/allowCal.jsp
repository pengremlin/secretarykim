<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String allow_no = request.getParameter("allow_no");
%>

<c:set var="b" value="${list}"/>
<c:set var="a" value="${a}"/>
<div class="wrapper wrapper-content animated fadeInDown">
	<div class="row">
		<div class="col-md-1">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h7>계산 내역 등록 </h7>
					<table class="table table-bordered">

						<c:forEach var="i" begin="0" end="6" step="1">
							<c:set var="b" value="${list}" />
							<tr>
								<c:forEach var="j" begin="0" end="2" step="1">
									<c:choose>
										<c:when test="${i == 0}">
											<th style="width: 30px">A${b[j].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-A${b[j].allow_no }"
													value="A${b[j].allow_no }">
													<span>${b[j].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:when test="${i == 1}">
											<th style="width: 30px">B${b[j+3].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-B${b[j+3].allow_no }"
													value="B${b[j+3].allow_no }">
													<span>${b[j+3].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:when test="${i == 2}">
											<th style="width: 30px">C${b[j+6].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-C${b[j+6].allow_no }"
													value="C${b[j+6].allow_no }">
													<span>${b[j+6].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:when test="${i == 3}">
											<th style="width: 30px">D${b[j+9].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-D${b[j+9].allow_no }"
													value="D${b[j+9].allow_no }">
													<span>${b[j+9].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:when test="${i == 4}">
											<th style="width: 30px">E${b[j+12].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-E${b[j+12].allow_no }"
													value="E${b[j+12].allow_no }">
													<span>${b[j+12].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:when test="${i == 5}">
											<th style="width: 30px">F${b[j+15].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-F${b[j+15].allow_no }"
													value="F${b[j+15].allow_no }">
													<span>${b[j+15].allow_name }</span>
												</button>
											</th>
										</c:when>
										<c:otherwise>
											<th style="width: 30px">G${b[j+18].allow_no }</th>
											<th style="width: 100px">
												<button class="btn btn-success btn-md" type="button" id="acheck-G${b[j+18].allow_no }"
													value="G${b[j+18].allow_no }">
													<span>${b[j+18].allow_name }</span>
												</button>
											</th>
										</c:otherwise>
									</c:choose>
									<%-- <th style="width: 30px">${b[j].allow_no }</th>
												<th style="width: 100px">${b[j].allow_name }</th> --%>
								</c:forEach>
							</tr>
						</c:forEach>
						<%-- <c:forEach var="b" items="${list}">
										<th style="width: 30px">${b.allow_no }</th>
										<th style="width: 100px">A13</th>
									</c:forEach> --%>

					</table>
				</div>
			</div>
		</div>
		<div class="col-md-1">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<table class="table " >
						<tr>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-7" value="7">7</button>
									
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-8" value="8">8</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-9" value="9">9</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-6" value="/">/</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" value="C">C</button>
									
							</td>
						</tr>
						<tr>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-4" value="4">4</button>
									
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-5" value="5">5</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-6" value="6">6</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-5" value="*">*</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-7" value="R">R</button>
									
							</td>
						</tr>
						<tr>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-1" value="1">1</button>
									
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-2" value="2">2</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-3" value="3">3</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-4" value="-">-</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-2" value=")">)</button>
									
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 5px;">
								<button style="width:239px; height:50px;" class="btn btn-primary btn-lg" id="aadd-0" value="0">0</button>
									
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-10" value=".">.</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aadd-3" value="+">+</button>
								
							</td>
							<td style="padding: 5px;">
								<button style="width:100px; height:50px;" class="btn btn-primary btn-lg" id="aaddBtn-1" value="(">(</button>
								
							</td>
							
						</tr>

					</table>
					

					<h7>설정한 계산식의 결과입니다. 맞게 설정이 되었으면 [저장]</h7>
					<table class="table table-bordered">

						<tr>
							<th>
								
							
								<form name="writeform"
									action="${pageContext.request.contextPath}/emp/allowCalWrite.htm?allow_no=<%=allow_no%>"
									method="post">
									<input type="text" style="width: 450px" name="allow_calcul"
										id="resultBox" value="${a.allow_calcul }">
									<!-- <button type="submit" onclick="board_write()">삭제</button> -->
									<button type="submit" onclick="">저장</button>
								</form>
							</th>
						</tr>


					</table>

					<h7>[계산내역설정 예]</h7>
					<table class="table">

						<tr>
							<th>수당일때 A1수당에 A2근태를 곱한 값의 2%를 원단위에서 반올림하여 십원단위로 바꿔줍니다.<br>
								계산식결과 : R(A01*T01*0.02*0.1)*10
							</th>
						</tr>

					</table>


				</div>
			</div>
		</div>
	</div>
</div>



