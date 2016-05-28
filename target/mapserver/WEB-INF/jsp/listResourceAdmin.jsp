<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
	<head>
		
		<title>教育资源列表</title>
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
		  	<div class="row">
			  	 <div class="col-lg-4 col-lg-offset-8 form-inline">
					<label  for="districtName" >选择学区：</label>
					    <select class="form-control" id="schoolAreaId">
					       <c:forEach items="${schoolAreas}" varStatus="i" var="schoolArea" >
					          	<option <c:if test="${ schoolAreaId eq schoolArea.saId }">selected="selected"</c:if> value="${ schoolArea.saId }">${ schoolArea.saName }</option>
					       </c:forEach>
					    </select>
				</div>
			</div>
			<table class="table table-hover">
			  	 <tr class="info">
			  	 	<th>编号</th>
				 	<th>教育资源名</th>
				 	<th>最后更新时间</th>
				 	<th>操作</th>
				 </tr>
				 <c:forEach items="${resources}" varStatus="i" var="resource" >
				 	<tr>
				 		<th>${ i.index + 1 }</th>
				 		<th>${ resource.rName }</th>
				 		<th>${ resource.rUpdatetime }</th>
				 		<th>
				 			<button type="update" attr="${ resource.rId }" class="btn btn-sm btn-default">修改</button>
				 			<button type="delete" attr="${ resource.rId }"class="btn btn-sm btn-danger">删除</button>
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
			$("#schoolAreaId").change(function (){
				var id = $(this).children('option:selected').val();
				window.location = 'listResource?schoolAreaId='+id;
			});
			$("button[type=update]").on('click',function(){
				var id = this.getAttribute('attr');
				window.location = 'addResource?id='+id;
			});
			$("button[type=delete]").on('click',function(){
				var id = this.getAttribute('attr');
				window.location = 'addResource?id='+id+"&method=delete";
			});
		}
	);
</script>