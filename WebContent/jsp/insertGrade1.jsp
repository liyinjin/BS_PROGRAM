<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/27
  Time: 下午3:14
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
    <script>
        $(document).ready(function () {
            $("#gradeFF").form().form("load",ccgrade);
        });

        function inGrade() {
            var inpuuu=document.getElementById("inpuuu");
            var grade=document.getElementById("grade");
                $.ajax({
                    type:'post',
                    url:'grade/insertStudentGrade',
                    data:{"name":inpu.value,"grade":grade.value},
                    success:function (data) {
                        var json=data.i;
                        if (json==1){
                            alert("添加成绩成功");
                            $("#gradeWin").window("close");
                        }
                    }
                })
        }
    </script>
    <form id="gradeFF" action="" method="post">
        <table id="insertGradeTable">
            <tr>
                <td>学生姓名</td>
                <td><input type="text" id="inpuuu" name="userName"></td>
            </tr>
            <tr>
                <td>学生成绩</td>
                <td><input type="text" id="grade" name="grade"></td>
            </tr>
            <tr>
                <button type="button" onclick="inGrade()">确定</button>
            </tr>
        </table>
    </form>
</body>
</html>
