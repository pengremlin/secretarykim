<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="resources/js/jquery-2.1.1.js"></script>
	<script src="resources/js/jquery-ui-1.10.4.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#btnLogin').click(
			function() {
						var reg_id = /^[a-z0-9_-]{4,12}$/;
						var reg_email = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
						var re_pw = /^[a-z0-9_-]{4,12}$/; // 비밀번호 검사식
						
						var name = $('#user_name'), 
						email = $('#user_email'),
						birth = $('#user_birth'),
						id = $('#user_id'), 
						pwd = $('#user_pwd'),
						pwdok = $('#user_pwdok'), 
						gender = $('#user_gender'),
						add = $('#user_add'),
						hp = $('#user_ph');
						 
						if(name.val()==""){
							alert('Name를 입력해주세요.');
							user_name.focus();
							return false;
							
						}else if (!reg_email.test(email.val())) {
							alert('이메일 주소가 유효하지 않습니다');
							user_email.focus();
							return false;
						
						}else if (birth.val()==""){
							alert('생년월일을 입력해주세요');
							user_birth.focus();
							return false;
							
						}else if (!reg_id.test(id.val()) == true) {
							alert("아이디는 4-12자 이여야 합니다. ");
							user_id.focus();
							return false;
						
						}else if(!re_pw.test(pwd.val()) == true){
							alert("비밀번호는 4-12자 이여야 합니다.");
							user_pwd.focus();
							return false;
							
						}
						else if (pwd.val() != pwdok.val()){ // 이름 검사
						    alert('비밀번호가 맞질 않습니다.');
						    user_pwdok.focus();
							return false;
						
						}else if (gender.val() == "") { // 이름 검사
							alert('성별을  정확히 입력해 주세요.');
							user_gender.focus();
							return false;
						
						}else if(add.val()==""){
							alert('주소를 입력해주세요.');
							user_add.focus();
							return false;
							
						}else if (hp.val() == "" || hp.val().length != 11) { // 핸드폰 검사
							alert('핸드폰 번호를  정확히 입력해 주세요.');
							user_ph.focus();
							return false;
						
						}

					});
		
		//아이디 체크 AJAX 처리
	    $("#user_id").keyup(function() {
	    	console.log("ajax 타니");
	    	
	    	var reg_id = /^[a-z0-9_-]{4,12}$/;
	    	var id = $('#user_id')
	       
	    	$.post("idcheck.htm", 
	                {user_id : $('#user_id').val()},  
	                function(data) {
	                	console.log(data);
	                    if ( data > 0 ) {
	                        $("#help_text").html('<b> 이미 가입된 ID 입니다.</b>');
	                    
	                    }else if(!reg_id.test(id.val()) == true){
	                    	$("#help_text").html('<b> 아이디는 4자 이상 12자 이하 </b>')
	                    
	                    
	                    }else if (data =0 || reg_id.test(id.val()) == true)  {
	                        $("#help_text").html('<i class="fa fa-check"></i>');
	                    }
	                });
	    });
	
		
	
		
		//비밀번호 자리수
		
		$("#user_pwd").keyup(function() {
			console.log('userpwd function');
			
			var re_pw = /^[a-z0-9_-]{4,12}$/;
			var pwd = $('#user_pwd');
			console.log("pwd : " + pwd.val());
			
			if (!re_pw.test(pwd.val()) == true) {
				$("#pwd_length").html('<b> 비밀번호는 4자 이상 12자 이하</b>');
				return false;
			} else {
				$("#pwd_length").html('<i class="fa fa-check"></i>');
			}

		});

		//비밀번호 체크 AJAX 처리 
		$("#user_pwdok").keyup(function() {

			var pwd = $('#user_pwd');
			var pwdok = $('#user_pwdok');

			if (pwd.val() != pwdok.val()) {
				$("#pwd_text").html('<i class="fa fa-ban"></i>');
				return false;
			} else {
				$("#pwd_text").html('<i class="fa fa-check"></i>');
			}

		});
		
		//email 체크 처리
	    $("#user_email").keyup(function() {
	    	console.log("ajax 타니");
	    	
	    	var reg_email = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	    	var email = $('#user_email')
	       
	    		if (!reg_email.test(email.val()) == true) {
				$("#help_email").html('<b>이메일 형식에 맞지 않습니다.</b>');
				return false;
			} else {
				$("#help_email").html('<i class="fa fa-check"></i>');
			}
	    	
	    });

	});
</script>

<!-- join modal -->
<form action="join.htm" method="post">
	<div class="in" id="joinModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header"
					style="padding: 35px 50px; color: white; background-color: #1AB394">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4>
						<span class="glyphicon glyphicon-user"></span>&nbsp;회원 가입
					</h4>
				</div>
				<div class="modal-body">
					<div
						class="mbr-section__container mbr-section__container--std-padding container">
						<div class="row">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-8 col-sm-offset-2" data-form-type="formoid">
										<div class="input-group form-group">
										<div data-form-alert="true"></div>
										<label for="usrname"><span
											class="fa fa-user"></span> 권한 설정</label><input
											type="radio" name="user_state" value="1" checked style="margin-left:20px;">
										<label style="margin-left:5px;" for="radio1"> 일반회원</label> <input type="radio" name="user_state" value="2" style="margin-left:20px;"><label style="margin-left:5px;" for="radio1"> 관리자</label>
										</div>
										<div class="input-group form-group">
											<input type="text" class="form-control" id="user_id"
												name="user_id" placeholder="ID"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-film"></span>
												<span id="help_text"></span>
											</span>
										</div>

										<div class="input-group form-group">
											<input type="password" class="form-control" id="user_pwd"
												name="user_pwd" placeholder="Password"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-lock"></span>
												<span id="pwd_length"></span>
											</span>
										</div>
										<div class="input-group form-group">
											<input type="password" class="form-control" id="user_pwdok"
												name="user_pwdok" placeholder="Password 를 한번 더 입력해주세요"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-lock"></span>
												<span id="pwd_text"></span>
											</span>
										</div>
										<div class="input-group form-group">
											<input type="text" class="form-control" id="user_name"
												name="user_name" required placeholder="Name"
												data-form-field="Name"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-user"></span>
											</span>
										</div>

										<div class="input-group form-group">
											<input type="email" class="form-control" id="user_email"
												name="user_email" required placeholder="Email"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-envelope"></span>
												<span id="help_email"></span>
											</span>
										</div>
										<div class="input-group form-group">
											<input type="date" class="form-control" id="user_birth"
												name="user_birth" value="" style="padding: 12px 12px 15px 12px;"> <span
												class="input-group-addon"> <span
												class="fa fa-birthday-cake"></span>
											</span>
										</div>


										<div class="input-group form-group">
											<input type="text" class="form-control" id="user_gender"
												name="user_gender" placeholder="Gender (ex. 남자)"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-heart"></span>
											</span>
										</div>

										<div class="input-group form-group">
											<input type="text" class="form-control" id="user_ph"
												name="user_ph" placeholder="Phone (ex. 01012345678)"> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-phone"></span>
											</span>
										</div>
										<div class="input-group form-group">
											<input type="text" class="form-control" id="user_add"
												name="user_add" placeholder="Address"> <span
												class="input-group-addon"><input class="btn btn-primary btn-sm" type="button" value="주소 검색" onclick="openAddr();"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success"
						id="btnLogin" value="">
						<span class="glyphicon glyphicon-off"></span>  &nbsp;&nbsp;가입
					</button>
					<a href="index.htm" class="btn btn-warning"
						><span
						class="glyphicon glyphicon-remove"> 취소</span></a>
				</div>
			</div>

		</div>
	</div>
</form>

