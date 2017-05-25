<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 프로젝트 관리 content -->


<div class="wrapper wrapper-content animated fadeInDown">

	<div class="ibox">
		<div class="ibox-title">
			<h5>프로젝트 관리</h5>
			<div class="ibox-tools">
				<a href="tocreateproject.htm" class="btn btn-primary btn-md"><i class="fa fa-plus"></i> 프로젝트
					생성</a>
			</div>
		</div>
		<div class="ibox-content">
			<!-- <div class="row m-b-sm m-t-sm">
				<div class="col-md-1">
					<button type="button" id="loading-example-btn"
						class="btn btn-white btn-sm">
						<i class="fa fa-refresh"></i> Refresh
					</button>
				</div>
				<div class="col-md-11">
					<div class="input-group">
						<input type="text" placeholder="Search"
							class="input-sm form-control"> <span
							class="input-group-btn">
							<button type="button" class="btn btn-sm btn-primary">
								Go!</button>
						</span>
					</div>
				</div>
			</div> -->

			<div class="project-list">

				<table class="table table-hover">
					<thead>

						<tr>
							<th style="text-align:center;">프로젝트 번호</th>
							<th style="text-align:center;">프로젝트 이름</th>
							<th style="text-align:center;">프로젝트 기간</th>
							<th style="text-align:center;">린캔버스</th>
							<th style="text-align:center;">버전 관리</th>
							<th style="text-align:center;">타임 라인</th>
							<th style="text-align:center;">진행률</th>
							<th style="text-align:center;">마일스톤으로 가기</th>


						</tr>
						</thead>
						<tbody>
						<c:forEach var="b" items="${list}">




							<tr>
								<td style="text-align:center;" class="project-status"><span
									class="label label-info">${b.project_no}</span></td>
								<td style="text-align:center;" class="project-title"><a
									href="milestone.htm?project_no=${b.project_no}">${b.project_name}</a>
									</td>

								<!-- <td class="project-people"><a href=""><img alt="image"
										class="img-circle" src="../resources/img/a3.jpg"></a> <a
									href=""><img alt="image" class="img-circle"
										src="../resources/img/a1.jpg"></a> <a href=""><img
										alt="image" class="img-circle" src="../resources/img/a2.jpg"></a>
									<a href=""><img alt="image" class="img-circle"
										src="../resources/img/a4.jpg"></a> <a href=""><img
										alt="image" class="img-circle" src="../resources/img/a5.jpg"></a>
								</td>
								
								 -->

								<td style="text-align:center;">${b.project_start} <i class="fa fa-minus"></i> ${b.project_end}</td>
								<td style="text-align:center;" class="project-actions"><a
							href="leancanvas.htm?project_no=${b.project_no}"
									class="btn btn-white btn-md"><i class="fa fa-folder"></i>
										린캔버스 </a> 
								<td style="text-align:center;"><a
							href="calendar.htm?project_no=${b.project_no}&project_name=${b.project_name}" class="btn btn-white btn-md"><i
										class="fa fa-pencil"></i> 버전 관리 </a></td>
										
										<td style="text-align:center;"><a
							href="timeline.htm?project_no=${b.project_no}" class="btn btn-white btn-md"><i
										class="fa fa-history"></i> 타임 라인 </a></td>
										
								<td style="text-align:center;" class="project-completion"><small>
										${b.completion}&nbsp;%</small>
									<div class="progress progress-striped active">
										<div style="width: ${b.completion}%;" class="progress-bar progress-bar-danger"></div>
									</div></td>
								<td style="text-align:center;"><a href="milestone.htm?project_no=${b.project_no} "
									class="btn btn-outline btn-success">GO TO</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>