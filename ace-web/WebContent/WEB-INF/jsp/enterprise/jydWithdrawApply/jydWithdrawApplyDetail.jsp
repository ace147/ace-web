<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               提现
            </h4>
         </div>
         
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">提现人</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						${jydWithdrawApply.applyman.nickname }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">提现金额</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${jydWithdrawApply.applyMoney }
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">提现时间</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${jydWithdrawApply.applyTime }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">银行帐号</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						${jydWithdrawApply.bankcard.account }
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label">状态</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<c:choose>
							<c:when test="${jydWithdrawApply.status eq '1' }">成功提现</c:when>
							<c:when test="${jydWithdrawApply.status eq '2' }">失败提现</c:when>
							<c:when test="${jydWithdrawApply.status eq '3' }">提现申请中</c:when>
						</c:choose>
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

	