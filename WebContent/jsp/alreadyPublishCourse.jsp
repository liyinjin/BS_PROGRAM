<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/22
  Time: 上午10:17
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
    <title>已发布的课程</title>
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
            $("#alreadyTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'publish/selectAlReadyPublishCourse',
                columns:[[
                    {field:'id',title:'课程编号'},
                    {field:'name',title:'课程名称'},
                    {field:'allScores',title:'学分'},
                    {field:'person',title:'上课人数'}
                ]]
            })
        })
    </script>
    <form id="alreadyForm" action="" method="post">
        <table id="alreadyTable" class="easyui-datagrid">
        </table>
    </form>
</body>
</html>
