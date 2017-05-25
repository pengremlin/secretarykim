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
											<th width="80">부서no</th>
											<th width="80">부서명</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach var="b" items="${list}">
											<tr>
												<td><a href="javascript:sendChildValue2('${b.dept_no}','${b.dept_name}')">${b.dept_no}</a></td>
												<td>${b.dept_name}</td>
											</tr>
										
										</c:forEach>
										
									</tbody>
									
								</table>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>

