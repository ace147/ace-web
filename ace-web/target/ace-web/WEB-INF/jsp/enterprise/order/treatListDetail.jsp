<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               处方
            </h4>
         </div>
					
		<div class="modal-body">
			<div class="form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">订单编号</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${syTreatList.treatInfo.syOrderDetail.code}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">医生姓名</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${syTreatList.treatInfo.jydUser.realName}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">医生手机</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syTreatList.treatInfo.jydUser.mobile}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">客户姓名</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${syTreatList.treatInfo.syOrderDetail.name}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">客户手机</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syDoctororder.syOrderDetail.contactPhone}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">病人地址</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syDoctororder.syOrderDetail.address}
				</div>
			</div> --%>
			
			<div class="form-group">
				<label class="col-md-3 control-label">下单时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syDoctororder.syOrderDetail.orderTime}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">结算状态</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:choose>
                     	<c:when test="${syDoctororder.syOrderDetail.jsStatus eq '0' }">未结算</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.jsStatus eq '1' }">已结算</c:when>
                     </c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">订单状态</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:choose>
                     	<c:when test="${syDoctororder.syOrderDetail.status eq '0' }">失效</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.status eq '1' }">待确认</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.status eq '2' }">已确认</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.status eq '3' }">锁定</c:when>
                     </c:choose>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="col-md-3 control-label">出诊状态</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:choose>
                     	<c:when test="${syDoctororder.syOrderDetail.czStatus eq '1' }">已接单</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.czStatus eq '2' }">在路上</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.czStatus eq '3' }">已到达</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.czStatus eq '4' }">已出诊</c:when>
                     </c:choose>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">情况描述</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syDoctororder.syOrderDetail.description}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">是否使用优惠卷</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:choose>
                     	<c:when test="${syDoctororder.syOrderDetail.isCoupon eq 'Y' }">使用</c:when>
                     	<c:when test="${syDoctororder.syOrderDetail.isCoupon eq 'F' }">不使用</c:when>
                     </c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">优惠卷号</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syDoctororder.syOrderDetail.myCoupon }
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">服务折扣</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syOrderDetail.serviceDis}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">药费折扣</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syOrderDetail.medicineDis}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">服务费</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syOrderDetail.serviceFee}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">医药费</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syOrderDetail.medicineFee}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">总体费用</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${syOrderDetail.totalFee}
				</div>
			</div> --%>
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
	