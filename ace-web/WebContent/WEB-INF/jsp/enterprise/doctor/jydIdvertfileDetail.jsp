<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
		 <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               审核医生
            </h4>
         </div>
					
		<div class="modal-body">
			<div class="form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">医生id</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				${jydIdverifile.jydUser.id}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">真实姓名</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydIdverifile.jydUser.realName}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">证件号码</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydIdverifile.cardNum}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">从医年限</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydIdverifile.workyear}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">身份证件正面照</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
					<a href="${ctx}/${jydIdverifile.idCardFile}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.idCardFile}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.idCardFile} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">身份证件背面照</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     <a href="${ctx}/${jydIdverifile.idCardFile2}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.idCardFile2}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.idCardFile2} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">身份证件手持照</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <a href="${ctx}/${jydIdverifile.idCardFile3}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.idCardFile3}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.idCardFile3} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">执业资格文件1</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                       <a href="${ctx}/${jydIdverifile.qualifiFile}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.qualifiFile}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.qualifiFile} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">执业资格文件2</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <a href="${ctx}/${jydIdverifile.qualifiFile2}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.qualifiFile2}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.qualifiFile2} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">执业资格文件3</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      <a href="${ctx}/${jydIdverifile.qualifiFile3}" target="_brank">
						<img style="width:100%; max-width: 300px;" src="
							<c:choose>
								<c:when test="${empty jydIdverifile.qualifiFile3}">
									${ctx}/upload/MissPhoto.JPG
								</c:when>
							<c:otherwise>
								${ctx}/${jydIdverifile.qualifiFile3} 
							<%-- ${ctx}/upload/MissPhoto.JPG --%>
							</c:otherwise>
						</c:choose>
						" />
					</a>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-md-3 control-label">身份证件审核</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <c:if test="${jydIdverifile.idCardCheck eq 'Y'}">通过</c:if>
					<c:if test="${jydIdverifile.idCardCheck eq 'F'}">不通过</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">身份证件审核情况</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                     ${jydIdverifile.idVardResult}
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">执业资格审核</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <c:if test="${jydIdverifile.qualifiCheck eq 'Y'}">通过</c:if>
					<c:if test="${jydIdverifile.qualifiCheck eq 'F'}">不通过</c:if>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">执业资格审核情况</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                      ${jydIdverifile.qualifiResult}
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label">上传时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <fmt:formatDate value="${jydIdverifile.editTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">审核时间</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
                    <fmt:formatDate value="${jydIdverifile.veriTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">审核人</label>
				<div class="col-md-9 controls" style="margin-top:8px;">
				     ${jydIdverifile.veritor.realName}
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
	