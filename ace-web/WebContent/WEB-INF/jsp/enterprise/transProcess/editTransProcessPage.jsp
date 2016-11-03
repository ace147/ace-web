<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">转运订单处理</li>
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
					<div class="panel-heading">转运订单处理
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
						      <div class="form-group">
										<label>订单详情</label>
										<button href="${ctx}/transorder/getTransorderDetail?id=${syTransProcess.syTransorder.id}" data-toggle="modal" data-target="#myModal" class="btn btn-primary">查询</button>
								</div>
						
							   <%--  <div class="form-group">
										<label>医生id</label>
										<input class="form-control"   value="${jydIdverifile.jydUser.id}" disabled="disabled">
								</div> --%>
								<%-- <div class="form-group">
										<label>订单编号</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.code}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>客户姓名</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.name}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>联系电话</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.contactPhone}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>客户地址</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.address}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>情况描述</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.situation}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>目标医院</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.hospital}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>转运目的地</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.targetadd}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>订单时间</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.orderTime}" disabled="disabled">
								</div>
								<div class="form-group">
									<label>订单状态</label>
									<select class="form-control" name="stStatus" >
										<option value="1" <c:if test="${syTransProcess.syTransorder.stStatus eq '1'}">selected</c:if>>待确认</option>
										<option value="2" <c:if test="${syTransProcess.syTransorder.stStatus eq '2'}">selected</c:if>>已确认</option>
										<option value="3" <c:if test="${syTransProcess.syTransorder.stStatus eq '3'}">selected</c:if>>锁定</option>
										<option value="0" <c:if test="${syTransProcess.syTransorder.stStatus eq '0'}">selected</c:if>>失效</option>
									</select>
								</div>
								<div class="form-group">
										<label>审核时间</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.veritime}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>病人</label>
										<input class="form-control"   value="<c:if test="${not empty syTransProcess.syTransorder.user}">${syTransProcess.syTransorder.user.nickname}</c:if>" disabled="disabled">
								</div>
								<div class="form-group">
										<label>代理人</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.daili.nickname}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>审核人</label>
										<input class="form-control"   value="${syTransProcess.syTransorder.veritor.realName}" disabled="disabled">
								</div> --%>
								
								<form role="form" action="${ctx}/transProcess/updateTransProcess" method="post">
								<div class="form-group">
										<label>目标医院</label>
										<input class="form-control"  name="hospital"  value="${syTransProcess.hospital}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
										<label>转运车到达时间</label>
										<input class="form-control"  id="timer" value="<fmt:formatDate value="${syTransProcess.arriveTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
										<label>转运车到达地址</label>
										<textarea class="form-control"   name="arriveAddress"  rows="3" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>${syTransProcess.arriveAddress}</textarea>
								</div>
								<div class="form-group">
										<label>转运车司机</label>
										<input class="form-control" name="driver" value="${syTransProcess.driver}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
										<label>司机电话</label>
										<input class="form-control"  name="driverPhone" value="${syTransProcess.driverPhone}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								
								<div class="form-group">
									<label>医院联系人</label>
									<input class="form-control"   name="hoscontactMan" value="${syTransProcess.hoscontactMan}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
									<label>医院联系电话 </label>
									<input class="form-control"    name="hoscontactPhone" value="${syTransProcess.hoscontactPhone}"<c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
									<label>转运公里数（KM）</label>
									<input class="form-control"   id="distance" name="distance"    onchange="sumDistance()" value="${syTransProcess.distance}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>/>
								</div>
								<div class="form-group">
									<label>误差公里数（KM）</label>
									<input class="form-control"  id="gapdistance" name="gapdistance"  onchange="sumDistance()"  value="${syTransProcess.gapdistance}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>/>
								</div>
								<div class="form-group">
									<label>总共公里数（KM）</label>
									<input class="form-control"  id="totaldistance" name="totaldistance" readonly="readonly" value="${syTransProcess.totaldistance}" >
								</div>
								<div class="form-group">
									<label>每公里价格</label>
									<%-- <c:if test="${empty  syTransProcess.kmPrice||syTransProcess.kmPrice==''||syTransProcess.kmPrice==0}"> --%>
										<input class="form-control"  id="kmPrice" name="kmPrice" readonly="readonly" onchange="sumPrice()" value="${price}" >
									<%-- </c:if> --%>
									<%-- <c:if test="${not empty  syTransProcess.kmPrice||syTransProcess.kmPrice==''||syTransProcess.kmPrice==0}">
										<input class="form-control"  id="kmPrice" name="kmPrice" readonly="readonly" onchange="sumPrice()" value="${price}" disabled="disabled"</c:if>>
									</c:if> --%>
								</div>
								<div class="form-group">
									<label>额外费用</label>
									<input class="form-control"  id="fixedOtherPrice" value="${otherPrice}" readonly="readonly">
								</div>
								<div class="form-group">
									<label>其他价格</label>
									<input class="form-control"  id="otherPirce" name="otherPrice" onchange="sumPrice()" value="${syTransProcess.otherPrice}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div>
								<div class="form-group">
									<label>总共价格</label>
									<input class="form-control"  id="totalPrice" name="totalPrice" readonly="readonly"  value="${syTransProcess.totalPrice}" readonly="readonly">
								</div>
								<%-- <div class="form-group">
									<label>折扣</label>
									<input class="form-control"  name="discount" value="${syTransProcess.discount}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div> --%>
								<%-- <div class="form-group">
									<label>应付价格</label>
									<input class="form-control"  id="payPrice" name="payPrice" value="${syTransProcess.payPrice}" <c:if test="${syTransProcess.jsStatus eq '1'}">disabled="disabled"</c:if>>
								</div> --%>
								<div class="form-group">
									<label>结算状态</label>
									<select class="form-control" name="jsStatus" disabled="disabled">
										<option value="1" <c:if test="${syTransProcess.jsStatus eq '1'}">selected</c:if>>已结算</option>
										<option value="0" <c:if test="${syTransProcess.jsStatus eq '0'}">selected</c:if>>未结算</option>
									</select>
								</div>
								<div class="form-group">
										<label>审核人</label>
										<input class="form-control"   value="${syTransProcess.veritor.realName}" disabled="disabled">
								</div>
								<div class="form-group">
										<label>审核时间</label>
										<input class="form-control"   value="<fmt:formatDate value="${syTransProcess.veriTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled="disabled">
								</div>
								
							    <input class="form-control"  type="hidden" name="id" value="${syTransProcess.id}">
								<c:if test="${syTransProcess.jsStatus eq '0'}">
									<button type="submit" class="btn btn-primary">提交</button>
									<button type="reset" class="btn btn-default">重置</button>
								</c:if>
							</div>
								
							</div>
						</form>
					</div>
				</div>
			</div><!-- /.col-->
		</div><!-- /.row -->
		
	</div><!--/.main-->
	
	<script type="text/javascript">
		function sumDistance()
		{  
			//误差公里
			var gapdistance=$("#gapdistance").val()*1;
			//公里数（不包括误差）
			var distance=$("#distance").val()*1;
			if(distance==null){
				distance=0.00;
			}
			if(gapdistance==null){
				gapdistance=0.00;
			}
			$("#totaldistance").val(Number((distance+gapdistance)));
			
			
			/* //总公里
			var totaldistance=$("#totaldistance").val()*1;
			//总价格
			var kmPrice=$("#kmPrice").val()*1;
			$("#totalPrice").val(Number((totaldistance*kmPrice))); */
			sumPrice();
		}
		
		function sumPrice()
		{
			var totaldistance=$("#totaldistance").val()*1;
			var kmPrice=$("#kmPrice").val()*1;
			var otherPrice=$("#otherPirce").val()*1;
			var fixedOhterPrice=$("#fixedOtherPrice").val()*1;
			if(otherPrice==null){
				otherPrice=0.00;
			}
			var totalPrice=Number((totaldistance*kmPrice));
			$("#totalPrice").val(totalPrice+fixedOhterPrice+otherPrice);
			$("#payPrice").val(totalPrice);
		}
    </script>
	
     <script>
      ;!function(){

			//laydate.skin('molv');

			laydate({
			   elem: '#timer',
			   format: 'YYYY-MM-DD hh:mm:ss', //日期格式
			   istime: true, //是否开启时间选择
			   isclear: true, //是否显示清空
			   istoday: true, //是否显示今天
			})

			}();
	</script>
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
var activeLi = $('#transProcessList')
activeLi.addClass('active');
activeLi.parents('.children').addClass('in');
activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
</script>
</body>

</html>

