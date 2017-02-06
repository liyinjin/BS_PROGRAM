<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../js/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../js/demo.css">
	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/Fenye.js">
	</script>
</head>
<body>
	<script type="text/javascript">
		function insertUser(){
			$("#adduserform").form().form("submit",{
				url:'${pageContext.request.contextPath}/my/insertUser',
				success:function(data){
					var json=eval('('+data+')');
					if(json.i=1){
						alert("添加成功");
						$("#PortWin").window("close");
					}
				}
			})
		}
		function clear(){
			$("#PortWin").window("close");
		}
	</script>
	<form action="" id="adduserform" method="post">
		<table>
			<tr>
				<td>账户</td>
				<td><input type="text" name="userId"/></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="userName"/></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>创建人</td>
				<td><input type="hidden" name="createby" value="李迎金"/>李迎金</td>
			</tr>
			<tr>
				<td>用户角色关联ID</td>
				<td><input type="text" name="ufID"/></td>
			</tr>
			<tr>
				<td>角色ID</td>
				<td><span class="form-radio-group">
		                <input type="radio" name="roleId" value="1"/>管理员
		                <input type="radio" name="roleId" value="2"/>学生
		                <input type="radio" name="roleId" value="3"/>教师
	           		</span>
				</td>
			</tr>
		</table>
	</form>
	<div style="text-align:right; ;padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			 onclick="insertUser();">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			 onclick="clear();">关闭</a>
	</div>
</body>
</html>