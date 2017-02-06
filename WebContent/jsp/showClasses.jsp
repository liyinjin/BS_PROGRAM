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
		function addClasses(){
			$("#classesWin").window({
				width:200,
				height:200,
				title:'添加班级',
				href:'jsp/insertClasses.jsp'
			})
		}
		function delClasses(){

			row=$("#classesTable").datagrid("getSelected");
			if(row==null){
				alert("请选择要删除的用户");
				return
			}else {
			    var url="classes/delClasses";
			    $.post(url,row,delClassesSuccess);
			}
		}

		function delClassesSuccess(data) {

            var json=data.i;
            if(json==1){
                alert("删除成功");
                $("#classesTable").datagrid("reload");
            }
        }

        function upClasses(){
            row=$("#classesTable").datagrid("getSelected");
            if (row==null){
                alert("请选择班级");
                return;
            }else{
                $("#classesWin").window({
                    width:220,
                    height:220,
                    href:'jsp/upClasses.jsp'
                })
            }
        }
	</script>
	<form action="" id="classesForm" method="post">
		<table id="classesTable" class="easyui-datagrid" data-options="url:'${pageContext.request.contextPath}/classes/findall',toolbar:'#classttb',singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'id'">班级编号</th>
					<th data-options="field:'name'">班级名称</th>
				</tr>
			</thead>
		</table>
	</form>
		<div id="classttb">
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				data-options="iconCls:'icon-add',plain:true" onclick="addClasses();">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				data-options="iconCls:'icon-edit',plain:true" onclick="upClasses();">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" 
				data-options="iconCls:'icon-cut',plain:true" onclick="delClasses();">删除</a>
	</div>
	<div id="classesWin"></div>
</body>
</html>