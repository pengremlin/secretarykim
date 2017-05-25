<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title><tiles:getAsString name="title" /></title>


<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="../resources/css/bootstrap.min.inspinia.css"
	rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">


</head>

<body>

		<!-- Main 영역 -->
		<tiles:insertAttribute name="content" />

</body>

<!-- Mainly scripts -->
<script src="../resources/js/lib/jquery-2.1.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script
	src="../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Flot -->
<script src="../resources/js/plugins/flot/jquery.flot.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="../resources/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity -->
<script src="../resources/js/plugins/peity/jquery.peity.min.js"></script>
<script src="../resources/js/demo/peity-demo.js"></script>

<!-- iCheck -->
<script src="../resources/js/plugins/iCheck/icheck.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="../resources/js/inspinia.js"></script>
<script src="../resources/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="../resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="../resources/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="../resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="../resources/js/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="../resources/js/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="../resources/js/plugins/toastr/toastr.min.js"></script>

<!-- Jquery Validate -->
<script src="../resources/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('button[name^="emp-"]').click(function() {
		
		$.ajax({	
			type : "post",
			url : "jobForm.htm", 
			data : {"user_id" : $(this).val()},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var dataUser = data.userlist;
			
				$('#userlist').remove();
				
				var html = '';
                html += '<form id="userlist" name="userlist" action="${pageContext.request.contextPath}/emp/jobsubmit.htm" method="post">';
                html += '<table class="table">';
                html += '<h4>이 계정을 사원으로 등록 시키겠습니까?</h4>';
                html += '<tr>';
				html += '<th>아이디</th><td class="td">';	
                html += '<input type="text" name="user_id" readonly value="'+dataUser.user_id+'">';
                html += '</td></tr>';
                html +=	'<tr><th>이름</th><td class="td">';
				html += '<input type="text" name="user_name" readonly value="'+dataUser.user_name+'">';
				html += '</td></tr>';
				html +=	'<tr><th>핸드폰번호</th><td class="td">';
				html += '<input type="text" name="user_ph" readonly value="'+dataUser.user_ph+'">';
				html += '</td></tr>';
				html +=	'<tr><th>주소</th><td class="td">';
				html += '<input type="text" name="user_add" readonly value="'+dataUser.user_add+'">';
				html += '</td></tr>';
				
				html += '<tr>';
				html += '<th>사원번호</th><td class="td">';	
                html += '<input type="text" name="emp_no"  value="">';
                html += '</td></tr>';
				html +=	'<tr><th>부서 번호</th><td class="td">';
				html += '<input type="text" name="dept_no"  value="">';
				html += '</td></tr>';
				html +=	'<tr><th>직급 이름</th><td class="td">';
				html += '<input type="text" name="job_name"  value="">';
				html += '</td></tr>';
				
				html += '</table>';
				html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="userlist()">입사 등록</button>';
				html += '<button type="reset" class="btn btn-primary btn-block" onclick="userlist()">취소</button>';
				html += '</form>';
				
                $("#userBody").html(html);
                $("#userDialog").modal('show'); 
			}
		});
	});
});
</script>
<script type="text/javascript">
$(function(){
	
	$('button[name^="job-"]').click(function() {
		
		$.ajax({	
			type : "post",
			url : "writeForm.htm", 
			data : {"user_id" : $(this).val()},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var dataWrite = data.writelist;
			
				$('#writelist').remove();
				
				var html = '';
                html += '<form id="writelist" name="writelist" action="${pageContext.request.contextPath}/emp/write.htm" method="post">';
                html += '<table class="table">';
                html += '<h4>직급을 부여 하시겠습니까?</h4>';
                html += '<tr>';
				html += '<th>아이디</th><td class="td">';	
                html += '<input type="text" name="user_id" readonly value="'+dataWrite.user_id+'">';
                html += '</td></tr>';
                html +=	'<tr><th>직급 이름</th><td class="td">';
				html += '<input type="text" name="job_name" value="'+dataWrite.job_name+'">';
				html += '</td></tr>';
				
				html += '</table>';
				html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="writelist()">직급 등록</button>';
				html += '<button type="reset" class="btn btn-primary btn-block" onclick="writelist()">취소</button>';
				html += '</form>';
				
                $("#writeBody").html(html);
                $("#writeDialog").modal('show'); 
			}
		});
	});
});
</script>
<script type="text/javascript">
$(function(){
	
	$('button[name^="jobReg-"]').click(function() {
		
		$.ajax({	
			type : "post",
			url : "jobwrite.htm", 
			data : {"user_id" : $(this).val()},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var dataWrite = data.joblist;
			
				$('#writelist').remove();
				
				var html = '';
                html += '<form id="writelist" name="writelist" action="${pageContext.request.contextPath}/emp/write.htm" method="post">';
                html += '<table class="table">';
                html += '<h4>직급을 생성 하겠습니까?</h4>';
                html += '<tr>';
				html += '<th>회사 번호</th><td class="td">';	
                html += '<input type="text" name="comp_no" value="'+dataWrite.user_id+'">';
                html += '</td></tr>';
                html +=	'<tr><th>직급 이름</th><td class="td">';
				html += '<input type="text" name="job_name" value="">';
				html += '</td></tr>';
				
				html += '</table>';
				html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="writelist()">직급 등록</button>';
				html += '<button type="reset" class="btn btn-primary btn-block" onclick="writelist()">취소</button>';
				html += '</form>';
				
                $("#jobBody").html(html);
                $("#jobDialog").modal('show'); 
			}
		});
	});
});
</script>
<script type="text/javascript">
$(function(){
	
	$('button[name^="jobreg-"]').click(function() {
		
		
		
		$.ajax({	
			type : "post",
			url : "jobwriteForm.htm", 
			data : {"job_name" : $(this).val()},
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var dataJob = data.jobUserlist;
			
				$('#joblist').remove();
				
				var html = '';
                html += '<form id="joblist" name="joblist" action="${pageContext.request.contextPath}/emp/jobRegsubmit.htm" method="post">';
                html += '<table class="table">';
                html += '<h4>직급을 생성 하겠습니까?</h4>';
                html += '<tr>';
                html +=	'<tr><th>회사 번호</th><td class="td">';
				html += '<input type="text" name="comp_no" readonly value="'+dataJob.comp_no+'">';
				html += '</td></tr>';
				html += '<th>직급 이름</th><td class="td">';	
                html += '<input type="text" name="job_name"  value="'+dataJob.job_name+'">';
                html += '</td></tr>';
			
			 
				html += '</table>';
				html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="userlist()">입사 등록</button>';
				html += '<button type="reset" class="btn btn-primary btn-block" onclick="userlist()">취소</button>';
				html += '</form>';
				
                $("#jobBody").html(html);
                $("#jobDialog").modal('show'); 
			}
		});
	});
});
</script>
<script>
	$(document).ready(function() {

		$("#form").validate({
			rules : {
				emp_no : {
					required : true,
					number: true
				},
				job_name : {
					required : true
					
				},
				comp_name : {
					required : true
					
				},
				dept_no : {
					required : true,
					number: true
				},
				user_id : {
					required : true
					
				}
			}
		});
	});
</script>

<script type="text/javascript">
$(function(){
	$('button[id^="check-"]').click(function(){
		
		console.log();
		console.log($('#check').val());
		var html ="";
		
		html+='allowCal.htm?allow_no=';
		html+= $(this).val();
		
		var url =  html;
		
		
		window.open(url, "allowCal", "width=700,height=600,scrollbars=yes,resizeable=no")
	});
	
	
});

</script>



<script type="text/javascript">
$(document)
.ready(
		function() {
			
			$('button[id^="acheck-"]').click(function(){
				
				var result = $('#resultBox').val();
				var v = $(this).val();
				
				$('#resultBox').val(result+v);
				
				
			});
			
			
			
			
		})
</script>

<script type="text/javascript">

$(document)
.ready(
		function() {
			
		
			
			$('button[id^="aadd-"]').click(function(){
				
				var result = $('#resultBox').val();
				var v = $(this).val();
				
				$('#resultBox').val(result+v);
				
				
			});
			
			$('button[id^="aaddBtn-"]').click(function(){
				
				var result = $('#resultBox').val();
				var v = $(this).val();
				
				$('#resultBox').val(result+v);
				
				
			});
			
			
			
		})
			
	
</script>
<script type="text/javascript">
$(function(){
	
	$('a[id^="check-"]').click(function(){

		var html ="";
		
		html+='empList.htm';

		var url =  html;
		
		
		window.open(url, "empList", "width=700,height=600,scrollbars=yes,resizeable=no")
	});
	
	$('a[id^="dept"]').click(function(){

		var html ="";
		
		html+='deptList.htm';

		var url =  html;
		
		
		window.open(url, "deptList", "width=400,height=400,scrollbars=yes,resizeable=no")
	});
	
	
});


function setChildValue(name1,name2,name3,name4){
    document.getElementById("emp_no").value = name1;
    document.getElementById("user_name").value = name2;
    document.getElementById("job_name").value = name3;
    document.getElementById("emp_date").value = name4;

}

function setChildValue2(name1,name2){
    document.getElementById("dept_no").value = name1;
    document.getElementById("dept_name").value = name2;
    

}
</script>

<script type="text/javascript">
	
	
	function sendChildValue2(name1,name2){

		opener.setChildValue2(name1,name2);
		window.close();
	}
</script>

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

		
		$(function(){
			
			$('a[id^="search"]').click(function(){

				var html ="";
				
				html+='test1.htm';

				var url =  html;
				
				
				window.open(url, "test", "width=1050,height=800,scrollbars=yes,resizeable=no")
			});
			
		});
		
	});
	
	function setChildValue2(name1,name2){
	    document.getElementById("dept_no").value = name1;
	    document.getElementById("dept_name").value = name2;
	    

	}
	
	
</script>
<script type="text/javascript">
$(function(){
	
	$('a[id^="rcheck-"]').click(function(){

		var html ="";
		var check= $(this).attr('value');
		
		html+='endCal.htm';
		//html+= check;
		
		var url =  html;
		
		
		window.open(url, "endCal", "width=750,height=600,scrollbars=yes,resizeable=no")
	});
});

</script>
<script type="text/javascript">
$(function(){
	
	console.log('달력');
	$('#datepiker1').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#datepiker2').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#datepiker3').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#datepiker4').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#datepiker5').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$('#datepiker6').datepicker({
		dateFormat : "dd",
		nextText: '다음 달',
	    prevText: '이전 달',
	    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	var check1;
	var check2;
	var check3;
	var check4;
	var dk1;
	var dk2; 

	$('#check-1').on('change', function() {       
        check1=$(this).val();
        alert(this.value);
    });
	$('#check-2').on('change', function() {       
        check2=$(this).val();
    });
	$('#check-3').on('change', function() {       
        check3=$(this).val();
    });
	$('#check-4').on('change', function() {       
        check4=$(this).val();

    });
	$('#datepiker1').on('change', function() {       
		dk1=$(this).val();

    });
	$('#datepiker2').on('change', function() {       
		dk2=$(this).val();

		
    });
	
	var day1="0";
	var day2="0";
	var day3="0";
	var s="0";
	var sal1="0";
	var sal2="0";
	var sal3="0";


	$('#day1').on('change',function(){
		day1=Number($('#day1').val());
		console.log(day1);
		s = parseInt(day1)+parseInt(day2)+parseInt(day3);
		$('#sum').val(s);
		sal1 = parseInt(day1)*parseInt("500000");

		$('#sal1').val(sal1);

	});
	$('#day2').on('change',function(){
		day2=$('#day2').val();
		console.log(day2);
		s = parseInt(day1)+parseInt(day2)+parseInt(day3);
		$('#sum').val(s);
		sal2 = parseInt(day2)*parseInt("500000");
		$('#sal2').val(sal2);

	});
	$('#day3').on('change',function(){
		day3=$('#day3').val();
		console.log(day3);
		s = parseInt(day1)+parseInt(day2)+parseInt(day3);
		$('#sum').val(s);
		sal3 = parseInt(day3)*parseInt("500000");
		$('#sal3').val(sal3);
		var t = (sal1+sal2+sal3)*Number(0.9);
		$('#sum_total').val(t);
	});
	
});

</script>
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

		
		
		$(function(){
			
			$('a[id^="search"]').click(function(){

				var html ="";
				
				html+='test1.htm';

				var url =  html;
				
				
				window.open(url, "test", "width=1050,height=800,scrollbars=yes,resizeable=no")
			});
			
		});
		
		
		
	});
	
function empAllow(name1){
   		
		$(function(){
			
			$('a[id^="allow1"]').click(function(){

				var html ="";
				var emp =name1;
				
				html+='empAllowList.htm?emp_no=';
				html+=emp
				
				var url =  html;
				
				
				window.open(url, "empAllowList", "width=550,height=600,scrollbars=yes,resizeable=no")
			});
			
		});

	}
	
	function setChildValue2(name1,name2){
	    document.getElementById("dept_no").value = name1;
	    document.getElementById("dept_name").value = name2;
	    

	}
	
</script>
<script type="text/javascript">


		function empAllowList(name1,name2){

			opener.empAllowList2(name1,name2);
			
		}



</script>

<script type="text/javascript">



function empAllowList2(name1,name2){
	var n1=Number(name1);
	var s = $('#sum-2001').val();
	var s2 = $('#sum-'+name2).val();
	console.log(n1);
	console.log(name2);
	console.log(s);
	console.log(s2);
	var sum1 = Number($('#sum-2001').val());
	var sum2 = Number($('#sum-'+name2).val());
	console.log(sum1);
	console.log(sum2);
	document.getElementById("sum-"+name2).value = sum2+n1;
	document.getElementById("gong-"+name2).value = (sum2+n1)*Number(0.0852);
}
</script>
	
<script type="text/javascript">


		function salSearch(name1){

			opener.setsalSearch(name1);
			
		}


</script>


</body>
</html>