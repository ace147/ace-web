<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">审核医生</li>
			</ol>
		</div><!--/.row-->
		
		<!--<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Forms</h1>
			</div>
		</div>/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">审核医生
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							    <div class="form-group">
										<label>医生id</label>
										<input class="form-control"   value="${jydIdverifile.jydUser.id}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>医生姓名</label>
										<input class="form-control"   value="${jydIdverifile.jydUser.realName}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>证件号码</label>
										<input class="form-control"   value="${jydIdverifile.cardNum}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>从医年限</label>
										<input class="form-control"   value="${jydIdverifile.workyear}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>身份证件正面照</label>
										<a href="${ctx}/${jydIdverifile.idCardFile}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
										<label>身份证件背面照</label>
										<a href="${ctx}/${jydIdverifile.idCardFile}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
										<label>身份证件手持照</label>
										<a href="${ctx}/${jydIdverifile.idCardFile}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
									<label>执业资格文件1</label>
									<a href="${ctx}/${jydIdverifile.qualifiFile}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
									<label>执业资格文件2</label>
									<a href="${ctx}/${jydIdverifile.qualifiFile2}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
									<label>执业资格文件3</label>
									<a href="${ctx}/${jydIdverifile.qualifiFile3}" target="_brank">
											<img style="width:100%; max-width: 500px;" src="
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
								<div class="form-group">
									<label>上传时间</label>
									<input class="form-control"  name="editTime" disabled="disabled" value="<fmt:formatDate value="${jydIdverifile.editTime}" pattern="yyyy-MM-dd"/>">
								</div>
								<form role="form" action="${ctx}/jydIdvertfile/modifyJydIdvertfile" method="post">
							    <input class="form-control"  type="hidden" name="id" value="${jydIdverifile.id}">
							    <input class="form-control"  type="hidden" name="jydUser.id" value="${jydIdverifile.jydUser.id}">
								<div class="form-group">
									<label>身份证件审核</label>
									<select class="form-control" name="idCardCheck" >
										<option value="Y" <c:if test="${jydIdverifile.idCardCheck eq 'Y'}">selected</c:if>>通过</option>
										<option value="F" <c:if test="${jydIdverifile.idCardCheck eq 'F'}">selected</c:if>>不通过</option>
									</select>
								</div>
								<div class="form-group">
									<label>身份证件审核情况</label>
									<textarea class="form-control" name="idVardResult" rows="3" value="${jydIdverifile.idVardResult}">${jydIdverifile.idVardResult}</textarea>
								</div>
								<div class="form-group">
									<label>执业资格审核</label>
									<select class="form-control" name="qualifiCheck" >
										<option value="Y" <c:if test="${jydIdverifile.qualifiCheck eq 'Y'}">selected</c:if>>通过</option>
										<option value="F" <c:if test="${jydIdverifile.qualifiCheck eq 'F'}">selected</c:if>>不通过</option>
									</select>
								</div>
								<div class="form-group">
									<label>执业资格审核情况</label>
									<textarea class="form-control" name="qualifiResult" rows="3" value="${jydIdverifile.qualifiResult}">${jydIdverifile.qualifiResult}</textarea>
								</div>
								
								
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
							</div>
								
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
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
	var activeLi = $('#doctor_idvertfile')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>	
</body>

</html>

