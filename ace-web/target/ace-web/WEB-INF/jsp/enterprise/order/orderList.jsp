<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">订单</li>
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
					<div class="panel-heading">订单</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/doctororder/getDoctororderList" method="post">
					  <div class="columns pull-right">
					      <button type="submit" class="btn btn-primary">查询</button>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" id="timer1" type="text" placeholder="按日期范围(结束)查找" name="endDate" value="${endDate}">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" id="timer2" type="text" placeholder="按日期范围(开始)查找" name="startDate" value="${startDate }">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <select name="syOrderDetail.jsStatus" class="form-control">
					    	<option value=''>按结算状态查找</option>
					    	<option value='1' <c:if test="${syDoctororder.syOrderDetail.jsStatus eq '1' }">selected</c:if>>已结算</option>
					    	<option value='0' <c:if test="${syDoctororder.syOrderDetail.jsStatus eq '0' }">selected</c:if>>未结算</option>
					    </select>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <select name="syOrderDetail.czStatus" class="form-control">
					    	<option value=''>按出诊状态查找</option>
					    	<option value='1' <c:if test="${syDoctororder.syOrderDetail.czStatus eq '1' }">selected</c:if>>已接单</option>
					    	<option value='2' <c:if test="${syDoctororder.syOrderDetail.czStatus eq '2' }">selected</c:if>>在路上</option>
					    	<option value='3' <c:if test="${syDoctororder.syOrderDetail.czStatus eq '3' }">selected</c:if>>已到达</option>
					    	<option value='4' <c:if test="${syDoctororder.syOrderDetail.czStatus eq '4' }">selected</c:if>>已出诊</option>
					    </select>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <select name="syOrderDetail.status" class="form-control">
					    	<option value=''>按订单状态查找</option>
					    	<option value='0' <c:if test="${syDoctororder.syOrderDetail.status eq '0' }">selected</c:if>>失效</option>
					    	<option value='1' <c:if test="${syDoctororder.syOrderDetail.status eq '1' }">selected</c:if>>待确认</option>
					    	<option value='2' <c:if test="${syDoctororder.syOrderDetail.status eq '2' }">selected</c:if>>已确认</option>
					    	<option value='3' <c:if test="${syDoctororder.syOrderDetail.status eq '3' }">selected</c:if>>锁定</option>
					    </select>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <select name="syOrderDetail.isCoupon" class="form-control">
					    	<option value=''>按是否使用优惠卷查找</option>
					    	<option value='Y' <c:if test="${syDoctororder.syOrderDetail.isCoupon eq 'Y' }">selected</c:if>>使用</option>
					    	<option value='F' <c:if test="${syDoctororder.syOrderDetail.isCoupon eq 'F' }">selected</c:if>>不使用</option>
					    </select>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" type="text" placeholder="按医生手机号码查找" name="jydUser.mobile" value="${syDoctororder.jydUser.mobile}">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" type="text" placeholder="按医生姓名查找" name="jydUser.realName" value="${syDoctororder.jydUser.realName}"> 
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" type="text" placeholder="按客户手机号码查找" name="syOrderDetail.contactPhone" value="${syDoctororder.syOrderDetail.contactPhone}">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" type="text" placeholder="按客户姓名查找" name="syOrderDetail.name" value="${syDoctororder.syOrderDetail.name}">
					  </div>
					  <div class="pull-left search" style="width:160px;">
					    <input class="form-control" type="text" placeholder="按订单编号查找" name="syOrderDetail.code" value="${syDoctororder.syOrderDetail.code}">
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
											    <div class="th-inner sortable">订单编号</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable"> 客户姓名</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">客户手机</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable"> 医生姓名</div>
												<div class="fht-cell"></div>
											</th>
											<th >
											    <div class="th-inner sortable">医生手机</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">下单时间</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">结算状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">订单状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">出诊状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable">总体费用</div>
												<div class="fht-cell"></div>
											</th>
											<th  >
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="11" >暂无订单</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td >${bean.syOrderDetail.code}</td>
											 <td >${bean.syOrderDetail.name}</td>
											 <td >${bean.syOrderDetail.contactPhone}</td>
											 <td >${bean.jydUser.realName}</td>
											 <td >${bean.jydUser.mobile}</td>
											 <td >${bean.syOrderDetail.orderTime}</td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.syOrderDetail.jsStatus eq '1'}">已结算</c:when>
											 		<c:when test="${bean.syOrderDetail.jsStatus eq '0'}">未结算</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.syOrderDetail.status eq '0'}">失效</c:when>
											 		<c:when test="${bean.syOrderDetail.status eq '1'}">待确认</c:when>
											 		<c:when test="${bean.syOrderDetail.status eq '2'}">已确认</c:when>
											 		<c:when test="${bean.syOrderDetail.status eq '3'}">锁定</c:when>
											 	</c:choose>
											 </td>
											 <td >
											 	<c:choose>
											 		<c:when test="${bean.syOrderDetail.czStatus eq '1'}">已接单</c:when>
											 		<c:when test="${bean.syOrderDetail.czStatus eq '2'}">在路上</c:when>
											 		<c:when test="${bean.syOrderDetail.czStatus eq '3'}">已到达</c:when>
											 		<c:when test="${bean.syOrderDetail.czStatus eq '4'}">已出诊</c:when>
											 	</c:choose>
											 </td>
											 <td >${bean.syOrderDetail.totalFee}</td>
											 <td > 
											     <%-- <a href="${ctx}/medicineSet/eidtMedicineSetPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp --%>
											     <a href="${ctx}/doctororder/orderDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/doctororder/treatInfo?id=${bean.syOrderDetail.id}" title="诊疗信息"><span class="glyphicon glyphicon-zoom-in"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/doctororder/editStatus?id=${bean.syOrderDetail.id}" title="编辑" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp 
											     <%-- <a href="${ctx}/orderDetail/removeOrder?id=${bean.id}" title="删除"><span class="glyphicon glyphicon-remove"></span></a> --%>
											     
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/doctororder/getDoctororderList">
							<input type="hidden" name="syOrderDetail.jsStatus" value="${syDoctororder.syOrderDetail.jsStatus}">
							<input type="hidden" name="syOrderDetail.czStatus" value="${syDoctororder.syOrderDetail.czStatus}">
							<input type="hidden" name="syOrderDetail.status" value="${syDoctororder.syOrderDetail.status}">
							<input type="hidden" name="syOrderDetail.isCoupon" value="${syDoctororder.syOrderDetail.isCoupon}">
							<input type="hidden" name="jydUser.mobile" value="${syDoctororder.jydUser.mobile}">
							<input type="hidden" name="jydUser.realName" value="${syDoctororder.jydUser.realName}">
							<input type="hidden" name="syOrderDetail.contactPhone" value="${syDoctororder.syOrderDetail.contactPhone}">
							<input type="hidden" name="syOrderDetail.name" value="${syDoctororder.syOrderDetail.name}">
							<input type="hidden" name="syOrderDetail.code" value="${syDoctororder.syOrderDetail.code}">
							<input type="hidden" name="startDate" value="${startDate}">
							<input type="hidden" name="endDate" value="${endDate}">
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
	<script src="${ctx}/js/datetimepicker/jquery.datetimepicker.js"></script>
	
	<script>
	  ;!function(){

			//laydate.skin('molv');

			laydate({
			   elem: '#timer1',
			   format: 'YYYY-MM-DD hh:mm:ss', //日期格式
			   istime: true, //是否开启时间选择
			   isclear: true, //是否显示清空
			   istoday: true, //是否显示今天
			})

			}();
			
			;!function(){

				//laydate.skin('molv');

				laydate({
				   elem: '#timer2',
				   format: 'YYYY-MM-DD hh:mm:ss', //日期格式
				   istime: true, //是否开启时间选择
				   isclear: true, //是否显示清空
				   istoday: true, //是否显示今天
				})

				}();
	</script>	
	
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
	
	<script type="text/javascript">
	var activeLi = $('#orderList')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
