<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 마일스톤7 content -->

<!-- 알파카드 모달 -->
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
<!-- 알파카드 모달 -->
<!-- 문서작성 모달-->
<div class="modal inmodal fade inl" id="colModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content animated flipInY">
			<div class="modal-header" id="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					id="modal_close">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="title">행 이름 설정</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				<div id="edit_col_name_body"></div>
			</div>
		</div>
	</div>
</div>
<!-- 문서작성 모달-->
<!-- 파일 업로드 모달 -->
<div class="modal inmodal fade inl" id="fileuploadModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated flipInY">
			<div class="modal-header" id="modal-header">
				<button type="reset" class="close" data-dismiss="modal"
					id="modal_close">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="title">파일업로드</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				 <form action="uploadpro_File.htm" method="post" id="uploadFile" enctype="multipart/form-data">
                        <table class="table table-bordered">
                           <tr>
                              <th colspan="1"><label for="orign_file"> 첨부 파일 </label></th>
                              <td><input type="file" name="file" placeholder="첨부할 파일"></td>
                           </tr>
                           <tr>
                              <th><label for="data_content"> 파일 설명 </label></th>
                              <td colspan="1"><input type="text" name="data_content" placeholder="파일에 대한 설명"></td>
                           </tr>
                           <tr align="center">
                              <td colspan="2">
                                 <button class="btn btn-success" type="submit">
                                    <i class="fa fa-check">등록</i>
                                 </button>
                              
                                 <button class="btn btn-primary"  type="reset" data-dismiss="modal">
                                    <i class="fa fa-close">취소</i>
                                 </button>
                                 
                                 <input type="hidden" id="for_file_project_no" value = "${project_no }"name="project_no">
                                 <input type="hidden" id="for_file_col_no" name="mile_col_no">
                                 
                              </td>
                           </tr>
                        </table>
                     </form>
			</div>
		</div>
	</div>
</div>
<!-- 파일 업로드 모달 -->

<!-- 업로드한 파일 보기 -->
<div class="modal inmodal fade inl" id="filedownloadModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated flipInY">
			<div class="modal-header" id="modal-header">
				<button type="reset" class="close" data-dismiss="modal"
					id="modal_close">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="title">파일 다운로드</h4>
				<small class="font-bold"></small>
			</div>
			<div class="modal-body">
				
                        <table class="table table-bordered" id="file_download_table">
                           
                          
                           
                        </table>
                        <input type="hidden" id="for_download_project_no"  value = "${project_no }"name="project_no">
                  
			</div>
		</div>
	</div>
</div>
<!-- 업로드한 파일 보기 -->




<!-- agile 구간 설정하기  -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="ibox float-e-margins border-bottom" id="agile_toggle">
		<div class="ibox collapsed">
			<div class="ibox-title">
				<table class="table table-striped">
					<tr>
						<td colspan="10" align="center">
							<h3>Agile 생성</h3>
						</td>
					</tr>
				</table>
				<!-- 우측 상단 아이콘 구간 -->
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
						class="fa fa-wrench"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<c:forEach var="b" items="${mile_agile}">
							<c:choose>
								<c:when test="${b.list_status eq '0' }">
									<li><a
										href="drag3.htm?project_no=${b.project_no}&list_name=${b.list_name}">${b.list_name}</a></li>
								</c:when>
								<c:when test="${b.list_status eq '1' }">
									<li><a
										href="drag4.htm?project_no=${b.project_no}&list_name=${b.list_name}">${b.list_name}(종결됨)</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 우측 상단 아이콘 구간 -->

			<div class="ibox-content">
				<div class="row">
					<table class="table">
						<tr>
							<td align="center"><input type="text" placeholder="버전 입력"
								id="list_name"> <input type="button"
								class="btn btn-primary btn-sm" id="save_value" name="save_value"
								value="Agile 생성하기" /></td>
						</tr>
					</table>
				</div>


				<div class="row">
					<c:forEach var="b" items="${mile_frame_list}">
						<div class="col-lg-2">
							<table class="table table-striped">
								<tr>
									<td>
										<div class="note-editable" contenteditable="true"
											id="colname${b.mile_col_no}">${b.mile_col_name}</div>
									<td>
								</tr>
								<tr>
									<td><input type="checkbox" class="js-switch"
										id="aglie${b.mile_col_no}" value="${b.mile_col_no}"> <%-- 	<input type="checkbox" class="js-switch${b.mile_col_no}" id="aglie${b.mile_col_no}"/> --%>
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- agile 구간 설정하기  -->


<!-- 마일스톤 카드 base -->
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox collapsed">
					<div class="ibox-title">
						<table class="table table-striped">
							<tr>
								<td align="center">
									<h3>마일스톤 카드</h3>
								</td>
							</tr>
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
											<c:if
												test="${b.alph_cate eq '이해관계자' && b.alph_loc eq 'base'}">
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
											<c:if
												test="${b.alph_cate eq '소프트웨어시스템' && b.alph_loc eq 'base'}">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>












<div class="ibox-title">
	<table class="table table-striped">
		<tr>
			<td valign="middle" rowspan="1" colspan="1" align="center">알파상태
				배열 <i class="fa fa-hand-o-right"></i>
			</td>

			<td valign="middle" rowspan="2" colspan="2" align="center">
				Customer</td>
			<td valign="middle" rowspan="2" colspan="2" align="center">
				Solution</td>
			<td valign="middle" rowspan="2" colspan="4" align="center">
				Endeavour</td>

		</tr>
		<tr>
			<td colspan="1" align="center"><i class="fa fa-hand-o-down"></i>
				마일스톤 배열</td>

		</tr>




		<!-- 첫번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<br> <br> <br> <c:forEach var="b"
					items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '1'}">
						<div id="mile_colname${b.mile_col_no}">${b.mile_col_name}</div>
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
			<td rowspan="1" colspan="1" align="center">기타 기능</td>
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

			<td colspan="1" align="center">
				<ul class="nav navbar-top-links navbar-right">

					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i>
							<span class="label label-warning"></span>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a id="edit_col_button1" data-toggle="modal"
								data-target="#colModal">행 이름 설정</a></li>
							<li><a
								href="milestone_score.htm?project_no=${project_no }&col_no=1">성숙도
									체크</a></li>
								<li><a id="file_upload-1"  data-toggle="modal" data-target="#fileuploadModal">파일 업로드</a></li>
								<li><a id="file_download-1"  data-toggle="modal" data-target="#filedownloadModal">파일 다운로드</a></li>
								
						</ul></li>
				</ul>
			</td>



		</tr>
		<!-- 첫번째 줄  끝 -->




		<!-- 두번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '2'}">
						<div id="mile_colname${b.mile_col_no}">${b.mile_col_name}</div>
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
			<td colspan="1" align="center">
				<ul class="nav navbar-top-links navbar-right">

					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i>
							<span class="label label-warning"></span>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a id="edit_col_button2" data-toggle="modal"
								data-target="#colModal">행 이름 설정</a></li>
							<li><a
								href="milestone_score.htm?project_no=${project_no }&col_no=2">성숙도
									체크</a></li>
							<li><a id="file_upload-2" data-toggle="modal" data-target="#fileuploadModal">파일 업로드</a></li>
							<li><a id="file_download-2"  data-toggle="modal" data-target="#filedownloadModal">파일 다운로드</a></li>		
						</ul></li>
				</ul>
			</td>
		</tr>
		<!-- 두번째 줄 -->



		<!-- 세번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '3'}">
						<div id="mile_colname${b.mile_col_no}">${b.mile_col_name}</div>
					</c:if>
				</c:forEach> <br></td>
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
			<td colspan="1" align="center">
				<ul class="nav navbar-top-links navbar-right">

					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i>
							<span class="label label-warning"></span>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a id="edit_col_button3" data-toggle="modal"
								data-target="#colModal">행 이름 설정</a></li>
							<li><a
								href="milestone_score.htm?project_no=${project_no }&col_no=3">성숙도
									체크</a></li>
							<li><a id="file_upload-3" data-toggle="modal" data-target="#fileuploadModal">파일 업로드</a></li>
							<li><a id="file_download-3"  data-toggle="modal" data-target="#filedownloadModal">파일 다운로드</a></li>
						</ul></li>
				</ul>
			</td>
		</tr>
		<!-- 세번째 줄 끝 -->


		<!-- 네번째 줄 -->
		<tr>
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '4'}">
						<div id="mile_colname${b.mile_col_no}">${b.mile_col_name}</div>
					</c:if>
				</c:forEach> <br></td>
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
			<td colspan="1" align="center">
				<ul class="nav navbar-top-links navbar-right">

					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i>
							<span class="label label-warning"></span>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a id="edit_col_button4" data-toggle="modal"
								data-target="#colModal">행 이름 설정</a></li>
							<li><a
								href="milestone_score.htm?project_no=${project_no }&col_no=4">성숙도
									체크</a></li>
							<li><a id="file_upload-4" data-toggle="modal" data-target="#fileuploadModal">파일 업로드</a></li>
							<li><a id="file_download-4"  data-toggle="modal" data-target="#filedownloadModal">파일 다운로드</a></li>
						</ul></li>
				</ul>
			</td>
		</tr>
		<!-- 네번째 줄 끝-->

		<!-- 다섯번째 줄 -->
		<tr class="cond used">
			<td valign="middle" rowspan="2" colspan="1" align="center"><br>
				<c:forEach var="b" items="${mile_frame_list}">
					<c:if test="${b.mile_col_no eq '5'}">
						<div id="mile_colname${b.mile_col_no}">${b.mile_col_name}</div>
					</c:if>
				</c:forEach> <br></td>
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
										id="test-${b.alph_title }" name="${b.alph_title}"
										title="${b.alph_cate}"><i class="fa fa-search"></i></a>${b.alph_title }
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</td>
			<td colspan="1" align="center">
				<ul class="nav navbar-top-links navbar-right">

					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i>
							<span class="label label-warning"></span>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a id="edit_col_button5" data-toggle="modal"
								data-target="#colModal">행 이름 설정</a></li>
							<li><a
								href="milestone_score.htm?project_no=${project_no }&col_no=5">성숙도
									체크</a></li>
							<li><a id="file_upload-5" data-toggle="modal" data-target="#fileuploadModal">파일 업로드</a></li>
							<li><a id="file_download-5"  data-toggle="modal" data-target="#filedownloadModal">파일 다운로드</a></li>
						</ul></li>
				</ul>
			</td>
		</tr>

		<!-- 다섯번째 줄 끝-->


		

		

	</table>
	<input type="hidden" id="project_no2" value="${project_no }">
</div>

			<%
				pageContext.include("inc/chat2.jsp");
			%>

