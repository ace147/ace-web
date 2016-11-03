<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               微信转运订单处理
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">目标医院</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.hospital}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">转运车到达时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<fmt:formatDate value="${wechatTransProcess.arriveTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">转运车到达地址</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.arriveAddress}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">转运车司机</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.driver}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">司机电话</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.driverPhone}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">医院联系人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.hoscontactMan}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">医院联系电话 </label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.hoscontactPhone}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">误差公里数（KM）</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.gapdistance}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">总共公里数（KM）</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.totaldistance}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">转运公里数（KM）</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.distance}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">每公里价格</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.kmPrice}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">其他价格</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.otherPrice}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">总共价格</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.totalPrice}
					</div>
				</div>
				<%-- <div class="form-group">
					<label class="col-md-3 control-label">折扣</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.discount}
					</div>
				</div> --%>
				<div class="form-group">
					<label class="col-md-3 control-label">应付价格</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.payPrice}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">订单状态</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:if test="${wechatTransProcess.jsStatus eq '1'}">已结算</c:if>
						<c:if test="${wechatTransProcess.jsStatus eq '0'}">未结算</c:if>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">编辑人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.edittor.realName}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${wechatTransProcess.veritor.realName}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<fmt:formatDate value="${wechatTransProcess.veriTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
			</div>
		</div>
	

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
var activeLi = $('#wctransProcessList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>