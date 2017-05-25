<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<se:authentication property="name" var="LoginUser" />
<input type="hidden" name="sender" class="form-control"
	value="${LoginUser}">
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

				<form method="get" action="index.html"
					class="pull-right mail-search">
					<div class="input-group">
						<input type="text" class="form-control input-sm" name="search"
							placeholder="Search email">
						<div class="input-group-btn">
							<button type="submit" class="btn btn-sm btn-primary">
								Search</button>
						</div>
					</div>
				</form>
				<h2>보낸 메세지</h2>
				<div class="mail-tools tooltip-demo m-t-md">
					<div class="btn-group pull-right">
						<button class="btn btn-white btn-sm">
							<i class="fa fa-arrow-left"></i>
						</button>
						<button class="btn btn-white btn-sm">
							<i class="fa fa-arrow-right"></i>
						</button>

					</div>
					<button class="btn btn-white btn-sm" data-toggle="tooltip"
						data-placement="left">
						<i class="fa fa-refresh"></i> Refresh
					</button>
					<button class="btn btn-white btn-sm" data-toggle="tooltip"
						data-placement="top">
						<i class="fa fa-eye"></i>
					</button>
					<button class="btn btn-white btn-sm" data-toggle="tooltip"
						data-placement="top">
						<i class="fa fa-exclamation"></i>
					</button>

					<button id="remove" class="btn btn-white btn-sm"
						data-toggle="tooltip" data-placement="top">
						<i class="fa fa-trash-o"></i>
					</button>
				</div>
			</div>

			<div class="mail-box">
				<table class="table table-hover table-mail">
					<tbody>
						<tr>
							<th class="check-mail" width=10%><input type="checkbox"
								class="i-checks all"></th>
							<th width=10%><label>번호</label></th>
							<th width=20%><label>받은 이</label></th>
							<th width=25%><label>내용</label></th>
							<th width=25%><label>보낸 날짜</label></th>
							<th width=10%><label>삭제</label></th>
						</tr>

						<c:forEach var="m" items="${message}">
							<tr>
								<td class="check-mail"><input type="checkbox"
									class="i-checks sel"></td>
								<td class="">${m.message_num}</td>
								<td class="mail-ontact">${m.receiver}</td>
								<td class="mail-subject"><a href="">${m.message_content}</a></td>
								<td><fmt:formatDate value="${m.date_of_sending}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>

								<td><a href="deleteMSG2.htm?message_num=${m.message_num}"> <input type="hidden"
										name="message_num" value="${m.message_num}" />
										<button type="submit" class="btn btn-white btn-md">
											<i class="fa fa-trash-o"></i>
										</button>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
