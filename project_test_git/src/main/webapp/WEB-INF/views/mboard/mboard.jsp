<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="content" class="wow fadeInLeft">
	<h3 class="hidden">공지사항 목록</h3>
	<form id="content-searchform" class="article-search-form"
		action="mboard.jsp" method="get">
		<fieldset>
			<legend class="hidden"> 목록 검색 폼 </legend>
			<input type="hidden" name="pg" value="" /> <label for="f"
				class="hidden">검색필드</label> <select name="f">
				<option value="TITLE">제목</option>
				<option value="CONTENT">내용</option>
			</select> <label class="hidden" for="q">검색어</label> <input type="text"
				name="q" value="" /> <input type="submit" value="검색" />
		</fieldset>
	</form>
	<table class="table table-striped table-hover">
		<caption class="hidden">공지사항</caption>
		<thead>
			<tr>
				<th class="seq" style="text-align: center;">번호</th>
				<th class="title" style="text-align: center;">제목</th>
				<th class="writer" style="text-align: center;">작성자</th>
				<th class="regdate" style="text-align: center;">작성일</th>
				<th class="hit" >조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="mb">
				<tr>
					<td class="seq" style="text-align: center;">${mb.mboard_no}</td>
					<td class="title" style="text-align: center;"><a href="mboardDetail.htm?seq=${mb.mboard_no}">${mb.mboard_title}</a></td>
					<td class="writer" style="text-align: center;">${mb.user_id}</td>
					<td class="regdate" style="text-align: center;"><fmt:formatDate value="${mb.mboard_date}" pattern="yyyy-MM-dd"/></td>
					<td class="hit" style="text-align: center;">${mb.mboard_read_num}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p class="article-comment margin-small">
	<%-- <security:authorize access="hasRole('ROLE_USER') AND hasRole('ROLE_ADMIN')">
    	<a class="btn-write button" href="noticeReg.htm">글쓰기</a>
   </security:authorize> --%>
		<a class="btn-write button" href="mboardReg.htm">글쓰기</a>
	
	
	</p>
	<p id="cur-page" class="margin-small">
		<span class="strong">1</span> / 10 page
	</p>
	<div id="pager-wrapper" class="margin-small">
		<div class="pager clear">
			<p id="btnPrev">
				<a class="button btn-prev" href="mboard.jsp">이전</a>
			</p>
			<ul>
				<li><a class="strong" href="">1</a></li>
				<li><a href="">2</a></li>
				<li><a href="">3</a></li>
				<li><a href="">4</a></li>
				<li><a href="">5</a></li>
			</ul>
			<p id="btnNext">
				<span class="button btn-next">다음</span>
			</p>
		</div>
	</div>
</div>


