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
								<table class="table table-bordered">
									<tr>
										<th width="40">근속기간</th>
										<th width="150">
											<select class="y" id="check-1"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-2">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option selected="selected" value='06'>06</option> 
												<option value='05'>05</option>
												<option value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>
											<input type="text" name="sal_date" style="width: 30px" id="datepiker1"> ~
											<select class="y" id="check-3"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-4">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option selected="selected" value='06'>06</option> 
												<option value='05'>05</option>
												<option value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>
											<input type="text" name="sal_date" style="width: 30px" id="datepiker2">
										</th>
										<th width="100">계산 대상이 되는 근무 기간을  확인합니다.</th>
											
									</tr>
									<tr>
										<th width="40">퇴직금 대상(급여)</th>
										<th width="150">
											<select class="y" id="check-5"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-6">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option selected="selected" value='06'>06</option> 
												<option value='05'>05</option>
												<option value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>ㅣ
											<input type="text" name="sal_date" style="width: 30px" id="day1">일/
											<input type="text" name="sal_date" style="width: 30px" id="totalday1" value="31">일
											<input type="text" name="sal_date" style="width: 100px" id="sal1">
										<br><br>
										
											<select class="y" id="check-7"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-8">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option value='06'>06</option> 
												<option selected="selected" value='05'>05</option>
												<option value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>ㅣ
											<input type="text" name="sal_date" style="width: 30px" id="day2">일/
											<input type="text" name="sal_date" style="width: 30px" id="totalday2" value="31">일
											<input type="text" name="sal_date" style="width: 100px" id="sal2">
										<br><br>
										<select class="y" id="check-9"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-10">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option value='06'>06</option> 
												<option value='05'>05</option>
												<option selected="selected" value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>ㅣ
											<input type="text" name="sal_date" style="width: 30px" id="day3">일/
											<input type="text" name="sal_date" style="width: 30px" id="totalday3" value="31">일
											<input type="text" name="sal_date" style="width: 100px" id="sal3">
										<br><br>
										(3개월 근무 일수:<input type="text" style="width: 30px" id="sum">)
										
										<th width="100">*계산 대상이 될 3개월 급여가 선택됩니다.<br>
														*(3개월 근무일수)계산은 정산의 마지막일로부터
   														3개월의 일수를 계산합니다.<br>
														*해당 연월을 변경하였을 경우에는 급여내역
   														불러오기를 하셔야 해당월의 급여가 적용됩니다</th>
											
									</tr>
									<tr>
										<th width="40">퇴직일자</th>
										<th width="150">
											<select class="y" id="check-11"> 
												<option value='2017'>2017</option>
												<option selected="selected" value='2016'>2016</option> 
												<option value='2015'>2015</option>
											</select>
											<select class="y" id="check-12">
												<option value='12'>12</option>
												<option value='11'>11</option>
												<option value='10'>10</option>
												<option value='09'>09</option>
												<option value='08'>08</option>
												<option value='07'>07</option> 
												<option selected="selected" value='06'>06</option> 
												<option value='05'>05</option>
												<option value='04'>04</option>
												<option value='03'>03</option>
												<option value='02'>02</option>
												<option value='01'>01</option>
											</select>
											<input type="text" name="sal_date" style="width: 30px" id="datepiker6">
										</th>
										<th width="100">[중간정산 : 지급일자 또는 중간정산일자]</th>
											
									</tr>
									<tr>
										<th width="40">퇴직사유</th>
										<th width="150">
											<input type="checkbox" >정년퇴직
											<input type="checkbox" >정리해고
											<input type="checkbox" >자발적퇴직
										</th>
										<th width="100">퇴직 사유 선택</th>
											
									</tr>
									<tr>
										<th width="40">퇴직금</th>
										<th width="150"><input style="width: 150px" type="text" readonly="readonly" id="sum_total"></th>
										<th width="100">퇴직금을 임의로 계산해 줍니다</th>
											
									</tr>
									
								</table>
								<!-- <button>퇴직금 계산</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>

