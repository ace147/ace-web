<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               病人个人信息
            </h4>
         </div>
					
		<div class="modal-body">
			<div class="form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">病人id</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${jybUser.id}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">病人头像</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					<a href="${ctx}/${jybUser.userHead}" target="_brank">
							<img style="width:100%; max-width: 150px;" src="
								<c:choose>
									<c:when test="${empty jybUser.userHead}">
										${ctx}/upload/MissPhoto.JPG
									</c:when>
								<c:otherwise>
									 ${ctx}/${jybUser.userHead} 
								<%--  ${ctx}/upload/MissPhoto.JPG  --%>
								</c:otherwise>
							</c:choose>
						   " />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">真实姓名</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.realName}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">昵称</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.nickname}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">手机号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.mobile}
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">性别</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${jybUser.sex eq 'M'}">男</c:if>
					 <c:if test="${jybUser.sex eq 'F'}">女</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">生日</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <fmt:formatDate value="${jybUser.birthday}" pattern="yyyy-MM-dd"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">证件号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    ${jybUser.cardNum}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">地区</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.area}
				</div>
			</div> --%>
			<div class="form-group">
				<label class="col-md-3 control-label">联系地址</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    ${jybUser.address}
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">证件类型</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <c:if test="${jybUser.cardType eq '1'}">身份证</c:if>
					  <c:if test="${jybUser.cardType eq '2'}">护照</c:if>
					  <c:if test="${jybUser.cardType eq '3'}">港澳通行证</c:if>
					  <c:if test="${jybUser.cardType eq '4'}">军官证</c:if>
				</div>
			</div> --%>
			
			
			<div class="form-group">
				<label class="col-md-3 control-label">注册时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    ${jybUser.regisTime}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">最后访问时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <fmt:formatDate value="${jybUser.lastVisitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">登录次数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.loginNums}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">已下单数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jybUser.orderNum}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">注册来源</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <c:if test="${jybUser.regisFrom eq '1'}">平台</c:if>
					  <c:if test="${jybUser.regisFrom eq '2'}">微信</c:if>
					  <c:if test="${jybUser.regisFrom eq '3'}">QQ</c:if>
					  <c:if test="${jybUser.regisFrom eq '4'}">新浪</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">帐号状态</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${not empty jybUser.status}">
				          <c:if test="${jybUser.status eq '1'}">启用</c:if>
					      <c:if test="${jybUser.status eq '2'}">禁用</c:if>
				     </c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">是否拉黑</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					   <c:if test="${jybUser.isBlock eq 'Y'}">是</c:if>
					   <c:if test="${jybUser.isBlock eq 'F'}">否</c:if>
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
	