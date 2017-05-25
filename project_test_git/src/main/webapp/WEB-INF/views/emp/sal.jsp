<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<div class="wrapper wrapper-content animated fadeIn">


	<div class="row">
		<div class="col-lg-6">
			<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_WRITE','ROLE_EMP_MANAGER')">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class=""><a data-toggle="tab" href="#tab-1">급여 계산/대장</a></li>

					</ul>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane">
							<div class="panel-body">
								<div class="ibox-title">

									<div id="wrap">
										<div id="tbl">
											<form name="writeform"
												action="${pageContext.request.contextPath}/emp/sal_ListWrite.htm"
												method="post">
												<table class="table">

													<tr>
														<th>지급 년/월</th>
														<td class="td"><input type="date" name="sal_date"
															class="form-control"></td>
													</tr>
													<tr>
														<th>대장 명칭</th>
														<td class="td"><input type="text"
															name="sal_list_title" class="form-control"></td>
													</tr>
													<tr>
														<th>급여구분</th>
														<th><select class="y form-control">
																<option selected="selected">-----</option>
																<option value='급여'>급여</option>

														</select></th>
													</tr>

													<tr>
														<th>부서</th>
														<td class="td"><input type="text" class="form-control"
															id="dept_no"> <a id="dept"><i
																class="fa fa-folder"></i></a> <input type="text"
															class="form-control" name="dept_name" id="dept_name">
														</td>
													</tr>



												</table>

												<button type="submit" class="btn btn-primary btn-block">입력</button>

											</form>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>


				</div>
			</se:authorize>
		</div>
	</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>급여 계산/대장</h3>

				</div>
				<div class="ibox-content">

					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="text-align: center">지급연월</th>
								<th style="text-align: center">구분</th>
								<th style="text-align: center">대장명칭</th>
								<th style="text-align: center">부서</th>
								<th style="text-align: center">사전작업</th>
								<th style="text-align: center">급여계산(인원)</th>
								<th style="text-align: center">급여대장</th>
								<th style="text-align: center">지급총액</th>
								<th style="text-align: center">삭제</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="b" items="${list}">
								<form
									action="${pageContext.request.contextPath}/emp/sal_ListDelete.htm?sal_list_no=${b.sal_list_no}"
									method="post">
									<tr>
										<td style="text-align: center; vertical-align: middle">${b.sal_date }</td>

										<td style="text-align: center; vertical-align: middle">급여</td>

										<td style="text-align: center; vertical-align: middle">${b.sal_list_title }</td>

										<td style="text-align: center; vertical-align: middle" id="qq">${b.dept_name }</td>
										<se:authorize
											access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_WRITE','ROLE_EMP_MANAGER')">
											<td style="text-align: center; vertical-align: middle"><a id="empallow1"
												href="javascript:sal('${b.dept_name}')">근무 기록 확정</a><br>
											</td>
										</se:authorize>
										<td style="text-align: center; vertical-align: middle">
											<!-- <a id="totalsal">전체 계산</a><br> --> <a id="eachsal"
											href="javascript:sal1()">개별 계산</a>
										</td>
										<se:authorize
											access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_WRITE','ROLE_EMP_MANAGER')">
											<td style="text-align: center; vertical-align: middle"><a id="search">조회</a></td>
										</se:authorize>
										<td style="text-align: center; vertical-align: middle"><input class="form-control" type="text" id="ssum"></td>

										<td style="text-align: center; vertical-align: middle"><se:authorize
												access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_EMP_DELETE','ROLE_EMP_MANAGER')">
												<button type="submit"
													class="btn btn-primary btn-ㅡㅇ">삭제</button>
											</se:authorize></td>
									</tr>
								</form>

							</c:forEach>
						</tbody>

					</table>

				</div>



			</div>
		</div>
	</div>
</div>

