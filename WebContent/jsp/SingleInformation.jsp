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
        function selectSingle() {
            var idQu = $("#idQu").val();
            $("#SingleInformationTable").datagrid({
                url:'my/findUserById',
                queryParams:{
                    id:idQu
                },
                idField:'id'
            });
            alert(1);
            $("#SingleInformationTable").datagrid('reload');
        }
    </script>
    请输入账号：
    <input type="text" id="idQu" name="id">
    <input type="submit" name="查询" onclick="selectSingle()">
    <%--<form id="SingleInformationForm" action="" method="post">--%>
        <%--<table id="SingleInformationTable" class="easyui-datagrid">--%>
            <%--<tr>--%>
                <%--<th data-options="field:'id'">账户</th>--%>
                <%--<th data-options="field:'userName'">密码</th>--%>
                <%--<th data-options="field:'className'">姓名</th>--%>

            <%--</tr>--%>
        <%--</table>--%>
    <%--</form>--%>
    <form action="" id="SingleInformationForm" method="post">
        <table id="SingleInformationTable" class="easyui-datagrid">
            <thead>
            <tr>
                <th data-options="field:'id'">账户</th>
                <th data-options="field:'userName'">姓名</th>
                <th data-options="field:'className'">班级</th>
            </tr>
            </thead>
        </table>
    </form>
</body>
</html>
