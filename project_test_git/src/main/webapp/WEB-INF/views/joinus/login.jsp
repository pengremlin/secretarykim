<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- login modal -->
<c:url value="/login" var="loginURL"></c:url>
<form action="${loginURL}" method="post">
	<fieldset>
		<div class="in" id="loginModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<c:if test="${param.error != null}">
							<div>
								로그인 실패<br>
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
									<c:out value="비밀번호 오류 입니다" />
								</c:if>
							</div>
						</c:if>
						<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> ID</label> <input type="text"
								class="form-control" id="user_id" name="username"
								placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> PASSWORD</label> <input
								type="password" class="form-control" id="user_pwd"
								name="password" placeholder="패스워드를 입력하세요">
						</div>
						<!-- <div class="checkbox">
							<label><input type="checkbox" value="" checked>아이디를
								기억하시겠습니까?</label>
						</div> -->
						<button type="submit" class="btn btn-success btn-block"
							id="btnLogin" value="">
							<span class="glyphicon glyphicon-off"></span> &nbsp;&nbsp;로그인
						</button>
						<a href="index.htm" class="btn btn-warning btn-block"><span
							class="glyphicon glyphicon-remove"> 취소</span></a>
					</div>
					<div class="modal-footer">
						<a href="join.htm" class="btn btn-info btn-md">회원 가입</a>

						<button type="button" class="btn btn-info btn-md"
							data-toggle="modal" data-target="#myModal1">아이디 찾기</button>

						<button type="button" class="btn btn-info btn-md"
							data-toggle="modal" data-target="#myModal2">패스워드 찾기</button>

					</div>
				</div>

			</div>
		</div>
	</fieldset>
</form>


<!-- id modal -->
<div class="modal fade" id="myModal1" role="dialog" style="top: 20%;">
	<form id="idform" action="idSearch.htm" method="post">
		<fieldset>
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-user"></span> 아이디 찾기
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<div class="input-group form-group">
							<input type="text" class="form-control" id="user_name"
								name="user_name" required placeholder="이름을 입력하세요."> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
							</span>
						</div>
						<div class="input-group form-group">
							<input type="email" class="form-control" id="user_email"
								name="user_email" required placeholder="이메일을 입력하세요."> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-envelope"></span>
							</span>
						</div>
						<button style="float: right; margin-left: 5px;" type="button"
							class="btn btn-danger btn-md" id="btnCancel" value=""
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>취소
						</button>
						<button style="float: right;" type="submit"
							class="btn btn-success btn-md" id="btnLogin" value="">
							<span class="glyphicon glyphicon-off"></span>확인
						</button>

					</div>
				</div>

			</div>
		</fieldset>
	</form>
</div>


<!-- password modal -->
<div class="modal fade" id="myModal2" role="dialog" style="top: 15%;">
	<form id="pwdform" action="pwdSearch.htm" method="post">
		<fieldset>
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header"
						style="padding: 35px 50px; color: white; background-color: #1AB394">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 패스워드 찾기
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<div class="input-group form-group">
							<input type="text" class="form-control" id="user_id"
								name="user_id" required placeholder="아이디를 입력하세요."> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-user"></span>
							</span>
						</div>
						<div class="input-group form-group">
							<input type="email" class="form-control" id="user_email"
								name="user_email" required placeholder="이메일을 입력하세요."> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-envelope"></span>
							</span>
						</div>
						<button style="float: right; margin-left: 5px;" type="button"
							class="btn btn-danger btn-md" id="btnCancel" value=""
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>취소
						</button>
						<button style="float: right;" type="submit"
							class="btn btn-success btn-md" id="btnLogin" value="">
							<span class="glyphicon glyphicon-off"></span>확인
						</button>

					</div>
				</div>

			</div>
		</fieldset>
	</form>
</div>