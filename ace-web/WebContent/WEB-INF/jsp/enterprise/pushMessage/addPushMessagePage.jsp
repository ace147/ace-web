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
					<div class="panel-heading">推送信息
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" action="${ctx}/pushMessage/addPushMessagePage" method="post">
							
								<div class="form-group">
									<label>标题</label>
									<input  class="form-control" type="text" name="title" value="" />
								</div>
								
								<div class="form-group">
									<label>内容</label>
									<input class="form-control" type="text" name="content" value="" />
								</div>
								
								<div class="form-group">
									<label>目标</label>
									<select class="form-control" name="target">
										<option value="ALL">全部</option>
										<option value="android">android</option>
										<option value="ios">ios</option>
									</select>
								</div>
								
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
var activeLi = $('#pushMessage')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>