<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               医生个人信息
            </h4>
         </div>
					
		<div class="modal-body">
			<div class="form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">医生id</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${jydUser.id}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">医生头像</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					<a href="${ctx}/${jydUser.userHead}" target="_brank">
							<img style="width:100%; max-width: 150px;" src="
								<c:choose>
									<c:when test="${empty jydUser.userHead}">
										${ctx}/upload/MissPhoto.JPG
									</c:when>
								<c:otherwise>
									 ${ctx}/${jydUser.userHead} 
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
                     ${jydUser.realName}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">昵称</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.nickname}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">手机号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.mobile}
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">性别</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${jydUser.sex eq 'M'}">男</c:if>
					 <c:if test="${jydUser.sex eq 'F'}">女</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">生日</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <fmt:formatDate value="${jydUser.birthday}" pattern="yyyy-MM-dd"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">地区</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.area}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">联系地址</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    ${jydUser.address}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">证件类型</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <c:if test="${jydUser.cardType eq '1'}">身份证</c:if>
					  <c:if test="${jydUser.cardType eq '2'}">护照</c:if>
					  <c:if test="${jydUser.cardType eq '3'}">港澳通行证</c:if>
					  <c:if test="${jydUser.cardType eq '4'}">军官证</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">证件号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    ${jydUser.cardNum}
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">注册时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <fmt:formatDate value="${jydUser.regisTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">最后访问时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <fmt:formatDate value="${jydUser.lastVisitTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">登录次数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.loginNums}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">已接单数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.orderCnt}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">已取消订单数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.orderCancel}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">注册来源</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <c:if test="${jydUser.regisFrom eq '1'}">平台</c:if>
					  <c:if test="${jydUser.regisFrom eq '2'}">微信</c:if>
					  <c:if test="${jydUser.regisFrom eq '3'}">QQ</c:if>
					  <c:if test="${jydUser.regisFrom eq '4'}">新浪</c:if>
				</div>
			</div>
			<%-- <div class="form-group">
				<label class="col-md-3 control-label">帐号状态</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${not empty jydUser.status}">
				          <c:if test="${jydUser.status eq '1'}">启用</c:if>
					      <c:if test="${jydUser.status eq '2'}">禁用</c:if>
				     </c:if>
				</div>
			</div> --%>
			<div class="form-group">
				<label class="col-md-3 control-label">是否拉黑</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					   <c:if test="${jydUser.isBlock eq 'Y'}">是</c:if>
					   <c:if test="${jydUser.isBlock eq 'F'}">否</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">是否代理</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${not empty jydUser.isDaili}">
				           <c:if test="${jydUser.isDaili eq 'Y'}">是</c:if>
						   <c:if test="${jydUser.isDaili eq 'F'}">否</c:if>
				     </c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">是否审核</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <c:if test="${not empty jydUser.isIdveri}">
				           <c:if test="${jydUser.isIdveri eq 'Y'}">是</c:if>
						   <c:if test="${jydUser.isIdveri eq 'F'}">否</c:if>
				     </c:if>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">好评率</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.goodRate}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">星星数</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.star}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">医生擅长领域</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydUser.skilledIn}
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
	