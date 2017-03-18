<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/15
  Time: 下午3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>已选课程</title>
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
            $("#checkCourseTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'course/checkAlreadyStudentCourse',
                columns:[[
                    {field:'id',title:'课程编号'},
                    {field:'name',title:'课程名称'},
                    {field:'allScores',title:'学分'},
                    {field:'classroomName',title:'教室'},
                    {field:'learnDay',title:'上课日期'},
                    {field:'time',title:'上课时间'},
                    {field:'userName',title:'任课教师'},
                    {field:'tt',title:'删除已选课程',
                        formatter:function () {
                            var srr='<button id="but" type="button" onclick="delStudentCourse();">确定</button>';
                            return srr;
                        }
                    }
                ]]
            });
        })

        function delStudentCourse() {
            var aa=$("#checkCourseTable").datagrid("getSelected");
            if (aa==null){
                alert("请选择要删除的已选课程");
            }else{
                var da=$("#checkCourseTable").datagrid("getSelected");
                $.ajax({
                    type:'post',
                    url:'course/deleteStudentCourse',
                    data:{'courseId':da.id},
                    success:function (data) {
                        var json=data.i;
                        if(json==1){
                            alert("删除成功");
                            $("#checkCourseTable").datagrid("reload");
                            $("#studentCourseTable").datagrid("reload");
                        }
                    }
                })
            }
        }
    </script>
    <form action="" id="checkCourseForm" method="post">
        <table id="checkCourseTable">
        </table>
    </form>
</body>
</html>
