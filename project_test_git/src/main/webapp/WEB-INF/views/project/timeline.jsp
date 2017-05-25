<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- timeline content -->

<div class="wrapper wrapper-content">
	<div class="row animated fadeInRight">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="text-center float-e-margins p-md">
					<!-- <span>Turn on/off color/background or orientation version: </span> -->
					<a href="#" class="btn btn-xs btn-primary" id="lightVersion">Light
						version</a> <a href="#" class="btn btn-xs btn-primary"
						id="darkVersion">Dark version</a> <a href="#"
						class="btn btn-xs btn-primary" id="leftVersion">Left version</a>
				</div>
				<div class="ibox-content" id="ibox-content">

					<div id="vertical-timeline"
						class="vertical-container dark-timeline center-orientation">
						<c:forEach var="p" items="${pro_list}">
						
							<div class="vertical-timeline-block">
								<div class="vertical-timeline-icon navy-bg">
									<i class="fa fa-github" ></i>
								</div>

								<div class="widget style1 navy-bg">
								<input type="hidden" id="project_no2" value="${p.project_no }">
									<h2>project name :<br><br>${p.project_name }</h2>
									<%-- <p>${t.version_content }</p> --%>
									<span class="vertical-date">Project Start<br/>${p.project_start }
									</span>
								</div>
							</div>
						
							<c:forEach var="t" items="${cal_list}">
								<div class="vertical-timeline-block">
									<div class="vertical-timeline-icon navy-bg">
										<i class="fa fa-briefcase"></i>
									</div>
	
									<div class="vertical-timeline-content">
										<h2>${t.version_title }</h2>
										<%-- <p>${t.version_content }</p> --%>
										<span class="vertical-date"> End<br /> <small>${t.version_end }</small>
										</span>
									</div>
								</div>
							</c:forEach>
							
						<div class="vertical-timeline-block">
								<div class="vertical-timeline-icon navy-bg">
									<i class="fa fa-thumbs-o-up" ></i>
								</div>

								<div class="widget style1 navy-bg">
									<h2>project name :<br><br>${p.project_name }</h2>
									<%-- <p>${t.version_content }</p> --%>
									<span class="vertical-date">Project end<br/>${p.project_end }
									</span>
								</div>
							</div>
							
							
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

			<%
				pageContext.include("inc/chat2.jsp");
			%>





