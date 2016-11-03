<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Tables</li>
			</ol>
		</div><!--/.row-->
		<!--
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Tables</h1>
			</div>
		</div>/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">医生资料
					 <a href="${ctx}/jydUser/addDoctorPage"><button type="button" style="float:right;"class="btn btn-default" >添加</button></a>
					 </div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/jydUser/getJydUserList">
					
					  
					  
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入手机" name="mobile" value="<c:if test="${not empty mobileSearch}">${mobileSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入姓名" name="realName" value="<c:if test="${not empty realNameSearch}">${realNameSearch}</c:if>">
					  </div>
					 <!--  <div class=" pull-right search" style="margin-left:20px;">
							<select class="form-control" name="cardType">
							    <option value="">证件类型</option>
								<option value="1">身份证</option>
								<option value="2">护照</option>
								<option value="3">港澳通行证</option>
								<option value="4">军官证</option>
							</select>
					  </div> -->
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="regisFrom" >
							    <option value="">- 注册来源 -</option> 
								<option value="1" <c:if test="${regisFromSearch eq '1'}">selected</c:if>>平台</option>
								<option value="2" <c:if test="${regisFromSearch eq '2'}">selected</c:if>>微信</option>
								<option value="3" <c:if test="${regisFromSearch eq '3'}">selected</c:if>>QQ</option>
								<option value="4" <c:if test="${regisFromSearch eq '4'}">selected</c:if>>新浪</option>
							</select>
					  </div>
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="isIdveri">
							    <option value="">- 是否审核 -</option> 
								<option value="Y" <c:if test="${isIdverifileSearch eq 'Y'}">selected</c:if>>审核</option>
								<option value="F" <c:if test="${isIdverifileSearch eq 'F'}">selected</c:if>>未审核</option>
							</select>
					  </div> 
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="isDaili">
							    <option value="">- 是否代理 -</option> 
								<option value="Y" <c:if test="${isDailiSearch eq 'Y'}">selected</c:if>>是</option>
								<option value="F" <c:if test="${isDailiSearch eq 'F'}">selected</c:if>>否</option>
							</select>
					  </div> 
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="star" >
							    <option value="-1" <c:if test="${starSearch eq '-1'}">selected</c:if>>- 星星数 -</option> 
								<option value="10" <c:if test="${starSearch eq '10'}">selected</c:if>>满星</option>
								<option value="5" <c:if test="${starSearch eq '5'}">selected</c:if>>5星</option>
								<option value="0" <c:if test="${starSearch eq '0'}">selected</c:if>>0</option>
							</select>
					  </div>
					   <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="orderType" >
							    <option value="">- 排序 -</option> 
								<option value="1" <c:if test="${orderTypeSearch eq '1'}">selected</c:if>>登陆次数</option>
								<option value="2" <c:if test="${orderTypeSearch eq '2'}">selected</c:if>>已接订单</option>
								<option value="3" <c:if test="${orderTypeSearch eq '3'}">selected</c:if>>已取消订单</option>
								<option value="4" <c:if test="${orderTypeSearch eq '4'}">selected</c:if>>星星数</option>
							</select>
					  </div>
					  
					  <div class="columns pull-left" style="margin-left:20px;">
					      <button type="submit" class="btn btn-primary">查询</button>
					  </div>
					  
					  
					  </form>
					</div>
					   
					   <div class="fixed-table-container">
					        <div class="fixed-table-header"></div>
					   		<div class="fixed-table-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th  style>
											    <div class="th-inner sortable"> ID</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 姓名</div>
												<div class="fht-cell"></div>
											</th> 
											<!-- <th  style>
											    <div class="th-inner sortable"> 昵称</div>
												<div class="fht-cell"></div>
											</th>  -->
											<th  style>
											    <div class="th-inner sortable"> 手机</div>
												<div class="fht-cell"></div>
											</th> 
											<!-- <th  style>
											    <div class="th-inner sortable">证件类型 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">证件号码 </div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">是否认证 </div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">登录次数 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">已接单数 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">已取消订单数 </div>
												<div class="fht-cell"></div>
											</th> -->
											<th  style>
											    <div class="th-inner sortable">注册时间 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">星星数 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">注册来源 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">帐号状态 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">是否代理 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">是否审核 </div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th  style>
											    <div class="th-inner sortable"> 性别</div>
												<div class="fht-cell"></div>
											</th>
											-->
											<th  style>
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="4" >暂无医生资料</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td style>${bean.id}</td>
											 <td style>${bean.realName}</td>
											 <td style>${bean.mobile}</td>
											 <td style><fmt:formatDate value="${bean.regisTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											 
											 
											<%--  <td style>
											    <c:if test="${bean.cardType eq '1'}">身份证</c:if>
											    <c:if test="${bean.cardType eq '2'}">护照</c:if>
											    <c:if test="${bean.cardType eq '3'}">港澳通行证</c:if>
											    <c:if test="${bean.cardType eq '4'}">军官证</c:if>
											</td>
											 <td style>${bean.cardNum}</td>
											 <td style>
											     <c:if test="${empty bean.jydIdverifile}">未认证</c:if>
												 <c:if test="${not empty bean.jydIdverifile}">已认证</c:if>
											 </td> --%>
											 <%-- <td style>${bean.loginNums}</td>
											 <td style>${bean.orderCnt}</td>
											 <td style>${bean.orderCancel}</td> --%>
											 <td style>${bean.star}</td>
											 <td style>
												 <c:if test="${bean.regisFrom eq '1'}">平台</c:if>
												 <c:if test="${bean.regisFrom eq '2'}">微信</c:if>
												 <c:if test="${bean.regisFrom eq '3'}">QQ</c:if>
												 <c:if test="${bean.regisFrom eq '4'}">新浪</c:if>
											 </td>
											 <td style>
											     <c:if test="${bean.status eq '0'}">禁用</c:if>
											     <c:if test="${bean.status eq '1'}">启用</c:if>
											     <c:if test="${bean.status eq '2'}">注销</c:if>
											 </td>
											 <td style>
											     <c:if test="${bean.isDaili eq 'Y'}">是</c:if>
											     <c:if test="${bean.isDaili eq 'F'}">否</c:if>
											 </td>
											  <td style>
											     <c:if test="${bean.isIdveri eq 'Y'}">是</c:if>
											     <c:if test="${bean.isIdveri eq 'F'}">否</c:if>
											 </td>
											
											<%--  <td style>
											   <c:if test="${bean.sex=='M'}">男</c:if>
											   <c:if test="${bean.sex=='F'}">女</c:if>
											 </td>
											  <td style>${bean.mobile}</td> --%>
											 <td style> 
											     <a href="${ctx}/jydUser/eidtDoctorPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jydUser/doctorDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											      &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jydUser/doctorBankcard?id=${bean.id}" title="查看银行卡" ><span class="glyphicon glyphicon-credit-card"></span></a>
											      &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jydUser/getJydLoginRecordById?id=${bean.id}" title="登录记录" ><span class="glyphicon glyphicon-list-alt"></span></a>
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/jydUser/getJydUserList">
						    <input type="hidden" name="mobile" value="${mobileSearch}">
							<input type="hidden" name="realName" value="${realNameSearch}">
							<input type="hidden" name="regisFrom" value="${regisFromSearch}">
							<input type="hidden" name="isIdveri" value="${isIdverifileSearch}">
							<input type="hidden" name="isDaili" value="${isDailiSearch}">
							<input type="hidden" name="star" value="${starSearch}">
							<input type="hidden" name="orderType" value="${orderTypeSearch}">
						    <%@ include file="/WEB-INF/jsp/common/pager.jsp"%> 
						</form>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->
	
	
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
		
		/* $("#myModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
		}); */
	</script>	
</body>
<script type="text/javascript">
var activeLi = $('#doctors')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>

