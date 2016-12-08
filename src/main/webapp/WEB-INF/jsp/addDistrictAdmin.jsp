<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
	<head>
		
		<title>添加行政区</title>
		<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
		<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
		<script src="<c:url value="/js/validator.js"/>" type="text/javascript"></script>
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
		  	 <form role="form" id="myForm" class="form-inline" action="<c:url value="/addDistrict"/>" method="POST" enctype="multipart/form-data">
		        <input type="hidden" name="id" value="${ district.dId }"/>
		        <div class="row">
		          <label class="col-md-2 col-md-offset-1 control-label" for="areaName" >行政区名称：</label>
		          <div class="col-md-6 form-group">
		            <input type="text" value="${ district.dName  }" data-error="该行政区名已存在" data-remote="adminApi/districtCheck"
		              class="form-control" id="areaName" name="name" placeholder="请输入行政区名称" required>
		              <div class="help-block with-errors"></div>
		          </div>
		        </div>
		        <input type="hidden" name="method" value="add_update" />
		      
		      
		       </form>
		       <div class="row">
		        	<button type="submit"class="col-md-1 col-md-offset-2 btn btn-default">提交</button>
		       </div>
		  </div>
		</div>
	</body>
</html>
<script>
$(document).ready(function() {
	$('#myForm').validator();
	$('button[type=submit]').on('click',function(){
		$('#myForm').validator('validate');
		$('#myForm').submit();
	});
});
</script>
