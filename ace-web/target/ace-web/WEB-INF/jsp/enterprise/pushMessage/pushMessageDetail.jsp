<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               推送信息
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">标题</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syPushMessage.title }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">内容</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syPushMessage.content }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">目标</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${syPushMessage.target eq 'android' }">android</c:when>
							<c:when test="${syPushMessage.target eq 'ios' }">ios</c:when>
							<c:when test="${syPushMessage.target eq 'ALL' }">全部</c:when>
						</c:choose>
						
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">发送时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syPushMessage.sendTime }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">建立人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syPushMessage.addor.username }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">发送人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syPushMessage.sender.username }
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

	