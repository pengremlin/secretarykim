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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<link href="../resources/css/bootstrap.min.inspinia.css"
	rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">
<link href="../resources/css/plugins/sweetalert/sweetalert.css" rel='stylesheet'>
<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">
<script src="../resources/js/plugins/sweetalert/sweetalert.min.js"></script>

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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="../resources/js/lib/jquery-2.1.1.js"></script>
<script
	src="../resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Mainly scripts -->
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
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
<script type="text/javascript">
	$(function() {

		$('button[name^="authdel-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "authDel.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log(data);

							var dataAuth = data.authlist;
							console.log("authlist 확인 : " + dataAuth);
							console.log(data.userlist);
							console.log(data.authlist.auth_name);
							/* $('#user_id1').val(data.userlist.user_id); */
							$('#auth_name1').val(dataAuth.auth_name);
							$('#user_id1').val(dataAuth[0].user_id);
							var html = '';

							$('#user_id').val(
									$('#user_id1')
											.val());

							$('#auth_name1').html(html);
							html += '<option value="">' + '권한 리스트 확인'
									+ '</option>';
							$.each(dataAuth, function(key, value) {
								html += '<option value="'+value.auth_name+'">'
										+ value.auth_name + '</option>';
							});
							$('#auth_name1').html(html);
							
							$('#auth_name1').change(
									function() {

										$('#auth_list_selected').val(
												$('#auth_name1 option:selected')
														.val());

									});

						}
					});
				});
	});
</script>
<script type="text/javascript">
	$(function() {

		$('button[name^="auth-"]').click(
				function() {

					$.ajax({
						type : "post",
						url : "authWriteForm.htm",
						data : {
							"user_id" : $(this).val()
						},
						dataType : "json",
						success : function(data) {
							console.log(data);

							var dataAuth = data.authlist;
							console.log("authlist 확인 : " + dataAuth);
							$('#user_id').val(data.authlist.user_id);
							$('#auth_name').val(data.authlist.auth_name);
							
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
$(function(){
	var user_id=""
	$('button[name^="auth-"]').click(function() {
		
		
		 user_id = $(this).val();
		$.ajax({	
			type : "post",
			url : "authWriteForm.htm", 
			data : {"user_id" : $(this).val()},
			dataType : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(responseData) {
				
				
				$('#user_id').val(user_id);
				
				var data = JSON.stringify(responseData);;
				console.log(data);
				var html='';

				 
				 
				$.each(data,function(key,value) {
					    
					
					   console.log(value.user_id);
					   console.log(value.auth_name);
					    
						
				
			            }); 
                $("#authBody").html(html);
                $('#authDialog').modal('show'); 
			}
		});
	});
});
</script>

<script type="text/javascript">
$(function(){
	var user_id=""
	$('button[name^="project-"]').click(function() {
		
		
		 user_id = $(this).val();
		$.ajax({	
			type : "post",
			url : "projectWriteForm.htm", 
			data : {"user_id" : $(this).val()},
			
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(responseData) {
				
				
				
				$('#listmodi').remove();
				
				$('#user_id').val(user_id);
				
				var data = JSON.stringify(responseData);;
				
				var html='';

				 
				 
				$.each(data,function(key,value) {
					    
					
					 
			            }); 
                $("#projectBody").html(html);
                $('#projectDialog').modal('show'); 
			}
		});
	});
});
</script>

<script type="text/javascript">
$(function(){
	var user_id=""
	$('button[id^="give_auth-"]').click(function() {
		
		
		 user_id = $(this).val();
		$.ajax({	
			type : "post",
			url : "get_project_for_give_auth.htm", 
			
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(responseData) {
				
				
				var data = JSON.parse(responseData);
				
				
				
				$('#user_id').val(user_id);
				
				var html='';

				 
				 
				$('#project_name').html(html);
				
				html += '<option value="">' + '참여할 프로젝트 선택' + '</option>';
					$.each(data,function(key,value) {
						html+='<option value="'+value.project_no+'">' + value.project_name+'</option>';			
						
						
									});
				$('#project_name').html(html);
					
				
				
				$('button[id^=give_auth]').click(function(){
					
					
					$.ajax({	
						type : "post",
						url : "give_auth.htm", 
						data : {"user_id" : user_id ,"project_no" : $('#project_name option:selected').val(),"project_name":$('#project_name option:selected').text()},
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(responseData) {
							
							
							
							
						
			                
						} 
					});
					swal({   title: "알림",   text: "권한이 등록되었습니다.",   type: "info",   showCancelButton: true,   closeOnConfirm: false,   showLoaderOnConfirm: true, }, 
							function(){   setTimeout(function(){     swal("권한이 등록되었습니다.");   }, 2000,location.reload()); });
					
					
					
					
				});
				
			
				
                
			}
		});
	});
});
</script>
</body>
</html>