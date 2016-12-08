<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>添加教育资源</title>
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=ca76dda02a3f34acd3130993e0b3aed9"></script>
	<script src="<c:url value="/js/validator.js"/>" type="text/javascript"></script>
	
<style>
.jumbotron {
	width: 80%;
	height: 588px;
	float: left;
}

.container {
	padding: 0 10px 0px 50px;
}

#map-container {
	width: 870px;
	height: 400px;
	position: relative;
}

#tip {
	background-color: #ddf;
	color: #333;
	border: 1px solid silver;
	box-shadow: 3px 4px 3px 0px silver;
	position: absolute;
	top: 10px;
	right: 10px;
	border-radius: 5px;
	overflow: hidden;
	line-height: 20px;
	z-index: 9999;
}

#tip input[type="text"] {
	height: 25px;
	border: 0;
	padding-left: 5px;
	width: 280px;
	border-radius: 3px;
	outline: none;
}

.amap-sug-result {
	z-index: 9999;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/titleBarAdmin.jsp"%>
	<%@ include file="/WEB-INF/jsp/sideBarAdmin.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<form id="myForm" action="<c:url value="/addResource"/>" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${ resource.rId }" />
				<div class="row">
					<div class="col-lg-5">
						<div class="form-group">
							<label for="schoolName">教育资源名称：</label> <input type="text"
								value="${ resource.rName  }" class="form-control" id="schoolName" data-error="该教育资源名已存在" data-remote="adminApi/resourceCheck"
								name="name" placeholder="请输入学校名称" required ><div class="help-block with-errors"></div>
						</div>
						<div class="form-group">
							<label for="districtName">教育资源所属学区：</label> <select id="district"
								class="form-control" name="schoolAreaId">
								<c:forEach items="${schoolAreas}" varStatus="i" var="schoolArea">
									<option
										<c:if test="${ resource.schoolAreaId eq schoolArea.saId }">selected="selected"</c:if>
										value="${ schoolArea.saId }">${ schoolArea.saName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="schoolAddress">教育资源地址：</label> <input type="text"
								value="${ resource.rAddress  }" class="form-control"
								id="schoolAddress" name="address" placeholder="请输入学校地址">
						</div>
						<div class="form-group">
							<label for="schoolDesc">教育资源描述：</label>
							<textarea id="schoolDesc" class="form-control" name="desc"
								rows="4" placeholder="请输入学校描述">${ resource.rDescription  }</textarea>
						</div>
						<div class="form-group">
							<label for="schoolScore">教育资源评分：</label> <input type="text"
								value="${ resource.rScore  }" class="form-control"
								id="schoolScore" name="score" placeholder="请输入学校评分">
						</div>

					</div>
					<div class="col-lg-5 col-lg-offset-1">
						<div class="form-group">
							<label for="middlePoint">教育资源中心点坐标：</label> <input type="text"
								readonly='true' value='${ resource.rMiddlepoint }'
								class="form-control" target="middlePoint" id="middlePoint"
								name="middlePoint" placeholder="请在地图上选择" /> <a
								attitude="middlePoint" class="btn btn-sm btn-default" href="#"
								role="button">在地图上选择</a>
						</div>
						<div class="form-group">
							<label for="schoolType">教育资源类型：</label> <select id="schoolType"
								class="form-control" name="type">
								<option
									<c:if test="${ resource.rType eq '公园' }">selected="selected"</c:if>
									value="公园">公园</option>
								<option
									<c:if test="${ resource.rType eq '图书馆' }">selected="selected"</c:if>
									value="图书馆">图书馆</option>
								<option
									<c:if test="${ resource.rType eq '博物馆' }">selected="selected"</c:if>
									value="博物馆">博物馆</option>
							</select>
						</div>
						<div class="form-group">
							<label for="schoolPhone">教育资源电话：</label> <input type="text"
								value="${ resource.rPhone  }" class="form-control"
								id="schoolPhone" name="phone" placeholder="请输入学校电话">
						</div>
						<div class="form-group">
							<label for="schoolUrl">教育资源主页URL：</label> <input type="text"
								value="${ resource.rUrl  }" class="form-control" id="schoolUrl"
								name="url" placeholder="请输入主页URL">
						</div>
					</div>
				</div>
				<input type="hidden" name="method" value="add_update" />
				<div id="mymodal" class="modal fade bs-example-modal-lg"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">请标出教育资源中心</h4>
							</div>
							<div class="modal-body">
								<div id="tip">
									<input type="text" id="keyword" name="keyword"
										value="请输入关键字：(选定后搜索)" onfocus='this.value=""' />
								</div>
								<div id="map-container"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row">
				<button type="submit"
					class="col-lg-2 col-lg-offset-4 btn btn-default">提交</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	var middlePoint;
	var mapObj;
	var notify = function() {
		var tempPoint = {
			lng : middlePoint.getPosition().lng,
			lat : middlePoint.getPosition().lat
		}
		$('input[target=middlePoint]').attr('value', JSON.stringify(tempPoint));
	}
	var _onClick = function(e) {
		if (middlePoint) {
			mapObj.remove(middlePoint);
		}
		middlePoint = new window.AMap.Marker({
			position : e.lnglat,
			map : mapObj,
			draggable : false,
			clickable : false,
			label : {
				content : "中心点",
				offset : new AMap.Pixel(-13, -10)
			}
		});
		notify();
	};
	var drawMiddlePoint = function(){
		var arg0 = $('input[target=middlePoint]').attr('value');
		var obj0;
		if (arg0 != '') {
			obj0 = JSON.parse(arg0);
			middlePoint = new window.AMap.Marker({
				position : new AMap.LngLat(obj0.lng, obj0.lat),
				map : mapObj,
				draggable : false,
				clickable : false,
				label : {
					content : "中心点",
					offset : new AMap.Pixel(-13, -10)
				}
			});
		}
	}
	var initMap = function(xhr) {
		mapObj.clearMap();
		drawMiddlePoint();
		if (xhr && xhr.resultCode == 0) {
			var result = xhr.result;
			var obj1;
			var obj2;
			if (result.saMiddlepoint != '') {
				obj1 = JSON.parse(result.saMiddlepoint);
			} else {
				obj1 = {
					lng : 116.39,
					lat : 39.9
				};
			}
			if (result.saPoints != '') {
				obj2 = JSON.parse(result.saPoints);
			}
			mapObj.setCenter(new AMap.LngLat(obj1.lng, obj1.lat));
			if (result.saScaleparam) {
				mapObj.setZoom(result.saScaleparam);
			}
			var lnglats = [];
			for (var i = 0; i < obj2.length; i++) {
				lnglats.push(new AMap.LngLat(obj2[i].lng, obj2[i].lat));
			}
			lnglats.push(new AMap.LngLat(obj2[0].lng, obj2[0].lat));
			new window.AMap.Polyline({
				map : mapObj,
				path : lnglats,
				strokeColor : "#197DBF",
				strokeStyle : "dashed"
			});
		}
	}
	var init = function() {
		mapObj = new window.AMap.Map('map-container', {
			zoom : 11,
			center : [ 116.39, 39.9 ]
		})
		mapObj.setDefaultCursor('default')
		window.AMap.event.addListener(mapObj, 'click', _onClick);
		window.AMap
				.plugin(
						[ 'AMap.Autocomplete', 'AMap.PlaceSearch' ],
						function() {
							var autoOptions = {
								city : '北京',
								input : 'keyword'
							};
							var autocomplete = new window.AMap.Autocomplete(
									autoOptions);
							var placeSearch = new window.AMap.PlaceSearch({
								city : '北京'
							});
							window.AMap.event
									.addListener(
											autocomplete,
											'select',
											function(e) {
												placeSearch
														.search(
																e.poi.name,
																function(
																		status,
																		result) {
																	var pois = result.poiList.pois
																	mapObj
																			.setCenter(pois[0].location);
																	mapObj
																			.setZoom(15);
																});
											});
						});
		drawMiddlePoint();
	}
	$(document).ready(function() {
		$('#myForm').validator();
		$('button[type=submit]').on('click', function() {
			$('#myForm').validator('validate');
			$('#myForm').submit();
		});
		$("a[attitude=middlePoint]").on('click', function() {
			var id = $("#district option:selected").attr("value");
			$.ajax({
				type : "GET",
				url : "api/schoolArea?saId=" + id,
				dataType : "json",
				success : initMap
			});
			$('#mymodal').modal('show');
		});
		init();
	});
</script>