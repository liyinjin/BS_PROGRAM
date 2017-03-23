<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/19
  Time: 下午2:49
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
            $("#TeacherSubjectTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'my/selectTeacherSubject',
                columns:[[
                    {field:'userName',title:'教师名称'},
                    {field:'subject',title:'所任课程'}
                ]]
            })
        })
    </script>
    <form id="TeacherSubjectForm" action="" method="post">
        <table id="TeacherSubjectTable">
        </table>
    </form>
</body>
</html>
