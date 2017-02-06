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
  <script type="text/javascript" src="js/Fenye.js">
  </script>
</head>
<body  class="easyui-layout">
	<script type="text/javascript">
		function exect(){
			localhost.href='login.html';
		}
	</script>
  <div data-options="region:'north',border:false" class="header">
    <div class="logo">
      <img src="img/timg.jpg">
      <span>
        学生选课系统
      </span>
    </div>
    <div class="btn-group">
      <span>修改密码</span>
      <span onclick="javascript:location.href='login.html'">退出登录</span>
    </div>
  </div>
  <div data-options="region:'west',split:true,title:'系统功能',href:'jsp/menu.jsp'" style="width:150px;"></div>
  <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
  <div data-options="region:'south',border:false" class="footer" style="height:40px;line-height:40px;">
    学生管理系统
  </div>
  <div data-options="region:'center'">
    <div class="easyui-tabs" id="maintabs" fit="true"></div>
  </div>
</body>
</html>