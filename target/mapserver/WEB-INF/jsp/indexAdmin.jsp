<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/JSPComHead.inc"%>
<!DOCTYPE html>
<html>
<head>

<title>首页</title>
<%@ include file="/WEB-INF/include/JavsScriptAdmin.inc"%>
<%@ include file="/WEB-INF/include/StyleSheetAdmin.inc"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/index.css"/>" />
<style>
</style>
</head>
<body>
	<div class="page">
		<div class="header"></div>
		<div class="body" style="background-image:url(<c:url value="/image/login_bg.jpg"/>)">
			<div class="jumbotron login-jumbotron">
				<form action="<c:url value="/index"/>" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="username">用户名：</label> <input
							class="form-control" id="username" name="username"
							placeholder="请输入用户名">
					</div>
					<div class="form-group">
						<label for="password">密码：</label> <input
							type="password" class="form-control" id="password" name="pwd"
							placeholder="请输入密码">
					</div>
					<button type="submit" name="method" value="login" class="btn btn-default">登陆</button>
				</form>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>
