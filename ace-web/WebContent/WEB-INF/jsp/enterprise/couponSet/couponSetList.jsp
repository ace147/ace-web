<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">优惠券</li>
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
					<div class="panel-heading">优惠券</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/couponSet/getCouponSetList" method="post">
						
					  
					  <div class="pull-left search">
					    <input class="form-control" type="text" placeholder="按标题查找" name="couponTitle">
					  </div>
					  <div class="columns pull-left">
					      <button type="submit" class="btn btn-primary">查询</button>
					  </div>
					  <div class="columns pull-left">
					      <a href="${ctx}/couponSet/addCouponSet" data-toggle="modal" data-target="#myModal">
					      	<button class="btn btn-primary">添加</button>
					      </a>
					  </div>
					  
					  </form>
					</div>
					   
					   <div class="fixed-table-container">
					        <div class="fixed-table-header"></div>
					   		<div class="fixed-table-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th >
											    <div class="th-inner sortable">标题</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">编号</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">优惠金额</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">目标用户</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">是否发送</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">是否短信通知</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">抵扣方式</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">发放方式 </div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">允许分享次数</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">标题</div>
												<div class="fht-cell"></div>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="9" >暂无优惠券</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td >${bean.couponTitle}</td>
											 <td >${bean.code}</td>
											 <td >${bean.saveMoney}</td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.target eq '1'}">未领取</c:when>
											 		<c:when test="${bean.target eq '2'}">本月未呼叫医生</c:when>
											 		<c:when test="${bean.target eq '3'}">三月内未呼叫医生</c:when>
											 		<c:when test="${bean.target eq '4'}">本月已呼叫医生</c:when>
											 		<c:when test="${bean.target eq '5'}">三月内已呼叫医生</c:when>
											 		<c:when test="${bean.target eq 'ALL'}">所有用户</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.isSended eq 'Y' }">已发送</c:when>
											 		<c:when test="${bean.isSended eq 'F' }">未发送</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.isSms eq 'Y' }">是</c:when>
											 		<c:when test="${bean.isSms eq 'F' }">否</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.deducType eq '1' }">服务费</c:when>
											 		<c:when test="${bean.deducType eq '2' }">药费</c:when>
											 		<c:when test="${bean.deducType eq 'ALL' }">所有</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.grantType eq '1' }">服务费</c:when>
											 		<c:when test="${bean.grantType eq '2' }">药费</c:when>
											 		<c:when test="${bean.grantType eq 'ALL' }">所有</c:when>
											 	</c:choose>
											 </td>
											 <td >${bean.sharedNum }</td>
											 <td > 
											 	<a href="${ctx}/couponSet/couponSetDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/couponSet/editCouponSet?id=${bean.id}" title="编辑" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <%-- <a href="${ctx}/orderDetail/removeOrder?id=${bean.id}" title="删除"><span class="glyphicon glyphicon-remove"></span></a> --%>
											     
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/couponSet/getCouponSetList">
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
 <script type="text/javascript">
var activeLi = $('#couponSet')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>