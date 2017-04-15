<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/7
  Time: 上午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>个人信息</title>
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
        $(function () {
            $("#SingleInformationTable").datagrid({
                singleSelect:true,
                fitColumns:true,
                url:'my/findUserById',
                columns:[[
                    {field:'id',title:'账号'},
                    {field:'userName',title:'姓名'},
                    {field:'password',title:'密码'},
                    {field:'phone',title:'联系方式'}
                ]]
            });
            $("#SingleInformationTable").datagrid('reload');
        })
    </script>
    <form action="" id="SingleInformationForm" method="post">
        <table id="SingleInformationTable" class="easyui-datagrid">
        </table>
    </form>
</body>
</html>
