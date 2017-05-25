<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div class="wrapper wrapper-content animated fadeInRight" >


            <div class="row">
                <div class="col-lg-6">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active" ><a data-toggle="tab" href="#tab-1">기본</a></li>
                            
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <div class="ibox-title" >
								
								<div id="wrap">
									<div id="tbl" class="tab-pan active">
										<form name="main" action="${pageContext.request.contextPath}/emp/allowBasicWrite.htm" method="post">
											<table class="table">

												<tr>
													<th>사원번호</th>
													<td class="td">
														<input type="text" name="emp_no" style="width: 150px" id="emp_no">
														<a id="check-"><i class="fa fa-search"></i></a>
														
													</td>
												</tr>
												<tr>
													<th>성명</th>
													<td class="td"><input type="text" name="user_name" id="user_name"></td>
												</tr>
												<tr>
													<th>급여구분</th>
													<td class="td">
														<input type="checkbox" name="emp_division" value="1">고정급
														<input type="checkbox" name="emp_division" value="2">변동급
													</td>
												</tr>
												<tr>
													<th>급여차수</th>
													
													<td class="td">
														<input type="text" >
													</td>
												</tr>
												<tr>
													<th>부서</th>
													<td class="td">
														<input type="text"  style="width: 70px" id="dept_no">
														<a id="dept"><i class="fa fa-folder"></i></a>
														<input type="text"  style="width: 70px" name="dept_name" id="dept_name">
													</td>
												</tr>
												<tr>
													<th>직위/직급</th>
													<td class="td">
														<input type="text"  style="width: 150px" name="job_name" id="job_name">
														
														
													</td>
												</tr>
												<tr>
													<th>입사일자</th>
													<td class="td"><input type="text" name="emp_date" id="emp_date"></td>
												</tr>
												<tr>
													<th>기타</th>
													<td class="td">
														<input type="checkbox"  value="1">재직자
														<input type="checkbox"  value="0">퇴사자
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
                </div>
</div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center">사원번호</th>
											<th style="text-align: center">성명</th>
											<th style="text-align: center">부서</th>
											<th style="text-align: center">직급</th>
											<th style="text-align: center">급여차수</th>
											<th style="text-align: center">입사일</th>
											<th style="text-align: center">계좌번호</th>
											<th style="text-align: center">삭제</th>
										</tr>
									</thead>
									
									<tbody>
										
										<c:forEach var="b" items="${list}">
											
											<form name="deleteAllowBasic" action="${pageContext.request.contextPath}/emp/allowBasicDelete.htm?emp_no=${b.emp_no}"
											method="post">
											<tr>
												<td style="text-align: center; vertical-align: middle">${b.emp_no}</td>
												<td style="text-align: center; vertical-align: middle">${b.user_name}</td>
												<td style="text-align: center; vertical-align: middle">${b.dept_name}</td>
												<td style="text-align: center; vertical-align: middle">${b.job_name}</td>
												<td style="text-align: center; vertical-align: middle">${b.step}</td>
												<td style="text-align: center; vertical-align: middle">${b.emp_date}</td>
												<td style="text-align: center; vertical-align: middle">${b.acc_num}</td>
												<td style="text-align: center; vertical-align: middle"><button type="submit" class="btn btn-danger btn-md" id="del-${b.emp_no }" >삭제</button></td>
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
