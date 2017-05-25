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

<link href="../resources/css/bootstrap.min.inspinia.css"
	rel="stylesheet">
<link href="../resources/css/font-awesome.css" rel="stylesheet">

<!-- Toastr style -->
<link href="../resources/css/toastr.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="../resources/css/jquery.gritter.css" rel="stylesheet">

<link href="../resources/css/animate.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">

<link href="../resources/css/plugins/switchery/switchery.css"
	rel="stylesheet">

<link href="../resources/css/plugins/sweetalert/sweetalert.css" rel='stylesheet'>


    <link href="../resources/css/plugins/iCheck/custom.css" rel="stylesheet">

    <link href="../resources/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
    <link href="../resources/css/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print'>


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
<script src="../resources/js/plugins/fullcalendar/moment.min.js"></script>
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
<script src="../resources/js/plugins/sweetalert/sweetalert.min.js"></script>

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

<!-- Switchery -->
<script src="../resources/js/plugins/switchery/switchery.js"></script>

<!-- jQuery UI custom -->
<script src="../resources/js/jquery-ui.custom.min.js"></script>

<!-- iCheck -->
<script src="../resources/js/plugins/iCheck/icheck.min.js"></script>

<!-- Full Calendar -->
<script src="../resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>



<script>
	$(document)
			.ready(
					function() {

						$("a[id^='edit_col_button'")
								.click(
										function() {
											$
													.ajax({
														type : "POST",
														url : "get_col_name_to_edit.htm",
														data : {
															"project_no" : $(
																	"#project_no")
																	.attr(
																			'name')
														},

														success : function(
																responseData) {

															var html = "";

															var data = JSON
																	.parse(responseData);
															html += '<table class="table table-striped">';

															$
																	.each(
																			data,
																			function(
																					key,
																					value) {

																				html += '<tr>';
																				html += '<td>'
																						+ '<input id="input_col_name-'+ value.mile_col_no +'" type="text" value='+ value.mile_col_name +'>'
																						+ '</td>';
																				html += '<td>'
																						+ '<a id="update_col_name_button-'+ value.mile_col_no+'"' + 'name="'+value.mile_col_no+'">수정</a>';
																				html += '</tr>';
																			});
															html += '</table>';

															$(
																	'#edit_col_name_body')
																	.html(html);
															/* 콜 정보들 가져오기 끝 */

															/* 여기서 부터 실제 업데이트 처리 */

															$(
																	'a[id^=update_col_name_button-]')
																	.click(
																			function() {

																				var mile_col_name = $(
																						"#input_col_name-"
																								+ this.name)
																						.val();
																				var mile_col_no = this.name;

																				swal(
																						{
																							title : "행 이름을 업데이트 하겠습니다.",
																							type : "warning",
																							showCancelButton : true,
																							confirmButtonColor : "#DD6B55",
																							confirmButtonText : "네",
																							closeOnConfirm : false
																						},
																						function() {
																							swal("업데이트 완료!");

																							$
																									.ajax({
																										type : "POST",
																										url : "update_col_name.htm",
																										data : {
																											"project_no" : $(
																													"#project_no")
																													.attr(
																															'name'),
																											"mile_col_no" : mile_col_no,
																											"mile_col_name" : mile_col_name
																										},
																										beforeSend : function() {

																										},
																										success : function(
																												responseData) {

																											console
																													.log(responseData);
																											$(
																													"#colname"
																															+ mile_col_no)
																													.html(
																															"");
																											$(
																													"#colname"
																															+ mile_col_no)
																													.html(
																															responseData
																																	.replace(
																																			/"/g,
																																			""));
																											$(
																													"#mile_colname"
																															+ mile_col_no)
																													.html(
																															"");
																											$(
																													"#mile_colname"
																															+ mile_col_no)
																													.html(
																															responseData
																																	.replace(
																																			/"/g,
																																			""));

																										}
																									});

																						});

																			});

														}
													});
										});

						var i = 0;

						$('#save_value').click(
								function() {
									var arr = [];
									$('.js-switch:checked').each(function() {
										arr.push($(this).val());
									});

									var list_name = $('#list_name').val();
									console.log(list_name);
									jQuery.ajaxSettings.traditional = true;

									$.ajax({
										type : "POST",
										url : "updateagile.htm",
										data : {
											"mile_col_no" : arr,
											"project_no" : $("#project_no")
													.attr('name'),
											"list_name" : list_name
										},

										beforeSend : function() {

										},
										success : function(responseData) {
											location.reload();
										}
									});

								});

						$(".stakeholder")
								.sortable(
										{
											connectWith : ".stakeholder",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""
												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {
															}
														});
											}
										}).disableSelection();

						$(".opportunity")
								.sortable(
										{
											connectWith : ".opportunity",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""
												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {

															}
														});
											}
										}).disableSelection();

						$(".requirements")
								.sortable(
										{
											connectWith : ".requirements",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""
												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {

															}
														});
											}
										}).disableSelection();

						$(".softwaresystem")
								.sortable(
										{
											connectWith : ".softwaresystem",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""
												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {

															}
														});
											}
										}).disableSelection();

						$(".team").sortable({
											connectWith : ".team",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""

												$.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															}
														});
											}
										}).disableSelection();

						$(".wayofworking")
								.sortable(
										{
											connectWith : ".wayofworking",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""

												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {

															}
														});
											}
										}).disableSelection();

						$(".work")
								.sortable(
										{
											connectWith : ".work",
											update : function(event, ui) {
												var string = $(this).sortable(
														'toArray').toString();
												var html = ""

												$
														.ajax({
															type : "POST",
															url : "updatemilestone.htm",
															data : {
																"alph_loc" : this.id,
																"alph_title" : string
															},
															success : function(
																	responseData) {

															}
														});
											}
										}).disableSelection();

						$('a[id^="test-"]').click(function() {
											var html = '';

											$.ajax({
													type : "POST",
														url : "callcard.htm",
														data : {
															"alph_title" : this.name,
															"project_no" : $("#project_no").attr('name')
														},
														contentType : "application/x-www-form-urlencoded; charset=UTF-8",

														success : function(responseData,index) {

															if (responseData != null) {

																var data = JSON
																		.parse(responseData);
																html += '<table class="table table-striped">';

																$.each(data,function(key,value) {
																					html += '<tr>'
																							+ '<td>'
																							+ '<select class="alph_score" id="alph_score'+value.alph_content_no+'">'
																							+ '<option id='+value.alph_content_no+' vlaue=1>'
																							+ '1'
																							+ '</option>'
																							+ '<option id='+value.alph_content_no+' vlaue=2>'
																							+ '2'
																							+ '</option>'
																							+ '<option id='+value.alph_content_no+' vlaue=3>'
																							+ '3'
																							+ '</option>'
																							+ '<option id='+value.alph_content_no+' vlaue=4>'
																							+ '4'
																							+ '</option>'
																							+ '<option id='+value.alph_content_no+' vlaue=5>'
																							+ '5'
																							+ '</option>'
																							+ '</select>'
																							+ '</td>'
																							+ '<td>'
																							+ value.alph_content
																							+ '</td>'
																							+ '</tr>';

																				});

																html += '</table>';
																$('#title').html(data[0].alph_title);
																$('#target').html(html);

																$.each(data,function(key,value) {
																					$("#alph_score"+ value.alph_content_no).val(value.alph_score);
																				});

																
																$("select")
																		.change(function() {
																					var str = "";
																					var score = [];
																					var alph_content_no = [];
																					$("select option:selected").each(
																									function() {
																										score.push($(this).text());
																										alph_content_no
																												.push(this.id);
																									});

																					jQuery.ajaxSettings.traditional = true;
																					$.ajax({type : "POST",
																						    url : "updatescore.htm",
																						    data : {
																									"score" : score,
																									"alph_content_no" : alph_content_no,
																									"alph_title" : data[0].alph_title,
																									"project_no" : $("#project_no").attr('name')
																								}
																							});
																				});

															}

														}

													});

										});
						var elems = Array.prototype.slice.call(document
								.querySelectorAll('.js-switch'));

						elems.forEach(function(html) {
							var switchery = new Switchery(html);
						});
					});
</script>


	<script>
	
		$(document)	.ready(
				
				
				
					function() {
						
						$('#finish_agile').click(function(){
							
							console.log($('#list_name').attr('name'));

								console.log( );
							swal(
                                    {
                                       title : "정말 애자일을 종결하시겠습니까?",
                                       text : "종결된 애자일은 다시 편집할 수 없습니다.",
                                       type : "warning",
                                       showCancelButton : true,
                                       confirmButtonColor : "#DD6B55",
                                       confirmButtonText : "네,종결하겠습니다.!",
                                       closeOnConfirm : false
                                    },function() {
                                        swal(
                                                "종결되었습니다!",
                                                "",
                                                "success");
                                      $.ajax({
              								    type : "POST",
              								    url : "finish_agile.htm",														
              								    data :{"list_name" : $('#list_name').val()},
              									contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
              								    success: function(responseData,index) {
              									 	
              									 
              										var url = "milestone.htm?project_no="+$("#project_no").attr('name');    
              										$(location).attr('href',url);
              							
              									}
              								});
                                          

 									});
							
							
						});
						
						$('#myModal2').on('hidden.bs.modal', function (e) {
		                      $("#target").html("");
		                      $("#target2").html("");
		                    });
						
						
						
						$('#btn_re').click(function(event){
							
							
							var html= '';
							 $.ajax({
								    type : "POST",
								    url : "insertre.htm",														
								    data :{"re_content" : $("#input_re").html(),"board_no" : $("#target_hidden").val()},
									contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
								    success: function(responseData,index) {
									 			$("#input_re").html("");
								          
												$("#target2").html("");
									
												var data = JSON.parse(responseData);	
												
													html += '<table class="table table-striped">';
												$.each(data, function(index,value) {
													
													html += '<tr>' + '<td colspan="11" >';
										            html += value.re_content + '</td>';
													html += '<td colspan="1" align="right">'; 
													html += '<a name='+value.re_no+' id="delete'+value.re_no+'"'+ 'class="pull-right btn btn-xs btn-white" >삭제</a>';
													html += '</td>' + '</tr>'; 
													
											  
													});
												
													html+= '</table>';
												$("#target2").html(html);
												$('#myModal2').modal('toggle');
												
												
											
								        }
								    });
							
							
							
							});
						
						
						$('a[id^="delete_board-"]').click(function(event){
							
								var board_no=this.name;
								console.log(board_no);
								
                                swal(
                                      {
                                         title : "정말 삭제하시겠습니까?",
                                         text : "포함된 모든 댓글들도 함께 삭제됩니다.",
                                         type : "warning",
                                         showCancelButton : true,
                                         confirmButtonColor : "#DD6B55",
                                         confirmButtonText : "네,지우겠습니다!",
                                         closeOnConfirm : false
                                      },function() {
                                          swal(
                                                  "Deleted!",
                                                  "Your imaginary file has been deleted.",
                                                  "success");
                                          $.ajax({
                								    type : "POST",
                								    url : "delete_board.htm",														
                								    data :{"board_no" : board_no},
                									contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
                								    success: function(responseData,index) {
                									 	console.log(responseData);
                										location.reload();
                							
                									}
                								});
                                            

   									});
                        
						});
			
						$('a[id^="memo-"]').click(function(event){
							
							event.preventDefault();
							console.log(this.name);
							var html= '';
							 $.ajax({
								    type : "POST",
								    url : "getmemo.htm",														
								    data :{"board_no" : this.name},
									contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
								    success: function(responseData,index) {
									 		console.log(responseData);
								            if(responseData != null)    {
												
									
												var data = JSON.parse(responseData);	
											    
												$("#target_hidden").val(data[0].board_no);
												$("#target").html(data[0].board_content);
												$("#board_date").html("시작 날짜   :   "+data[0].board_date);
												$("#board_end").html("완료 날짜   :   "+data[0].board_end);
												html += '<table class="table table-striped">';
												$.each(data[1], function(key, value) { 
													
											            
													html += '<tr>' + '<td colspan="11">';
										            html += value.re_content + '</td>';
													html += '<td colspan="1" align="right">' + '<a name='+value.re_no+' id="delete'+value.re_no+'"'+ 'class="pull-right btn btn-xs btn-white" >삭제</a>';
													html += '</td>' + '</tr>';
											         
											       
												});
												
												html+= '</table>';
												$("#target2").html(html);
												
												
												$('a[id^="delete"]').click(function(event){
													var re_no = (this.name);
													var html= '';
													 swal(
						                                      {
						                                         title : "정말 삭제하시겠습니까?",
						                                         text : "삭제된 댓글은 복구할 수 없습니다.",
						                                         type : "warning",
						                                         showCancelButton : true,
						                                         confirmButtonColor : "#DD6B55",
						                                         confirmButtonText : "네,지우겠습니다!",
						                                         closeOnConfirm : false
						                                      },function() {
						                                          swal(
						                                                  "Deleted!",
						                                                  "Your imaginary file has been deleted.",
						                                                  "success");
						                                       
						                                     $.ajax({
						                                    	 			
																		    type : "POST",
																		    url : "deletere.htm",														
																		    data :{"re_no" : re_no , "board_no" : data[0].board_no},
																			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
																			beforesend : function(){
																				console.log(this.name);
																			},
																		    success: function(responseData,index) {
																								
																								$("#input_re").html("");
																				          
																								$("#target2").html("");
																					
																								var data = JSON.parse(responseData);	
																								
																									html += '<table class="table table-striped">';
																								$.each(data, function(index,value) {
																									
																									html += '<tr>' + '<td colspan="11" >';
																						            html += value.re_content + '</td>';
																									html += '<td colspan="1" align="right">'; 
																									html += '<a name='+value.re_no+' id="delete'+value.re_no+'"'+ 'class="pull-right btn btn-xs btn-white" >삭제</a>';
																									html += '</td>' + '</tr>'; 
																									
																							  
																									});
																									html+= '</table>';
																								$("#target2").html(html);
																								location.reload();
																		
																		
																		        }
																		    });
						                                            
						                                      });
						   									     
						                  			});
												
												
												
												
												
												
												
												
												
								            } else {
								               
								            }
								        }
								    });
							
							
							
							});
						
					
							
								/* $.fn.test=function(){
									console.log(this.name);
								} */
							
							/*  $("#test").click(function(){
								  
								 
							 }); */
							
							
			
							$("#todo, #inprogress, #completed").sortable(
											{
												connectWith : ".connectList",
												update : function(event, ui) {
													
													var string = $(this).sortable('toArray').toString();
													var list_no;
													
													console.log(this.id);
													
													if(this.id=='todo'){
														  list_no='todo';
													  } else if (this.id=='inprogress'){
														  list_no='inprogress';
													  } else if (this.id=='completed'){
														  list_no='completed';
													  }  
													
													$('.output')
															.html(
																	"ToDo: "
																			+ window.JSON
																					.stringify(todo)
																			+ "<br/>"
																			+ "In Progress: "
																			+ window.JSON
																					.stringify(inprogress)
																			+ "<br/>"
																			+ "Completed: "
																			+ window.JSON
																					.stringify(completed)
											
															);
													
											
													  
													 
													  $.ajax({
														    type : "POST",
														    url : "updateorder.htm",														
														    data :{"data" : string,"list_no" : list_no},
																
														   		beforeSend:function(){
								
														},
														
														        success: function(data) {
														            if(data != null)    {
																	
														            } else {
														               
														            }
														        }
														    });
													
												}
											}).disableSelection();
							 
							 
							$('a[id^="agile_card-"]')
							.click(
									function() {
										var html = '';

										$
												.ajax({
													type : "POST",
													url : "callcard.htm",
													data : {
														"alph_title" : this.name,
														"project_no" : $("#project_no").attr('name')
													},
													contentType : "application/x-www-form-urlencoded; charset=UTF-8",

													success : function(
															responseData,
															index) {

														if (responseData != null) {

															var data = JSON
																	.parse(responseData);
															html += '<table class="table table-striped">';

															$.each(data,function(key,
																					value) {
																				html += '<tr>'
																						+ '<td>'
																		
																						+ value.alph_content
																						+ '</td>'
																						+ '</tr>';

																			});

															html += '</table>';
															$('#title')
																	.html(
																			data[0].alph_title);
															$('#target3')
																	.html(
																			html);

															$
																	.each(
																			data,
																			function(
																					key,
																					value) {
																				$(
																						"#alph_score"
																								+ value.alph_content_no)
																						.val(
																								value.alph_score);
																			});

															

														}

													}

												});

									});
							 
							 
					});
					
		
	</script>




<!-- 버전관리 -->

<script>
	$(document)
			.ready(
					function() {
						
						
						

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
						
						console.log("1");
						var add_title;
						var add_start;
						var add_end;
						console.log(add_end);
						console.log("2");
						 
					
							 $.ajax({
									type : "POST",
									url : "selet_Project_date.htm",
									dataType : "JSON",
									data :{
										project_no : $('#project_no').val()
									},
									success : function(data) {
										if(data != null){
											
											add_title = data[0].project_name;
											add_start = data[0].project_start;
											add_end = data[0].project_end;	
											

											console.log("3 : " + add_start);
										}
										
										
										
										/*  */
										$('#calendar')
								.fullCalendar(
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
												if ($('#drop-remove').is(
														':checked')) {								
													$(this).remove();
												}									
												var end = event.end || "";
												if (end != "") {
													end = $(end).attr("_d");
												}
												$
														.ajax({
															type : "POST",
															url : "dropUpdateCal.htm",
															dataType : "JSON",
															data : {
																calendar_no : $(this).attr("id"), //sequence
																calendar_start : $(even).attr("_d"),
																calendar_end : end

															},
															success : function(
																	data) {
															}

														});

											},
											events : function(start, end,
													timezone, callback) {
												$
														.ajax({
															url : 'ajaxCalendar.htm',
															data : {
																project_no : $('#project_no').val()
															},
															success : function(
																	doc) {
																var data = JSON
																		.parse(doc);
																var events = [];
																var i = 0;
																$
																		.each(data,
																				function(key,value) {
																					if (value.claendar_end !== 'undefined') {
																						events
																								.push({
																									id : value.version_no,
																									title : value.version_title,
																									start : value.version_start,
																									end : value.version_end,
																									allDay : true

																								})
																					} else {
																						events
																								.push({
																									id : value.version_no,
																									title : value.version_title,
																									start : value.version_start,
																									allDay : true

																								})
																					}
																				});
																/* console.log(events); */

																/* console.log(events); */
																callback(events);
															}
														});
											},

											eventDrop : function(event, delta,
													revertFunc) {

												/* console.log($(this));
												console.log(event.start); 
												console.log(event);*/
												var id = event.id;
												var start = event.start;
												var end = event.end || "";
												if (end != "") {
													end = $(end).attr("_d");
												}

												$.ajax({
													type : "POST",
													url : "dropUpdateCal.htm",
													dataType : "JSON",
													data : {
														calendar_no : id, //sequence
														calendar_start : $(start).attr("_d"),
														calendar_end : end
													}

												});

											},
											eventResize : function(event,
													delta, revertFunc) {

												var id = event.id;
												var end = event.end._d;
												/* console.log(id); */
												if (typeof id == "undefined") {
													/* console.log(id);
													console.log(_id); */
													id = _id;
													/* console.log(id); */
												}
												;
												/* console.log(id); */

												$.ajax({
													type : "POST",
													url : "resizeCal.htm",
													dataType : "JSON",
													data : {
														calendar_no : id, //sequence
														calendar_end : end

													}

												});

											},
											
											 eventSources: [
											                {
											                    events: 
																[
											                        {
											                            title  : "project name : " + add_title,
											                            start  : new Date(add_start),
											                            end    : new Date(add_end),
											                            allDay : true
											                        }
											                    ],
											                    color: '#389561'
											                }
											],

											
											
											eventClick : function(calEvent,
													jsEvent, view) {

	

												var id = calEvent.id;
												if (typeof id == "undefined") {
													id = _id;
												}
												console.log($('#project_no').val());

												$('.col-lg-9')
														.ready(
																function() {
																	swal(
																			{
																				title : "Are you sure?",
																				text : "You will not be able to recover this imaginary file!",
																				type : "warning",
																				showCancelButton : true,
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "Yes, delete it!",
																				closeOnConfirm : false
																			},
																			function() {
																				swal(
																						"Deleted!",
																						"Your imaginary file has been deleted.",
																						"success");

																				$
																						.ajax({
																							type : "POST",
																							url : "deleteCal.htm",
																							dataType : "html",
																							data : {
																								id : id,
																								project_no : $('#project_no').val(),
																								project_name : $('#project_name').val()
																							},
																							success : function(
																									data) {

																								var url = "calendar.htm?project_no="+
																											$('#project_no').val()+
																											"&project_name="+
																											$('#project_name').val();
																								console.log(url);
																							
																								$(location).attr('href',url);
																								window.location.reload();
																							},
																							error : function(a, b ,c){
																								console.log(a);
																								console.log(b);
																								console.log(c);
																							}

																						});

																			});

																});
											}
										});
										
								
										
										
									}				
							});
				
						
						

					});
</script>



<!-- lean canvas  -->
<script>
	$(document).ready(function() {
	
		
		
		$(
			"#problem, #solution, #unique, #unfair, #customer, #key, #cost, #channels, #revenue")
			.sortable(
				{
					connectWith : ".connectList",
					update : function(event, ui) {

						var string = $(this).sortable(
								'toArray').toString();
						var lean_no;

						console.log(this.id);

						if (this.id == 'problem') {
							lean_order = 'problem';
						} else if (this.id == 'solution') {
							lean_order = 'solution';
						} else if (this.id == 'unique') {
							lean_order = 'unique';
						} else if (this.id == 'unfair') {
							lean_order = 'unfair';
						} else if (this.id == 'customer') {
							lean_order = 'customer';
						} else if (this.id == 'key') {
							lean_order = 'key';
						} else if (this.id == 'cost') {
							lean_order = 'cost';
						} else if (this.id == 'channels') {
							lean_order = 'channels';
						} else if (this.id == 'revenue') {
							lean_order = 'revenue';
						}

						$
								.ajax({
									type : "POST",
									url : "updatelean.htm",
									data : {
										"data" : string, //sequence
										"lean_order" : lean_order
									// id
									},

									beforeSend : function() {

									},

									success : function(
											data) {
										if (data != null) {

										} else {

										}
									}
								});

					}
				}).disableSelection();
		
		
		$('.lenbtn').click(function(data){
		
			var deleteid="";
			deleteid=(this).name;
			
			swal(
					{
						title : "Are you sure?",
						text : "You will not be able to recover this imaginary file!",
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "Yes, delete it!",
						closeOnConfirm : false
					},
					function(data) {
						
						
						
						swal(
								"Deleted!",
								"Your imaginary file has been deleted.",
								"success");
						
						
						$
						.ajax({
							type : "POST",
							url : "deletelean.htm",
							dataType : "JSON",
							data : {
								lean_no : deleteid
							},
							success : function(data) {
								
								window.location.reload();
							     
							}
						
						}); 
						
								
					}); 
		});							
});
</script>


<!-- timeline -->
<script>
	$(document).ready(function() {

		// Local script for demo purpose only
		$('#lightVersion').click(function(event) {
			event.preventDefault()
			$('#ibox-content').removeClass('ibox-content');
			$('#vertical-timeline').removeClass('dark-timeline');
			$('#vertical-timeline').addClass('light-timeline');
		});

		$('#darkVersion').click(function(event) {
			event.preventDefault()
			$('#ibox-content').addClass('ibox-content');
			$('#vertical-timeline').removeClass('light-timeline');
			$('#vertical-timeline').addClass('dark-timeline');
		});

		$('#leftVersion').click(function(event) {
			event.preventDefault()
			$('#vertical-timeline').toggleClass('center-orientation');
		});

		$.ajax({
			type : "POST",
			url : "timeline.htm",
			date : {
				project_no : $('#project_no2').val()
			},
			success : function(data) {

			}

		});

	});
</script>


<!-- smalltimeline -->
<script>
	
$(document).ready(function() {
	
	
	 
		$.ajax({
			type : "POST",
			url : "timeline2.htm",
			dataType : "json",
			data : {
				project_no : $('#project_no2').val()
			},
			success : function(data) {

				var htmltext = "";
				var maxday = Array();
				
				$.each(data, function(key, value) {
					
					if(parseInt(value.version_end)>=0){
						maxday.push(parseInt(value.version_end));
					}else{
						value.version_end = "+"+value.version_end
					}

					htmltext += '<div class="vertical-timeline-block">';
					htmltext += '<div class="vertical-timeline-icon gray-bg">';
					htmltext += '<i class="fa fa-briefcase"></i>';
					htmltext += '</div>';
					htmltext += '<div class="vertical-timeline-content">';
					htmltext += '<p>' + value.version_title + '</p>';
					htmltext += '<span class="vertical-date small text-muted">D '
							+ value.version_end + 'Day </span>';
					htmltext += '</div>';
					htmltext += '</div>';
					
				});
			
				var r =(maxday.reverse())[0];
			

				if( r== 0){
					$('#dnum').text("D-day");
				}else{
					$('#dnum').text("D-"+r);	
				}
	
				 $('#smalltimeline').html(htmltext);  
				
			
			}
		});
		
	

});
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#dept_select').change(function(){
		
		
		
		$.ajax({
			type : "POST",
			url : "get_person_to_select_project_manager.htm",
			data : {
				"dept_name" : $('#dept_select option:selected').text()		
			},
			success : function(responseData) {
				if (responseData != null) {
					var data = JSON.parse(responseData);
					
					console.log(data);
					var html="";
					$('#project_select_option').html(html);
						html += '<option value="">' + '프로젝트 담당자 선택' + '</option>';
					$.each(data,function(key,value) {
						html+='<option value="'+value.user_name+'">' + value.user_name+'</option>';			
						
						
									});
					
					
					$('#project_select_option').html(html);
					
					
					$('#project_select_option').change(function(){
						
						var user_name = $('#project_select_option option:selected').text();
						
						$('#user_name').val(user_name);
						
						
						
					});
					
					
					
					
				} else {

					
					
				}
				
				
				
				
			}
		});
		
		
		
		
		
	});
	
	
	
});



</script>
<script type="text/javascript">
$('a[id^="complete-"]').click(function(event){ 
	
	var board_no=this.name;
	console.log(board_no);
	
    swal(
          {
             title : "정말 완료 하시겠습니까?",
             text : "완료 버튼 클릭시 상태가 완료로 저장됩니다.",
             type : "warning",
             showCancelButton : true,
             confirmButtonColor : "#DD6B55",
             confirmButtonText : "네,완료 하겠습니다!",
             closeOnConfirm : false
          },function() {
              swal(
                      "완료!",
                      "Your imaginary file has been complete.",
                      "success");
              $
				.ajax({
					type : "post",
					url : "complete.htm",
					data : {
						"board_no" : board_no
					},
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(
							responseData,
							index) {
						console.log(responseData);
						location.reload();
						
				

					}
				
				});
              
              
             
			});

});

</script>


<script>
   $(document).ready(function() {

      Date.prototype.format = function(f) {
         if (!this.valueOf())
            return " ";

         var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
         var d = this;

         return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
            switch ($1) {
            case "yyyy":
               return d.getFullYear();
            case "yy":
               return (d.getFullYear() % 1000).zf(2);
            case "MM":
               return (d.getMonth() + 1).zf(2);
            case "dd":
               return d.getDate().zf(2);
            case "E":
               return weekName[d.getDay()];
            case "HH":
               return d.getHours().zf(2);
            case "hh":
               return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm":
               return d.getMinutes().zf(2);
            case "ss":
               return d.getSeconds().zf(2);
            case "a/p":
               return d.getHours() < 12 ? "오전" : "오후";
            default:
               return $1;
            }
         });
      };

      String.prototype.string = function(len) {
         var s = '', i = 0;
         while (i++ < len) {
            s += this;
         }
         return s;
      };
      String.prototype.zf = function(len) {
         return "0".string(len - this.length) + this;
      };
      Number.prototype.zf = function(len) {
         return this.toString().zf(len);
      };

      $('.i-checks').iCheck({
         checkboxClass : 'icheckbox_square-green',
         radioClass : 'iradio_square-green'
      });

      /* initialize the external events
       -----------------------------------------------------------------*/

      $('#external-events div.external-event').each(function() {

         // store data so the calendar knows to render an event upon drop
         $(this).data('event', {
            title : $.trim($(this).text()), // use the element's text as the event title
            stick : true
         // maintain when user navigates (see docs on the renderEvent method)
         });

         // make the event draggable using jQuery UI
         $(this).draggable({
            zIndex : 1111999,
            revert : true, // will cause the event to go back to its
            revertDuration : 0
         //  original position after the drag
         });

      });

      /* initialize the calendar
       -----------------------------------------------------------------*/

      var date = new Date();
      var d = date.getDate();
      var m = date.getMonth();
      var y = date.getFullYear();

      var project_start = "";
      var project_end = "";

      $('#pro_calendar').fullCalendar({

         editable : true,
         droppable : true,
         eventLimit : false,

         events : [ {
            title : "기간설정",
            start : new Date(y, m, d),
            allDay : true
         } ],

         eventDrop : function(event, delta, revertFunc) {

            if (event.end == null) {
               project_start = (event.start._d).format("yyyy-MM-dd");
               $('#project_start').val(project_start);
              
            } else {
               project_start = (event.start._d).format("yyyy-MM-dd");
               project_end = (event.end._d).format("yyyy-MM-dd");

               $('#project_start').val(project_start);
               $('#project_end').val(project_end);
            }

         },
         eventResize : function(event, delta, revertFunc) {
            project_start = (event.start._d).format("yyyy-MM-dd");
            project_end = (event.end._d).format("yyyy-MM-dd");
            console.log(project_start);
            $('#project_start').val(project_start);
            $('#project_end').val(project_end);
         }
      });
      $('.fc-time').remove();
   });
</script>

<script type="text/javascript">

//프로젝트 생성 유효성 검사
$(function(){
	
	console.log($('#project_start').val());

	console.log($('#project_end'));

	$('#project_btn').click(function(){
		console.log("프로젝트 생성");
		
		var project_name = $('#project_name');
		console.log("name : " + project_name);
		
		if(project_name.val()==""){
			alert('프로젝트 이름을 입력해주세요.');
			project_name.focus();
			return false;
		
		} else if($('#project_start').val()==""){
			alert('프로젝트 기간을 설정해야 합니다.');
			
			return false;
		
		}
		
		 
	});
});

$(function(){
	console.log("영여어어엉");
	 $("#project_name").keyup(function() {

		 var project_name = $('#project_name');

			$.post("project_name_check.htm", 
	         	  {project_name : $('#project_name').val()
			}, function(data) {
				console.log("중복확인 : " + data);
				if (data > 0) {
					$("#name_test").html('<b>이미 등록된 이름입니다.</b>');
				}else if(project_name.val()==""){
					$("#name_test").html('<i class="fa fa-ban"></i>');
				}else {
	                $("#name_test").html('<i class="fa fa-check"></i>');
	            }
			});
		});
});

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('a[id^="file_upload-"]').click(function(){
		
		var str=this.id;
		
		var data = str.split("-");
		
		$('#for_file_col_no').val("");
		$('#for_file_col_no').val(data[1]);
		
		
		
	});
	
	$('a[id^="file_download-"]').click(function(){
		
		var str=this.id;
		
		var data = str.split("-");
		
		var mile_col_no = data[1];// 肄쒕꽆踰?		
		
		console.log();
		console.log(mile_col_no);
		
		 $.ajax({
				type : "post",
				url : "get_files_to_download.htm",
				data : {"project_no" : $('#for_download_project_no').val(),"mile_col_no" : mile_col_no},
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(responseData,index) {
					console.log(responseData);
					var data = JSON.parse(responseData);
					
					var html ="";
					$('#file_download_table').html(html);
					
					
					html += '<tr>';
					html += ' <th colspan="1" align="center"><label for="orign_file"> 파일 이름 </label></th>';
					html += '<th colspan="1" align="center"><label for="data_content"> 파일 설명 </label></th>	';
					html += '<th colspan="1" align="center"><label for="data_content"> 다운로드 </label></th>	';
					html += '</tr>';
					$.each(data,function(key,value) {

								html += '<tr>';
								html += '<td>'
										+  value.o_name
										+ '</td>';
								html += '<td>';
								html +=	value.data_content;
								html += '</td>';		
								html += '<td>'
										+ '<a href="${pageContext.request.contextPath}/project/downloadFile.htm?save_name='+value.file_name+'&orign_name='+value.o_name+'" ><i class="fa fa-download">다운로드</a>';
								html += '</td>';
								html += '</tr>';
							});
					  					
                    					
					
					
					$('#file_download_table').html(html);
					
					
					
					
				}
			
			});
		
		
		
		
	});
	
	
});

</script>




</body>
</html>