<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               折扣
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">标题</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.title }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">服务折扣</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.serviceDis }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">药费折扣</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.medicineDis }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">编辑人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.editTor.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">编辑时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.editTime }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.confirmMan.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syDiscountSet.confirmTime }
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
var activeLi = $('#discountSet')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>