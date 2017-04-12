<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/27
  Time: 下午2:42
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

        $(document).ready(function () {
            $("#gradeForm").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'my/selectTeacherStudent',
                columns:[[
                    {field:'id',title:'学生编号'},
                    {field:'userName',title:'学生姓名'},
                    {field:'dt',title:'添加成绩',
                        formatter:function () {
                            var ts='<button id="bu" type="button" onclick="insertGrade();">确定</button>';
                            return ts;
                        }
                    }
                ]]
            })
        })
        var grass;
        function insertGrade() {


            grass=$("#gradeTable").datagrid("getSelected");
            alert(111);
            if(grass==null){
                alert("请选择学生");
                return;
            }else{
                    $("#gradeWin").window({
                        width:220,
                        height:220,
                        href:'jsp/insertGrade1.jsp'
                    })

            }
        }
    </script>
    <form role="form" id="gradeForm" method="post" action="">
        <table class="table" id="gradeTable">
        </table>
    </form>
<div id="gradeWin"></div>
</body>
</html>
