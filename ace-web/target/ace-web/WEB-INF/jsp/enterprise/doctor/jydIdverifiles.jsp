<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">审核医生</li>
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
					<div class="panel-heading">审核医生</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/jydIdvertfile/getJydIdvertfileList">
					  <div class="columns pull-right">
					      <button type="submit" class="btn btn-primary">查询</button>
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入手机" name="jydUser.mobile" value="<c:if test="${not empty mobileSearch}">${mobileSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入姓名" name="jydUser.realName" value="<c:if test="${not empty realNameSearch}">${realNameSearch}</c:if>">
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入证件号码" name="cardNum" value="<c:if test="${not empty cardNumSearch}">${cardNumSearch}</c:if>">
					  </div>
					 <%--   <div class="pull-right search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="请输入证件号码" name="cardNum" value="<c:if test="${not empty cardNumSearch}">${cardNumSearch}</c:if>">
					  </div> --%>
					     
					  
					  
					  <div class=" pull-left search" style="margin-left:20px;">
							<input class="form-control" id="timer2" value="<c:if test="${not empty editTimeFrontSearch}"><fmt:formatDate value="${editTimeFrontSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="editTimeFront" placeholder="请输入上传时间1">
					  </div>
					  
					  <div class=" pull-left search" style="margin-left:6px; margin-right:6px">
							--
					  </div>
					  
					  <div class=" pull-left search">
							<input class="form-control " id="timer1" value="<c:if test="${not empty editTimeBehindSearch}"><fmt:formatDate value="${editTimeBehindSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="editTimeBehind" placeholder="请输入上传时间2">
					  </div>
					  	
					   
					  <div class=" pull-left search" style="margin-left:20px;">
							<input class="form-control" id="timer3" value="<c:if test="${not empty veriTimeBehindSearch}"><fmt:formatDate value="${veriTimeBehindSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="veriTimeBehind" placeholder="请输入审核时间1">
					  </div>
					  <div class=" pull-left search" style="margin-left:6px; margin-right:6px">
							--
					  </div>
					  <div class=" pull-left search" >
							<input class="form-control" id="timer4" value="<c:if test="${not empty veriTimeFrontSearch}"><fmt:formatDate value="${veriTimeFrontSearch}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>" name="veriTimeFront" placeholder="请输入审核时间2">
					  </div>
					  
					  
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="">
							    <option value="">- 证件类型 -</option>
								<option value="1">身份证</option>
								<option value="2">护照</option>
								<option value="3">港澳通行证</option>
								<option value="4">军官证</option>
							</select>
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
											    <div class="th-inner sortable">医生id</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">医生姓名</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 身份证件审核</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">执业资格审核</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">上传时间</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">审核时间</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">审核人</div>
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
										    <td colspan="4" >暂无审核申请</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
										     <td style>${bean.jydUser.id}</td>
											 <td style>${bean.jydUser.realName}</td>
											 <td style>
											     <c:if test="${bean.idCardCheck eq 'Y'}">通过</c:if>
											     <c:if test="${bean.idCardCheck eq 'F'}">不通过</c:if>
											     <c:if test="${bean.idCardCheck == null}">未审核</c:if>
											 </td>
											 <td style>   
											     <c:if test="${bean.qualifiCheck eq 'Y'}">通过</c:if>
											     <c:if test="${bean.qualifiCheck eq 'F'}">不通过</c:if>
											     <c:if test="${bean.idCardCheck == null}">未审核</c:if>
											 </td>
											 <td style><fmt:formatDate value="${bean.editTime}" pattern="yyyy-MM-dd"/></td>
											 <td style><fmt:formatDate value="${bean.veriTime}" pattern="yyyy-MM-dd"/></td>
											 <td style>${bean.veritor.realName}</td>
											 <td style> 
											     <a href="${ctx}/jydIdvertfile/editJydIdvertfile?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											       &nbsp&nbsp&nbsp&nbsp
											     <a href="${ctx}/jydIdvertfile/jydIdvertfileDetail?id=${bean.id}" title="查看" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span></a>
											 </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<form id="form1" action="${ctx}/jydIdvertfile/getJydIdvertfileList">
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

/* $(function() {
	$(".examDate").datetimepicker({
		lang : 'zh',
		timepicker : false,
		format : 'Y-m-d H:m:s',
		closeOnDateSelect : true
	});
}); */

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
		;!function(){

			//laydate.skin('molv');

			laydate({
			   elem: '#timer3',
			   format: 'YYYY-MM-DD hh:mm:ss', //日期格式
			   istime: true, //是否开启时间选择
			   isclear: true, //是否显示清空
			   istoday: true, //是否显示今天
			})

			}();
			
		;!function(){

				//laydate.skin('molv');

				laydate({
				   elem: '#timer4',
				   format: 'YYYY-MM-DD hh:mm:ss', //日期格式
				   istime: true, //是否开启时间选择
				   isclear: true, //是否显示清空
				   istoday: true, //是否显示今天
				})

		}();


var activeLi = $('#doctor_idvertfile')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>