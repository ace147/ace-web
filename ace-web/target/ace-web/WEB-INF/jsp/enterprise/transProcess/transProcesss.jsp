<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Tables</li>
			</ol>
		</div>
				
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">转运处理
					 <%-- <a href="${ctx}/jydUser/addDoctorPage"><button type="button" style="float:right;"class="btn btn-default" >添加</button></a> --%>
					 </div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/transProcess/getTransProcessList">
					
					  
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" id="timer2" type="text" placeholder="开始时间" name="dateFront" value="<c:if test="${not empty dateFrontSearch}"><fmt:formatDate value="${dateFrontSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
					    <input class="form-control" id="timer1" type="text" placeholder="结束时间" name="dateEnd" value="<c:if test="${not empty dateEndSearch}"><fmt:formatDate value="${dateEndSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
							<input class="form-control" type="text" placeholder="请输入订单编号" name="orderCode" value="<c:if test="${not empty orderCodeSearch}">${orderCodeSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
							<input class="form-control" type="text" placeholder="请输入支付编号" name="code" value="<c:if test="${not empty codeSearch}">${codeSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
							<input class="form-control" type="text" placeholder="请输入代理人" name="dali" value="<c:if test="${not empty daliSearch}">${daliSearch}</c:if>">
					  </div>
					   <div class="pull-left search" style="width:160px;margin-right:5px;">
							<select class="form-control" name="jsStatus" >
							    <option value="">- 支付状态 -</option> 
								<option value="1" <c:if test="${jsStatusSearch eq '1'}">selected</c:if>>已支付</option>
								<option value="0" <c:if test="${jsStatusSearch eq '0'}">selected</c:if>>未支付</option>
							</select>
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
							<input class="form-control" type="text" placeholder="请输入订单联系人" name="syTransorder.name" value="<c:if test="${not empty nameSearch}">${nameSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="width:160px;margin-right:5px;">
							<input class="form-control" type="text" placeholder="请输入联系手机" name="syTransorder.contactPhone" value="<c:if test="${not empty contactPhoneSearch}">${contactPhoneSearch}</c:if>">
					  </div>
					   <div class="pull-left search" style="width:160px;margin-right:5px;">
							<select class="form-control" name="stStatus" >
							    <option value="">- 订单状态 -</option> 
								<option value="1" <c:if test="${stStatusSearch eq '1'}">selected</c:if>>未处理</option>
								<option value="0" <c:if test="${stStatusSearch eq '2'}">selected</c:if>>已处理</option>
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
											    <div class="th-inner sortable">订单编号</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">支付订单</div>
												<div class="fht-cell"></div>
											</th>
										    <th  style>
											    <div class="th-inner sortable"> 病人姓名</div>
												<div class="fht-cell"></div>
											</th> 
											<th  style>
											    <div class="th-inner sortable">客户Id</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">客户姓名</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">下单来源</div>
												<div class="fht-cell"></div>
											</th>											<th  style>
											    <div class="th-inner sortable">订单联系手机</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">总共公里数（KM） </div>
												<div class="fht-cell"></div>
											</th>
											
											<!-- <th  style>
											    <div class="th-inner sortable">目标医院</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">转运车到达时间</div>
												<div class="fht-cell"></div>
											</th>  -->
											<!-- <th  style>
											    <div class="th-inner sortable"> 转运车到达地址</div>
												<div class="fht-cell"></div>
											</th>   -->
											<!-- <th  style>
											    <div class="th-inner sortable"> 转运车司机</div>
												<div class="fht-cell"></div>
											</th>  -->
											<!-- <th  style>
											    <div class="th-inner sortable">司机电话 </div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">医院联系人</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">医院联系电话 </div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">转运公里数（KM）</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">每公里价格</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">其他价格</div>
												<div class="fht-cell"></div>
											</th> -->
											<th  style>
											    <div class="th-inner sortable">总价格</div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th  style>
											    <div class="th-inner sortable">折扣</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">应付价格</div>
												<div class="fht-cell"></div>
											</th> -->
											<th  style>
											    <div class="th-inner sortable">订单时间</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">支付状态</div>
												<div class="fht-cell"></div>
											</th>
											
											<!-- <th  style>
											    <div class="th-inner sortable">编辑人</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">编辑时间</div>
												<div class="fht-cell"></div>
											</th> -->
											<!-- <th  style>
											    <div class="th-inner sortable">审核人</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">审核时间</div>
												<div class="fht-cell"></div>
											</th> -->
											
											<th  style>
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="4" >暂无转运订单</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr> 
										     <td style>${bean.orderCode}</td>
										     <td style>${bean.payCode}</td>
					  					     <td style>${bean.patientName}</td>
											 <td style>${bean.orderPersonId}</td>
											 <td style>
											 	 <c:if test="${bean.orderFrom eq '1'}"><a href="${ctx}/jydUser/doctorDetail?id=${bean.orderPersonId}" title="查看" data-toggle="modal" data-target="#myModal">${bean.orderPerson}</a></c:if>
												 <c:if test="${bean.orderFrom eq '2'}"><a href="${ctx}/jybUser/patientDetail?id=${bean.orderPersonId}" title="查看" data-toggle="modal" data-target="#myModal">${bean.orderPerson}</a></c:if>
											 </td>
											 <td style>
												 <c:if test="${bean.orderFrom eq '1'}">代理</c:if>
												 <c:if test="${bean.orderFrom eq '2'}">病人</c:if>
											 </td>
										     <td style>${bean.contactPhone}</td>
										     
										     <%-- <td style>${bean.hospital}</td> --%>
											<%--  <td style><fmt:formatDate value="${bean.arriveTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
											 <%-- <td style>${bean.arriveAddress}</td> --%>
											<%--  <td style>${bean.driver}</td> --%>
											 <%-- <td style>${bean.driverPhone}</td> --%>
											 <%-- <td style>${bean.hoscontactMan}</td> --%>
											 <%-- <td style>${bean.hoscontactPhone}</td> --%>
											 <%-- <td style>${bean.gapdistance}</td> --%>
											 <td style>${bean.totaldistance}</td>
											 <%-- <td style>${bean.distance}</td> --%>
											 <%-- <td style>${bean.kmPrice}</td> --%>
											 <%-- <td style>${bean.otherPrice}</td> --%>
											 <td style>${bean.totalPrice}</td>
											 <td style><fmt:formatDate value="${bean.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											 <%-- <td style>${bean.discount}</td> --%>
											 <%-- <td style>${bean.payPrice}</td> --%>
											 <%-- <td style>${bean.otherPrice}</td> --%>
											  <td style>
											    <c:if test="${bean.jsStatus eq '1'}">已结算</c:if>
											    <c:if test="${bean.jsStatus eq '0'}">未结算</c:if>
											 </td>
											 <%-- <td style><a href="${ctx}/jydUser/doctorDetail?id=${bean.syTransorder.daili.id}" title="查看" data-toggle="modal" data-target="#myModal">${bean.syTransorder.daili.realName}</a></td> --%>
											 <%-- <td style>${bean.syTransorder.daili.realName}</td> --%>
											 <%-- <td style><a href="${ctx}/jybUser/patientDetail?id=${bean.syTransorder.user.id}" title="查看" data-toggle="modal" data-target="#myModal">${bean.syTransorder.user.nickname}</a></td> --%>
											 <%-- <td style>${bean.syTransorder.user.nickname}</td> --%>
											<%--  <td style>${bean.edittor.realName}</td>
											 <td style><fmt:formatDate value="${bean.editTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
											 <%-- <td style>${bean.veritor.realName}</td> --%>
											 <%-- <td style><fmt:formatDate value="${bean.veriTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
											
											 <td style> 
											     <a href="${ctx}/transProcess/eidtTransProcessPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/transProcess/getTransProcessDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/transProcess/getTransProcessList">
						    <input type="hidden" name="orderCode" value="${orderCodeSearch}">
						    <input type="hidden" name="dateFront" value="${dateFrontSearch}">
						    <input type="hidden" name="dateEnd" value="${dateEndSearch}">
						    <input type="hidden" name="code" value="${codeSearch}">
						    <input type="hidden" name="dali" value="${daliSearch}">
						    <input type="hidden" name="jsStatus" value="${jsStatusSearch}">
						    <input type="hidden" name="stStatus" value="${stStatusSearch}">
						    <input type="hidden" name="syTransorder.contactPhone" value="${contactPhoneSearch}">
						    <input type="hidden" name="syTransorder.name" value="${nameSearch}">
						    
						    <%@ include file="/WEB-INF/jsp/common/pager.jsp"%> 
						</form>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
	<!-- 模态框（Modal） -->
	<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	       
	         </div>
	      </div>
	   </div>
	</div> -->
	
<script>
   /* $(function () { $('#myModal').modal({
      keyboard: true
   })}); */
</script>
		
		
	</div><!--/.main-->

	 <%-- <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/chart.min.js"></script>
	<script src="${ctx}/js/chart-data.js"></script>
	<script src="${ctx}/js/easypiechart.js"></script>
	<script src="${ctx}/js/easypiechart-data.js"></script>
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/js/bootstrap-table.js"></script> --%>
	
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
var activeLi = $('#transProcessList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
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
</html>

