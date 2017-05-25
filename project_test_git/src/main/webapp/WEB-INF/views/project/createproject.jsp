<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 프로젝트 생성 content -->

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">

					<form name="project"
						action="createproject.htm"
						method="post">
						<table class="table">

							<tr>
								<td>
									<h2>프로젝트 시작</h2>
								</td>
							</tr>

							<tbody>
								<tr class="btn-group">

									<td><input class="input-form form-control" size="80"
										id="project_name"  name="project_name" type="text" placeholder="프로젝트 이름을 입력하세요."><br>
										<span id="name_test"></span>
										<input type="hidden" id="user_name" name="user_name">
										</td>

									
									<td><select id="dept_select"
										class="btn btn-warning btn-group">
											<option value="">부서선택</option>
											<c:forEach items="${dept_list }" var="dept">
												<option value="${dept.dept_no}" id="${dept.dept_name}">${dept.dept_name }</option>
											</c:forEach>

									</select></td>
									
									<td><select id="project_select_option"
										class="btn btn-primary btn-group">
											<option value="">프로젝트 담당자 선택</option>

									</select></td>

									<td><select class="btn btn-info btn-group"
										name="mile_col_selection">
											<option value="">마일스톤 행</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
									</select></td>
							
										<input type="hidden" id="project_start" name="project_start">
										<input type="hidden" id="project_end" name="project_end">

									<td>
										<button class="btn btn-success" type="submit" id="project_btn">프로젝트 생성</button>
									</td>
								</tr>
							</tbody>
						</table>

					</form>
					<div class="ibox-content">
						<div id="pro_calendar"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

