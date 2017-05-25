<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 마일스톤 content -->

<div class="modal inmodal fade inl" id="myModal" tabindex="-1"
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
				<div class="note-editable" contenteditable="true" id="target">
				</div>
			</div>
		</div>
	</div>
</div>

<div class="ibox-title">
	<input type="hidden" id="project_no" name="${project_no }">
	<table class="table table-striped">
		<tr>
			<td>이해관계자</td>
			<td>기회</td>
			<td>요구사항</td>
			<td>소프트웨어시스템</td>
			<td>팀</td>
			<td>작업방식</td>
			<td>작업</td>
		</tr>



		<tr>
			<td>
				<!-- 이해관계자 -->
				<ul class="sortable-list stakeholder agile-list" id="base">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '이해관계자' && b.alph_loc eq 'base'}">
							<li class="success-element" id="${b.alph_title}">

								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '기회' && b.alph_loc eq 'base'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '요구사항' && b.alph_loc eq 'base'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '소프트웨어시스템' && b.alph_loc eq 'base'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '팀' && b.alph_loc eq 'base'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '작업방식'&& b.alph_loc eq 'base'}">

							<li class="info-element" id="${b.alph_title }">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
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
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_cate eq '작업' && b.alph_loc eq 'base'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"><i
										class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
	</table>


	<table class="table table-striped">
		<tr>
			<td valign="middle" rowspan="1" colspan="1" align="center">알파상태
				배열 <i class="fa fa-hand-o-right"></i>
			</td>

			<td valign="middle" rowspan="2" colspan="2" align="center">
				Customer</td>
			<td valign="middle" rowspan="2" colspan="2" align="center">
				Solution</td>
			<td valign="middle" rowspan="2" colspan="3" align="center">
				Endeavour</td>
		</tr>
		<tr>
			<td colspan="1" align="center"><i class="fa fa-hand-o-down"></i>
				마일스톤 배열</td>

		</tr>


		<!-- 첫번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<br>
			<br>
			<br> <c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '1'}">
									${b.mile_col_name}
								</c:if>
				</c:forEach></td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="stakeholder">이해관계자</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="opportunity">기회</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="requirements">요구사항</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="softwaresystem">소프트웨어시스템</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="team">팀</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="wayofworking">작업방식</td>
			<td class="alph_cate" rowspan="1" colspan="1" align="center"
				id="work">작업</td>
		</tr>

		<tr>
			<td colspan="1" align="center">
				<ul class="sortable-list stakeholder agile-list" id="stakeholder1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'stakeholder1'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list opportunity agile-list" id="opportunity1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'opportunity1'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list requirements agile-list" id="requirements1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'requirements1'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list softwaresystem agile-list"
					id="softwaresystem1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'softwaresystem1'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list team agile-list" id="team1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'team1'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list wayofworking agile-list" id="wayofworking1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'wayofworking1'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list work agile-list" id="work1">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'work1'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
		<!-- 첫번째 줄  끝 -->




		<!-- 두번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '1'}">
									${b.mile_col_name}
								</c:if>
				</c:forEach> <br></td>
		</tr>

		<tr>
			<td colspan="1" align="center">
				<ul class="sortable-list stakeholder agile-list" id="stakeholder2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'stakeholder2'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list opportunity agile-list" id="opportunity2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'opportunity2'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list requirements agile-list" id="requirements2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'requirements2'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list softwaresystem agile-list"
					id="softwaresystem2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'softwaresystem2'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list team agile-list" id="team2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'team2'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list wayofworking agile-list" id="wayofworking2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'wayofworking2'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list work agile-list" id="work2">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'work2'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
		<!-- 두번째 줄 -->



		<!-- 세번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				요구분석 <br></td>
		</tr>

		<tr>
			<td colspan="1" align="center">
				<ul class="sortable-list stakeholder agile-list" id="stakeholder3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'stakeholder3'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>

			<td colspan="1" align="center">
				<ul class="sortable-list opportunity agile-list" id="opportunity3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'opportunity3'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list requirements agile-list" id="requirements3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'requirements3'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>


			<td colspan="1" align="center">
				<ul class="sortable-list softwaresystem agile-list"
					id="softwaresystem3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'softwaresystem3'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>

			<td colspan="1" align="center">
				<ul class="sortable-list team agile-list" id="team3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'team3'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list wayofworking agile-list" id="wayofworking3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'wayofworking3'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list work agile-list" id="work3">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'work3'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
		<!-- 세번째 줄 끝 -->


		<!-- 네번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				구현 <br></td>
		</tr>

		<tr>
			<td colspan="1" align="center">
				<ul class="sortable-list stakeholder agile-list" id="stakeholder4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'stakeholder4'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list opportunity agile-list" id="opportunity4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'opportunity4'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list requirements agile-list" id="requirements4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'requirements4'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list softwaresystem agile-list"
					id="softwaresystem4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'softwaresystem4'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list team agile-list" id="team4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'team4'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list wayofworking agile-list" id="wayofworking4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'wayofworking4'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list work agile-list" id="work4">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'work4'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
		<!-- 네번째 줄 끝-->

		<!-- 다섯번째 줄 -->
		<tr class="cond used">
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				종료 <br></td>
		</tr>

		<tr>

			<td colspan="1" align="center">
				<ul class="sortable-list stakeholder agile-list" id="stakeholder5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'stakeholder5'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list opportunity agile-list" id="opportunity5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'opportunity5'}">
							<li class="success-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>

			<td colspan="1" align="center">
				<ul class="sortable-list requirements agile-list" id="requirements5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'requirements5'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list softwaresystem agile-list"
					id="softwaresystem5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'softwaresystem5'}">
							<li class="warning-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list team agile-list" id="team5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'team5'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list wayofworking agile-list" id="wayofworking5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'wayofworking5'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_title }"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="sortable-list work agile-list" id="work5">
					<c:forEach var="b" items="${alph_title}">
						<c:if test="${b.alph_loc eq 'work5'}">
							<li class="info-element" id="${b.alph_title}">
								<div class="success-element">
									<a href="#" class="pull-right btn btn-xs btn-white"
										data-toggle="modal" data-target="#myModal"
										id="test-${b.alph_title }" name="${b.alph_cate}"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
		</tr>
		<input type="hidden" id="project_no2" value="${project_no }">

		<!-- 다섯번째 줄 끝-->

	</table>
</div>

																			    data :{"score" : score,"alph_content_no" : alph_content_no,"alph_title" :data[0].alph_title,"project_no":$("#project_no").attr('name') },
																			    success: function(data) {
			
			<%
				pageContext.include("inc/chat2.jsp");
			%>
																			
																			        }
																			    });
																	  });
																	
																	
																} 
																
																
															}
															
														});
												
											});
						});
	</script>
