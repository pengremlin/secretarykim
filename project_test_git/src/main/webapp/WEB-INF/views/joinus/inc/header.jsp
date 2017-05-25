<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!-- Header start -->
<header id="header" role="banner">
	<nav class="navbar navbar-default navbar-fixed-top" id="tf-menu">
		<div class="container">
			<div class="row">
				<!-- Logo start -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<a href="index.htm" class="page-scroll"> <img class="img-responsive"
							src="resources/img/klogo.png" alt="logo">
						</a>
					</div>
				</div>
				<!--/ Logo end -->
				<div class="collapse navbar-collapse clearfix navMenu"
					role="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a class="page-scroll" href="#slider-part">Home</a></li>
						<li><a class="page-scroll" href="#feature">김비서 소개</a></li>
						<li><a class="page-scroll" href="#process">튜토리얼</a></li>
						<li><a class="page-scroll" href="mboard.htm">자유 게시판</a></li>
					</ul>
				</div>
				<!--/ Navigation end -->
			</div>
			<!--/ Row end -->
		</div>
		<!--/ Container end -->
	</nav>
	<se:authorize access="!hasRole('ROLE_USER')">
						</se:authorize>
						<se:authentication property="name" var="LoingUser" />
						<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
							<li><a href="${pageContext.request.contextPath}/logout">
									(${LoingUser})로그아웃</a></li>
						</se:authorize>
</header>
<!--/ Header end -->
<!-- END MAIN NAV -->