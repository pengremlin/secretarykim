<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="content" class="wow fadeInLeft">
	<h2>자유게시판</h2>
	<h3 class="hidden">방문페이지위치</h3>
	<ul id="breadscrumb" class="block_hlist">
		<li>HOME</li>
		<li>자유게시판</li>
		<li>글쓰기</li>
	</ul>
	<form action="" method="post" enctype="multipart/form-data">
		<div id="notice-article-detail" class="article-detail margin-large">
			<dl class="article-detail-row">
				<dt class="article-detail-title">제목</dt>
				<dd class="article-detail-data">
					&nbsp;<input type="text" name="mboard_title" />
				</dd>
			</dl>

			<!-- <dl class="article-detail-row">
				<dt class="article-detail-title">첨부파일_1</dt>
				<dd class="article-detail-data">
					&nbsp;<input type="file" id="txtFile" name="files[0]" />
				</dd>
			</dl>
			<dl class="article-detail-row">
				<dt class="article-detail-title">첨부파일_2</dt>
				<dd class="article-detail-data">
					&nbsp;<input type="file" id="txtFile" name="files[1]" />
				</dd>
			</dl> -->
			<div class="article-content">
				<textarea id="txtContent" class="txtContent" name="mboard_content"></textarea>
			</div>

		</div>
		<p class="article-comment margin-small">
			<input class="btn-save button" type="submit" value="저장" /> <a
				class="btn-cancel button" href="mboard.htm">취소</a>
		</p>
	</form>
</div>
