<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/20
  Time: 上午11:44
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
    <title>Title</title>
</head>
<body>
    <script>
        $(document).ready(function () {
            $("#TeacherStudentTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'my/selectTeacherStudent',
                columns:[[
                    {field:'id',title:'学生ID'},
                    {field:'userName',title:'学生姓名'},
                    {field:'phone',title:'学生联系方式'}
                ]]
            })
        })
    </script>
    <form action="" id="TeacherStudentForm" method="post">
        <table id="TeacherStudentTable">
        </table>
    </form>
</body>
</html>
