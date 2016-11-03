<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               评论
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">订单编号</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syCommentInfo.syOrderDetail.code }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">评论用户</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syCommentInfo.commentor.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">星星数</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syCommentInfo.start }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">评论时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syCommentInfo.commentTime }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">内容</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syCommentInfo.content }
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

	