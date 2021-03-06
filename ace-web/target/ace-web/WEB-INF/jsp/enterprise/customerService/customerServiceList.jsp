
<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">客户联系</li>
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
					<div class="panel-heading">
					      客户联系
					   <a href="${ctx}/customerService/addCustomerServicePage"><button type="button" style="float:right;"class="btn btn-default" >添加</button></a>
					</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/customerService/getCustomerServiceList">
					  
					  <div class="pull-left search" style="margin-left:10px">
					    <input class="form-control" id="medicineSearch" type="text" placeholder="按客户姓名查找" value="${customerService.name}" name="name">
					  </div>
					  <%-- <div class="pull-left search" style="margin-left:10px">
					    <input class="form-control" id="basicillSearch" type="text" placeholder="按疾病名查找" value="<c:if test="${not empty basicillSearch}">${basicillSearch}</c:if>" name="basicill.name">
					  </div> --%>
					  
					  <div class="columns pull-left">
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
											<th  >
											    <div class="th-inner sortable">姓名</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">联系电话1</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">联系电话2</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">邮箱</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">QQ</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">微信</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">类型</div>
												<div class="fht-cell"></div>
											</th>
											
											
											<th  >
											    <div class="th-inner sortable">操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="9" >暂无客户</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td >${bean.name}</td>
											 <td >${bean.telePhone1}</td>
											 <td >${bean.telePhone2}</td>
											 <td >${bean.email}</td>
											 <td >${bean.qq}</td>
											 <td >${bean.wechat}</td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.status eq '1'}">在线</c:when>
											 		<c:when test="${bean.status eq '2'}">下线</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.type eq '1'}">上门服务</c:when>
											 		<c:when test="${bean.type eq '2'}">转运服务</c:when>
											 		<c:when test="${bean.type eq 'ALL'}">所有服务</c:when>
											 	</c:choose>
											 </td>
											 <td > 
											 	<a href="${ctx}/customerService/customerServiceDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/customerService/eidtCustomerServicePage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/customerService/removeCustomerService?id=${bean.id}" title="删除"><span class="glyphicon glyphicon-remove"></span></a>
											     
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/customerService/getCustomerServiceList">
						<input type="hidden" value="${customerService.name}" name="name"/>
						<%-- <input type="hidden" value="${medicineSearch}" name="medicine.name"/> --%>
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
	</script>	
</body>

</html>

<script type="text/javascript">
var activeLi = $('#customerService')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>