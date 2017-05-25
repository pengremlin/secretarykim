<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
   
<!-- admin view -->
<form action="${pageContext.request.contextPath}/emp/jobRegsubmit.htm"
   method="post">
   <div class="wrapper wrapper-content animated fadeInRight">
      <div class="row">

         <div  class="col-lg-6">
            <div class="ibox float-e-margins">
               <div class="ibox-title">
                  <h3>직급 생성</h3>
                  <div class="form-group">
                     <input type="text" class="form-control" id="job_name"
                        name="job_name" placeholder="생성할 직급을 입력하세요" required>
                  </div>
                  <div class="form-group">
                     <button type="submit" name="jobreg-${list.job_name}"
                        value="${list.job_name}" class="btn btn-primary btn-md"
                        data-toggle="modal" data-target="#jobDialog">생성</button>
                     <button type="button" name="jobDel-${list.job_name}"
                        value="${list.job_name}" class="btn btn-danger btn-md"
                        data-toggle="modal" data-target="#delDialog">삭제</button>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-6">
            <div class="ibox float-e-margins">
               <div class="ibox-title">
                  <table class="table table-bordered">
                     <thead>
                        <tr>
                           <th>직급 이름</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="list" items="${joblist}">
                           <tr>
                              <td>${list.job_name}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</form>
<!-- master가 권한 부여 다이얼로그 -->
<div class="modal inmodal fade inl" id="delDialog" tabindex="-1"
	role="dialog" aria-hidden="true">
	<form name="dellist"
		action="${pageContext.request.contextPath}/emp/jobDel.htm"
		method="post">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">직급 부여</h4>
					<small class="font-bold"></small>
				</div>
				<div class="modal-body">
					<div id="writeBody">
						<h4>직급을 삭제 하시겠습니까?</h4>
						<input type="text" readonly="readonly"  id="job_name_list_selected" name="job_name">
						<button style="margin-top:20px;" type="submit" class="btn btn-primary btn-block">사원
							삭제</button>
						<button type="reset" class="btn btn-warning btn-block"
							 onclick="dellist()">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


