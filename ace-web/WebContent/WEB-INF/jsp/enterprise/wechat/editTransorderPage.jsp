<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">微信审核转运订单</li>
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
					<div class="panel-heading">审核转运订单
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
								<div class="form-group">
										<label>订单编号</label>
										<input class="form-control"   value="${wechatTransorder.orderCode}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>支付编号</label>
										<input class="form-control"   value="${wechatTransorder.code}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>用户人ID</label>
										<input class="form-control"   value="${wechatTransorder.userId.id}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>用户人</label>
										<input class="form-control"   value="${wechatTransorder.userId.wechatName}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>客户姓名</label>
										<input class="form-control"   value="${wechatTransorder.name}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>客户联系电话</label>
										<input class="form-control"   value="${wechatTransorder.contactPhone}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>客户地址</label>
										<textarea class="form-control" name="address" rows="3" disabled="disabled">${wechatTransorder.address}</textarea>
								</div>
								<div class="form-group">
										<label>情况描述</label>
										<textarea class="form-control" name="address" rows="3" disabled="disabled">${wechatTransorder.situation}</textarea>
								</div>
								<div class="form-group">
										<label>目标医院</label>
										<input class="form-control"   value="${wechatTransorder.hospital}" disabled="disabled">
								</div>
								
								<div class="form-group">
									<label>下单时间</label>
									<input class="form-control"  disabled="disabled" value="<fmt:formatDate value="${wechatTransorder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
								</div>
								
								<div class="form-group">
										<label>审核人</label>
										<input class="form-control"   value="${wechatTransorder.veritor.realName}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>审核时间</label>
										<input class="form-control"   value="<fmt:formatDate value="${wechatTransorder.veritime}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="disabled">
								</div>
								<div class="form-group">
									<label>支付状态</label>
									<select class="form-control"  disabled="disabled">
										<option value="1" <c:if test="${wechatTransorder.jsStatus eq '1'}">selected</c:if>>已支付</option>
										<option value="0" <c:if test="${wechatTransorder.jsStatus eq '0'}">selected</c:if>>未支付</option>
									</select>
								</div>
								<form role="form" action="${ctx}/wechatTransorder/updateTransorder" method="post">
							    <input class="form-control"  type="hidden" name="id" value="${wechatTransorder.id}">
								<div class="form-group">
									<label>订单状态</label>
									<select class="form-control" name="stStatus" >
										<option value="1" <c:if test="${wechatTransorder.stStatus eq '1'}">selected</c:if>>待确认</option>
										<option value="2" <c:if test="${wechatTransorder.stStatus eq '2'}">selected</c:if>>已确认</option>
										<option value="3" <c:if test="${wechatTransorder.stStatus eq '3'}">selected</c:if>>锁定</option>
										<option value="0" <c:if test="${wechatTransorder.stStatus eq '0'}">selected</c:if>>失效</option>
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
var activeLi = $('#wctransorderList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</body>

</html>

