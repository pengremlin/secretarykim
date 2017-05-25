<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">

					<div class="ibox-title">
						<h5>Simple line chart</h5>
					</div>
					<div class="ibox-content">
						<div id="ct-chart1" class="ct-perfect-fourth"
							style="width: 600px; height: 400px"></div>
					</div>



				</div>
			</div>
		</div>
	</div>
</div>


<script>
		$(document).ready(
				function() {
					// Simple line
					new Chartist.Line('#ct-chart1', {
						labels : [ 'Monday', 'Tuesday', 'Wednesday',
								'Thursday', 'Friday' ],
						series : [ [ 12, 9, 7, 8, 5 ], [ 2, 1, 3.5, 7, 3 ],
								[ 1, 3, 4, 5, 6 ] ]
					}, {
						fullWidth : true,
						chartPadding : {
							right : 40
						}
					});
				});
	</script>
