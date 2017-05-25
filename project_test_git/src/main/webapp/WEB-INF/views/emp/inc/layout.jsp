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
<link href="../resources/css/plugins/sweetalert/sweetalert.css" rel='stylesheet'>

<link href="../resources/css/bootstrap.min.inspinia.css"
	rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">

<!-- fullcalendar -->
<link href="../resources/css/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="../resources/css/plugins/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print'>


</head>

<body>
	<div id="wrapper">
		<!-- Navi 영역 -->
		<tiles:insertAttribute name="navi" />

		<!-- Header  영역  -->
		<tiles:insertAttribute name="header" />

		<!-- Main 영역 -->
		<tiles:insertAttribute name="content" />

		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>
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


<!-- Full Calendar -->
<script src="../resources/js/plugins/fullcalendar/moment.min.js"></script>
<script src="../resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="../resources/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('button[name^="delemp-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "editForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log("확인 data : " + data);

							var dataUser = data.userlist;
							var dataJob = data.joblist;
							var dataAuth = data.authlist;
							console.log("joblist 확인 : " + dataJob);
							console.log("datauser 확인 : " + dataUser);
							console.log("dataauth 확인 : " + dataAuth);
							console.log(data.authlist);
							$('#user_id').val(data.authlist[0].user_id);
							/* $('#user_name').val(data.userlist.user_name); */
					/* 		$('#user_ph').val(data.userlist.user_ph);
							$('#user_add').val(data.userlist.user_add); */
							$('#job_name').val(data.joblist.job_name);
							$('#auth_name').val(data.authlist.auth_name);
							$('#userlist').remove();

							var html = '';
							

							$('#auth_name').html(html);
							html += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name').html(html); 
							
							 $('#auth_name').change(
									function() {

										$('#auth_list_selected').val(
												$('#auth_name option:selected')
														.val());

									});

						}
					});
				});

	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="jobDel-"]').click(
				function() {
					$('#job_name_list_selected').val(
							$('#job_name')
									.val());
					console.log('#job_name_list_selected');
					console.log('#job_name');
				});
	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="edit-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "editForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log(data);

							var dataJob = data.joblist;
							var dataAuth = data.authlist;
							var dataemp = data.emplist;
							console.log("joblist 확인 : " + dataJob);
							console.log(data.emplist.user_id);
							$('#user_id').val(data.writelist.user_id);
							$('#job_name').val(dataJob.job_name);
							$('#auth_name').val(data.authlist.auth_name);
							var html = '';
							var html1 = '';
							$('#job_name').html(html);

							html += '<option value="">' + '직급 이름 선택'
									+ '</option>';
							$.each(dataJob, function(key, value) {
								html += '<option value="'+value.job_name+'">'
										+ value.job_name + '</option>';
							});

							$('#auth_name').html(html1);
							html1 += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html1 += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name').html(html1);

							$('#job_name').change(
									function() {

										$('#job_name_list_selected').val(
												$('#job_name option:selected')
														.val());

									});

							$("#job_name").html(html);
						}
					});
				});
	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="emp-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "jobForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log("확인 data : " + data);

							var dataUser = data.userlist;
							var dataJob = data.joblist;
							var dataAuth = data.authlist;
							console.log("joblist 확인 : " + dataJob);
							console.log("datauser 확인 : " + dataUser);
							console.log("dataauth 확인 : " + dataAuth);
							console.log(data.authlist.auth_name);
							$('#user_id').val(data.userlist.user_id);
							$('#user_name').val(data.userlist.user_name);
							$('#user_ph').val(data.userlist.user_ph);
							$('#user_add').val(data.userlist.user_add);
							$('#job_name').val(data.joblist.job_name);
							$('#auth_name').val(data.authlist.auth_name);
							$('#userlist').remove();

							var html = '';
							var html1 = ''; 
							$('#job_name').html(html);

							html += '<option value="">' + '직급 이름 선택'
									+ '</option>';
							$.each(dataJob, function(key, value) {
								html += '<option value="'+value.job_name+'">'
										+ value.job_name + '</option>';
							});

							$('#auth_name').html(html1);
							html1 += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html1 += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name').html(html1); 

							$('#job_name').change(
									function() {

										$('#job_list_selected').val(
												$('#job_name option:selected')
														.val());

									});

							$("#job_name").html(html);
						}
					});
				});

	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="subemp-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "editForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log("확인 data : " + data);

							var dataUser = data.userlist;
							var dataJob = data.joblist;
							var dataAuth = data.authlist;
							console.log("joblist 확인 : " + dataJob);
							console.log("datauser 확인 : " + dataUser);
							console.log("dataauth 확인 : " + dataAuth);
							console.log(data.authlist);
							$('#user_id').val(data.authlist[0].user_id);
							/* $('#user_name').val(data.userlist.user_name); */
					/* 		$('#user_ph').val(data.userlist.user_ph);
							$('#user_add').val(data.userlist.user_add); */
							$('#job_name').val(data.joblist.job_name);
							$('#auth_name').val(data.authlist.auth_name);
							$('#userlist').remove();

							var html = '';
							

							$('#auth_name').html(html);
							html += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name').html(html); 

						}
					});
				});

	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="job-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "writeForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log(data);

							var dataJob = data.joblist;
							var dataAuth = data.authlist;
							console.log("joblist 확인 : " + dataJob);
							$('#user_id').val(data.writelist.user_id);
							$('#job_name').val(dataJob.job_name);
							$('#auth_name').val(data.authlist.auth_name);
							var html = '';
							var html1 = '';
							$('#job_name').html(html);

							html += '<option value="">' + '직급 이름 선택'
									+ '</option>';
							$.each(dataJob, function(key, value) {
								html += '<option value="'+value.job_name+'">'
										+ value.job_name + '</option>';
							});

							$('#auth_name').html(html1);
							html1 += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html1 += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name').html(html1);

							$('#job_name').change(
									function() {

										$('#job_name_list_selected').val(
												$('#job_name option:selected')
														.val());

									});

							$("#job_name").html(html);
						}
					});
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
				
				html+='salSearch.htm';

				var url =  html;

			
				window.open(url, "salSearch", "width=1050,height=800,scrollbars=yes,resizeable=no")
			});
			
		});
		
	});
	
	function setChildValue2(name1,name2){
	    document.getElementById("dept_no").value = name1;
	    document.getElementById("dept_name").value = name2;
	    

	}
	
	/* sal.jsp에서 */
	function sal(name1){
		
		$('a[id^="empallow1"]').click(function(){
			
			var html ="";
			var dept =name1;
			console.log(dept);
			html+='empAllow.htm?dept_name=';
			html+=dept;
			var url =  html;
			
			
			window.open(url, "empAllow", "width=600,height=600,scrollbars=yes,resizeable=no")
		});
	}
	
	function setsalSearch(name1){
	    document.getElementById("ssum").value = Number(name1);

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
		
		
		window.open(url, "endCal", "width=750,height=480,scrollbars=yes,resizeable=no")
	});
});

</script>
<!-- 퇴직금 계산 -->
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
		sal1 = parseInt(day1)*parseInt("50000");
		$('#sal1').val(sal1);

	});
	$('#day2').on('change',function(){
		day2=$('#day2').val();
		console.log(day2);
		s = parseInt(day1)+parseInt(day2)+parseInt(day3);
		$('#sum').val(s);
		sal2 = parseInt(day2)*parseInt("50000");
		$('#sal2').val(sal2);

	});
	$('#day3').on('change',function(){
		day3=$('#day3').val();
		console.log(day3);
		s = parseInt(day1)+parseInt(day2)+parseInt(day3);
		$('#sum').val(s);
		sal3 = parseInt(day3)*parseInt("50000");
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
				
				html+='salSearch.htm';

				var url =  html;
				
				
				window.open(url, "salSearch", "width=1050,height=800,scrollbars=yes,resizeable=no")
			});
			
		});
		
		
		
	});
	
	function setChildValue2(name1,name2){
	    document.getElementById("dept_no").value = name1;
	    document.getElementById("dept_name").value = name2;
	    

	}
	
	
	
</script>




<!-- ///////////////////////////////////////////////////// -->

<script type="text/javascript">



$(document).ready(function() {



    /* initialize the calendar
     -----------------------------------------------------------------*/
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#emp_calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: false,
        droppable: false, 
        events : function(start, end, timezone, callback) {
			$.ajax({
				url : "viewatteForm.htm",
				success : function(
						doc) {
					var data = JSON
							.parse(doc);
					var events = [];
					var i = 0;
					console.log(data);
					
					
				
					
				 	$.each(data,function(key,value) {
						
							events.push({
										id : value.atte_no,
										title : "출근",
										start : new Date(value.atte_go)									
									})
							events.push({
								id : value.atte_no,
								title : "퇴근",
								start : new Date(value.atte_back)									
							})
					});
				
					callback(events); 
					
				}
			});
		}
        
        
        
        
        
        
        
        
    });
    
    


});

</script>


<!-- fullcalendar -->

<script>
$(document).ready(function() {

	
	
	
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	
	
	$('.i-checks').iCheck({
		checkboxClass : 'icheckbox_square-green',
		radioClass : 'iradio_square-green'
	});
	
	/* initialize the external events
	 -----------------------------------------------------------------*/
	
	$('#external-events div.external-event').each(
			function() {		
				$(this).data('event', {
					title : $.trim($(this).text()), 
					stick : true	
				});
		
				$(this).draggable({
					zIndex : 1111999,
					revert : true, 
					revertDuration : 0
				});
	
			});
	
	/* initialize the calendar
	 -----------------------------------------------------------------*/
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	var _id = "";
	
	$('#holi_calendar').fullCalendar(
	{
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month'
		},
	
		editable : true,
		droppable : true,
		drop : function(even) {												
			_id = $(this).attr('id');
			if ($('#drop-remove2').is(
					':checked')) {								
				$(this).remove();
			}									
			var end = event.end || "";
			if (end != "") {
				end = $(end).attr("_d");
			}
			console.log($(this).attr("id"));
			console.log($(even).attr("_d").format("yyyy-MM-dd"));
			console.log(end); 
			$.ajax({
						type : "POST",
						url : "holidropUpdate.htm",
						dataType : "JSON",
						data : {
							holi_no : $(this).attr("id"), //sequence
							holi_start : $(even).attr("_d").format("yyyy-MM-dd"),
							holi_end : end
						},
						success : function(
								data) {
						},
	
					});
	
		},
		events : function(start, end,
				timezone, callback) {
		 $.ajax({
				url : 'ajaxholilist.htm',
				success : function(
						doc) {
					var data = JSON
							.parse(doc);
					var events = [];
				
					$.each(data,function(key,value) {
						if (value.holi_end !== 'undefined') {
							events.push({
								id : value.holi_no,
								title : value.holi_content,
								start : new Date(value.holi_start),
								end : new Date(value.holi_end),
								allDay : true			
							})						
						} else {
							events.push({
								id : value.holi_no,
								title : value.holi_content,
								start : new Date(value.holi_start),
								allDay : true			
			
						})
					}
				});
			
				callback(events);
			}
			}); 
		},
	
		eventDrop : function(event, delta,
				revertFunc) {

		 	var id = event.id;
			var start = event.start;
			var end = event.end || "";
			if (end != "") {
				end = $(end).attr("_d");
			};			
			if (typeof id == "undefined") {
				
				id = _id;
			
			};
			

			$.ajax({
				type : "POST",
				url : "holidropUpdate.htm",
				dataType : "JSON",
				data : {
					holi_no : id, //sequence
					holi_start : $(start).attr("_d").format("yyyy-MM-dd"),
					holi_end : end.format("yyyy-MM-dd")
				}
	
			}); 
	
		},
		eventResize : function(event,
				delta, revertFunc) {
	
			 var id = event.id;
			 var start = event.start._d;
			var end = event.end._d;
			
			if (typeof id == "undefined") {
				
				id = _id;
			
			};
			
		
			$.ajax({
				type : "POST",
				url : "holidropUpdate.htm",
				dataType : "JSON",
				data : {
					holi_no : id, //sequence
					holi_start : start.format("yyyy-MM-dd"),
					holi_end : end.format("yyyy-MM-dd")
	
				}
	
			}); 
	
		},
		eventClick : function(calEvent,
				jsEvent, view) {
	
			 console.log("calEvent"
					+ calEvent);
			console.log("jsEvent  "
					+ jsEvent);
			console.log("view  " + view);
	
			var id = calEvent.id;
			if (typeof id == "undefined") {
				id = _id;
			}
			console.log(id);
	
			$('.col-lg-9').ready(function() {
				swal(
						{
							title : "휴가를 지우시겠습니까?",
							text : "휴가를 지우면 다시 되돌릴 수 없습니다!",
							type : "warning",
							showCancelButton : true,
							confirmButtonColor : "#DD6B55",
							confirmButtonText : "Yes, delete it!",
							closeOnConfirm : false
						},
						function() {
							swal(
									"삭제 !",
									"파일을 지우고 있습니다..",
									"success");

					$.ajax({
								type : "POST",
								url : "deleteholi.htm",
								dataType : "JSON",
								data : {
									holi_no : id
								},
								success : function(
										data) {

									 window.location.reload();
						}

					});

				});

			}); 
		}
	});

});
</script>










<!-- ///////////////////////////////////////////////////// -->

<script type="text/javascript">
	

function sal1(name1){
	
	$('a[id^="eachsal"]').click(function(){
		
		var html ="";
		html+='eachSal.htm';

		var url =  html;

		
		window.open(url, "eachSal", "width=700,height=700,scrollbars=yes,resizeable=no")
	});
}

$(function(){
	
	$('a[id^="totalsal"]').click(function(){

		$('#ssum').val(dd);
		
	});
	
});

</script>

<script type="text/javascript">
$(function(){
	
	$('a[id^="checka-"]').click(function(){

		var html ="";
		var check= $(this).attr('value');
		
		html+='readAtti.htm?atti_no=';
		html+= check;
		
		var url =  html;
		
		
		window.open(url, "readAtti", "width=600,height=500,scrollbars=yes,resizeable=no")
	});
	
	$('a[id^="checkb-"]').click(function(){

		var html ="";
		var check= $(this).attr('value');
		
		html+='readDoc.htm?atti_no=';
		html+= check;
		
		var url =  html;
		
		
		window.open(url, "readDoc", "width=700,height=600,scrollbars=yes,resizeable=no")
	});
});

</script>
<script type="text/javascript">
$(function(){
$('#datepiker10').datepicker({
	dateFormat : "yy-mm-dd",
	nextText: '다음 달', 
    prevText: '이전 달',
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
});
</script>
</body>
</html>