<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               转运订单
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">订单编号</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.orderCode}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">支付编号</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.code}
					</div>
				</div>
				
				
					<div class="form-group">
						<label class="col-md-3 control-label">客户ID</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<c:if test="${not empty syTransorder.user}">
							${syTransorder.user.id}
						</c:if>
						<c:if test="${not empty syTransorder.daili}">
							${syTransorder.daili.id}
						</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">客户姓名</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
							<c:if test="${not empty syTransorder.user}">
								${syTransorder.user.realName}
							</c:if>
							<c:if test="${not empty syTransorder.daili}">
								${syTransorder.daili.realName}
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">下单来源</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
							<c:if test="${not empty syTransorder.user}">
	                                                                         病人
	                        </c:if>
	                        <c:if test="${not empty syTransorder.daili}">
	                                                                         代理	
	                        </c:if>                                              
						</div>
					</div>
				<div class="form-group">
					<label class="col-md-3 control-label">病人姓名</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.name}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">客户联系电话</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.contactPhone}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">客户地址</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.address }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">情况描述</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.situation }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">目标医院</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.hospital}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">转运目的地</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.targetadd}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">上传时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<fmt:formatDate value="${syTransorder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">订单状态</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:if test="${syTransorder.stStatus eq '1'}">待确认</c:if>
						<c:if test="${syTransorder.stStatus eq '2'}">已确认</c:if>
						<c:if test="${syTransorder.stStatus eq '3'}">锁定</c:if>
						<c:if test="${syTransorder.stStatus eq '0'}">失效</c:if>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">支付状态</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:if test="${syTransorder.jsStatus eq '1'}">已支付</c:if>
						<c:if test="${syTransorder.jsStatus eq '0'}">未支付</c:if>
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-md-3 control-label">审核人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syTransorder.veritor.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<fmt:formatDate value="${syTransorder.veritime}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
var activeLi = $('#transorderList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>