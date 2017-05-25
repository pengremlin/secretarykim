<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!-- 네비 시작 -->
<nav class="navbar-default navbar-static-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav metismenu" id="side-menu">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<span> <a
						href="${pageContext.request.contextPath}/index.htm"
						class="page-scroll"> <img alt="image" class=""
							src="../resources/img/klogo.png" width=150 height=50 />
					</a>

					</span>
					<!-- <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear"> <span class="block m-t-xs"> <strong
								class="font-bold"></strong>
						</span> <span class="text-muted text-xs block">Developer <b
								class="caret"></b></span>
					</span>
					</a>
					<ul class="dropdown-menu animated fadeInRight m-t-xs">
						<li><a href="profile.html">Profile</a></li>
						<li><a href="contacts.html">Contacts</a></li>
						<li><a href="mailbox.html">Mailbox</a></li>
						<li class="divider"></li>
					</ul> -->
				</div>
				<div class="logo-element">K'BS</div>
			</li>
			<se:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
				<li><a href=""><i class="fa fa-star"></i> <span
						class="nav-label">관리자 권한 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="">팀장 권한 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/auth/authWriteForm.htm">권한
										등록</a></li>
							</ul></li>
					</ul></li>
			</se:authorize>
				<li><a href=""><i class="fa fa-sitemap"></i> <span
						class="nav-label">인사 관리 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
					<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_EMP_MANAGER','ROLE_ADMIN')">
						<li><a href="">사원 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/emp/jobForm.htm">사원
										등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/editForm.htm">추가
										권한 생성</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/writeForm.htm">직급
										수정</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/jobwriteForm.htm">직급
										생성</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/emplistForm.htm">사원 권한 삭제</a></li>
								
							</ul></li></se:authorize>
						<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_EMP','ROLE_EMP_MANAGER','ROLE_ADMIN')">
						<li><a href="">근태 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/emp/atti_KindForm.htm">근태
										코드 등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/atteForm.htm">출결일지</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/holiForm.htm">휴가일지</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/attiForm.htm">근태
										작성</a></li>
							</ul></li>
						<li><a href="">급여 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/emp/allowBasic.htm">기본
										사항 등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/allowForm.htm">수당
										항목 등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/sal.htm">급여
										계산/대장</a></li>
								<li><a
									href="${pageContext.request.contextPath}/emp/retireList.htm">재직자
										퇴직금 계산</a></li>
							</ul></li></se:authorize>
					</ul></li>


			<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_GOODS','ROLE_GOODS_MANAGER','ROLE_ADMIN')">
				<li><a href=""><i class="fa fa-bar-chart"></i> <span
						class="nav-label">주문/납품 관리 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="">주문 물품 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/goods/reqlist.htm">주문
										내역 조회</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/newreg.htm">주문
										내역 입력</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/openFilelist.htm">주문내역
										파일관리</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/deliverlist.htm">납품
										내역 조회</a></li>
							</ul></li>
						<li><a href="">거래처 관리 <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level collapse">
								<li><a
									href="${pageContext.request.contextPath}/goods/custlist.htm">거래처
										조회</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/regCust.htm">거래처
										등록</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/custacclist.htm">거래처
										통장 조회</a></li>
								<li><a
									href="${pageContext.request.contextPath}/goods/regCustAcc.htm">거래처
										통장 등록</a></li>
							</ul></li>
					</ul></li>
			</se:authorize>

			<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_EMP','ROLE_GOODS','ROLE_ADMIN')">
				<li><a href=""><i class="fa fa-files-o"></i> <span
						class="nav-label">프로젝트 관리 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a
							href="${pageContext.request.contextPath}/project/tocreateproject.htm">프로젝트
								생성<span class="label label-primary pull-right">NEW</span>
						</a></li>
						<li><a
							href="${pageContext.request.contextPath}/project/manageproject.htm">프로젝트
								관리</a></li>
					</ul></li>
			</se:authorize>

			<se:authorize
				access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN','ROLE_PROJECT_USER','ROLE_PROJECT_MANAGER','ROLE_EMP_MANAGER')">
				<li><a href=""><i class="fa fa-tasks"></i> <span
						class="nav-label">프로젝트 참여 메뉴</span> <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">


						<li><a
							href="${pageContext.request.contextPath}/auth/projectsubWriteForm.htm">참여
								권한 등록</a></li>
						<%-- <li><a
								href="${pageContext.request.contextPath}/auth/projectsubEditForm.htm">프로젝트 참여 인원 권한 수정</a></li>
							<li><a
								href="${pageContext.request.contextPath}/auth/projectsubDeleteForm.htm">프로젝트  참여 인원 권한 삭제</a></li> --%>

					</ul>
			</se:authorize>
		</ul>

	</div>
</nav>
