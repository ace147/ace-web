<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Forms</li>
			</ol>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">添加后台用户
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" action="${ctx}/user/addUser" method="post">
							
								<div class="form-group">
									<label>账号</label>
									<input class="form-control" name="username">
								</div>
								
								<div class="form-group">
									<label>密码</label>
									<div>
									<input class="form-control"  name="password">
									</div>
								</div>
								<div class="form-group">
									<label>真实姓名</label>
									<input class="form-control"  name="realName">
								</div>
								<div class="form-group">
									<label>手机</label>
									<input class="form-control"  name="mobilePhone">
								</div>
								
								<div class="form-group">
 									<label>角色</label>
									<select class="form-control" name="roleId">
 										<c:forEach items="${roles}" var="bean">
 										   <option value="${bean.id}">${bean.name}</option>
 										</c:forEach>
									</select>
								</div>
								<div class="form-group">
 									<label>状态</label>
									<select class="form-control" name="status">
 										<option value="1">启用</option>
										<option value="0">禁用</option>
									</select>
								</div>
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
								
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
	<script type="text/javascript">
	var activeLi = $('#users')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
	
</body>

</html>

