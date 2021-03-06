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
						<input type="text" name="couponTitle" value="${syCouponSet.couponTitle }" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">优惠金额</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<input type="number" name="saveMoney" value="${syCouponSet.saveMoney }" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">目标用户</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="target">
							<option value="1" <c:if test="${syCouponSet.target eq '1'}">selected</c:if>>未领取</option>
							<option value="2" <c:if test="${syCouponSet.target eq '2'}">selected</c:if>>本月未呼叫医生</option>
							<option value="3" <c:if test="${syCouponSet.target eq '3'}">selected</c:if>>三月内未呼叫医生</option>
							<option value="4" <c:if test="${syCouponSet.target eq '4'}">selected</c:if>>本月已呼叫医生</option>
							<option value="5" <c:if test="${syCouponSet.target eq '5'}">selected</c:if>>三月内已呼叫医生</option>
							<option value="ALL" <c:if test="${syCouponSet.target eq 'ALL'}">selected</c:if>>所有用户</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">是否发送</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="isSended">
							<option value="Y" <c:if test="${syCouponSet.isSended eq 'Y'}">selected</c:if>>已发送</option>
							<option value="F" <c:if test="${syCouponSet.isSended eq 'F'}">selected</c:if>>未发送</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">是否短信通知</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="isSms">
							<option value="Y" <c:if test="${syCouponSet.isSms eq 'Y'}">selected</c:if>>是</option>
							<option value="F" <c:if test="${syCouponSet.isSms eq 'F'}">selected</c:if>>否</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">抵扣方式</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="deducType">
							<option value="1" <c:if test="${syCouponSet.deducType eq '1'}">selected</c:if>>服务费</option>
							<option value="2" <c:if test="${syCouponSet.deducType eq '2'}">selected</c:if>>药费</option>
							<option value="ALL" <c:if test="${syCouponSet.deducType eq 'ALL'}">selected</c:if>>所有</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">发放方式</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="grantType">
							<option value="1" <c:if test="${syCouponSet.grantType eq '1'}">selected</c:if>>服务费</option>
							<option value="2" <c:if test="${syCouponSet.grantType eq '2'}">selected</c:if>>药费</option>
							<option value="ALL" <c:if test="${syCouponSet.grantType eq 'ALL'}">selected</c:if>>所有</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">允许分享次数</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<input type="number" name="sharedNum" value="${syCouponSet.sharedNum }" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">备注</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<textarea name="remark">${syCouponSet.remark }</textarea>
					</div>
				</div>
			</div>
		</div>
	
		<div class="modal-footer">
			<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
			<button type="submit" class="btn btn-primary btn-small">提交</button>
		</div>
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
	

	