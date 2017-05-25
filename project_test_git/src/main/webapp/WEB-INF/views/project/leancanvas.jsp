<%@ page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">

					<div class="ibox-title">
						<h3 class="box-title">Lean Canvas</h3>

						<!-- 모달 입력 시작 -->

						<div class="input-group" style="float: right;">
							<!-- 모달 호출 버튼 -->
							<button type="button" class="btn btn-sm btn-success"
								data-toggle="modal" data-target="#myModal">
								<i class="fa fa-plus"></i>노트 추가
							</button>
							<!-- 모달 호출 버튼 -->

							</span>
						</div>

						<!-- 모달 입력 끝 -->

					</div>
					<div class="ibox-content">

						<!-- 테이블 시작 -->

						<table class="table tb-color table-bordered" id="main_table"
							border="1">
							<tr>
								<!-- Problem start -->
								<td rowspan="2" colspan="2">

									<h5 id="2">문제</h5> <!-- drop start -->
									<div class="ibox-content">



										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list" id="problem">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='1'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</form>



									</div> <!-- drop end  --> <!-- Problem end -->

								</td>

								<!-- Solution start -->
								<td rowspan="1" colspan="2">

									<h5 id="2">솔루션</h5> <!-- drop start -->
									<div class="ibox-content">


										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list"
												id="solution">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='2'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Solution end -->


								</td>

								<!-- Unique Value Proposition start -->
								<td rowspan="2" colspan="2" class="">

									<h5 id="2">고유 가치제안</h5> <!-- drop start -->
									<div class="ibox-content">



										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list" id="unique">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='3'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Unique Value Proposition end -->


								</td>


								<!-- Unfair Advantage start -->
								<td rowspan="1" colspan="2">

									<h5 id="2">경쟁우위</h5> <!-- drop start -->
									<div class="ibox-content">


										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list" id="unfair">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='4'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제
																</a> <i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Unfair Advantage end -->


								</td>

								<!-- Customer Segments start -->
								<td rowspan="2" colspan="2">

									<h5 id="2">고객군</h5> <!-- drop start -->
									<div class="ibox-content">



										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list"
												id="customer">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='5'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Customer Segments end -->


								</td>
							</tr>


							<!-- Key Metrics start -->
							<td rowspan="1" colspan="2">

								<h5 id="2">핵심 지표</h5> <!-- drop start -->
								<div class="ibox-content">


									<form
										action="${pageContext.request.contextPath}/project/updatelean.htm"
										method="post">
										<ul class="sortable-list connectList agile-list" id="key">
											<c:forEach var="b" items="${lean_list}">
												<c:if test="${b.lean_order=='6'}">
													<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
														<div class="agile-detail">
															<a name="${b.lean_no}" href="#"
																class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
															<i class="fa fa-trash-o"></i>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>



									</form>
								</div> <!-- drop end  --> <!-- Key Metrics end -->


							</td>





							<!-- Channels start -->
							<td rowspan="1" colspan="2">

								<h5 id="2">채널</h5> <!-- drop start -->
								<div class="ibox-content">



									<form
										action="${pageContext.request.contextPath}/project/updatelean.htm"
										method="post">
										<ul class="sortable-list connectList agile-list" id="channels">
											<c:forEach var="b" items="${lean_list}">
												<c:if test="${b.lean_order=='7'}">
													<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
														<div class="agile-detail">
															<a name="${b.lean_no}" href="#"
																class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
															<i class="fa fa-trash-o"></i>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>



									</form>
								</div> <!-- drop end  --> <!-- Channels end -->


							</td>
							</tr>
							<tr class="" height="150">


								<!-- Cost Structure start -->
								<td colspan="5">

									<h5 id="2">비용구조</h5> <!-- drop start -->
									<div class="ibox-content">



										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list" id="cost">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='8'}">
														<li style="font-size: 1.2em;" class="" id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">
																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Cost Structure end -->


								</td>


								<!-- Revenue Stream start -->
								<td colspan="5">

									<h5 id="2">수익원</h5> <!-- drop start -->
									<div class="ibox-content">



										<form
											action="${pageContext.request.contextPath}/project/updatelean.htm"
											method="post">
											<ul class="sortable-list connectList agile-list" id="revenue">
												<c:forEach var="b" items="${lean_list}">
													<c:if test="${b.lean_order=='9'}">
														<li style="font-size: 1.2em;" class="discern"
															id="${b.lean_no}">${b.lean_content}
															<div class="agile-detail">


																<a name="${b.lean_no}" href="#"
																	class="pull-right btn btn-xs btn-default lenbtn">삭제</a>
																<i class="fa fa-trash-o"></i>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>



										</form>
									</div> <!-- drop end  --> <!-- Revenue Stream end -->


								</td>
							</tr>

						</table>


						<!-- 테이블 끝 -->

					</div>



				</div>
			</div>
		</div>
	</div>
</div>


<!-- 모달 창 -->
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
	aria-hidden="true">

	<form
		action="${pageContext.request.contextPath}/project/insertlean.htm"
		method="post">
		
		<input type="hidden" name="project_no" value="${project_no}" >

		<div class="modal-dialog">
			<div class="modal-content animated flipInY">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">내용 추가</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div class="note-editable" contenteditable="true">
						<textarea cols=73 rows=15 id="lean_content" name="lean_content"> </textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">내용 저장</button>
				</div>
			</div>
		</div>

	</form>
</div>
<!-- 모달 창 -->