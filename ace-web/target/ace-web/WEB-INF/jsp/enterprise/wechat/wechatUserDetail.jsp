<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               微信用户个人信息
            </h4>
         </div>
					
		<div class="modal-body">
			<div class="form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">用户id</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${wechatUser.id}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">用户头像</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					<a href="${ctx}/${jybUser.userHead}" target="_brank">
							<img style="width:100%; max-width: 150px;" src="
								<c:choose>
									<c:when test="${empty wechatUser.userHead}">
										${ctx}/upload/MissPhoto.JPG
									</c:when>
								<c:otherwise>
									 ${wechatUser.userHead} 
								<%--  ${ctx}/upload/MissPhoto.JPG  --%>
								</c:otherwise>
							</c:choose>
						   " />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">微信名称</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${wechatUser.wechatName}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">手机号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${wechatUser.mobile}
				</div>
			</div> --%>
			
			<div class="form-group">
				<label class="col-md-3 control-label">性别</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${wechatUser.sex eq '1'}">男</c:if>
					 <c:if test="${wechatUser.sex eq '2'}">女</c:if>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-md-3 control-label">注册时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <fmt:formatDate value="${wechatUser.regisTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">最后访问时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <fmt:formatDate value="${wechatUser.lastVisitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">登录次数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${wechatUser.loginNums}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">已下单数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${wechatUser.orderNum}
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
	