<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>集合列表</title>
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
	width: 870px;
	height: 400px;
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
					<th>集合名</th>
					<th>集合类型</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${unions}" varStatus="i" var="union">
					<tr>
						<th>${ i.index + 1 }</th>
						<th>${ union.unName }</th>
						<th>${ types[union.unType] }</th>
						<th>
							<button type="inspect" attr="${ union.unId }" attrName="${ union.unName }" 
								class="btn btn-sm btn-default">查看</button>
							<button type="delete" attr="${ union.unId }"
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
	var initMap = function(xhr) {
		console.log(xhr)
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
		}
	}
	$(document).ready(function() {
		$("button[type=inspect]").on('click', function() {
			$('.modal-title').html(this.getAttribute('attrName'))		
			$('#mymodal').modal('show');
			mapObj = new window.AMap.Map('map-container', {
				zoom : 11,
				center : [ 116.39, 39.9 ]
			});
			mapObj.clearMap();
			var id = this.getAttribute('attr');
			$.ajax({
				type : "GET",
				url : "adminApi/schoolByUnId?unId=" + id,
				dataType : "json",
				success : initMap
			});
		});
		$("button[type=delete]").on('click', function() {
			var id = this.getAttribute('attr');
			window.location = 'addUnion?id=' + id + "&method=delete";
		});
	});
</script>