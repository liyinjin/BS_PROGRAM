<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
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
		var row;
		function editPassword(){
			row=$("#userTable").datagrid("getSelected");
			if(row==null){
				alert("请选择要修改的用户");
				return;
			}else{
				$("#PortWin").window({
					width:350,
					height:200,
					href:'jsp/updatePassword.jsp'
				})
			}
		}

		function delUser(){
			row=$("#userTable").datagrid("getSelected");
			if(row==null){
				alert("请选择要删除的用户");
				return;
			}else{
				var url='my/delUser';
				$.post(url,row,delSuccess);
			}
		}
		function delSuccess(data){
			var json=eval('('+data+')');
			if(json.i==1){
				alert("删除成功");
				$("#userTable").datagrid("reload");
			}
		}
		function addUser(){
			$("#PortWin").window({
				width:310,
				height:225,
				title:'修改用户信息',
				href:"jsp/insertUser.jsp"
			})
		}
		function find(){
			var value=$("#ridvalue").val();
			$("#userTable").datagrid({
				url:'my/findallUser',
				 queryParams: {
					 roleId: value
					},
				idField:'id'
				
			});
 			$("#userTable").datagrid('reload');
		}
	</script>
	<form action="" id="userForm" method="post">
		<table id="userTable" class="easyui-datagrid" data-options="toolbar:'#porttb'">
			<thead>
				<tr>
					<th data-options="field:'id'">账户</th>
					<th data-options="field:'password'">密码</th>
					<th data-options="field:'userName'">姓名</th>
					<th data-options="field:'name'">角色</th>
				</tr>
			</thead>
		</table>
	</form>
	<div id="porttb">
		<select id="ridvalue">
			<option name="rId" value="">所有用户</option>
			<option name="rId" value="1">管理员</option>
			<option name="rId" value="2">学生</option>
			<option name="rId" value="3">教师</option>
		</select>
		<a  class="easyui-linkbutton" 
			data-options="iconCls:'icon-add',plain:true" onclick="find();">
			<input type="button" value="查询"></a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			data-options="iconCls:'icon-add',plain:true" onclick="addUser();">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			data-options="iconCls:'icon-edit',plain:true" onclick="editPassword();">修改</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			data-options="iconCls:'icon-cut',plain:true" onclick="delUser();">删除</a>
	</div>
<div id="PortWin"></div>
</body>
</html>