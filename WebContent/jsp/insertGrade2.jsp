<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/27
  Time: 下午5:26
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
        var ccgrade;
        $(document).ready(function () {
            $("#gradeInsertTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'my/selectTeacherStudent',
                columns:[[
                    {field:'id',title:'学生编号'},
                    {field:'userName',title:'学生姓名'},
                    {field:'ddddaaa',title:'操作',
                        formatter:function () {
                            var rrrg='<button id="but" type="button" onclick="insertGrades();">确定</button>';
                            return rrrg;
                        }
                    }
                ]]
            })
        })

        function insertGrades() {
            ccgrade=$("#gradeInsertTable").datagrid("getSelected");
            if(ccgrade==null){
                alert("请选择学生");
                return;
            }else{
                $("#gradeInsertWin").window({
                    width:300,
                    height:300,
                    href:'jsp/insertGrade1.jsp'
                })
            }
        }
    </script>
    <form id="gradeInsertForm" action="" method="post">
        <table id="gradeInsertTable">

        </table>
    </form>
    <div id="gradeInsertWin"></div>
</body>
</html>
