<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!-- header -->
<div id="page-wrapper" class="gray-bg dashbard-1">
	<div class="row border-bottom">
		<nav class="navbar navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
					href="#"><i class="fa fa-bars"></i> </a>
				<form role="search" class="navbar-form-custom"
					action="search_results.html">
					<div class="form-group">
						<input type="text" placeholder="Welcome to KIMBUSIOR "
							class="form-control" name="top-search" id="top-search">
					</div>
				</form>
			</div>
			<ul class="nav navbar-top-links navbar-right">
				
				<se:authorize access="!hasRole('ROLE_USER')">
					<li><a
						href="${pageContext.request.contextPath}/joinus/login.htm">로그인</a>
					</li>
				</se:authorize>
				<se:authentication property="name" var="LoginUser" />
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><span class="m-r-sm text-muted welcome-message"> ${LoginUser} 님 환영합니다.</span></li>
				</se:authorize>
				<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
					<li><a
						href="${pageContext.request.contextPath}/mypage/mypage.htm">MyPage</a>
					</li>
				</se:authorize>
				<li class="dropdown"><a class="dropdown-toggle count-info"
					 href="${pageContext.request.contextPath}/mypage/messageBox.htm"> <i style="font-size: 1.2em;" class="fa fa-envelope"></i>
						<!-- <span class="label label-warning">16</span> -->
				</a>
					<!-- <ul class="dropdown-menu dropdown-messages">
						<li>
							<div class="dropdown-messages-box">
								<a href="#" class="pull-left"> <img alt="image"
									class="img-circle" src="resources/img/a7.jpg">
								</a>
								<div class="media-body">
									<small class="pull-right">46h ago</small> <strong>Mike
										Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
									<small class="text-muted">3 days ago at 7:58 pm -
										10.06.2014</small>
								</div>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<div class="dropdown-messages-box">
								<a href="#" class="pull-left"> <img alt="image"
									class="img-circle" src="resources/img/a4.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right text-navy">5h ago</small> <strong>Chris
										Johnatan Overtunk</strong> started following <strong>Monica
										Smith</strong>. <br> <small class="text-muted">Yesterday
										1:21 pm - 11.06.2014</small>
								</div>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<div class="dropdown-messages-box">
								<a href="#" class="pull-left"> <img alt="image"
									class="img-circle" src="resources/img/profile.jpg">
								</a>
								<div class="media-body ">
									<small class="pull-right">23h ago</small> <strong>Monica
										Smith</strong> love <strong>Kim Smith</strong>. <br> <small
										class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
								</div>
							</div>
						</li>
						<li class="divider"></li>
						<li>
							<div class="text-center link-block">
								<a href="#"> <i class="fa fa-envelope"></i> <strong>Read
										All Messages</strong>
								</a>
							</div>
						</li>
					</ul> --></li>
				<li class="dropdown"><a class="dropdown-toggle count-info"
					 href="${pageContext.request.contextPath}/mypage/chatting.htm"> <i style="font-size:1.2em;" class="fa fa-comments"></i> <!-- <span
						class="label label-primary">8</span> -->
				</a>
					<!-- <ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> You have 16 messages <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li>
							<div class="text-center link-block">
								<a href="#"> <strong>See All
										Alerts</strong> <i class="fa fa-angle-right"></i>
								</a>
							</div>
						</li>
					</ul> --></li>

				<li><a href="${pageContext.request.contextPath}/logout">
						Log out</a></li>
				<li>
				<li><a class="${pageContext.request.contextPath}/logout"> 
					<i style="font-size:1.2em;" class="fa fa-sign-out"></i>
				</a></li>
				
				
			</ul>

		</nav>
	</div>