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
							<form name="popup">
							
								<table class="table">
									<thead>
										<tr>
											<th width="80">사원no</th>
											<th width="80">성명</th>
											<th width="80">부서</th>
											<th width="80">직급</th>
											<th width="100">입사일</th>
											<th width="100">계좌번호</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach var="b" items="${list}">
											<tr>
												<td><a href="javascript:sendChildValue('${b.emp_no}','${b.user_name}','${b.job_name}','${b.emp_date}')">${b.emp_no}</a></td>
												<td>${b.user_name}</td>
												<td>${b.dept_name}</td>
												<td>${b.job_name}</td>
												<td>${b.emp_date}</td>
												<td>${b.acc_num}</td>
												
											</tr>
										
										</c:forEach>
										
									</tbody>
									
								</table>
								
								</form>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>



	
<script type="text/javascript">
	
	function sendChildValue(name1,name2,name3,name4){

		opener.setChildValue(name1,name2,name3,name4);
		window.close();
	}
	

</script>


</html>
