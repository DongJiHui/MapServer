<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>关联学校</title>
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=ca76dda02a3f34acd3130993e0b3aed9"></script>
<style>
.jumbotron {
	width: 80%;
	height: 588px;
	float: left;
}

#map-container {
	margin-top: 10px;
	width: 870px;
	height: 400px;
	position: relative;
	width: 870px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/titleBarAdmin.jsp"%>
	<%@ include file="/WEB-INF/jsp/sideBarAdmin.jsp"%>
	<div class="jumbotron">
		<div class="container">

			<div class="row">
				<button type="button" style="float: right; margin-right: 25px"
					class="btn btn-primary" data-toggle="modal"
					data-target=".bs-example-modal-lg">添加关系</button>
			</div>
			<table class="table table-hover">
				<tr class="info">
					<th>编号</th>
					<th>配额</th>
					<th>初中</th>
					<th>高中</th>
					<th>行政区</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${allocations}" varStatus="i" var="allocation">
					<tr>
						<th>${ i.index + 1 }</th>
						<th>${ allocation.alQuota }</th>
						<th>${ allocation.middleSchool.sName }</th>
						<th>${ allocation.highSchool.sName }</th>
						<th>${ allocation.alDName }</th>
						<th>
							<button type="delete" msId="${ allocation.alMsId }"
								hsId="${ allocation.alHsId }" class="btn btn-sm btn-danger">删除</button>
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
							<div id="alertRole" class="alert alert-warning" role="alert"
								style="display: none;">ERROR!</div>
							<div class="row">
								<form id="myForm" action="<c:url value="/allocateSchool"/>"
									method="POST" enctype="multipart/form-data">
									<input type="hidden" name="method" value="add"> <input
										type="hidden" name="type"> <input type="hidden"
										name="sId1"> <input type="hidden" name="sId2">
									<div class="row">
										<div class="col-lg-5 col-lg-offset-1">
											<div class="form-group">
												<label >行政区名称：</label> <select
													id="district" class="form-control" name="dName">
													<c:forEach items="${districts}" varStatus="i"
														var="district">
														<option
															value="${ district.dName }">${ district.dName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-lg-5">
											<div class="form-group">
												<label>分配名额：</label> <input type="text"
													class="form-control"
													id="quota" name="quota" placeholder="请输入欲分配的名额" required>

											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-5 col-lg-offset-1">
											<div class="form-group">
												<label >初中名称：</label> <select
													id="middleSchool" class="form-control" name="msId">
													
												</select>
											</div>
										</div>
										<div class="col-lg-5">
											<div class="form-group">
												<label >高中名称：</label> <select
													id="highSchool" class="form-control" name="hsId">
													
												</select>
											</div>
										</div>
									</div>

								</form>

							</div>

						</div>
						<div class="modal-footer">
							<button type="button" target="submit" class="btn btn-default">提交</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
						</div>

					</div>
				</div>
			</div>


		</div>
	</div>
</body>
<script>
	var schoolAjax = function(name){
		var initSchool = function(xhr){
			var select1 = $("#middleSchool");
			var select2 = $("#highSchool");
			select1.empty();
			select2.empty()
			xhr.forEach(function(school){
				if (school.sType == '初中') {
					select1.append("<option value='"+school.sId+"'>"+school.sName+"</option>"); 
				}
				if (school.sType == '高中') {
					select2.append("<option value='"+school.sId+"'>"+school.sName+"</option>"); 
				}
			})
			 $(select1.children('option')[0]).attr("selected",true);
			 $(select2.children('option')[0]).attr("selected",true);
		}
		$.ajax({
			type : "GET",
			url : "adminApi/schoolByDName?dName="
					+ name,
			dataType : "json",
			success : initSchool
		});
	}

	$(document)
			.ready(
					function() {
						$("#district").change(function (){
							var name = $(this).children('option:selected').html();
							schoolAjax(name);
						});
						
						$("button[target=submit]").on('click', function() {
							if ($("#quota").val() == ""|| $("#middleSchool").val() == null || $("#highSchool").val() == null) {
								$("#alertRole").slideDown('slow');
								setTimeout(function() {
									$("#alertRole").slideUp('slow');
								}, 3000);
								return;
							}
							
							$('#myForm').submit();
						});
						$("button[type=delete]")
						.on(
								'click',
								function() {
									var msId = $(this).attr("msId");
									var hsId = $(this).attr("hsId");
									window.location = "allocateSchool?method=delete&msId="
											+ msId + "&hsId=" + hsId;
								});
						var select0 = $("#district").children('option')[0];
						 $(select0).attr("selected",true);
						schoolAjax($(select0).val())
					});
</script>
</html>
