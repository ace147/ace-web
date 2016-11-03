<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">登录日志</li>
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
					<div class="panel-heading">登录日志
					 </div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<form action="${ctx}/system/loginRecord" method="post">	
						<input type="hidden" value="1" name="tag">  <%--标识是否查询 --%>														  
					  <div class=" pull-left search" style="margin-left:20px;">
							<select class="form-control" name="searchType">
								<option value="1" <c:if test="${searchType == 1}">selected</c:if>>后台用户</option>
								<option value="2" <c:if test="${searchType == 2}">selected</c:if>>医生用户</option>
								<option value="3" <c:if test="${searchType == 3}">selected</c:if>>病人用户</option>
							</select>
					  </div>
					  <div class="pull-left search" style="margin-left:20px;">
					    <input class="form-control" type="text" placeholder="账号" name="name" value="<c:if test="${not empty name}">${name}</c:if>">
					  </div>
<!-- 					 <div class=" pull-left search" style="margin-left:20px;"> -->
<!-- 							<select class="form-control" name="cardType"> -->
<!-- 							    <option value="">平台</option> -->
<!-- 								<option value="2">PC</option> -->
<!-- 								<option value="1">APP</option> -->
<!-- 								<option value="3">其他</option> -->
<!-- 							</select> -->
<!-- 					  </div> -->
					  <div class=" pull-left search" style="margin-left:20px;">
							<input class="form-control" id="timer1" value="<c:if test="${not empty startTime}">${startTime}</c:if>" name="startTime" placeholder="开始时间">
					  </div>
					  <div class=" pull-left search" style="margin-left:20px;">
							<input class="form-control" id="timer2" value="<c:if test="${not empty endTime}">${endTime}</c:if>" name="endTime" placeholder="结束时间">
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
											    <div class="th-inner sortable">账号</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">登录时间</div>
												<div class="fht-cell"></div>
											</th> 
											<th  style>
											    <div class="th-inner sortable">登录平台</div>
												<div class="fht-cell"></div>
											</th> 
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty pager.resultList}">
										 <tr class="no-records-found">
										    <td colspan="4" >请选择条件</td>
										 </tr>
										</c:if>
										<c:forEach items="${pager.resultList}" var="bean">
											<tr>
												<c:if test="${searchType == 1}">
												 	<td style>${bean.mcUser.username}</td>
												</c:if>
												 <td ><fmt:formatDate value="${bean.loginTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												 <td>
												 	<c:if test="${bean.type == 1}">APP</c:if>
												 	<c:if test="${bean.type == 2}">PC</c:if>
												 	<c:if test="${bean.type == 3}">其他</c:if>
												 </td>
										    </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${not empty pager.resultList}">
							<form id="form1" action="${ctx}/system/loginRecord" method="post">
							    <input type="hidden" name="tag" value="1">
								<input type="hidden" name="name" value="${name}">
								<input type="hidden" name="searchType" value="${searchType}">
								<input type="hidden" name="startTime" value="${startTime}">
								<input type="hidden" name=endTime value="${endTime}">
							    <%@ include file="/WEB-INF/jsp/common/pager.jsp"%> 
							</form>
						</c:if>
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
		
		/* $("#myModal").on("hidden.bs.modal", function() {
		    $(this).removeData("bs.modal");
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
	</script>	
</body>
<script type="text/javascript">
var activeLi = $('#doctors')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>

