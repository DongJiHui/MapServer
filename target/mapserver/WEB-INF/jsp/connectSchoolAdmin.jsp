<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>关联学校</title>
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<script src="<c:url value="/js/bootstrap3-typeahead.min.js"/>"
	type="text/javascript"></script>
<style>
.jumbotron {
	width: 80%;
	height: 588px;
	float: left;
}

.modal-body {
	width: 870px;
	height: 400px;
	position: relative;
}

.middleRow {
	margin: 70px 0px 80px 0px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/titleBarAdmin.jsp"%>
	<%@ include file="/WEB-INF/jsp/sideBarAdmin.jsp"%>
	<div class="jumbotron">
		<div class="container">
		
				<div class="row">
					<button type="button" style="float:right; margin-right:25px" class="btn btn-primary" data-toggle="modal"
						data-target=".bs-example-modal-lg">添加关系</button>
				</div>
				<table class="table table-hover">
				<tr class="info">
					<th>编号</th>
					<th>联系类型</th>
					<th>前驱</th>
					<th>后继</th>
					<th>操作</th>
				</tr>
				 <c:forEach items="${connects}" varStatus="i" var="connect" >
				 	<tr>
				 		<th>${ i.index + 1 }</th>
				 		<th><c:if test="${ connect.cType=='pm' }">小学-初中</c:if>
   							<c:if test="${ connect.cType=='mh' }">初中-高中</c:if></th>
				 		<th>${ connect.school1.sName }</th>
				 		<th>${ connect.school2.sName }</th>
				 		<th>
				 			<button type="delete" sId1="${ connect.sId1 }" sId2="${ connect.sId2 }" class="btn btn-sm btn-danger">删除</button>
				 		</th>
				 	</tr>
				 </c:forEach>
				</table>
				<div class="modal fade bs-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true"></span>
								</button>
								<h4 class="modal-title" id="myModalLabel">添加学校关系</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div style="float: right">
										<span>学校关联类型：</span>
										<div class="btn-group" role="group">
											<button type="button" target="pm" class="btn btn-default">小学-初中</button>
											<button type="button" target="mh" class="btn btn-default">初中-高中</button>
										</div>
									</div>
								</div>
								<div class="row middleRow">
									<form id="myForm" action="<c:url value="/connectSchool"/>"
										method="POST" enctype="multipart/form-data">
										<input type="hidden" name="method" value="add"> <input
											type="hidden" name="type"> <input type="hidden"
											for="input1" name="sId1"> <input type="hidden"
											for="input2" name="sId2">
									</form>
									<div class="form-group col-lg-4 col-lg-offset-1">
										<label for="input1">请选择</label> <span for="input1"
											style="display: none" class="label label-success">Success</span>
										<input id="input1" type="text" placeholder="请根据补全输入"
											class="form-control typeahead" data-provide="typeahead" disabled>

									</div>
									<div class="form-group col-lg-4 col-lg-offset-2">
										<label for="input2">请选择</label> <span for="input2"
											style="display: none" class="label label-success">Success</span>
										<input id="input2" type="text" placeholder="请根据补全输入"
											class="form-control typeahead" data-provide="typeahead" disabled>
									</div>
								</div>
								<div class="row">
									<button type="button" target="submit"
										class="btn col-lg-2 col-lg-offset-5 btn-default">添加</button>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">关闭</button>
							</div>

						</div>
					</div>
				</div>


		</div>
	</div>
</body>
<script>
	var initInput = function(inputName) {
		var $input = $('#' + inputName);
		var $span = $('span[for=' + inputName + ']');
		var $idInput = $('input[for=' + inputName + ']');
		return function(xhr) {
			$span.hide();
			$input.val("");
			$input.removeAttr("disabled"); 
			$input.typeahead('destroy')
			$input.typeahead({
				source : xhr,
				autoSelect : true
			});
			$input.change(function() {
				var current = $input.typeahead("getActive");
				if (current) {
					$span.addClass('label-success');
					$span.removeClass('label-danger');
					$span.html('成功');
					$span.show();
					$idInput.val(current.id);
					if (current.name == $input.val()) {
					} else {
						$input.val(current.name);
					}
				} else {
					$span.show();
					$span.removeClass('label-success');
					$span.addClass('label-danger');
					$span.html('该学校不存在');
				}
			});
		}
	}
	$(document).ready(function() {
		var $label1 = $("label[for=input1]");
		var $label2 = $("label[for=input2]");
		$("button[type=delete]").on('click',function(){
			var sId1 = $(this).attr("sId1");
			var sId2 = $(this).attr("sId2");
			window.location = "connectSchool?method=delete&sId1="+sId1+"&sId2="+sId2;
		});
		$("button[target=pm]").on('click', function() {
			$.ajax({
				type : "GET",
				url : "adminApi/schoolByType?type=小学",
				dataType : "json",
				success : initInput('input1')
			});
			$.ajax({
				type : "GET",
				url : "adminApi/schoolByType?type=初中",
				dataType : "json",
				success : initInput('input2')
			});
			$("input[name=type]").val("pm");
			$label1.html("小学：");
			$label2.html("初中：");
			$(this).addClass("btn-primary");
			$("button[target=mh]").removeClass("btn-primary");
		});
		$("button[target=mh]").on('click', function() {
			$.ajax({
				type : "GET",
				url : "adminApi/schoolByType?type=初中",
				dataType : "json",
				success : initInput('input1')
			});
			$.ajax({
				type : "GET",
				url : "adminApi/schoolByType?type=高中",
				dataType : "json",
				success : initInput('input2')
			});
			$("input[name=type]").val("mh");
			$label1.html("初中：");
			$label2.html("高中：");
			$(this).addClass("btn-primary");
			$("button[target=pm]").removeClass("btn-primary");
		});
		$("button[target=submit]").on('click', function() {
			if ($('input[name=type]').val() == '') return;
			if ($('#input1').val()=='' || $('#input2').val()=='') return;
			$('#myForm').submit();
		});
	});
</script>
</html>
