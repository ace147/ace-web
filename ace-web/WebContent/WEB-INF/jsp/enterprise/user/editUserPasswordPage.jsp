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
					<div class="panel-heading">修改密码
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form">
							
								<div class="form-group">
									<label>账号</label>
									<input class="form-control" name="username" value="${user.username }" disabled="true" id="username">
									<input class="form-control" value="${user.id }" type="hidden" id="userId">
								</div>
								
								<div class="form-group">
									<label>旧密码</label>
									<div>
									<input class="form-control"  placeholder="请输入旧密码" name="oldPassword" id="oldPassword">
									</div>
								</div>
								
								<div class="form-group">
									<label>新密码</label>
									<div>
									<input class="form-control"  placeholder="请输入新密码" name="newPassword" id="newPassword">
									</div>
								</div>
								
								<div class="form-group">
									<label>确认密码</label>
									<div>
									<input class="form-control" placeholder="请再次输入密码" name="repeatPassword" id="repeatPassword">
									</div>
								</div>
								
								<button type="button" class="btn btn-primary" onclick="passwordEdit()">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
								
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/chart.min.js"></script>
	<script src="${ctx}/js/chart-data.js"></script>
	<script src="${ctx}/js/easypiechart.js"></script>
	<script src="${ctx}/js/easypiechart-data.js"></script>
	<script src="${ctx}/js/bootstrap-datepicker.js"></script>
	<script src="${ctx}/js/layer1.8/layer.js"></script>
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
		
		/* 修改当前用户密码 */
		function passwordEdit(){
			var newPassword = $('#newPassword').val();
			var oldPassword = $('#oldPassword').val();
			var repeatPassword = $('#repeatPassword').val();
			
			if(newPassword == '' || oldPassword == '' || repeatPassword == ''){
				layer.msg('请完整填写表格！');
				return;
			}
			if(newPassword == oldPassword){
				layer.msg('新密码与旧密码一致，请重新输入！');
				return;
			}
			
			if(newPassword != repeatPassword){
				layer.msg('两次输入的新密码不一致！');
				return;
			}
			var index = layer.load(1, {shade: [0.8, '#393D49'], time: 3000});
			$.ajax({
				url:"${ctx}/user/updateUserSafe", //需要添加参数，看接口需要
				method:"POST",
				data:{
					"id" : $('#userId').val(),
					"username" : $('#username').val(),
					"authPassword": $("#newPassword").val(),
					"oldPassword": $("#oldPassword").val()
				},
				success:function(data){
					layer.close(index);
					if(data.status == 200){					
						location.href = '${ctx}/logout';
					}else if(data.status == 500){
						layer.msg(data.message);
					}
				}
			});
		}
	</script>	
	<script type="text/javascript">
	var activeLi = $('#users')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
	
</body>

</html>

