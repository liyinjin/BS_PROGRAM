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
		function insertClasses(){
			alert(111);
			$("#insertClassesForm").form().form("submit",{
				url:'${pageContext.request.contextPath}/classes/insertClasses',
				success:function(data){
					var json=eval('('+data+')');
					if(json.i==1){
						alert("添加成功");
						$("#classesWin").window("close");
						$("#classesTable").datagrid("reload");
					}
				}
			})
		}
	</script>
	<form action="" id="insertClassesForm" method="post">
		<table>
			<tr>
				<td>班级编号</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>班级名称</td>
				<td><input type="text" name="name"></td>
			</tr>
		</table>
	</form>
	<div style="text-align:right; ;padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			 onclick="insertClasses();">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" 
			 onclick="clear();">关闭</a>
	</div>
</body>
</html>