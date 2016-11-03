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
					<div class="panel-heading">添加病人
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" action="${ctx}/jybUser/addJybUser" method="post">
							    <div class="form-group">
									<label>手机</label>
									<input class="form-control"  name="mobile">
								</div>
								<!-- <div class="form-group">
									<label>账号</label>
									<input class="form-control" name="account">
								</div> -->
								
								<div class="form-group">
									<label>密码</label>
									<div>
									<input class="form-control"  name="password">
									</div>
								</div>
								<div class="form-group">
										<label>昵称</label>
										<input class="form-control"  name="nickname">
								</div>
								<div class="form-group">
									<label>真实姓名</label>
									<input class="form-control"  name="realName">
								</div>
								
							<!-- 	<div class="form-group">
									<label>性别</label>
									<div class="radio">
										<label>
											<input type="radio" name="sex" id="optionsRadios1" value="M" checked>男
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<input type="radio" name="sex" id="optionsRadios2" value="F">女
										</label>
									</div>
								</div> -->
								<div class="form-group">
										<label>性别</label>
										<select class="form-control" name="sex">
											<option value="M">男</option>
											<option value="F">女</option>
										</select>
									</div>
								
								
								<div class="form-group">
									<label>生日</label>
									<input class="form-control" id="timer" name="birthday">
								</div>
								
								<div class="form-group">
									<label>证件类型</label>
									<select class="form-control" name="cardType">
										<option value="1">身份证</option>
										<option value="2">护照</option>
										<option value="3">港澳通行证</option>
										<option value="4">军官证</option>
									</select>
								</div>
								<div class="form-group">
									<label>证件号码</label>
									<input class="form-control" name="cardNum">
								</div>
							<!--	
							<div class="form-group">
									<label>Password</label>
									<input type="password" class="form-control">
								</div>
								
								<div class="form-group checkbox">
								  <label>
								    <input type="checkbox">Remember me</label>
								</div>  
																
								<div class="form-group">
									<label>File input</label>
									<input type="file">
									 <p class="help-block">Example block-level help text here.</p>
								</div>
								-->
								<div class="form-group">
									<label>地址</label>
									<textarea class="form-control" name="address" rows="3"></textarea>
								</div>
								<div class="form-group">
									<label>注册来源</label>
									<select class="form-control" name="regisFrom">
										<option value="1">平台</option>
										<option value="2">微信</option>
										<option value="3">QQ</option>
										<option value="4">新浪</option>
									</select>
								</div>
								<div class="form-group">
									<label>状态</label>
									<select class="form-control" name="status">
										<option value="1">启用</option>
										<option value="0">禁用</option>
									</select>
								</div>
								<div class="form-group">
									<label>是否拉黑</label>
									<select class="form-control" name="isBlock">
										<option value="F">否</option>
										<option value="Y">是</option>
									</select>
								</div>
								
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
								<!--
								<label>Validation</label>
								<div class="form-group has-success">
									<input class="form-control" placeholder="Success">
								</div>
								<div class="form-group has-warning">
									<input class="form-control" placeholder="Warning">
								</div>
								<div class="form-group has-error">
									<input class="form-control" placeholder="Error">
								</div>
								-->
							</div>
							<div class="col-md-6">
						     <div class="form-group">
									<label>头像</label>
									<input type="file" name="userHead">
									 <p class="help-block">Example block-level help text here.</p>
								</div>
								
								
								
								
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	
	<script>
	;!function(){

		//laydate.skin('molv');

		laydate({
		   elem: '#timer',
		   format: 'YYYY-MM-DD ', //日期格式
		   istime: false, //是否开启时间选择
		   isclear: true, //是否显示清空
		   istoday: true, //是否显示今天
		})

		}();
	
	
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
var activeLi = $('#addpatients')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>