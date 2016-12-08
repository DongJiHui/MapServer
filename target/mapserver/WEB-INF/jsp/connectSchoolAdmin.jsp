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
					<th>联系类型</th>
					<th>前驱</th>
					<th>后继</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${connects}" varStatus="i" var="connect">
					<tr>
						<th>${ i.index + 1 }</th>
						<th><c:if test="${ connect.cType=='pm' }">小学-初中</c:if> <c:if
								test="${ connect.cType=='mh' }">初中-高中</c:if></th>
						<th>${ connect.school1.sName }</th>
						<th>${ connect.school2.sName }</th>
						<th>
							<button type="delete" sId1="${ connect.sId1 }"
								sId2="${ connect.sId2 }" class="btn btn-sm btn-danger">删除</button>
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
						<div id="alertRole" class="alert alert-warning" role="alert" style="display:none;">学校关系应是小学-初中或初中-高中，请点击清除当前关系重新选择！</div>
							<div class="row">
								<form id="myForm" action="<c:url value="/connectSchool"/>"
									method="POST" enctype="multipart/form-data">
									<input type="hidden" name="method" value="add"> <input
										type="hidden" name="type"> <input type="hidden"
										name="sId1"> <input type="hidden" name="sId2">
								</form>
								<div class="col-lg-3">
									<div class="input-group">
										<span class="input-group-addon" for="school1"> </span> <input
											type="text" class="form-control" for="school1">
									</div>
								</div>
								<div class="col-lg-3">
									<div class="input-group">
										<span class="input-group-addon" for="school2"> </span> <input
											type="text" class="form-control" for="school2">
									</div>
								</div>
								<div style="float: right">
									<span>学校关联类型：</span>
									<div class="btn-group" role="group">
										<button type="button" target="schoolSelect"
											class="btn btn-default">小学</button>
										<button type="button" target="schoolSelect"
											class="btn btn-default">初中</button>
										<button type="button" target="schoolSelect"
											class="btn btn-default">高中</button>
									</div>
								</div>
							</div>
							<div id="map-container"></div>
						</div>
						<div class="modal-footer">
							<button type="button" target="clear" class="btn btn-warning">清除当前关系</button>
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
	var mapObj;
	var school1;
	var school2;
	var notify = function() {
		if (school1 != null) {
			$("input[name=sId1]").val(school1.sId);
			$("input[for=school1]").val(school1.sName);
			$("span[for=school1]").html(school1.sType);
		}
		if (school2 != null) {
			$("input[name=sId2]").val(school2.sId);
			$("input[for=school2]").val(school2.sName);
			$("span[for=school2]").html(school2.sType);
			if (school1.sType == "小学" && school2.sType == "初中") {
				$("input[name=type]").val("pm");
			}
			if (school1.sType == "初中" && school2.sType == "高中") {
				$("input[name=type]").val("mh");
			}
		}
		if (school1 == null && school2 == null) {
			$("input[name=sId1]").val("");
			$("input[for=school1]").val("");
			$("span[for=school1]").html("");
			$("input[name=sId2]").val("");
			$("input[for=school2]").val("");
			$("span[for=school2]").html("");
			$("input[name=type]").val("");
		}
	}
	var initMap = function(xhr) {
		console.log(xhr)
		mapObj.clearMap();
		for (var i = 0; i < xhr.length; i++) {
			var point = JSON.parse(xhr[i].sMiddlepoint);
			var getClickFunc = function(arg0) {
				var school = arg0;
				return function() {
					if (school1 == null && school2 == null) {
						school1 = school;
					} else if (school2 == null) {
						school2 = school;
					}
					notify();
				}
			};
			var clickFunc = getClickFunc(xhr[i]);
			var marker = new AMap.Marker({
				map : mapObj,
				label : {
					content : xhr[i].sName,
					offset : new AMap.Pixel(-10, -15),
				},
				position : new AMap.LngLat(point.lng, point.lat)
			});
			window.AMap.event.addListener(marker, 'click', clickFunc);
		}
	};
	$(document)
			.ready(
					function() {
						var $label1 = $("label[for=input1]");
						var $label2 = $("label[for=input2]");
						$("button[type=delete]")
								.on(
										'click',
										function() {
											var sId1 = $(this).attr("sId1");
											var sId2 = $(this).attr("sId2");
											window.location = "connectSchool?method=delete&sId1="
													+ sId1 + "&sId2=" + sId2;
										});
						$("button[target=schoolSelect]").on(
								'click',
								function() {
									var schoolType = $(this).html();
									$.ajax({
										type : "GET",
										url : "adminApi/schoolByType?type="
												+ schoolType,
										dataType : "json",
										success : initMap
									});
								});
						$("button[target=submit]").on(
								'click',
								function() {
									if ($("input[name=type]").val() == "") {
										$("#alertRole").slideDown('slow');
										setTimeout(function(){
											$("#alertRole").slideUp('slow');
										},3000);
										return;
									};
									$('#myForm').submit();
								});
						$("button[target=clear]").on('click', function() {
							school1 = null;
							school2 = null;
							notify();
						});
						mapObj = new window.AMap.Map('map-container', {
							zoom : 11,
							center : [ 116.39, 39.9 ]
						});
					});
</script>
</html>
