<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
                            <h5>개별 계산</h5>
                            
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
                                    <th>급여</th> 
                                </tr>
                                </thead>
                                
                                <tbody>
                                <c:forEach var="b" items="${list}">
                                <tr>
                                	
                                    <td style="width: 90px">${b.emp_no }</td>
                                  
                                    <td style="width: 90px">${b.user_name }</td>
                                    
                                    <td style="width: 90px">${b.dept_name }</td>
                                    <fmt:formatNumber value="${sal}" type="number" var="qp1"/>
                                    <td><input style="width: 90px" type="text" id="esum" value="${qp1}" readonly="readonly"></td>
                                    <fmt:formatNumber value="${sal*0.052}" type="number" var="qp2"/>
                                    <td><input style="width: 90px" type="text" id="egong" value="${qp2}"readonly="readonly"></td>
                                    <fmt:formatNumber value="${list3.get(0).allow_sal*b.step+sal}" type="number" var="qp3"/>
                                    <td><input style="width: 90px" type="text" id="esal" value="${qp3}" readonly="readonly"></td>
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
		$('#salDate').datepicker({
			dateFormat : "yy-mm",
			nextText: '다음 달',
	        prevText: '이전 달',
	        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		$('a[id^="dept"]').click(function(){

			var html ="";
			
			html+='deptList.htm';

			var url =  html;
			
			
			window.open(url, "deptList", "width=400,height=400,scrollbars=yes,resizeable=no")
		});

		$('a[id^="empallow"]').click(function(){
			
			var html ="";
			var dept ="인사팀1";
			console.log(dept);
			html+='empAllow.htm?dept_name=';
			html+=dept;
			var url =  html;
			
			
			window.open(url, "empAllow", "width=600,height=400,scrollbars=yes,resizeable=no")
		});
		
		$(function(){
			
			$('a[id^="search"]').click(function(){

				var html ="";
				
				html+='test1.htm';

				var url =  html;
				
				
				window.open(url, "test", "width=1050,height=800,scrollbars=yes,resizeable=no")
			});
			
		});
		
		$(function(){
			
			$('a[id^="eachsal"]').click(function(){

				var html ="";
				
				html+='eachsal.htm';

				var url =  html;
				
				
				window.open(url, "eachsal", "width=700,height=700,scrollbars=yes,resizeable=no")
			});
			
		});
		
		$(function(){
			
			$('a[id^="totalsal"]').click(function(){

				var html ="";
				
				html+='totalsal.htm';

				var url =  html;
				
				
				window.open(url, "totalsal", "width=700,height=700,scrollbars=yes,resizeable=no")
			});
			
		});
		
	});
	
	function setChildValue2(name1,name2){
	    document.getElementById("dept_no").value = name1;
	    document.getElementById("dept_name").value = name2;
	    

	}
	
</script>
</html>