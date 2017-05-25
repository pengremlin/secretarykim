<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
                            <h5>사전작업 </h5>
                            
                        </div>
                        <div class="ibox-content">
						
                            <table class="table table-bordered">
                                <thead>
							<tr>
								<th style="width: 30px"></th>
								<th style="width: 50px">수당no</th>
								<th style="width: 150px">수당명</th>
								<th style="width: 100px">금액</th>
								<th style="width: 50px"></th>
							</tr>
						</thead>

                                
                                <tbody>
                                <c:forEach var="b" items="${list}">
                                
                                <tr>
                                <form name="atti_KindForm" action="${pageContext.request.contextPath}/emp/insertEmpAllow.htm?allow_no=${b.allow_no}&emp_no=${emp_no}"
								method="post">
								<fmt:formatNumber value="${b.allow_sal }" type="number" var="qp"/>
                                    <td style="width: 30px">
                                    	<input type="checkbox" id="checkbox-${b.allow_no }">
                                    	
                                    </td>
                                  
                                    <td style="width: 50px">${b.allow_no }</td>
                                    
                                    <td style="width: 150px">${b.allow_name }</td>
                                    
                                    <td><input style="width: 100px" type="text" id="sum" value="${qp }" ></td>
                                    
                                    <td style="width: 50px">
                                    	<button type="submit" class="btn btn-primary btn-block" onclick="javascript:empAllowList('${b.allow_sal }','${emp_no }')" id="allow_sal">입력</button>
                                    </td> 
                                </form>
                                </tr>
                               
                                </c:forEach>
                                </tbody>
                               
                            </table>
						 <input type="button" onclick="javascript:window.close();" value="완료">
                        </div>

							
							
						</div>
					</div>
				</div>
			</div>