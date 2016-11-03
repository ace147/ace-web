<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Forms</li>
			</ol>
		</div>
				
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">添加后台角色
					<button type="button" style="float:right;"class="btn btn-default" onclick="javascript:window.history.back();">返回</button>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<form role="form" action="${ctx}/role/addRole" method="post">
							
								<div class="form-group">
									<label>角色名</label>
									<input class="form-control" name="name">
								</div>
								
								<div class="form-group">
									<label>状态</label>
									<select class="form-control" name="status">
										<option value="1">启用</option>
										<option value="0">禁用</option>
									</select>
								</div>
								<div class="form-group">
									<label>权限</label>
									<ul id="treeDemo" class="ztree"></ul>
								</div>
								<input type="hidden" value="" id="msg" name="permissionss">
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default">重置</button>
								
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
	var activeLi = $('#users')
	activeLi.addClass('active');
	activeLi.parents('.children').addClass('in');
	activeLi.parents('.parent').find('.glyphicon-plus').length && activeLi.parents('.parent').find('.glyphicon-plus').addClass('glyphicon-minus');
	</script>
	
	<script type="text/javascript" src="${ctx}/js/zTree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctx}/js/zTree/js/jquery.ztree.excheck.js"></script>
	
	
	<SCRIPT type="text/javascript">
		
		var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeCheck: beforeCheck,
				onCheck: onCheck
			}
		};

		$(document).ready(function(){
			var zNodes = [];
			$.ajax({ 
		  		url:'${ctx}/permission/getPermissionAll', 
		  		type:'get', 
		  		dataType: 'json',
		  		data:{
		  			
		  		},
			    success: function(json) {
			    	$.each(json.result.menu, function(i,entity){
				             var permission = { id: entity.id, pId: entity.permissionId, name: entity.description };
				             zNodes.push(permission);
			         });
			    	//初始化树状图
			    	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
					$("#checkTrue").bind("click", {type:"checkTrue"}, checkNode);
					$("#checkFalse").bind("click", {type:"checkFalse"}, checkNode);
					$("#toggle").bind("click", {type:"toggle"}, checkNode);
					$("#checkTruePS").bind("click", {type:"checkTruePS"}, checkNode);
					$("#checkFalsePS").bind("click", {type:"checkFalsePS"}, checkNode);
					$("#togglePS").bind("click", {type:"togglePS"}, checkNode);
					$("#checkAllTrue").bind("click", {type:"checkAllTrue"}, checkNode);
					$("#checkAllFalse").bind("click", {type:"checkAllFalse"}, checkNode);

					$("#autoCallbackTrigger").bind("change", {}, setAutoTrigger);
			    },
			    error: function(XMLHttpRequest, textStatus, errorThrown) {
			       openwaring("网络出现异常");
			       $(".more-goods").html("加载失败,重新加载");
			       productsNum=0;	
			    }
		     });
			
		});
		
		var code, log, className = "dark";
		function beforeCheck(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeCheck ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name );
			return (treeNode.doCheck !== false);
		}
		function onCheck(e, treeId, treeNode) {
			GetCheckedAll();
		}		
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 6) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}
        
		//获取所有选中节点的值
	    function GetCheckedAll() {
	        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	        var nodes = treeObj.getCheckedNodes(true);
	        var msg = new Array();
	        for (var i = 0; i < nodes.length; i++) {
	            msg[i] = nodes[i].id;
	        }
	        $("#msg").val();
	        $("#msg").val(msg);
	    }    
		
		function checkNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			type = e.data.type,
			nodes = zTree.getSelectedNodes();
			if (type.indexOf("All")<0 && nodes.length == 0) {
				alert("请先选择一个节点");
			}

			if (type == "checkAllTrue") {
				zTree.checkAllNodes(true);
			} else if (type == "checkAllFalse") {
				zTree.checkAllNodes(false);
			} else {
				var callbackFlag = $("#callbackTrigger").attr("checked");
				for (var i=0, l=nodes.length; i<l; i++) {
					if (type == "checkTrue") {
						zTree.checkNode(nodes[i], true, false, callbackFlag);
					} else if (type == "checkFalse") {
						zTree.checkNode(nodes[i], false, false, callbackFlag);
					} else if (type == "toggle") {
						zTree.checkNode(nodes[i], null, false, callbackFlag);
					}else if (type == "checkTruePS") {
						zTree.checkNode(nodes[i], true, true, callbackFlag);
					} else if (type == "checkFalsePS") {
						zTree.checkNode(nodes[i], false, true, callbackFlag);
					} else if (type == "togglePS") {
						zTree.checkNode(nodes[i], null, true, callbackFlag);
					}
				}
			}
		}

		function setAutoTrigger(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.check.autoCheckTrigger = $("#autoCallbackTrigger").attr("checked");
			$("#autoCheckTriggerValue").html(zTree.setting.check.autoCheckTrigger ? "true" : "false");
		}

		$(document).ready(function(){
			
		});
		
	</SCRIPT>
</body>

</html>

