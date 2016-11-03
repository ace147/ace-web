<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               客户
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">姓名</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.name }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">联系电话1</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.telePhone1 }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">联系电话2</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.telePhone2 }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">邮箱</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.email }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">QQ</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.qq }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">微信</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.wechat }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">状态</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${customerService.status eq '1' }">在线</c:when>
							<c:when test="${customerService.status eq '2' }">下线</c:when>
						</c:choose>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">类型</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${customerService.type eq '1' }">上门服务</c:when>
							<c:when test="${customerService.type eq '2' }">转运服务</c:when>
							<c:when test="${customerService.type eq 'ALL' }">所有服务</c:when>
						</c:choose>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">录入人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.addor.username }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">录入时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${customerService.addTime }
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

	