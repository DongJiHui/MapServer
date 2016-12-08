<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>添加集合</title>
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
			<form id="myForm" action="<c:url value="/addUnion"/>" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${ union.unId }" />
				<div class="row">
					<div class="col-lg-5">
						<div class="form-group">
							<label for="schoolName">集合名称：</label> <input type="text"
								value="${ union.unName  }" class="form-control" id="schoolName" data-error="该学校名已存在" data-remote="adminApi/schoolCheck"
								name="name" placeholder="请输入集合名称" required>
								<div class="help-block with-errors"></div>
						</div>
						<div class="form-group">
							<label for="schoolType">集合类型：</label>
							<select id="schoolType"
								class="form-control" name="type">
								<c:forEach items="${types}" varStatus="i" var="mytype">
									<option
										<c:if test="${ union.unType eq i.index }">selected="selected"</c:if>
										value="${ i.index }">${ mytype }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-lg-5 col-lg-offset-1">
						<div class="form-group">
							<label for="schools">集合成员：</label> <input type="text"
								readonly='true' value='${ union.schools }'
								class="form-control"  id="schools"
								name="schools" placeholder="请在地图上选择" /> <a
								attitude="middlePoint" class="btn btn-sm btn-default" href="#"
								role="button">在地图上选择</a>
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
								<h4 class="modal-title" id="myModalLabel">请点击学校</h4>
							</div>
							<div class="modal-body">
								<div id="tip">
									<input type="text" id="keyword" name="keyword"
										value="请输入关键字：(选定后搜索)" onfocus='this.value=""' />
								</div>
								<div id="map-container"></div>
							</div>
							<div class="modal-footer">
								<button type="button" id="confirm" class="btn btn-success"
									data-dismiss="modal">确定</button>
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
	var mapObj;
	var schoolArray = [];
	var valString = ""
	var init = function() {
		mapObj = new window.AMap.Map('map-container', {
			zoom : 11,
			center : [ 116.39, 39.9 ]
		})
		mapObj.setDefaultCursor('default');
		 window.AMap.plugin(['AMap.Autocomplete', 'AMap.PlaceSearch','AMap.DistrictSearch'], function () {
		        var autoOptions = {
		          city: '北京',
		          input: 'keyword'
		        };
		        var autocomplete = new window.AMap.Autocomplete(autoOptions);
		        var placeSearch = new window.AMap.PlaceSearch({
		          city: '北京'
		        });
		        var districtSearch = new window.AMap.DistrictSearch({
		        	level: 'district',
		        	extensions: 'all',
		        	subdistrict: 0
		        });
		        window.AMap.event.addListener(autocomplete, 'select', function (e) {
		          placeSearch.search(e.poi.name, function (status, result) {
		            var pois = result.poiList.pois
		            mapObj.setCenter(pois[0].location);
		            mapObj.setZoom(15);
		          });
		        });
		        var districtName = $('select[name=districtId]').find("option:selected").text();
		        districtSearch.search(districtName,function(status, result){
		        	districtBoudary = result.districtList[0].boundaries[0];
		        	drawBoundary();
		        });
		        $('select[name=districtId]').change(function() {
		        	districtName = $(this).find("option:selected").text();
		        	districtSearch.search(districtName,function(status, result){
		            	districtBoudary = result.districtList[0].boundaries[0];
		            	drawBoundary();
		            });
		        });
		      });
	};
	var initMap = function(xhr){
		mapObj.clearMap();
		for (var i = 0; i < xhr.length; i++) {
			var point = JSON.parse(xhr[i].sMiddlepoint);
			var marker = new AMap.Marker({
				map : mapObj,
				label : {
					content : xhr[i].sName,
					offset : new AMap.Pixel(-10, -15),
				},
				position : new AMap.LngLat(point.lng, point.lat)
			});
			var getClickFunc = function(arg0, arg1) {
				var school = arg0;
				var marker = arg1;
				return function() {
					marker.setIcon("/mapserver/image/position.png");
					schoolArray.push(school);
				}
			};
			var clickFunc = getClickFunc(xhr[i], marker);
			window.AMap.event.addListener(marker, 'click', clickFunc);
		}
	}
	$(document).ready(function() {
		$('button[type=submit]').on('click', function() {
			$('#schools').val(valString);
			$('#myForm').submit();
		});
		$("a[attitude=middlePoint]").on('click', function() {
			$('#mymodal').modal('show');
		});
		$('#confirm').on('click', function() {
			console.log(schoolArray);
			var htmlString = "";
			for (var s in schoolArray) {
				if (s == 0) {
					valString = schoolArray[s].sId;
					htmlString = schoolArray[s].sName;
					continue;
				}
				valString = valString + '|' + schoolArray[s].sId;
				htmlString = htmlString + ',' + schoolArray[s].sName;
			}
			$('#schools').val(htmlString);
		});
		init();
		$.ajax({
			type : "GET",
			url : "adminApi/allSchool" ,
			dataType : "json",
			success : initMap
		});
	});
</script>