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
                            <h3>재직자 퇴직금 계산 </h3>
                            
                        </div>
                        <div class="ibox-content">

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                	<th style="text-align: center">사원 번호</th>
                                    <th style="text-align: center">성명</th>
                                    <th style="text-align: center">급여 차수</th>
                                    <th style="text-align: center">부 서</th>
                                    <th style="text-align: center">직위/직급</th>
                                    <th style="text-align: center">입사일</th>
                                    <th style="text-align: center">근속연수</th>
                                    <th style="text-align: center">근속월수</th>
                                    <th style="text-align: center">계산</th>	
                                </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="b" items="${list}">
										<tr>
                                   			<td style="text-align: center; vertical-align: middle">${b.emp_no}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.user_name}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.step}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.dept_name}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.job_name}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.emp_date}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.year}</td>
                                    		<td style="text-align: center; vertical-align: middle">${b.month}</td>
                                    		<td style="text-align: center; vertical-align: middle">
                                    			<a id="rcheck-${b.emp_no}" value="${b.emp_no}">계산</a>
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


<script type="text/javascript">
$(function(){
	
	$('a[id^="rcheck-"]').click(function(){

		var html ="";
		var check= $(this).attr('value');
		
		html+='endCal.htm';
		//html+= check;
		
		var url =  html;
		
		
		window.open(url, "endCal", "width=700,height=600,scrollbars=yes,resizeable=no")
	});
});

</script>

