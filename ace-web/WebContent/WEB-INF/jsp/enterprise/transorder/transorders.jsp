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
					<div class="panel-heading">转运订单
					 <%-- <a href="${ctx}/jydUser/addDoctorPage"><button type="button" style="float:right;"class="btn btn-default" >添加</button></a> --%>
					 </div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/transorder/getTransorderList">
					
					  
					  
					<%--   <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入医院" name="hospital" value="<c:if test="${not empty hospitalSearch}">${hospitalSearch}</c:if>">
					  </div> --%>
					   <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入订单编号" name="orderCode" value="<c:if test="${not empty orderCodeSearch}">${orderCodeSearch}</c:if>">
					  </div>
					  
					  <div class=" pull-left search" style="margin-left:20px;">
							<input class="form-control" id="timer2" value="<c:if test="${not empty orderTimeFrontSearch}"><fmt:formatDate value="${orderTimeFrontSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="orderTimeFrontSearch" placeholder="开始时间">
					  </div>
					  
					  <div class=" pull-left search" style="margin-left:6px; margin-right:6px">
							--
					  </div>
					  
					  <div class=" pull-left search">
							<input class="form-control" id="timer1" value="<c:if test="${not empty orderTimeBehindSearch}"><fmt:formatDate value="${orderTimeBehindSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="orderTimeBehindSearch" placeholder="结束时间">
					  </div>
					  
					  
					  <%-- <div class="pull-right search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入姓名" name="realName" value="<c:if test="${not empty realNameSearch}">${realNameSearch}</c:if>">
					  </div> --%>
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
							<select class="form-control" name="stStatus" >
							    <option value="">- 订单状态 -</option> 
								<option value="1" <c:if test="${stStatusSearch eq '1'}">selected</c:if>>待确认</option>
								<option value="2" <c:if test="${stStatusSearch eq '2'}">selected</c:if>>已确认</option>
								<option value="3" <c:if test="${stStatusSearch eq '3'}">selected</c:if>>锁定</option>
								<option value="4" <c:if test="${stStatusSearch eq '4'}">selected</c:if>>失效</option>
							</select>
					  </div>
					   <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="jsStatus" >
							    <option value="">- 结算状态 -</option> 
								<option value="1" <c:if test="${jsStatusSearch eq '1'}">selected</c:if>>已支付</option>
								<option value="0" <c:if test="${jsStatusSearch eq '0'}">selected</c:if>>未支付</option>
							</select>
					  </div>
					   <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入客户ID" name="user.id" value="<c:if test="${not empty userIdSearch}">${userIdSearch}</c:if>">
					  </div>
					   <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入代理人ID" name="daili.id" value="<c:if test="${not empty dailiIdSearch}">${dailiIdSearch}</c:if>">
					  </div> 
					   <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入联系电话" name="contactPhone" value="<c:if test="${not empty contactPhoneSearch}">${contactPhoneSearch}</c:if>">
					  </div>
					  <%-- 
					  <div class=" pull-right search" style="margin-left:20px;">
							<select class="form-control" name="isIdverifile">
							    <option value="">- 是否认证 -</option> 
								<option value="1" <c:if test="${isIdverifileSearch eq '1'}">selected</c:if>>认证</option>
								<option value="0" <c:if test="${isIdverifileSearch eq '0'}">selected</c:if>>未认证</option>
							</select>
					  </div> 
					  <div class=" pull-right search" style="margin-left:20px;">
							<select class="form-control" name="star" >
							    <option value="-1" <c:if test="${starSearch eq '-1'}">selected</c:if>>- 星星数 -</option> 
								<option value="10" <c:if test="${starSearch eq '10'}">selected</c:if>>满星</option>
								<option value="5" <c:if test="${starSearch eq '5'}">selected</c:if>>5星</option>
								<option value="0" <c:if test="${starSearch eq '0'}">selected</c:if>>0</option>
							</select>
					  </div>
					   <div class=" pull-right search" >
							<select class="form-control" name="orderType" >
							    <option value="">- 排序 -</option> 
								<option value="1" <c:if test="${orderTypeSearch eq '1'}">selected</c:if>>登陆次数</option>
								<option value="2" <c:if test="${orderTypeSearch eq '2'}">selected</c:if>>已接订单</option>
								<option value="3" <c:if test="${orderTypeSearch eq '3'}">selected</c:if>>已取消订单</option>
								<option value="4" <c:if test="${orderTypeSearch eq '4'}">selected</c:if>>星星数</option>
							</select>
					  </div> --%>
					  
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
											    <div class="th-inner sortable">支付编号</div>
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
											</th>
											<th  style>
											    <div class="th-inner sortable">联系电话</div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th  style>
											    <div class="th-inner sortable"> 昵称</div>
												<div class="fht-cell"></div>
											</th>  -->
											<!-- <th  style>
											    <div class="th-inner sortable"> 目标医院</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">转运目的地</div>
												<div class="fht-cell"></div>
											</th>  -->
											<th  style>
											    <div class="th-inner sortable">订单时间 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">订单状态 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">支付状态 </div>
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
											<%--  <td style>${bean.hospital}</td>
											 <td style>${bean.targetadd}</td> --%>
											 <td style><fmt:formatDate value="${bean.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											  <td style>
											    <c:if test="${bean.orderStatus eq '1'}">待确认</c:if>
											    <c:if test="${bean.orderStatus eq '2'}">已确认</c:if>
											    <c:if test="${bean.orderStatus eq '3'}">锁定</c:if>
											    <c:if test="${bean.orderStatus eq '0'}">失效</c:if>
											 </td>
											 <td style>
											    <c:if test="${bean.jsStatus eq '1'}">已支付</c:if>
											    <c:if test="${bean.jsStatus eq '0'}">未支付</c:if>
											    
											 </td>
											 
											 
											
											 <td style> 
											     <a href="${ctx}/transorder/eidtTransorderPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/transorder/getTransorderDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											  </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/transorder/getTransorderList">
						    <input type="hidden" name="hospital" value="${hospitalSearch}">
							<input type="hidden" name="orderCode" value="${orderCodeSearch}">
							<input type="hidden" name="orderTimeFrontSearch" value="${orderTimeFrontSearch}">
							<input type="hidden" name="orderTimeBehindSearch" value="${orderTimeBehindSearch}">
							<input type="hidden" name="stStatus" value="${stStatusSearch}">
							<input type="hidden" name="jsStatus" value="${jsStatusSearch}">
							<input type="hidden" name="daili.id" value="${dailiIdSearch}">
							<input type="hidden" name="user.id" value="${userIdSearch}">
							<input type="hidden" name="contactPhone" value="${contactPhoneSearch}">
							
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
		
		/* $("#myModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
		}); */
	</script>	
</body>
<script type="text/javascript">
var activeLi = $('#transorderList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>

