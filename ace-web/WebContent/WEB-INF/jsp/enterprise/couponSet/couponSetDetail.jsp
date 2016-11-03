<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               优惠券
            </h4>
         </div>
		<form class="form-horizontal" method="post"
			action="${pageContext.request.contextPath}/couponSet/updateCouponSet.do"
			>
		<input type="hidden" name="id" value="${syCouponSet.id}"/>
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">标题</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syCouponSet.couponTitle }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">优惠金额</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syCouponSet.saveMoney }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">目标用户</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syCouponSet.target eq '1'}">未领取</c:when>
							<c:when test="${syCouponSet.target eq '2'}">本月未呼叫医生</c:when>
							<c:when test="${syCouponSet.target eq '3'}">本月已呼叫医生</c:when>
							<c:when test="${syCouponSet.target eq '4'}">本月未呼叫医生</c:when>
							<c:when test="${syCouponSet.target eq '5'}">三月内已呼叫医生</c:when>
							<c:when test="${syCouponSet.target eq 'ALL'}">所有用户</c:when>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">是否发送</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syCouponSet.isSended eq 'Y'}">已发送</c:when>
							<c:when test="${syCouponSet.isSended eq 'F'}">未发送</c:when>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">是否短信通知</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syCouponSet.isSms eq 'Y'}">是</c:when>
							<c:when test="${syCouponSet.isSms eq 'F'}">否</c:when>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">抵扣方式</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syCouponSet.deducType eq '1'}">服务费</c:when>
							<c:when test="${syCouponSet.deducType eq '2'}">药费</c:when>
							<c:when test="${syCouponSet.deducType eq 'ALL'}">所有</c:when>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">发放方式</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syCouponSet.grantType eq '1'}">服务费</c:when>
							<c:when test="${syCouponSet.grantType eq '2'}">药费</c:when>
							<c:when test="${syCouponSet.grantType eq 'ALL'}">所有</c:when>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">允许分享次数</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syCouponSet.sharedNum }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">备注</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syCouponSet.remark }
					</div>
				</div>
			</div>
		</div>
	
		<!-- <div class="modal-footer">
			<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
			<button type="submit" class="btn btn-primary btn-small">提交</button>
		</div> -->
		</form>		

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
	

	