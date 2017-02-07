<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<body>
	<script type="text/javascript">
		$(function(){
			$("#updatePasswordForm").form().form("load",row);
		})
		
		function validate(){
			var pwd=document.getElementById("pwd").value;
			var password=document.getElementById("password").value;
			if(pwd==password){
				document.getElementById("pd").innerHTML="<font color='green'>&nbsp;&nbsp;✔两次密码相同</font>";
				document.getElementById("submit").disabled = false;
			}else{
				document.getElementById("pd").innerHTML="<font color='red'> &nbsp;&nbsp;❌两次密码不相同</font>";
				document.getElementById("submit").disabled = true;
			}
		}
		
		function updatePassword(){
			var value=$("#password").val();
			queryParams: {
				 password: value
				};
			$("#updatePasswordForm").form().form("submit",{
				url:'${pageContext.request.contextPath}/my/updatePassword',
				success:function(data){
					var json=eval('('+data+')');
					if(json.i==1){
						alert("修改成功");
						$("#PortWin").window("close");
						$("#userTable").datagrid("reload");
					}
				}
			});
		}
		function clear(){
			$("#PortWin").window("close");
		}
		
	</script>
	<form action="" id="updatePasswordForm" method="POST">
		<table id="updataPasswordTb">
			<tbody>
				<tr>
					<td>请输入账号</td>
					<td><input type="text" missingMessage="账号必须填写" size="20" name="id"></td>
				</tr>
				<tr>
					<td>请输入密码</td>
					<td><input type="text" required="true" missingMessage="密码必须填写" size="20" name="password" id="pwd"></td>
				</tr>
				<tr>
					<td>请重复密码</td>
					<td><input type="text" required="true" missingMessage="密码必须填写" size="20" name="password" id="password" onkeyup="validate()"><span id="pd"></span></td>
				</tr>
			</tbody>
		</table>
	</form>
	<div style="text-align:right;padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatePassword()" id="submit">保存</a>
	</div>
</body>
</html>