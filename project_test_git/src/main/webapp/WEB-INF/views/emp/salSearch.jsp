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
            <div id="idPrint">
                <style type="text/css">
                .insa th{font-weight:normal; padding:2px 1px 2px 1px;}
                .insa td{padding:2px 2px 2px 0px; border-right:1px solid #999; border-bottom:1px solid #999;}
                tr.bottom_line th,
                tr.bottom_line td{border-bottom:2px solid #036;}
                tr td.right_line{border-right:1px solid #036;}
                tfoot.border_line tr td{background:#EEF1F6; border:1px solid #036;}
                .gray_bg td{background-color:#f7f7f7;}
                </style>
        
                <div id="contents" style="width: 990px;">
                <div id="print_title">
                	<p class="center">
                		<table width='985px' border='0' cellspacing='0' cellpadding='0'>
                			<tr>
                				<td align='center'>
                				<table border='0' cellspacing='0' cellpadding='0'>
                				<tr>
                				<h2 align='center' class='big5'>급여 대장</h2>
                				</tr>
                				</table>
                				</td>
                			</tr>
                		</table>
                	</p>
                </div>
                <table summary="" class="insa">
                <tr>
                <th width="80">
                <input type="checkbox" id="chkAll" name="chkAll" checked onclick="AllCheck(this);" /> 성명</th>
                <th width="104">${list.get(0).allow_name }</th>
                <th width="104" colspan="2">${list.get(1).allow_name }</th>
                <th width="104" colspan="2">${list.get(2).allow_name }</th>
                <th width="104" colspan="2">${list.get(3).allow_name }</th>
                <th width="104">${list.get(4).allow_name }</th>
                <th width="78">${list.get(5).allow_name }</th>
                <th width="78">${list.get(6).allow_name }</th>
                <th width="78">${list.get(7).allow_name }</th>
                <th width="78">${list.get(8).allow_name }</th>
                <th width="78">${list.get(9).allow_name }</th>
                </tr>
                <tr>
                <th width="80">사번</th>
                <th width="80">${list.get(10).allow_name }</th>
                <th width="104">${list.get(11).allow_name }</th>
                <th width="104" colspan="2">${list.get(12).allow_name }</th>
                <th width="104" colspan="2">${list.get(14).allow_name }</th>
                <th width="104" colspan="2">${list.get(15).allow_name }</th>
                <th width="78">${list.get(15).allow_name }</th>
                <th width="78">${list.get(16).allow_name }</th>
                <th width="78">${list.get(17).allow_name }</th>
                <th width="78">${list.get(18).allow_name }</th>
                <th width="78">&nbsp;</th></tr>
                <tr class="bottom_line">
                <th width="80">직급</th>
                <th width="104">&nbsp;</th>
                <th width="104" colspan="2">&nbsp;</th>
                <th width="104" colspan="2">&nbsp;</th>
                <th width="104" colspan="2">&nbsp;</th>
                <th width="104"><strong>지급총액</strong></th>
                <th width="78">&nbsp;</th>
                <th width="78">&nbsp;</th>
                <th width="78">&nbsp;</th>
                <th width="78"><strong>공제총액</strong></th>
                <th width="78"><strong>실지급액</strong></th></tr>
                
                <c:forEach var="i" begin="0" end="${list3.size()-1 }" step="1">
                <tr>
                <td width="80" class="left">
                <input view="N" type="checkbox" id="chkRow" name="chkRow" value="005" checked>${list3.get(i).user_name }<br /></td>
                <td width="104" class="right"  id="sssal-${i }">
                	<fmt:formatNumber value="${list.get(0).allow_sal*list2.get(i).step}" type="number" />
                </td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" class="right"  >&nbsp;</td>
                <td width="78" class="right"  ></td>
                <td width="78" class="right"  ></td>
                <td width="78" class="right"  ></td>
                <td width="78" class="right"  >
                	<fmt:formatNumber value="${list2.get(i).sal*0.052*list2.get(i).step }" type="number" />
                </td>
                <td width="78" class="right"  ></td></tr>     
                <tr>
                <td width="80" class="left"  style="backgroung-color:#000">${list2.get(i).emp_no }</td>
                <td width="104" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >150,000</td>
                <td width="104" colspan="2" class="right"  >200,000</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" class="right"  >&nbsp;</td>
                <td width="78" class="right"  ></td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >&nbsp;</td></tr>
                <tr class='bottom_line'><td width="80" class="left">${list2.get(i).job_name }</td>
                <td width="104" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" colspan="2" class="right"  >&nbsp;</td>
                <td width="104" class="right"  >
                <strong>
                	<fmt:formatNumber value="${list.get(0).allow_sal*list2.get(i).step+200000+150000}" type="number" />
                </strong>
                </td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >&nbsp;</td>
                <td width="78" class="right"  >
                <strong>
                
                	<fmt:formatNumber value="${list2.get(i).sal*0.052*list2.get(i).step }" type="number" />
                
                </strong>
                </td>
                <td width="78" class="right"  >
                <strong>
                
                <fmt:formatNumber value="${list.get(0).allow_sal*list2.get(i).step+200000+150000-list2.get(i).sal*0.052*list2.get(i).step}" type="number" />
                </strong>
                </td>
                </tr>
                </c:forEach>
                
                <tfoot class="border_line"><tr>
                <td width="80" rowspan="3" class="center">
                <strong>합계(${list3.size() }명)</strong></td>
                <td width="104" class="right" id="sssum">
          			
      				<fmt:formatNumber value="${list.get(0).allow_sal*list2.get(0).step+list.get(0).allow_sal*list2.get(1).step+list.get(0).allow_sal*list2.get(2).step+list.get(0).allow_sal*list2.get(3).step}" type="number" />
                </td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" class="right">&nbsp;</td>
                <td width="78" class="right"></td>
                <td width="78" class="right"></td>
                <td width="78" class="right"></td>
                <td width="78" class="right">
                
                <fmt:formatNumber value="${list2.get(0).sal*0.052*list2.get(0).step+list2.get(1).sal*0.052*list2.get(1).step+list2.get(2).sal*0.052*list2.get(2).step+list2.get(3).sal*0.052*list2.get(3).step }" type="number" />
                </td>
                <td width="78" class="right"></td></tr>
                <tr><td width="104" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">600,000</td>
                <td width="104" colspan="2" class="right">800,000</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" class="right">&nbsp;</td>
                <td width="78" class="right"></td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">&nbsp;</td></tr>
                <tr><td width="104" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" colspan="2" class="right">&nbsp;</td>
                <td width="104" class="right">
                <strong>
                
                <fmt:formatNumber value="${list.get(0).allow_sal*list2.get(0).step+list.get(0).allow_sal*list2.get(1).step+list.get(0).allow_sal*list2.get(2).step+list.get(0).allow_sal*list2.get(3).step+1400000}" type="number" />
                </strong>
                </td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">&nbsp;</td>
                <td width="78" class="right">
                <strong>
                
				<fmt:formatNumber value="${list2.get(0).sal*0.052*list2.get(0).step+list2.get(1).sal*0.052*list2.get(1).step+list2.get(2).sal*0.052*list2.get(2).step+list2.get(3).sal*0.052*list2.get(3).step }" type="number" />                </strong>
                </td>
                <td width="78" class="right" id="salSearchSum">
                <strong>
                
                <fmt:formatNumber value="${list.get(0).allow_sal*list2.get(0).step+list.get(0).allow_sal*list2.get(1).step+list.get(0).allow_sal*list2.get(2).step+list.get(0).allow_sal*list2.get(3).step+1400000-list2.get(0).sal*0.052*list2.get(0).step+list2.get(1).sal*0.052*list2.get(1).step+list2.get(2).sal*0.052*list2.get(2).step+list2.get(3).sal*0.052*list2.get(3).step}" type="number"/>
                </strong>
                </td>
                </tr>
                </tfoot>
                </table>
               
                </div>
                
                </div> <!-- //contents-->
                <%-- <form action="${pageContext.request.contextPath}/emp/updateSal_List.htm?sal_list_no=<%=request.getParameter("sal_list_no") %>&sal=${list.get(0).allow_sal*list2.get(0).step+list.get(0).allow_sal*list2.get(1).step+list.get(0).allow_sal*list2.get(2).step+list.get(0).allow_sal*list2.get(3).step+1200000-list2.get(0).sal*0.052*list2.get(0).step+list2.get(1).sal*0.052*list2.get(1).step+list2.get(2).sal*0.052*list2.get(2).step+list2.get(3).sal*0.052*list2.get(3).step}" method="post">
				 --%><button style="width: 90px" type="submit" onclick="javascript:salSearch('${list.get(0).allow_sal*list2.get(0).step+list.get(0).allow_sal*list2.get(1).step+list.get(0).allow_sal*list2.get(2).step+list.get(0).allow_sal*list2.get(3).step+1400000-list2.get(0).sal*0.052*list2.get(0).step+list2.get(1).sal*0.052*list2.get(1).step+list2.get(2).sal*0.052*list2.get(2).step+list2.get(3).sal*0.052*list2.get(3).step}')" id="salSearch">확인</button>
				<!-- </form> -->
							</div>

							
						</div>
					</div>
				</div>
			</div>




