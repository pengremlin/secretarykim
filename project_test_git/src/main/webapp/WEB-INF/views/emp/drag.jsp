<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
#sortable1, #sortable2, #sortable3, #sortable4 {
	border: 1px solid #eee;
	width: 142px;
	min-height: 20px;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin-right: 10px;
}

#sortable1 li, #sortable2 li, #sortable3 li, #sortable4 li {
	margin: 0 5px 5px 5px;
	padding: 5px;
	font-size: 1.2em;
	width: 120px;
}
</style>



<div class="ibox-content">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-10">


				<form action="">

					<ul id="sortable1" class="connectedSortable">
						<li class="ui-state-default" id='1'>Item 1</li>
						<li class="ui-state-default" id='2'>Item 2</li>
						<li class="ui-state-default" id='3'>Item 3</li>
						<li class="ui-state-default" id='4'>Item 4</li>
						<li class="ui-state-default" id='5'>Item 5</li>
					</ul>


					<ul id="sortable2" class="connectedSortable">
						<li class="ui-state-highlight" id='6'>물</li>
						<li class="ui-state-highlight" id='7'>면</li>
						<li class="ui-state-highlight" id='8'>스프</li>
						<li class="ui-state-highlight" id='9'>Item 4</li>
						<li class="ui-state-highlight" id='10'>Item 5</li>
					</ul>


					<ul id="sortable3" class="connectedSortable">
						<li class="ui-state-default" id='11'>Item 1</li>
						<li class="ui-state-default" id='12'>Item 2</li>
						<li class="ui-state-default" id='13'>Item 3</li>
						<li class="ui-state-default" id='14'>Item 4</li>
						<li class="ui-state-default" id='15'>Item 5</li>
					</ul>


					<ul id="sortable4" class="connectedSortable">
						<li class="ui-state-highlight" id='16'>물</li>
						<li class="ui-state-highlight" id='17'>면</li>
						<li class="ui-state-highlight" id='18'>스프</li>
						<li class="ui-state-highlight" id='19'>Item 4</li>
						<li class="ui-state-highlight" id='20'>Item 5</li>
					</ul>
					<br>
			</div>
		</div>
		<div class="pull-right">
			<button type="submit" class="btn btn-w-m btn-success">저장</button>
		</div>
	</div>

	</form>






</div>
<h3>
	<span id="sortable-1"></span>
</h3>
<br>
<h3>
	<span id="sortable-2"></span>
</h3>
<br>
<h3>
	<span id="sortable-3"></span>
</h3>
<br>
<h3>
	<span id="sortable-4"></span>
</h3>
<br>



<script>
			$(function() {
				$("#sortable1, #sortable2 , #sortable3 , #sortable4").sortable(
						{
							connectWith : ".connectedSortable"
						}).disableSelection();
			});

			/* function viewArray(){
			   var result = $('#sortable1').sortable('toArray');
			   alert('value : ' + result);
			   alert('first value : result[0]');
			} */

			$(function() {
				$('#sortable1').sortable(
						{
							update : function(event, ui) {
								/*  수정사항이 있을 때마다 변환된 순서값을 배열로 표현한다. */
								var productOrder = $(this).sortable('toArray')
										.toString();
								$("#sortable-1").text(productOrder);
							}
						});
			});
			$(function() {
				$('#sortable2').sortable(
						{
							update : function(event, ui) {
								/*  수정사항이 있을 때마다 변환된 순서값을 배열로 표현한다. */
								var productOrder = $(this).sortable('toArray')
										.toString();
								$("#sortable-2").text(productOrder);
							}
						});
			});
			$(function() {
				$('#sortable3').sortable(
						{
							update : function(event, ui) {
								/*  수정사항이 있을 때마다 변환된 순서값을 배열로 표현한다. */
								var productOrder = $(this).sortable('toArray')
										.toString();
								$("#sortable-3").text(productOrder);
							}
						});
			});
			$(function() {
				$('#sortable4').sortable(
						{
							update : function(event, ui) {
								/*  수정사항이 있을 때마다 변환된 순서값을 배열로 표현한다. */
								var productOrder = $(this).sortable('toArray')
										.toString();
								$("#sortable-4").text(productOrder);
							}
						});
			});
		</script>
