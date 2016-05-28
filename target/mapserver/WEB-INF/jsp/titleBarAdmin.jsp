<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.titleBar {
	width:100%;
	height:130px;
	
}
.titleBar-top {
	height :29px;
	background-color:#222222;
	}
.titleBar-top a {
	float : right;
	line-height: 29px;
	margin: 0px 5px 0px 5px;
}
</style>
<div class="titleBar">
	<div class="titleBar-top">
		<a href="<c:url value="/index?method=logout"/>">退出登录</a>
	</div>
</div>