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
		<form class="form-horizontal" method="post"
			action="${pageContext.request.contextPath}/jydWithdrawApply/updateJydWithdrawApply.do">
		<input type="hidden" name="id" value="${jydWithdrawApply.id}"/>
		<div class="modal-body">
		
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-md-3 control-label">状态</label>
						<div class="col-md-9 controls" style="margin-top:8px;">
						<select name="status">
							<option value="1" <c:if test="${jydWithdrawApply.status eq '1' }">selected</c:if>>成功提现</option>
							<option value="2" <c:if test="${jydWithdrawApply.status eq '2' }">selected</c:if>>失败提现</option>
						</select>
					</div>
				</div>
				<%-- <div class="form-group">
					<label class="col-md-3 control-label">备注</label>
					<div class="col-md-9 controls" style="margin-top:8px;">
						<textarea name="remark">${syBankList.remark }</textarea>
					</div>
				</div> --%>
			</div>
		</div>
	
		<div class="modal-footer">
			<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
			<c:if test="${empty jydWithdrawApply.statusTime}">
				<button type="submit" class="btn btn-primary btn-small">提交</button>
			</c:if>
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

	