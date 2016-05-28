<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>添加学区</title>
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
			<form id="myForm" action="<c:url value="/addSchoolArea"/>" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${ schoolArea.saId }" />
				<div class="row">
					<div class="col-lg-5">
						<div class="form-group">
							<label for="areaName">学区名称：</label> <input type="text"
								value="${ schoolArea.saName  }" class="form-control"
								id="areaName" name="name" placeholder="请输入学区名称">
						</div>
						<div class="form-group">
							<label for="districtName">学区所属行政区：</label> <select
								class="form-control" name="districtId">
								<c:forEach items="${districts}" varStatus="i" var="district">
									<option
										<c:if test="${ schoolArea.districtId eq district.dId }">selected="selected"</c:if>
										value="${ district.dId }">${ district.dName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="areaDesc">学区描述：</label>
							<textarea id="areaDesc" class="form-control" name="desc" rows="4"
								placeholder="请输入学区描述">${ schoolArea.saDescription  }</textarea>
						</div>
						<div class="form-group">
							<label for="middlePoint">学区中心点坐标：</label> <input type="text"
								readonly='true' value='${ schoolArea.saMiddlepoint }'
								class="form-control" target="middlePoint" id="middlePoint"
								name="middlePoint" placeholder="请在地图上选择" /> <a
								attitude="middlePoint" class="btn btn-sm btn-default" href="#"
								role="button">在地图上选择</a>
						</div>
					</div>
					<div class="col-lg-5 col-lg-offset-1">
						<div class="form-group">
							<label for="points">学区边界坐标围成点列：</label>
							<textarea id="points" readonly='true' target="pointsContent"
								name="points" class="form-control" rows="4"
								placeholder="请在地图上选择">${ schoolArea.saPoints  }</textarea>
							<a attitude="points" class="btn btn-sm btn-default" href="#"
								role="button">在地图上选择</a>
						</div>
						<div class="form-group">
							<label for="scaleNum">地图显示缩放比例：</label> <input id="scaleNum"
								readonly='true' type="text"
								value="${ schoolArea.saScaleparam  }" class="form-control"
								target="scaleNum" name="scaleNum" placeholder="完成勾画学区后自动获取" />
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
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">
								<div id="tip">
									<input type="text" id="keyword" name="keyword"
										value="请输入关键字：(选定后搜索)" onfocus='this.value=""' />
								</div>
								<div id="map-container"></div>
							</div>
							<div class="modal-footer">
								<button target="makepolygon" type="button"
									class="btn btn-success">连成回路</button>
								<button target="clearall" type="button" class="btn btn-warning">清空点列</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row">
				<button type="submit" class="col-lg-2 col-lg-offset-4 btn btn-default">提交</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var tagMode;
var middlePoint;
var districtBoudary;
var districtBoudaryLine;
var PointsModel = function () {
    var points = []
    return {
      push: function (lnglat) {
        points.push(lnglat);
      },
      length: function () {
        return points.length;
      },
      getLast: function () {
        return points[points.length - 1];
      },
      getAll: function () {
        return points;
      },
      update: function (lnglat, lnglat_id) {
        for (var i = 0; i < points.length; i++) {
          if (points[i] === lnglat_id) {
            break;
          }
        }
        points[i] = lnglat;
      },
      getByIdex: function(index){
    	  return points[index];
      },
      delete: function (lnglat_id) {
        for (var i = 0; i < points.length; i++) {
          if (points[i] === lnglat_id) {
            break;
          }
        }
        points.splice(i, 1);
      },
      clearAll: function () {
        points.splice(0, points.length);
      },
      outputAsJson: function () {
    	 var jsonPoints = [];
    	 for (var i in points){
    		 var jsonPoint = {
    			lng: points[i].lng,
    			lat: points[i].lat
    		 };
    		 jsonPoints.push(jsonPoint);
    	 }
    	 return JSON.stringify(jsonPoints);
      },
      initAsJsonString: function (jsonString) {
    	  if (jsonString === ''){
    		  return;
    	  } else {
    		  var jsonObj = JSON.parse(jsonString);
    		  for (var i in jsonObj){
    		  	points.push(new AMap.LngLat(jsonObj[i].lng, jsonObj[i].lat));
    		  }
    	  }
      }
    };
  }
  var mapObj;
  var polyline;
  var polygon;
  var onclicklistener;
  var pointsModel = PointsModel();
  var notify = function(){
	  switch (tagMode){
	  case 0 : 
		  var tempPoint = {
			  lng: middlePoint.getPosition().lng,
			  lat: middlePoint.getPosition().lat
	  	  }
		  $('input[target=middlePoint]').attr('value',JSON.stringify(tempPoint));
		  break;
	  case 1 :
		  $('textarea[target=pointsContent]').html(pointsModel.outputAsJson());
		  break;
	  }
  }
  var redraw = function (mode, arg1) {
	  var deleteFunction = function(lnglat_id){
		  return function(e){
			  var infoWindow;
	          var button = document.createElement('button');
	          button.setAttribute('type', 'button');
	          button.setAttribute('class', 'btn btn-warning');
	          button.innerHTML = '删除';
	          window.$(button).on('click', function () {
	        	  pointsModel.delete(lnglat_id);
		          notify();
		          redraw('delete', lnglat_id);
		          infoWindow.close();
	          });
	          infoWindow = new window.AMap.InfoWindow({
	              content: button
	            })
	          infoWindow.open(mapObj, e.lnglat);
		  };
	  };
	  var draggingFunction = function(lnglat_id){
		  return function(e){
			  /*switch (tagMode){
	      	  case 0 :
	      		  break;
	      	  case 1:*/
		          pointsModel.update(e.lnglat, lnglat_id);
		          lnglat_id = e.lnglat;
		          this.setPosition(e.lnglat);
		          notify();
		          redraw('update');
		          /* break;
	         }*/
		  };
	  }
    switch (mode) {
      case 'add':
        var lnglat_id = pointsModel.getLast();
        var marker = new window.AMap.Marker({
          position: lnglat_id,
          map: mapObj,
          draggable: true,
          clickable: true
        });
        if (polyline) {
          mapObj.remove(polyline);
        }
        polyline = new window.AMap.Polyline({
          map: mapObj,
          path: pointsModel.getAll()
        })
        
        var test = deleteFunction(lnglat_id);
        // 添加点的点击事件监听
        window.AMap.event.addListener(marker, 'click', test);
        
        var test2 = draggingFunction(lnglat_id);
        // 添加点的拖拽事件监听
        window.AMap.event.addListener(marker, 'dragging', test2);
        break;
      case 'update':
        if (polygon) {
          mapObj.remove(polygon)
          polygon = new window.AMap.Polygon({
            map: mapObj,
            path: pointsModel.getAll()
          })
        }
        mapObj.remove(polyline)
        polyline = new window.AMap.Polyline({
          map: mapObj,
          path: pointsModel.getAll()
        })
        break;
      case 'delete':
        var deleteMarker;
        var markers = mapObj.getAllOverlays('marker')
        for (var i = 0; i < markers.length; i++) {
          if (markers[i].getPosition() === arg1) {
        	  deleteMarker = markers[i]
            break;
          }
        }
        mapObj.remove([deleteMarker])
        mapObj.remove(polyline)
        polyline = new window.AMap.Polyline({
          map: mapObj,
          path: pointsModel.getAll()
        })
        if (polygon) {
            mapObj.remove(polygon)
            polygon = new window.AMap.Polygon({
              map: mapObj,
              path: pointsModel.getAll()
            })
        }
        break;
      case 'init':
    	  var points = pointsModel.getAll()
    	  for (var i=0; i<points.length; i++){
    		  var deleteID = pointsModel.getByIdex(i);
    		  var marker = new window.AMap.Marker({
    	          position: points[i],
    	          map: mapObj,
    	          draggable: true,
    	          clickable: true
    	        });
    		 
    		  var test = deleteFunction(points[i]);
    		  window.AMap.event.addListener(marker, 'click', test);
    		  
    		  var test2 = draggingFunction(points[i]);
    	        window.AMap.event.addListener(marker, 'dragging', test2);
    	  }
    	  polyline = new window.AMap.Polyline({
              map: mapObj,
              path: pointsModel.getAll()
            })
    	  
    }
  }
  var _onClick = function (e) {
	  switch (tagMode){
	  case 0 : 
		  if (middlePoint) {
			  mapObj.remove(middlePoint);
		  }
		  middlePoint = new window.AMap.Marker({
	          position: e.lnglat,
	          map: mapObj,
	          draggable: false,
	          clickable: false,
	          label : {
	        	  content: "中心点",
	        	  offset: new AMap.Pixel(-13,-10)
	          }
	        });
		  mapObj.setCenter(e.lnglat);
		  notify();
		  break;
	  case 1:
		  pointsModel.push(e.lnglat);
		  notify();
		  redraw('add');
		  break;
	  }
   
  };
  
  var _onZoomend = function (){
	  $('input[target=scaleNum]').attr('value',mapObj.getZoom());
  }
  
  var drawBoundary = function(){
	  if (districtBoudaryLine) {
		  mapObj.remove([districtBoudaryLine]);
	  } 
	  console.log(districtBoudary);
	  districtBoudaryLine = new window.AMap.Polyline({
		  map: mapObj,
		  path: districtBoudary,
		  strokeColor: '#2F88C1',
		  strokeStyle: 'dashed' ,
		  strokeOpacity:0.9
	  });
  }
  
  var init = function () {
	  var arg0 = $('input[target=scaleNum]').attr('value');
	  if (arg0 === ''){
		  arg0 = 11;
	  }
	  var arg1 = $('input[target=middlePoint]').attr('value');
	  var obj1;
	  if (arg1 != ''){
		  obj1 = JSON.parse(arg1);
	  } else {
		  obj1 = {
			lng: 116.39,
			lat:  39.9
		  };
	  }
	  var arg2 = $('textarea[target=pointsContent]').html();
      mapObj = new window.AMap.Map('map-container', {
        zoom: arg0,
        center: [obj1.lng, obj1.lat]
      })
      if (arg1 != ''){
		  middlePoint = new window.AMap.Marker({
	          position: new AMap.LngLat(obj1.lng, obj1.lat),
	          map: mapObj,
	          draggable: false,
	          clickable: false,
	          label : {
	        	  content: "中心点",
	        	  offset: new AMap.Pixel(-13,-10)
	          }
	        });
	  }
      pointsModel.initAsJsonString(arg2);
      redraw('init');
      mapObj.setDefaultCursor('default')
      onclicklistener = window.AMap.event.addListener(mapObj, 'click', _onClick);
      window.AMap.event.addListener(mapObj, 'zoomend' ,_onZoomend);
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
  }
  var initModalView = function () {
	  switch (tagMode) {
	  case 0 :
		  $('#myModalLabel').html('请标出学区展示中心点');
		  $("button[target=makepolygon]").hide();
		  $("button[target=clearall]").hide();
		  break;
	  case 1 :
		  $('#myModalLabel').html('请在地图上勾画学区');
		  $("button[target=makepolygon]").show();
		  $("button[target=clearall]").show();
		  break;
	  }
	  
  }
  var makePolygon = function () {
	  if (polygon) {
		  mapObj.remove([polygon]);
		  onclicklistener = window.AMap.event.addListener(mapObj, 'click', _onClick);
		  polygon = null;
		  $("button[target=makepolygon]").html("连成回路");
		  $("button[target=clearall]").removeAttr("disabled");
		  return;
	  } else {
	  	if (pointsModel.length() < 3 || polygon) {
          return;
        }
        polygon = new window.AMap.Polygon({
          map: mapObj,
          path: pointsModel.getAll()
        });
        window.AMap.event.removeListener(onclicklistener);
        $("button[target=makepolygon]").html("继续添加点");
        $("button[target=clearall]").attr("disabled","disabled");
	  }
   }
  
	
  var clearAll = function () {
	  pointsModel.clearAll();
	  notify();
      mapObj.clearMap();
      if (middlePoint)
      	mapObj.add([middlePoint]);
      drawBoundary();
  }
  
  $(document).ready(
	function() {
		$('button[type=submit]').on('click',function(){
			$('#myForm').submit();
		});
		$("a[attitude=middlePoint]").on('click',function () {
			tagMode = 0;
			$('#mymodal').modal('show');
			initModalView();
		});
		$("a[attitude=points]").on('click',function () {
			tagMode = 1;
			$('#mymodal').modal('show');
			initModalView();
		});
		init();
		$("button[target=makepolygon]").on('click',makePolygon);
		$("button[target=clearall]").on('click',clearAll);
	}	  
  )
</script>