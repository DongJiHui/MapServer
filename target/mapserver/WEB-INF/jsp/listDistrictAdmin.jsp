<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
	<head>
		
		<title>行政区列表</title>
		<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
		<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
		<style>
			.jumbotron {
				width: 80%;
				height: 588px;
				float:left;
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
				 	<th>行政区名</th>
				 	<th>最后更新时间</th>
				 	<th>操作</th>
				 </tr>
				 <c:forEach items="${districts}" varStatus="i" var="district" >
				 	<tr>
				 		<th>${ i.index + 1 }</th>
				 		<th>${ district.dName }</th>
				 		<th>${ district.dUpdatetime }</th>
				 		<th>
				 			<button type="update" attr="${ district.dId }" class="btn btn-sm btn-default">修改</button>
				 			<button type="delete" attr="${ district.dId }"class="btn btn-sm btn-danger">删除</button>
				 		</th>
				 	</tr>
				 </c:forEach>
			</table>
		  </div>
		</div>
	</body>
</html>
<script>
	$(document).ready(
		function(){
			$("button[type=update]").on('click',function(){
				var id = this.getAttribute('attr');
				window.location = 'addDistrict?id='+id;
			});
			$("button[type=delete]").on('click',function(){
				var id = this.getAttribute('attr');
				window.location = 'addDistrict?id='+id+"&method=delete";
			});
		}
	);
</script>