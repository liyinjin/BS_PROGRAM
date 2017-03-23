<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/demo.css">
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
<div class="easyui-accordion" fit="true" id='sideBar'>
	<c:if test="${sessionScope.roleId=='1'}">
		<div title="基础数据" data-options="href:'jsp/menuTree.jsp?module=1'"></div>
		<div title="排课管理" data-options="href:'jsp/menuTree.jsp?module=2'"></div>
	</c:if>
	<c:if test="${sessionScope.roleId=='2'}">
		
		<div title="选课" data-options="href:'jsp/menuTree.jsp?module=1'"></div>
		<div title="个人信息" data-options="href:'jsp/menuTree.jsp?module=3'"></div>
	</c:if>
	<c:if test='${sessionScope.roleId=="3"}'>
		<div title="课程信息" data-options="href:'jsp/menuTree.jsp?module=1'"></div>
		<div title="个人信息" data-options="href:'jsp/menuTree.jsp?module=3'"></div>
	</c:if>
</div>
</body>
</html>