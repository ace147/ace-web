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
					<div class="panel-heading">后台用户
					<a href="${ctx}/user/addUserPage"><button type="button" style="float:right;"class="btn btn-default" >添加</button></a>
					</div>
					
					<div class="panel-body">
					<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
					</div>
					   
					   <div class="fixed-table-container">
					        <div class="fixed-table-header"></div>
					   		<div class="fixed-table-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th  style>
											    <div class="th-inner sortable"> 用户账户</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 真实名称 </div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 角色</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 手机</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 状态</div>
												<div class="fht-cell"></div>
											</th>
											<th  style>
											    <div class="th-inner sortable"> 操作</div>
												<div class="fht-cell"></div>
											</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pager.resultList}" var="bean">
										<tr>
											 <td style>${bean.username}</td>
											 <td style>${bean.realName}</td>
											 <td style>${bean.roleName }</td>
											 <td style>${bean.mobile}</td>
											 <td style>
											   <c:if test="${bean.status=='1'}">启用</c:if>
											   <c:if test="${bean.status=='0'}">禁用</c:if>
											 </td>
											 <td style> 
											     <a href="${ctx}/user/editUserPage?id=${bean.id}" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
											     &nbsp&nbsp&nbsp&nbsp
											     
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
var activeLi = $('#users')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</html>