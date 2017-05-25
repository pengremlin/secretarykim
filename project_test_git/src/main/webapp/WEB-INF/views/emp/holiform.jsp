<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div id="wrapper">


		<div class="wrapper wrapper-content">
			<div class="row animated fadeInDown">
				<div class="col-lg-3">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h3>휴가 내용 작성</h3>
							<div class="ibox-tools">
								<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
								</a> <a class="dropdown-toggle" data-toggle="modal"
									data-target="#myModal"> <i class="fa fa-plus-square-o"></i>
								</a> 
							</div>
						</div>
						<div class="ibox-content">
							<div id='external-events'>
								<p>휴가 일지에 휴가 내용을 넣은 후 휴가 기간을 조절하세요.</p>
								<c:forEach var="c" items="${list}">
									<c:if test="${c.holi_start eq null}">
										<div class='external-event navy-bg' id="${c.holi_no }">${c.holi_content }
										</div>
									</c:if>
								</c:forEach>
								<p class="m-t">
									<input type='checkbox' id='drop-remove2' class="i-checks"
										checked /> <label for='drop-remove2'>휴가 내용을 삭제하려면 휴가 일지에 등록 후 클릭 삭제하세요.</label>
								</p>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-9">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h3>휴가 일지</h3>
							<div class="ibox-tools">
								<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
								</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
									
								</a>
								
								<a class="close-link"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content">
							<div id="holi_calendar"></div>
						</div>
					</div>
				</div>
			</div>
		</div>


			<!-- 모달 창 -->
			<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
				aria-hidden="true">

				<form action="holi.htm" method="post">

					<div class="modal-dialog">
						<div class="modal-content animated flipInY">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">휴가 내용 작성</h4>
								<small class="font-bold"></small>
							</div>
							<div class="modal-body">
								
									<textarea rows=10 cols=72 id="holi_content" name="holi_content"> </textarea>
								
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




	
</div>
