<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class="row wrapper border-bottom white-bg page-heading"></div>



<div class="wrapper wrapper-content">
	<div class="row animated fadeInDown">
		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>버전 관리</h3>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class=""> <i class="fa fa-plus-square-o"
							data-toggle="modal" data-target="#myModal"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div id='external-events'>
						<p>버전 관리를 생성하고 캘린더에 드래그 하십시오.</p>

						<c:forEach var="c" items="${cal_list}">
							<c:if test="${c.version_start eq null}">
								<div class='external-event navy-bg' id='${c.version_no}'>${c.version_title}</div>
							</c:if>
						</c:forEach>

						
					</div>
				</div>
			</div>

		</div>
		<div class="col-lg-9">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>버전 관리 캘린더</h3>
					<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i
							class="fa fa-wrench"></i>
						</a>
						<!-- <ul class="dropdown-menu dropdown-user">
							<li><a href="#">Config option 1</a></li>
							<li><a href="#">Config option 2</a></li>
						</ul> -->
						<a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">
					<div id="calendar"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 창 -->
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
	aria-hidden="true">

	<form action="${pageContext.request.contextPath}/project/insertCal.htm" method="post">

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
						<input type="hidden" id="project_no" name="project_no" value="<%=request.getAttribute("project_no") %>">
						<input type="hidden" id="project_name" name="project_name" value="<%=request.getAttribute("project_name") %>">
						<textarea id="version_title" cols=73 rows=15 name="version_title"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">내용 저장</button>
				</div>

			</div>



		</div>

	</form>
</div>
<!-- 모달 창 -->






