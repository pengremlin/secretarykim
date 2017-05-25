<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="wrapper wrapper-content animated fadeIn" >


            <div class="row">
                <div class="col-lg-6">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class=""><a data-toggle="tab" href="#tab-1">근태 문서 작성</a></li>
                            
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body" style="width: 800px;">
                                    <div class="ibox-title">
					<div id="wrap">
						
						
						<div id="tbl">
							<form name="reqRegForm" action="${pageContext.request.contextPath}/emp/docWrite.htm" method="post" enctype="multipart/form-data">
								<table class="table table-bordered" summary="주문내역입력">
									<tr>
										<th width="100">문서 제목</th>
											<td>
												<input type="text" name="doc_title"
												maxlength="40" class="rightnone" style="width: 200px;">
											</td>
										
									</tr>
									<tr>
										<th width="100">작성일</th>
								 			<td>
												<input type="text" name="doc_date" id="datepiker10" class="rightnone" style="width: 150px;">
											</td>
										
									</tr>
									<tr>
										<th width="100">첨부파일함</th>
										<td>
											<input type="file" name="file">
										</td>
										
										</tr>
										<tr>
											<th width="100">근태 종류</th>
											<td class="td" >
												<select class="y" name="atti_kind_no"> 
												<c:forEach var="l" items="${list2 }">
													<option value=${l.atti_kind_no } >${l.atti_kind }</option> 
												</c:forEach>
													
												</select> 
											</td>
										</tr>
										<tr>
											<th width="100"> 문서 내용 </th>
											<td colspan="3">
												<textarea rows="10" cols="50" name="doc_content" onclick="this.value=''">문서 내용을 입력해주세요</textarea>
      											</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2">
												<button type="submit" class="btn btn-primary btn-block" style="width: 100px;">등록</button>
											</td>
											<td></td>
										</tr>
									</table> 
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
											<th style="text-align: center;">근태번호</th>
											<th style="text-align: center;">사원번호</th>
											<th style="text-align: center;">성명</th>
											<th style="text-align: center;">부서</th>
											<th style="text-align: center;">직급</th>
											
											<th style="text-align: center;">작성일</th>
											
											<th style="text-align: center;">내역조회</th>
											<th style="text-align: center;">문서내역</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="b" items="${list }">
										<tr>
											<td style="text-align: center; vertical-align: middle;">${b.atti_no }</td>
											<td style="text-align: center; vertical-align: middle;">${b.emp_no }</td>
											<td style="text-align: center; vertical-align: middle;">${b.user_name }</td>
											<td style="text-align: center; vertical-align: middle;">${b.dept_name }</td>
											<td style="text-align: center; vertical-align: middle;">${b.job_name }</td>
											
											<td style="text-align: center; vertical-align: middle;">${b.atti_date }</td>
											
											<td style="text-align: center; vertical-align: middle;">
												<a id="checka-${b.atti_no}" value="${b.atti_no}">조회</a>
											</td>
											<td style="text-align: center; vertical-align: middle;">					
												<a id="checkb-${b.atti_no}" value="${b.atti_no}">조회</a>
											</td>
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>


