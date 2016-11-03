<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li>订单</li>
				<li class="active">诊疗信息</li>
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
			
			<div class="panel-body">
			<div class="form-group">
				<label class="col-md-6 control-label">面诊情况</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.faceTreat}">${syTreatInfo.faceTreat}</c:if>
                     <c:if test="${empty syTreatInfo.faceTreat}">null</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label">诊疗时间</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.treatTime}">${syTreatInfo.treatTime}</c:if>
                     <c:if test="${empty syTreatInfo.treatTime}">null</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label">接单医生</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.jydUser.realName}">${syTreatInfo.jydUser.realName}</c:if>
                     <c:if test="${empty syTreatInfo.jydUser.realName}">null</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label">体温</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.temp}">${syTreatInfo.temp}</c:if>
                     <c:if test="${empty syTreatInfo.temp}">null</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label">高-血压度</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.hNibp}">${syTreatInfo.hNibp}</c:if>
                     <c:if test="${empty syTreatInfo.hNibp}">null</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-6 control-label">低-血压度</label>
				<div class="col-md-6 controls" style="margin-bottom:8px;">
                     <c:if test="${not empty syTreatInfo.lNibp}">${syTreatInfo.lNibp}</c:if>
                     <c:if test="${empty syTreatInfo.lNibp}">null</c:if>
				</div>
			</div>
		</div>
				<a href="${ctx}/doctororder/treatDetail?id=${syTreatInfo.id}"><button type="button" class="btn btn-primary">诊疗明细</button></a>
				<a href="${ctx}/doctororder/treatList?id=${syTreatInfo.syOrderDetail.id}"><button type="button" class="btn btn-primary">处方清单</button></a>
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
	<script type="text/javascript">
	var activeLi = $('#orderList')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
	
</body>

</html>