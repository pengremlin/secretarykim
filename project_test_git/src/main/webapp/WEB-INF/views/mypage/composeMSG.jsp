<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>


<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-lg-3">
			<div class="ibox float-e-margins">
				<div class="ibox-content mailbox-content">
					<div class="file-manager">
						<a class="btn btn-block btn-primary compose-mail"
							href="composeMSG.htm">메세지 보내기</a>
						<div class="space-25"></div>
						<h5>Folders</h5>
						<ul class="folder-list m-b-md" style="padding: 0">
							<li><a href="messageBox.htm"> <i class="fa fa-inbox "></i>
									메세지 함
							</a></li>
							<li><a href="sendMSG.htm"> <i class="fa fa-envelope-o"></i>
									보낸 메세지
							</a></li>
							<!-- <li><a href="mailbox.html"> <i class="fa fa-certificate"></i>
									Important
							</a></li>
							<li><a href="mailbox.html"> <i class="fa fa-file-text-o"></i>
									Drafts <span class="label label-danger pull-right">2</span></a></li>
							<li><a href="mailbox.html"> <i class="fa fa-trash-o"></i>
									Trash
							</a></li> -->
						</ul>
						<!-- <h5>Categories</h5>
						<ul class="category-list" style="padding: 0">
							<li><a href="#"> <i class="fa fa-circle text-navy"></i>
									Work
							</a></li>
							<li><a href="#"> <i class="fa fa-circle text-danger"></i>
									Documents
							</a></li>
							<li><a href="#"> <i class="fa fa-circle text-primary"></i>
									Social
							</a></li>
							<li><a href="#"> <i class="fa fa-circle text-info"></i>
									Advertising
							</a></li>
							<li><a href="#"> <i class="fa fa-circle text-warning"></i>
									Clients
							</a></li>
						</ul> -->


						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-9 animated fadeInRight">
			<div class="mail-box-header">

				<h2>메세지 보내기</h2>
			</div>
			<div class="mail-box">


				<div class="mail-body">

					<form class="form-horizontal" method="post" action="composeMSG.htm">
						<div class="form-group">
							<label class="col-sm-2 control-label">받는 이 :</label>

							<div class="col-sm-10">
								<input type="text" name="receiver" class="form-control">
							</div>
						</div>




						<div class="form-group">
							<label class="col-sm-2 control-label">내용 :</label>

							<div class="col-sm-10">
								<se:authentication property="name" var="LoginUser" />
								<input type="hidden" name="sender" class="form-control"
									value="${LoginUser}">
								<textarea rows="10" name="message_content" class="form-control"></textarea>
							</div>
						</div>
				</div>



				<div class="mail-body text-right">
					<input type="submit" class="btn btn-md btn-primary fa fa-reply"
						data-toggle="tooltip" data-placement="top" value="전송">
				</div>
				</form>
				<div class="clearfix"></div>



			</div>
		</div>
	</div>
</div>