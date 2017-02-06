   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
</head>
<body>
<script type="text/javascript">

$(function(){
	
})


function hides(){
	$(".tree-collapsed").hide();
	
}

function menuCheck(node){
	$("#maintabs").tabs("add",{
		title:node.text,
		href:node.attributes.url,
		closable:true
	});
}

function falses(){
	return false;
}



</script>
<ul class="easyui-tree" data-options="url:'${pageContext.request.contextPath}/rfc/findbyModule?module=${param.module}', treeField:'text', onClick:menuCheck ,onBeforeExpand:falses,onLoadSuccess:hides" ></ul>
</body>
</html>