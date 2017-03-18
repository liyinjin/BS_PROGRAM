<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/18
  Time: 下午1:31
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
    <title>查询学分</title>
</head>
<body>
    <script>
        $(document).ready(function () {
            $("#QueryTable").datagrid({
                border:true,
                fitColumns:true,
                SingleSelect:true,
                url:'course/queryScores',
                columns:[[
                    {field:'name',title:'所选课程'},
                    {field:'allScores',title:'所选课程学分'}
                ]]
            })
        })
    </script>
    <form action="" id="QueryForm" method="post">
        <table id="QueryTable">
        </table>
    </form>
</body>
</html>
