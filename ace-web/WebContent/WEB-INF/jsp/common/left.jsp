<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>佳医生</title>
</head>
<body>

	<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/css/datepicker3.css" rel="stylesheet">
	<link href="${ctx}/css/bootstrap-table.css" rel="stylesheet">
	<link href="${ctx}/css/styles.css" rel="stylesheet">
	<%-- <link rel="stylesheet" href="${ctx}/js/zTree/css/demo.css" type="text/css"> --%>
	<link rel="stylesheet" href="${ctx}/js/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<%-- <link rel="stylesheet"
		href="${ctx}/js/datetimepicker/jquery.datetimepicker.css"> --%>

	<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/chart.min.js"></script>
<script src="${ctx}/js/chart-data.js"></script>
<script src="${ctx}/js/easypiechart.js"></script>
<script src="${ctx}/js/easypiechart-data.js"></script>
<script src="${ctx}/js/bootstrap-datepicker.js"></script>
<script src="${ctx}/js/bootstrap-table.js"></script>
<script src="${ctx}/js/laydate/laydate.js"></script>
<%-- <script src="${ctx}/js/datetimepicker/jquery.datetimepicker.js"></script> --%>
<script>
/* 	$(function() {
		$(".examDate").datetimepicker({
			lang : 'zh',
			timepicker : false,
			format : 'Y-m-d',
			closeOnDateSelect : true
		});
	}); */

</script>
<style>
  .currentActive{color:#fff;background-color:#2fb4da;border-color:#2fb4da}
</style>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>佳医生</span>平台中心系统</a>
				<ul class="user-menu">
					<li class="dropdown pull-right"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><span
							class="glyphicon glyphicon-user"></span> ${user.username} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="${ctx}/user/editUserPasswordPage"><span class="glyphicon glyphicon-cog"></span>
									修改密码</a></li>
							<!-- <li><a href="#"><span class="glyphicon glyphicon-cog"></span>
									设置</a></li> -->
							<li><a href="${ctx}/logout"><span
									class="glyphicon glyphicon-log-out"></span> 退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<!-- <form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form> -->
		<ul class="nav menu">
		   <c:if test="${not empty STATICTIS}">
					<li ><a href="${ctx}/index.html"><span
					class="glyphicon glyphicon-stats"></span> 统计信息</a></li>
		    </c:if>
		    <c:if test="${not empty PATIENT_CENTER}">
			<li class="parent "><a href="#"> <span
					class="glyphicon glyphicon-tree-deciduous"></span> 病人中心 <span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus "></em></span></a>
				<ul class="children collapse" id="sub-item-1">
				   <c:if test="${not empty PATIENT_INFORMATION}">
						<li id="patients"><a class="" href="${ctx}/jybUser/getJybUserList"> <span
								class="glyphicon glyphicon-share-alt"></span> 病人资料
						</a></li>
					</c:if>
					 <c:if test="${not empty PATIENT_ADD}">
						<li id="addpatients"><a class="" href="${ctx}/jybUser/addPatientPage"> <span
								class="glyphicon glyphicon-share-alt"></span> 添加病人
						</a></li>
					</c:if>
				</ul></li>
			</c:if>
			<c:if test="${not empty DOCTOR_CENTER}">
			<li class="parent"><a href="#"> <span
					class="glyphicon glyphicon-road"></span> 医生中心 <span
					data-toggle="collapse" href="#sub-item-2" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span></a>
				<ul class="children collapse" id="sub-item-2">
					<c:if test="${not empty DOCTOR_INFORMATION}">
					<li id="doctors"><a class="" href="${ctx}/jydUser/getJydUserList?star=-1"> <span
							class="glyphicon glyphicon-share-alt"></span> 医生资料
					</a></li>
					</c:if>
					<c:if test="${not empty DOCTOR_ADD}">
					<li id="adddoctors"><a class="" href="${ctx}/jydUser/addDoctorPage"> <span
							class="glyphicon glyphicon-share-alt"></span> 添加医生
					</a></li>
					</c:if>
					<c:if test="${not empty DOCTOR_VERIFI}">
					<li id="doctor_idvertfile"><a class=""
						href="${ctx}/jydIdvertfile/getJydIdvertfileList"> <span
							class="glyphicon glyphicon-share-alt"></span> 身份审核
					</a></li>
					</c:if>
				</ul></li>
			</c:if>
			<c:if test="${not empty ORDER_MANAGER}">
				<li class="parent"><a href="#"> <span
					class="glyphicon glyphicon-list-alt"></span> 订单管理<span
					data-toggle="collapse" href="#sub-item-3" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span></a>
				<ul class="children collapse" id="sub-item-3">
				    <c:if test="${not empty ORDER_LIST}">
					<li id="orderList"><a class="" href="${ctx}/doctororder/getDoctororderList"> <span
							class="glyphicon glyphicon-share-alt"></span> 订单列表
					</a></li>
					</c:if>
				</ul></li>
			</c:if>
			<c:if test="${not empty TRANS_TREAT}">
			 <li class="parent">
				<a href="#">
					<span class="glyphicon glyphicon-plane"></span> 医疗转运 <span data-toggle="collapse" href="#sub-item-4" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-4">
					<c:if test="${not empty TRANS_ORDER}">
					<li id="transorderList">
						<a class="" href="${ctx}/transorder/getTransorderList">
							<span class="glyphicon glyphicon-share-alt"></span> 转运订单查询
						</a>
					</li>
					</c:if>
					<c:if test="${not empty TRANS_PROCESS}">
					<li id="transProcessList">
						<a class="" href="${ctx}/transProcess/getTransProcessList">
							<span class="glyphicon glyphicon-share-alt"></span> 转运订单处理
						</a>
					</li>
					</c:if>
				</ul>
			</li> 
			</c:if>
			<c:if test="${not empty WECHAT_TRANS_TREAT}">
			 <li class="parent">
				<a href="#">
					<span class="glyphicon glyphicon-plane"></span> 微信转运 <span data-toggle="collapse" href="#sub-item-5" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span> 
				</a>
				<ul class="children collapse" id="sub-item-5">
				    <c:if test="${not empty WECHAT_USER}">
						<li id="wechatUser"><a class="" href="${ctx}/wechatUser/getWechatUserList"> <span
								class="glyphicon glyphicon-share-alt"></span>微信用户
						</a></li>
					</c:if>
					<c:if test="${not empty WECHAT_TRANS_ORDER}">
					<li id="wctransorderList">
						<a class="" href="${ctx}/wechatTransorder/getTransorderList">
							<span class="glyphicon glyphicon-share-alt"></span> 微信转运订单
						</a>
					</li>
					</c:if>
					<c:if test="${not empty WECHAT_TRANS_PROCESS}">
					<li id="wctransProcessList">
						<a class="" href="${ctx}/wechatTransProcess/getTransProcessList">
							<span class="glyphicon glyphicon-share-alt"></span> 微信转运处理
						</a>
					</li>
					</c:if>
				</ul>
			</li> 
			</c:if>
			<c:if test="${not empty SYSTEM}">
			<li class="parent"><a href="#"> <span
					class="glyphicon glyphicon-pencil"></span> 系统设置 <span
					data-toggle="collapse" href="#sub-item-6" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-6">
				<c:if test="${not empty MEDICINE}">
					<li id="medicineSet"><a class="" href="${ctx}/medicineSet/getMedicineList">
							<span class="glyphicon glyphicon-share-alt"></span> 药方设置
					</a></li>
				</c:if>
				<c:if test="${not empty DISEASE}">
					<li id="basicillSet"><a class="" href="${ctx}/basicillSet/getBasicillSetList">
							<span class="glyphicon glyphicon-share-alt"></span> 基础疾病设置
					</a></li>
				</c:if>
				<c:if test="${not empty TREAT_SET}">
					<li id="treatSet"><a class="" href="${ctx}/treatSet/getTreatSetList"> <span
							class="glyphicon glyphicon-share-alt"></span> 处方设置
					</a></li>
				</c:if>
				<c:if test="${not empty DISCOUNT_SET}">
					<li id="discountSet"><a class="" href="${ctx}/discountSet/getDiscountList">
							<span class="glyphicon glyphicon-share-alt"></span> 折扣设置
					</a></li>
				</c:if>
				<c:if test="${not empty BANK_LIST}">
					<li id="bankSet"><a class="" href="${ctx}/bankList/getBankList"> <span
							class="glyphicon glyphicon-share-alt"></span> 银行设置
					</a></li>
				</c:if>
				<c:if test="${not empty COMMENTINFO}">
					<li id="commentInfo"><a class="" href="${ctx}/commentInfo/getCommentInfoList"> <span
							class="glyphicon glyphicon-share-alt"></span> 评论管理
					</a></li>
				</c:if>
				<c:if test="${not empty WITHDRAWAPPLY}">
					<li id="withdrawApply"><a class="" href="${ctx}/jydWithdrawApply/getJydWithdrawApplyList"> <span
							class="glyphicon glyphicon-share-alt"></span> 提现管理
					</a></li>
				</c:if>
				<c:if test="${not empty COUPONSET}">
					<li id="couponSet"><a class="" href="${ctx}/couponSet/getCouponSetList"> <span
							class="glyphicon glyphicon-share-alt"></span> 优惠券管理
					</a></li>
				</c:if>
				<c:if test="${not empty FEESET}">
					<li id="feeSet"><a class="" href="${ctx}/syFeeSet/getSyFeeSetList"> <span
							class="glyphicon glyphicon-share-alt"></span> 服务费用管理
					</a></li>
				</c:if>
				<c:if test="${not empty CUSTOMERSERVICE}">
					<li id="customerService"><a class="" href="${ctx}/customerService/getCustomerServiceList"> <span
							class="glyphicon glyphicon-share-alt"></span> 客户联系管理
					</a></li>
				</c:if>
				<c:if test="${not empty PUSHMESSAGE}">
					<li id="pushMessage"><a class="" href="${ctx}/pushMessage/getSyPushMessageList"> <span
							class="glyphicon glyphicon-share-alt"></span> 推送信息管理
					</a></li>
				</c:if>
				<c:if test="${not empty SYTRANSCARGPS}">
					<li id="syTransCarGps"><a class="" href="${ctx}/syTransCarGps/getSyTransCarGpsList"> <span
							class="glyphicon glyphicon-share-alt"></span> 转运路线
					</a></li>
				</c:if>
				
				</ul></li>
				</c:if>
				<c:if test="${not empty MCUSER}">
				<li class="parent"><a href="#"> <span
					class="glyphicon glyphicon-pencil"></span> 后台管理 <span
					data-toggle="collapse" href="#sub-item-7" class="icon pull-right"><em
						class="glyphicon glyphicon-s glyphicon-plus"></em></span></a>
				<ul class="children collapse" id="sub-item-7">
				<c:if test="${not empty MCUSER_LIST}">
					<li id="users">
						<a class="" href="${ctx}/user/getUserAll">
							<span class="glyphicon glyphicon-share-alt"></span> 用户管理
						</a>
					</li>
				</c:if>
				<c:if test="${not empty ROLE}">
					<li id="users">
						<a class="" href="${ctx}/role/getRoleAll">
							<span class="glyphicon glyphicon-share-alt"></span> 后台角色
						</a>
					</li>
				</c:if>
				</ul></li>
				</c:if>
				<c:if test="${not empty LOGINRECORD}">
					<li ><a href="${ctx}/system/loginRecord"><span
					class="glyphicon glyphicon-list-alt"></span>登录日志</a></li>
				</c:if>
		</ul>



		<!-- 	<div class="attribution">Copyright © 2016 JiaDoctor Inc. 保留所有权利。</div> -->
	</div>
	<!--/.sidebar-->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>
			</div>
		</div>
	</div>

	<script>
		$("#myModal").on("hidden.bs.modal", function() {
			$(this).removeData("bs.modal");
		});
	</script>