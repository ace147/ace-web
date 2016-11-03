<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Forms</li>
			</ol>
		</div><!--/.row-->
		
		<!--<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Forms</h1>
			</div>
		</div>/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">修改客户资料
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" action="${ctx}/customerService/updateCustomerService" method="post">
								<input type="hidden" name="id" value="${customerService.id }" />
								<div class="form-group">
									<label>姓名</label>
									<input  class="form-control" type="text" name="name" value="${customerService.name }" />
								</div>
								
								<div class="form-group">
									<label>联系电话1</label>
									<input class="form-control" type="text" name="telePhone1" value="${customerService.telePhone1 }" />
								</div>
								
								<div class="form-group">
									<label>联系电话2</label>
									<input class="form-control" type="text" name="telePhone2" value="${customerService.telePhone2 }" />
								</div>
								
								<div class="form-group">
									<label>邮箱</label>
									<input class="form-control" type="text" name="email" value="${customerService.email }" />
								</div>
								
								<div class="form-group">
									<label>QQ</label>
									<input class="form-control" type="text" name="qq" value="${customerService.qq }" />
								</div>
								
								<div class="form-group">
									<label>微信</label>
									<input class="form-control" type="text" name="wechat" value="${customerService.wechat }" />
								</div>
								<div class="form-group">
									<label>状态</label>
									<select class="form-control" name="status">
										<option value="1" <c:if test="${customerService.status eq '1' }">selected</c:if>>在线</option>
										<option value="2" <c:if test="${customerService.status eq '2' }">selected</c:if>>下线</option>
									</select>
								</div>
								
								<div class="form-group">
									<label>类型</label>
									<select class="form-control" name="type">
										<option value="1" <c:if test="${customerService.type eq '1' }">selected</c:if>>上门服务</option>
										<option value="2" <c:if test="${customerService.type eq '2' }">selected</c:if>>转运服务</option>
										<option value="ALL" <c:if test="${customerService.type eq 'ALL' }">selected</c:if>>所有服务</option>
									</select>
								</div>
								
								
<!-- 							<div class="form-group">
									<label>状态</label>
									<select class="form-control" name="status">
										<option value="1">启用</option>
										<option value="0">禁用</option>
									</select>
								</div>
 -->								
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
							</div>
								
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	
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