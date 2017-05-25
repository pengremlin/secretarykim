<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- drag3 content -->

<div class="wrapper wrapper-content  animated fadeInRight">

	<!-- 메모 모달 창 -->
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true">

		<form
			action="${pageContext.request.contextPath}/project/insertmemo.htm"
			method="post">

			<div class="modal-dialog">
				<div class="modal-content animated flipInY">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">메모 추가</h4>
						<small class="font-bold"></small>
					</div>
					<div class="modal-body">
						<div class="note-editable" contenteditable="true">

							


							<textarea cols="73" rows="8" style="resize: none"
								id="board_content" name="board_content"> </textarea>
						</div>
					</div>
					<div class="modal-footer">
						<h4>
							작업 완료 날짜 <input type="date" class="btn btn-white" name="board_end">
							<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">내용 저장</button>
						</h4>
					</div>
				</div>
			</div>

		</form>

	</div>
	<!-- 메모 모달 창 -->
	<!-- 자세히 보기 모달 -->
	<div class="modal inmodal fade in" id="myModal2" tabindex="-1"
		role="dialog" aria-hidden="true">



		<div class="modal-dialog modal-sm">
			<div class="modal-content animated flipInY">
				<div class="modal-header" style="background-color: #1AB394;">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" style="color: white;">상세 보기</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td style="background-color: #1AB394; color: white;"><div>내용</div></td>
						</tr>
						<tr>
							<td>
								<div id="target"></div> <input type="hidden" id="target_hidden">
							</td>
						</tr>
						<tr>
							<td><div id="board_date"></div></td>
						</tr>
						<tr>
							<td><div id="board_end"></div></td>
						</tr>
						<tr>
							<td style="background-color: #1AB394; color: white;"><div>댓글</div></td>
						</tr>
						<tr>
							<td><div id="target2"></div></td>
						</tr>

						<tr>
							<td style="background-color: #1AB394; color: white;">
							
							</td>
						</tr>
						<tr>
							<td style="padding: 5px 0;">
								<div contenteditable="true" id="input_re"
									style="height: 50px; background-color: #EAEAEA;"></div> <!-- <input type="text" id="board_content" name="board_content"> -->


							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
					
				</div>
			</div>
		</div>



	</div>
	<!-- 자세히 보기 모달 -->
	<!-- 개발론 카드 모달 -->
	<div class="modal inmodal fade inl" id="alph_modal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content animated flipInY">
				<div class="modal-header" id="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						id="modal_close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="title">개발론 카드</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div class="note-editable" contenteditable="true" id="target3">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 개발론 카드 모달 -->




	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">

					<div class="ibox-title">
						<table class="table table-striped">
							<thead>
								<tr>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center"><h3>구간에 해당하는 마일스톤 카드</h3></td>
								</tr>
							</tbody>

						</table>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a>


						</div>
					</div>
					<input type="hidden" id="project_no" name="${project_no }">
					
					<div class="ibox-content">
						<table class="table table-striped">

							<tr>
								<th style="text-align: center;">이해관계자</th>
								<th style="text-align: center;">기회</th>
								<th style="text-align: center;">요구사항</th>
								<th style="text-align: center;">소프트웨어시스템</th>
								<th style="text-align: center;">팀</th>
								<th style="text-align: center;">작업방식</th>
								<th style="text-align: center;">작업</th>

							</tr>

							<tr>
								<td>
									<!-- 이해관계자 -->
									<ul class="sortable-list stakeholder agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '이해관계자'}">
												<li class="success-element" id="${b.alph_title}">

													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td>
									<!-- 기회 -->
									<ul class="sortable-list opportunity agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '기회'}">
												<li class="success-element" id="${b.alph_title}">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td>
									<!-- 요구사항 -->
									<ul class="sortable-list requirements agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '요구사항'}">
												<li class="warning-element" id="${b.alph_title}">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td>
									<!-- 소프트웨어시스템 -->
									<ul class="sortable-list softwaresystem agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '소프트웨어시스템' }">
												<li class="warning-element" id="${b.alph_title}">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td>
									<!-- 팀 -->
									<ul class="sortable-list team agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '팀'}">
												<li class="info-element" id="${b.alph_title}">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
								<td>
									<!-- 작업방식 -->
									<ul class="sortable-list wayofworking agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '작업방식'}">

												<li class="info-element" id="${b.alph_title }">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>

								</td>
								<td>
									<!-- 작업 -->
									<ul class="sortable-list work agile-list" id="base">
										<c:forEach var="b" items="${info_list}">
											<c:if test="${b.alph_cate eq '작업'}">
												<li class="info-element" id="${b.alph_title}">
													<div class="success-element">
														<a href="#" class="pull-right btn btn-xs btn-white"
															data-toggle="modal" data-target="#alph_modal"
															id="agile_card-${b.alph_title }" name="${b.alph_title }"><i
															class="fa fa-search"></i></a>${b.alph_title }
													</div>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="row">
		<div class="col-lg-4">
			<div class="ibox">
				<div class="ibox-content">
					<h3>To-do</h3>
					<p class="small">
						<i class="fa fa-hand-o-up"></i> 모든 항목들은 드래그로 이동이 가능합니다.
					</p>

					<div class="input-group">
						<!-- 모달 호출 버튼 -->
						
						<!-- 모달 호출 버튼 -->


					</div>

					<form
						action="${pageContext.request.contextPath}/project/updatesort.htm"
						method="post">

						<ul class=" connectList agile-list" id="todo">
							<!-- todo 리스트 뿌리기 시작 -->
							<!-- 
									class="warning-element" 주황색 
									class="success-element" 초록색
									class="info-element"    파란색
									class="danger-element"  빨간색
									
									기본 폼
									
									<li class="색깔을 정하는 클래스" id="아이디는 task + ${board_no}" 로간다 >
									
										여기가 메모 전면부에 보이는 글 내용 부분
										${board_content}
										
										<div class="agile-detail">
										
											여기 a 태그를 통해서 리플 다는거 가능하게 모달창 고고
											<a href="#" class="pull-right btn btn-xs btn-white">자세히 보기</a> <i
												class="fa fa-clock-o"></i> 
												
												
												${board_date}
										</div>
									</li>
									
									-->
							<c:if test="${board_list!= null}">
								<c:forEach var="b" items="${board_list}">
									<c:if test="${b.list_no=='1'}">
										<li class="색깔을 정하는 클래스" id="${b.board_no}">
											${b.board_content}
											<div class="agile-detail">
												
												<a	href="#" class="pull-right btn btn-xs btn-white"
													data-toggle="modal" id="memo-" +${b.board_no}
													name="${b.board_no}" data-target="#myModal2"
													style="background-color: #1AB394; color: white;">자세히 보기</a>

												<i class="fa fa-clock-o"></i> ${b.board_end}
											</div>
										</li>
									</c:if>
								</c:forEach>
							</c:if>



						</ul>
						<!-- todo 끝 -->


					</form>


				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox">
				<div class="ibox-content">
					<h3>In Progress</h3>
					<p class="small">
						<i class="fa fa-hand-o-up"></i> Drag task between list
					</p>
					<ul class=" connectList agile-list" id="inprogress">
						<c:if test="${board_list!= null}">
							<c:forEach var="b" items="${board_list}">
								<c:if test="${b.list_no=='2'}">
									<li class="색깔을 정하는 클래스" id="${b.board_no}">
										${b.board_content}
										<div class="agile-detail">
											<a href="#" class="pull-right btn btn-xs btn-white"
												data-toggle="modal" id="memo-" +${b.board_no}
												name="${b.board_no}" data-target="#myModal2"
												style="background-color: #1AB394; color: white;">자세히 보기</a>
											<i class="fa fa-clock-o"></i> ${b.board_end}
										</div>
									</li>
								</c:if>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="ibox">
				<div class="ibox-content">
					<h3>Completed</h3>
					<p class="small">
						<i class="fa fa-hand-o-up"></i> Drag task between list
					</p>
					<ul class=" connectList agile-list" id="completed">
						<c:if test="${board_list!= null}">
							<c:forEach var="b" items="${board_list}">
								<c:if test="${b.list_no=='3'}">
									<c:if test="${b.board_state=='0'}">
									<li class="색깔을 정하는 클래스" id="${b.board_no}">
										${b.board_content}
										<div class="agile-detail">
											 <a href="#"
												class="pull-right btn btn-xs btn-white" data-toggle="modal"
												id="memo-" +${b.board_no} name="${b.board_no}"
												data-target="#myModal2"
												style="background-color: #1AB394; color: white;">자세히 보기</a>
												<a href="#" class="pull-right btn btn-xs btn-white"
												id="complete-${b.board_no}" name="${b.board_no}"
												style="background-color: #1AB394; color: white;">완료</a> 
											 <i class="fa fa-clock-o"></i> ${b.board_end}
										</div>
									</li>
									</c:if>
								</c:if>
							</c:forEach>
							<c:forEach var="b" items="${board_list}">
								<c:if test="${b.list_no=='3'}">
									<c:if test="${b.board_state=='1'}">
									<li class="색깔을 정하는 클래스" id="${b.board_no}">
										${b.board_content}
										<div class="agile-detail">
											 <a href="#"
												class="pull-right btn btn-xs btn-white" data-toggle="modal"
												id="memo-" +${b.board_no} name="${b.board_no}"
												data-target="#myModal2"
												style="background-color: #1AB394; color: white;">자세히 보기</a>
											완료 되었습니다
											 <i class="fa fa-clock-o"></i> ${b.board_end}
										</div>
									</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

		<%
			pageContext.include("inc/chat2.jsp");
		%>


	