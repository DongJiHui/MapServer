<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.list-group {
	width: 18%;
	text-align: center;
	margin: 0 5px 0px 8px;
	float: left;
}
</style>
<div class="list-group">
  <a href="#" class="list-group-item" location="addDistrict">添加行政区</a>
  <a href="#" class="list-group-item" location="listDistrict">行政区列表</a>
  <a href="#" class="list-group-item" location="addSchoolArea">添加学区</a>
  <a href="#" class="list-group-item" location="listSchoolArea">学区列表</a>
  <a href="#" class="list-group-item" location="addSchool">添加学校</a>
  <a href="#" class="list-group-item" location="listSchool">学校列表</a>
  <a href="#" class="list-group-item" location="connectSchool">关联学校</a>
  <a href="#" class="list-group-item" location="addResource">添加教育资源</a>
  <a href="#" class="list-group-item" location="listResource">教育资源列表</a>
  <a href="#" class="list-group-item" location="addUnion">添加集合</a>
  <a href="#" class="list-group-item" location="listUnion">集合列表</a>
</div>
<script>
	$(document).ready(
		function(){ 
			var tempArr = window.location.pathname.split('/');
			var nowLocation = tempArr[tempArr.length-1];
			$("a[location="+nowLocation+"]").addClass("active");
			$(".list-group a").on('click',function(){
				window.location = this.getAttribute('location');
			});
		}
	);
</script>