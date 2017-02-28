<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/18
  Time: 下午2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="js/demo.css">
    <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/Fenye.js">
    </script>
</head>
<body>
<script>

    $(document).ready(function () {
        $("#teacherForm").form().form("load",row);
    });

    $(document).ready(function () {

        $("#teacherTable").datagrid({
            border:false,
            fitColumns:true,
            singleSelect:true,
            url:'publish/showTeacher',
            columns:[[
                {field:'id',title:'教师编号'},
                {field:'userName',title:'教师名称'},
                {field:'subject',title:'课程'},
                {field:'insertTeacher',title:'添加',
                    formatter:function () {
                        var sttr='<button id="but" type="button" onclick="insertCourseTeacher();">确定</button>';
                        return sttr;
                    }
                }
            ]],

        });
    });

    function insertCourseTeacher() {
        var v=$("#teacherTable").datagrid("getSelected");
        var ii=document.getElementById("inpu");
        if (v==null){
            alert("请选择要添加的教师");
            return;
        }else {

            $.ajax({
                type:'post',
                url:'publish/insertCourseTeacher',
                data:{'id':ii.value,'teacherId':r.id},
                success:function (data) {
                    var json=data.i;
                    if (json==1){
                        alert("添加教师成功");
                        $("#publishWin").window("close");
                    }
                }
            })
        }
    }
</script>
<form id="teacherForm" action="" method="post">
    <table>
        <div>
            <table>
                <tr>
                    <td>课程编号</td>
                    <td><input type="text" id="inpu" name="id"></td>
                </tr>
            </table>
        </div>
        <div>
            <table id="teacherTable" class="easyui-datagrid">
            </table>
        </div>
    </table>
</form>
</body>
</html>
