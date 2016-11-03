<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               服务费用
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">标题</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.title}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">基础费用</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.basicFee}
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">第一区间,上午8:00-下午14:00</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.firstTag }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">第二区间,下午14:01－晚上21:00</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.secondTag }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">第三区间,晚上21:01-上午7:59</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.thirdTag }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">是否动态加价</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:if test="${syFeeSet.isDynamic eq 'Y'}">是</c:if>
						<c:if test="${syFeeSet.isDynamic eq 'F'}">否</c:if>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">编辑人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.editTor.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">编辑时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						
						<fmt:formatDate value="${syFeeSet.editTime}" pattern="yyyy-MM-dd"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核人</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${syFeeSet.confirmMan.realName }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">审核时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<fmt:formatDate value="${syFeeSet.confirmTime }" pattern="yyyy-MM-dd"/>
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