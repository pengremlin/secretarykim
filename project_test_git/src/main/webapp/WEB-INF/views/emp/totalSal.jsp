<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 등록</title>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<!-- Mainly scripts -->
<script src="resources/js/lib/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="resources/js/plugins/flot/jquery.flot.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="resources/js/demo/peity-demo.js"></script>

<!-- Custom and plugin javascript -->
<script src="resources/js/inspinia.js"></script>
<script src="resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="resources/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="resources/js/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="resources/js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="resources/js/plugins/toastr/toastr.min.js"></script>
<link href="resources/css/bootstrap.min.inspinia.css" rel="stylesheet">
<link href="resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="resources/css/jquery.gritter.css" rel="stylesheet">

<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">


</head>
<body>

	<!-- 전체 페이지 레이아웃 모든 include 또는 content 는 이 안에 들어가야함 -->
	<div id="wrapper">

		<!-- 인클루드되는 페이지의 css bootstrap jquery 링크는 삭제 -->
		<%
			pageContext.include("inc/navi.jsp");
		%>
		<!-- 인클루드되는 페이지의 css bootstrap jquery 링크는 삭제 -->

		<!-- 네비옆 회색 메인 컨텐츠 부분 -->
		<div id="page-wrapper" class="gray-bg">
			<!-- 네비 접었다 폈다 하기 -->
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
						href="#"><i class="fa fa-bars"></i> </a>
				</div>
				</nav>
			</div>
			<!-- 네비 접었다 폈다 하기 -->
			<!-- 페이지 헤더? -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10"></div>
				<div class="col-lg-2"></div>
			</div>
			<!-- 페이지 헤더? -->
			<!-- Main 끝 -->

			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
                            <h5>전체 계산 </h5>
                            
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
                                	
                                    <td style="width: 90px"><a id=allow href="javascript:empAllow('${b.emp_no }')">${b.emp_no }</a></td>
                                  
                                    <td style="width: 90px">${b.user_name }</td>
                                    
                                    <td style="width: 90px">${b.dept_name }</td>
                                    
                                    <td><input style="width: 90px" type="text" id="tsum"></td>
                                    
                                    <td><input style="width: 90px" type="text" id="tgong"></td>
                                    
                                    <td><input style="width: 90px" type="text" id="tsal"></td>
                                    
                                </tr>
                                </c:forEach>
                                </tbody>
                                
                            </table>

                        </div>

							
							
						</div>
					</div>
				</div>
			</div>
		</div>
		

				
		<!-- 채팅 인클루드 자리 -->
		<%
			pageContext.include("inc/chat.jsp");
		%>
		
	</div>
	
	<!-- Mainly scripts -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Peity -->
	<script src="js/plugins/peity/jquery.peity.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>

	<!-- iCheck -->
	<script src="js/plugins/iCheck/icheck.min.js"></script>

	<!-- Peity -->
	<script src="js/demo/peity-demo.js"></script>
	
	
</body>
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