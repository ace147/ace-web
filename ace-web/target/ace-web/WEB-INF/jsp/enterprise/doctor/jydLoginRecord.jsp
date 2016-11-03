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
					<div class="panel-heading">${name}的登陆记录
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					<%-- <form action="${ctx}/jydUser/getJydUserList">
					  <div class="columns pull-right">
					      <button type="submit" class="btn btn-primary">查询</button>
					  </div>
					  <div class="pull-right search">
					    <input class="form-control" type="text" placeholder="Search" name="mobile">
					  </div>
					  </form> --%>
					</div>
					   
					   <div class="fixed-table-container">
					        <div class="fixed-table-header"></div>
					   		<div class="fixed-table-body">
								<table class="table table-hover">
									<thead>
										<tr>
										    <th  style>
											    <div class="th-inner sortable">id</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable">登陆时间</div>
												<div class="fht-cell"></div>
											</th>
											<!-- <th  style>
											    <div class="th-inner sortable">登陆方式</div>
												<div class="fht-cell"></div>
											</th> -->
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list}">
										 <tr class="no-records-found">
										    <td colspan="4" >暂无登陆记录</td>
										 </tr>
										</c:if>
										<c:forEach items="${list}" var="bean">
										<tr>
											 <td style>${bean.id}</td>
											 <td style><fmt:formatDate value="${bean.loginTime}" pattern="yyyy-MM-dd HH:mm:SS"/></td>
											<%--  <td style>
											     <c:if test="${bean.type eq '1'}">APP</c:if>
											     <c:if test="${bean.type eq '2'}">PC</c:if>
											     <c:if test="${bean.type eq '3'}">其他</c:if>
											 </td>  --%>
											
										 </tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
		
	
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
var activeLi = $('#doctors')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>