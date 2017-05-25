<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="dept_name" value="${dept_name }" scope="session"/>
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
                                	<th>사원번호</th>
                                	<th>사원명</th>
                                	<th>부서명</th> 
                                	<th>수당총액</th>                          
                                    <th>공제총액</th> 
                                </tr>
                                </thead>
                                
                                <tbody>
                                <c:forEach var="b" items="${list}">
                                <tr>
                                	
                                    <td style="width: 90px"><a id=allow1 href="javascript:empAllow('${b.emp_no }')">${b.emp_no }</a></td>
                                  
                                    <td style="width: 90px">${b.user_name }</td>
                                    
                                    <td style="width: 90px">${b.dept_name }</td>
                                    
                                    <td><input style="width: 90px" type="text" id="sum-${b.emp_no}"></td>
                                    
                                    <td><input style="width: 90px" type="text" id="gong-${b.emp_no}"></td>
                                    
                                </tr>
                                </c:forEach>
                                </tbody>
                                
                            </table>

                        </div>

							
							
						</div>
					</div>
				</div>
			</div>
		
