<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="wrapper wrapper-content">
	<div class="row animated fadeInDown">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h3>출결 일지</h3>
				<div class="form-group" style="text-align: center;">
					<a class="page-scroll" href="atti.htm">
						<button class="btn btn-success btn-lg featured">출근</button>
					</a> <a class="page-scroll" href="atte_Back.htm">
						<button class="btn btn-warning btn-lg featured">퇴근</button>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<div id="emp_calendar"></div>
			</div>
		</div>

	</div>
</div>







