<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">提现</li>
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
					<div class="panel-heading">提现</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/jydWithdrawApply/getJydWithdrawApplyList" method="post">
					
					  
					  <div class="pull-left search">
					    <input class="form-control" type="text" placeholder="按医生名称查找" name="applyman.realName" value="${ name }">
					  </div>
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
											<th >
											    <div class="th-inner sortable">提现人</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">提现金额</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">提现时间</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">状态</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="6" >暂无提现</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td> ${bean.applyman.nickname}</td>
											 <td >${bean.applyMoney}</td>
											 <td >${bean.applyTime}</td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.status eq '1' }">成功提现</c:when>
											 		<c:when test="${bean.status eq '2' }">失败提现</c:when>
											 		<c:when test="${bean.status eq '3' }">提现申请中</c:when>
											 	</c:choose>
											 </td>
											 <td > 
											 	<a href="${ctx}/jydWithdrawApply/jydWithdrawApplyDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jydWithdrawApply/editJydWithdrawApply?id=${bean.id}" title="编辑" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <%-- <a href="${ctx}/orderDetail/removeOrder?id=${bean.id}" title="删除"><span class="glyphicon glyphicon-remove"></span></a> --%>
											     
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/jydUser/getJydUserList">
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
var activeLi = $('#withdrawApply')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>