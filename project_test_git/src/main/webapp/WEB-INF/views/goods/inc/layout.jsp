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

<script type="text/javascript">
	
	/*  탭클릭시 현재 탭 내용 유지 */
	/* $(document).ready(function(){
		var link = document.location.href;
		console.log("link 확인 : " + link);
		var tab = link.split('/').pop(); // 배열 마지막 요소 삭제후 삭제된 해당값 반환
		$('a[href$='+tab+']').trigger("click");
	}); */
	
	/*
	* @method Name : search
	* @date :2016. 06. 17
	* @description : 거래처 검색
	* @param spec : 없음
	*/
	$('#searchBtn').click(function() {
		
		console.log("여기는 타는거니 search function");
		console.log($('#searchCust').val());
		
		$.ajax({
			type : "post",
			url : "searchCust.htm",
			data : {"search" : $('#searchCust').val() },
			dataType : "json",
			success : function(data) {
				
				console.log("받은 data 확인 : " + data.list);
				
				var html = '';
				$.each(data.list, function(index, obj){
						html += '<tr>';
						html += '<td><button class="btn btn-rounded-3x btn-outline btn-info" data-dismiss="modal" name="seNo-'+index+'" value="'+obj.cust_no+'">'+obj.cust_no+'</a></td>';
						html += '<td>'+obj.cust_name+'</td>';
						html += '<td>'+obj.cust_pre+'</td>';
						html += '<td>'+obj.cust_ph1+'</td>';
						html += '</tr>';
				});
				
				$("#searchCustList").html(html);
				$('#searchCustDiv').show();

				$('button[name^="seNo-"]').click(function() {
					console.log("넘길 값 확인 번호 클릭시 : " + $(this).val() );
					
					$('#resultSearch').val( $(this).val() );
					
				});
			}
		});
	});
	
	/*
	 * @method Name : modi
	 * @date :2016. 06. 17
	 * @description : 비동기로 거래처통장 상세정보 가져와 모달창에 뿌려주기
	 */

	/* 	$(function() { */
			$('button[name^="acc-"]')
					.click(
							function() {

								console.log('button클릭은 타니?');

								$.ajax({
											type : "post",
											url : "detailCustAcc.htm",
											data : {"cust_acc_no" : $(this).val()},
											dataType : "json",
											success : function(data) {
												console.log(data.dto);
												var data = data.dto;
												
												console.log("data: " + data.cust_acc_bank);
												
												$('#custaccmodi').remove();
												
												var html = '';
												html += '<form id="custaccmodi" name="custaccmodi" action="custaccModi.htm" method="post">';
												html += '<table class="table">';
												html += '<tr><th>거래처통장번호</th><td class="td">';
												html += '<input type="text" name="cust_acc_no" readonly value="'+data.cust_acc_no+'">';
												html += '</td></tr>';
												html += '<tr><th>거래처번호</th><td class="td">';
												html += '<input type="text" name="cust_no" value="'+data.cust_no+'">';
												html += '</td></tr>';
												html += '<tr><th>은행</th><td class="td">';
												html += '<input type="text" name="cust_acc_bank" value="'+data.cust_acc_bank+'">';
												html += '</td></tr>';
												html += '<tr><th>계좌번호</th><td class="td">';
												html += '<input type="text" name="cust_acc_num" value="'+data.cust_acc_num+'">';
												html += '</table>';
												html += '<button type="submit" class="btn btn-primary btn-block">거래처통장수정</button>';
												html += '</form>';

												$("#CustAcBody").html(html); 
												$('#custAccDialog').modal('show');
											}
										});
							});
		/* }); */

	
	/*
	 * @method Name : cust
	 * @date :2016. 06. 08
	 * @description : 비동기로 거래처 상세정보 가져와 모달창에 뿌려주기
	 */
/* 	 $(function(){ */
			
			$('button[name^="cust-"]').click(function() {
				
				$.ajax({	
					type : "post",
					url : "detailCust.htm", 
					data : {"cust_no" : $(this).val()},
					dataType : "json",
					success : function(data) {
						console.log(data.dto);
						
						var data = data.dto;
						
						console.log("data: " + data.cust_name );
					
						$('#custmodi').remove();
						
						
						var html = '';
		                html += '<form id="custmodi" name="custmodi" action="custModi.htm" method="post">';
		                html += '<table class="table">';
		                html += '<tr>';
						html += '<th>거래처번호</th><td class="td">';	
		                html += '<input type="text" name="cust_no" readonly value="'+data.cust_no+'">';
		                html += '</td></tr>';
		                html +=	'<tr><th>거래처명</th><td class="td">';
						html += '<input type="text" name="cust_name" value="'+data.cust_name+'">';
						html += '</td></tr>';
						html +=	'<tr><th>대표자명</th><td class="td">';
						html += '<input type="text" name="cust_pre" value="'+data.cust_pre+'">';
						html += '</td></tr>';
						html +=	'<tr><th>전화번호</th><td class="td">';
						html += '<input type="text" name="cust_ph1" value="'+data.cust_ph1+'">';
						html += '</td></tr>';
						html +=	'<tr><th>핸드폰번호</th><td class="td">';
						html += '<input type="text" name="cust_ph2" value="'+data.cust_ph2+'">';
						html += '</td></tr>';
						html +=	'<tr><th>주소</th><td class="td">';
						html += '<input type="text" name="cust_add" value="'+data.cust_add+'">';
						html += '</td></tr>';
						html +=	'<tr><th>팩스</th><td class="td">';
						html += '<input type="text" name="cust_fax" value="'+data.cust_fax+'">';
						html += '</td></tr>';
						html += '</table>';
						html +=	'<button type="submit" class="btn btn-primary btn-block" onclick="cust_modi()">거래처수정</button>';
						html += '</form>';
						
		                $("#modiCustBody").html(html);
		                $('#modiCustDialog').modal('show'); 
					}
				});
			});
		/* }); */
		
		function cmaComma(obj) {
		    var firstNum = obj.value.substring(0,1); // 첫글자 확인 변수
		    var strNum = /^[/,/,0,1,2,3,4,5,6,7,8,9,/]/; // 숫자와 , 만 가능
		    var str = "" + obj.value.replace(/,/gi,''); // 콤마 제거  
		    var regx = new RegExp(/(-?\d+)(\d{3})/);  
		    var bExists = str.indexOf(".",0);  
		    var strArr = str.split('.');  
		 
		    if (!strNum.test(obj.value)) {
		        alert("숫자만 입력하십시오.\n\n특수문자와 한글/영문은 사용할수 없습니다.");
		        obj.focus();
		        return false;
		    }
		 
		    if ((firstNum < "0" || "9" < firstNum)){
		        alert("숫자만 입력하십시오.");
		        obj.focus();
		        return false;
		    }
		 
		    while(regx.test(strArr[0])){  
		        strArr[0] = strArr[0].replace(regx,"$1,$2");  
		    }  
		    if (bExists > -1)  {
		        obj.value = strArr[0] + "." + strArr[1];  
		    } else  {
		        obj.value = strArr[0]; 
		    }
		}
		
		/*
		* @method Name : datepicker()
		* @date :2016. 06. 19
		* @description : 데이터 피커
		*/
		$('#start_date').datepicker({
			minDate: 0,
			dateFormat : "yy/mm/dd",
			nextText: '다음 달',
	        prevText: '이전 달',
	        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		$('#end_date').datepicker({
			minDate: 0,
			dateFormat : "yy/mm/dd",
			nextText: '다음 달',
	        prevText: '이전 달',
	        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		// 종결문서 등록시
		$('#deliver_date').datepicker({
			minDate: 0,
			dateFormat : "yy/mm/dd",
			nextText: '다음 달',
	        prevText: '이전 달',
	        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		/*
		 * @method Name : reqlist. tab
		 * @date :2016. 06. 20
		 * @description : reqlist 에서 탭
		 */
		$( "#tabs" ).tabs({
		      collapsible: true,
		      active : 1
		    });
		 
		/*
		 * @method Name : invenmodi
		 * @date :2016. 06. 19
		 * @description : 새로운 문서 등록
		 * @param spec : 없음
		 */
		/* $('#NewReqBtn').click(function(){
			window.open("newreg.htm", "reqreg", "width=750, height=600, scrollbars=yes, resizeable=no");
			
		});  */
		
		// 종결문서 등록 페이지 열기
		$('button[id^="endReqA-"]').click(function(){
			var no = $(this).val();
			
			var html ="";
			html += "deliverreg.htm?request_no=";
			html += no;
			
			console.log(" url주소 확인  : " + html);
			var url = html;
			window.open(url, "deliverreg", "width=750, height=600,scrollbars=yes,resizeable=no");
		}); 
		
		/*
		* @method Name : openFile()
		* @date :2016. 06. 22
		* @description : regreq에서 파일등록 누를때 또는 파일리스트 열림
		*/
		$('#openFile').click(function(){
			window.open("openFilelist.htm", "openFilelist", "width=550, height=400,scrollbars=yes,resizeable=no");
			
		});
	
		// filereg로 보내기
		function sendFileValue(name1,name2){
			opener.setChildValue(name1, name2);
			console.log("자식에서 보내는 값 확인 : " + name1);
			window.close();
		}
		
		// 자식창에서 정보 받기
		function setChildValue(name1,name2){
		    document.getElementById("data_no").value = name1;
		    console.log("name2 : " + name2);
		    $('#openFile').hide();
		    $('#first_no').hide();
		    $('#showfileName').show().text(name2);
		}
		
		
		$('#printDeliver').click(function(){
			$(this).hide();
			$('#back1').hide();
			window.print();
		});
		
		$('#printReq').click(function(){
			$(this).hide();
			$('#back2').hide();
			window.print();
		});
		
		/*
		* @method Name : search2 
		* @date :2016. 06. 25
		* @description : 프로젝트 검색
		* @param spec : 없음
		*/
		$('#searchProBtn').click(function() {
			
			console.log("입력값 : " + $('#inputPro').val() );
			console.log("검색종류 : " + $('#findPro').val() );
			$.ajax({
				type : "post",
				url : "searchPro.htm",
				data : {
						 "search1" : $('#findPro').val(),
						 "search2" : $('#inputPro').val()
						},
				dataType : "json",
				success : function(data) {
					console.log("받은 data 확인 : " + data.list);
					
					var html = '';
					$.each(data.list, function(index, obj){
							html += '<tr>';
							html += '<td><button class="btn btn-rounded-3x btn-outline btn-info" data-dismiss="modal" name="proNo-'+index+'" value="'+obj.project_no+'">'+obj.project_no+'</a></td>';
							html += '<td>'+obj.project_name+'</td>';
							html += '</tr>';
					});
					
					$("#searchProList").html(html);
					$('#searchProDiv').show();

					$('button[name^="proNo-"]').click(function() {
						console.log("넘길 값 확인 번호 클릭시 : " + $(this).val() );
						
						$.ajax({
							type : "post",
							url : "getProDetail.htm",
							data : { "project_no" : $(this).val()},
							success : function(data){
								/* var data = JSON.parse(data); */
								
								console.log("가져온 값 확인 : " + data)
								console.log("0625받은 값 확인 : " + data.pro.project_no);
								console.log("0625받은 값 확인 : " + data.pro.project_name);
								
								$('#resultProNo').val(data.pro.project_no);
								$('#resultProName').val(data.pro.project_name);
								$('#pronobtn').hide();
								$('#showProName').show().text(data.pro.project_name);
							}
							
						});
						
						
					});
				}
			});
		});
</script>
</body>
</html>