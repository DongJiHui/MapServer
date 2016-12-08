<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>学区列表</title>
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca76dda02a3f34acd3130993e0b3aed9"></script>
<style>
.jumbotron {
	width: 80%;
	height: 588px;
	float: left;
}
#map-container {
	width : 870px;
	height : 400px;
	position: relative;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/titleBarAdmin.jsp"%>
	<%@ include file="/WEB-INF/jsp/sideBarAdmin.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<table class="table table-hover">
				<tr class="info">
					<th>编号</th>
					<th>学区名</th>
					<th>最后更新时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${schoolAreas}" varStatus="i" var="sa">
					<tr>
						<th>${ i.index + 1 }</th>
						<th>${ sa.saName }</th>
						<th>${ sa.saUpdatetime }</th>
						<th>
							<button type="show" attr="${ sa.saId }"
								class="btn btn-sm btn-primary">查看</button>
							<button type="update" attr="${ sa.saId }"
								class="btn btn-sm btn-default">修改</button>
							<button type="delete" attr="${ sa.saId }"
								class="btn btn-sm btn-danger">删除</button>
						</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="mymodal" class="modal fade bs-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div id="map-container"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
	var mapObj;
	var initMap = function (xhr){
		if (xhr && xhr.resultCode == 0){
			var result = xhr.result;
			$("#myModalLabel").html(result.saName);
			var obj1;
			var obj2;
			if (result.saMiddlepoint != ''){
				  obj1 = JSON.parse(result.saMiddlepoint);
			  } else {
				  obj1 = {
					lng: 116.39,
					lat:  39.9
				  };
			 }
			if (result.saPoints != ''){
				  obj2 = JSON.parse(result.saPoints);
			}
			mapObj.setCenter(new AMap.LngLat(obj1.lng,obj1.lat));
			if (result.saScaleparam){
				mapObj.setZoom(result.saScaleparam);
			}
			var lnglats = [];
			for (var i=0; i<obj2.length; i++){
				lnglats.push(new AMap.LngLat(obj2[i].lng,obj2[i].lat))
			}
			new window.AMap.Polygon({
		          map: mapObj,
		          path: lnglats,
		          strokeColor: "#197DBF",
		          fillColor: "#E6E6E6",
		          fillOpacity: 0.8
		    });
		}
	}
	var initMarkers = function(xhr){
		if (xhr && xhr.resultCode == 0){
			var result = xhr.result;
			console.log(result);
			for (var i=0; i<result.length; i++){
				var point = JSON.parse(result[i].sMiddlepoint);
				var test = function (arg0){
					var id = arg0;
					return function(){
						window.location = 'addSchool?id='+id;
					}
				};
				var testFunc = test(result[i].sId);
				var id = result[i].sId;
				var marker = new AMap.Marker({
					map: mapObj,
					label: {
						content: result[i].sName,
						offset: new AMap.Pixel(-10,-15),
						},
					position: new AMap.LngLat(point.lng,point.lat)
				});
				window.AMap.event.addListener(marker, 'click', testFunc);
			}
		}
	}
	$(document).ready(function() {
		$("button[type=show]").on('click', function() {
			var id = this.getAttribute('attr');
			$('#mymodal').modal('show');
			mapObj = new window.AMap.Map('map-container', {
		        zoom: 11,
		        center: [116.39, 39.9]
		    });
			mapObj.clearMap();
			$.ajax({
				  type: "GET",
				  url: "api/schoolArea?saId="+id,
				  dataType: "json",
				  success: initMap
			});
			$.ajax({
				  type: "GET",
				  url: "api/schoolList?saId="+id,
				  dataType: "json",
				  success: initMarkers 
			});
		});
		$("button[type=update]").on('click', function() {
			var id = this.getAttribute('attr');
			window.location = 'addSchoolArea?id=' + id;
		});
		$("button[type=delete]").on('click', function() {
			var id = this.getAttribute('attr');
			window.location = 'addSchoolArea?id=' + id + "&method=delete";
		});
	});
</script>