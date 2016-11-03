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
					<div class="panel-heading">病人资料</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/jybUser/getJybUserList">
					
					  
					  
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入手机" name="mobile" value="<c:if test="${not empty mobileSearch}">${mobileSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入姓名" name="realName" value="<c:if test="${not empty realNameSearch}">${realNameSearch}</c:if>">
					  </div>
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
							<select class="form-control" name="isBlock" >
							    <option value="">- 是否拉黑 -</option> 
								<option value="Y" <c:if test="${isBlockSearch eq 'Y'}">selected</c:if>>拉黑</option>
								<option value="F" <c:if test="${isBlockSearch eq 'F'}">selected</c:if>>正常</option>
							</select>
					  </div>
					   <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="orderType"  >
							    <option value="">- 排序 -</option> 
								<option value="1" <c:if test="${orderTypeSearch eq '1'}">selected</c:if>>登录次数</option>
								<option value="2" <c:if test="${orderTypeSearch eq '2'}">selected</c:if>>下单数</option>
								<option value="3" <c:if test="${orderTypeSearch eq '3'}">selected</c:if>>最后访时间</option>
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
											    <div class="th-inner sortable"> 病人id</div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th  style>
											    <div class="th-inner sortable"> 用户账户</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable"> 昵称</div>
												<div class="fht-cell"></div>
											</th> -->
											<th  style>
											    <div class="th-inner sortable"> 手机</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 真实名称 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 性别</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 登录次数</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 订单数</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 最后访问时间</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 账号状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="4">暂无病人资料</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr> 
										     <td style>${bean.id}</td>
										     <td style>${bean.mobile}</td>
											<%--  <td style>${bean.nickname}</td> --%>
											 <td style>${bean.realName}</td>
											 <td style>
											     <c:if test="${bean.sex eq 'M' }">男</c:if>
											     <c:if test="${bean.sex eq 'F' }">女</c:if>
											 </td>
											 <td style>${bean.loginNums}</td>
											 <td style>${bean.orderNum}</td>
											 
											 <td style><fmt:formatDate value="${bean.lastVisitTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											 <td style>
											     <c:if test="${bean.isBlock eq 'Y' }">是</c:if>
											     <c:if test="${bean.isBlock eq 'F' }">否</c:if>
											 </td>
											 <td style> 
											     <a href="${ctx}/jybUser/eidtPatientPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jybUser/patientDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jybUser/modifyBlock?id=${bean.id}" title="拉黑"><span class="glyphicon glyphicon-pencil"></span></a>
											     
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/jybUser/getJybUserList">
						    <%@ include file="/WEB-INF/jsp/common/pager.jsp"%> 
						</form>
						<!-- <div class="fixed-table-pagination">
						   <div class="pull-left pagination-detail">
						     <span class="pagination-info"></span>
						   </div>
						   <div class="pull-right pagination">
							    <ul class="pagination">
							       <li class="page-first disabled"><a href="#"><<</a></li>
							       <li class="page-pre disabled"><a href="#"><</a></li>
							       <li class="page-number active disabled"><a href="#"><<</a></li>
							       <li class="page-next disabled"><a href="#">></a></li>
							       <li class="page-last disabled"><a href="#">>></a></li>
							    </ul>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
	</div><!--/.main-->

	<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/chart.min.js"></script>
	<script src="${ctx}/js/chart-data.js"></script>
	<script src="${ctx}/js/easypiechart.js"></script>
	<script src="${ctx}/js/easypiechart-data.js"></script>
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/js/bootstrap-table.js"></script>
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
		
		//extendedMenu("jybUserList");
		
		
	  /* $(function(){
	   $('#patients').addClass('active').siblings().removeClass('active');   
});  */
	</script>
	<script type="text/javascript">
	var activeLi = $('#patients')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
	

</body>

</html>