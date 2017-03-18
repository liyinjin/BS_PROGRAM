<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/3/14
  Time: 下午5:09
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
    <title>选课</title>
    <title>修改班级信息</title>
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
        $("#studentCourseTable").datagrid({
            border:false,
            fitColumns:true,
            singleSelect:true,
            url:'publish/selectAlReadyPublishCourse',
            columns:[[
                {field:'id',title:'课程编号'},
                {field:'name',title:'课程名称'},
                {field:'classroomName',title:'上课地址'},
                {field:'learnDay',title:'上课日期'},
                {field:'time',title:'上课时间'},
                {field:'allScores',title:'学分'},
                {field:'person',title:'上课人数'},
                {field:'surplusPerson',title:'课程剩余量'},
                {field:'userName',title:'任课教师'}
            ]]
        })
    })

    function insertStudentCourse(){
        var w=$("#studentCourseTable").datagrid("getSelected");
        if(w==null){
            alert("请选择课程");
            return;
        }else {
            $.ajax({
                type:'post',
                url:'course/insertStudentCourse',
                data:{'courseId':w.id},
                success:function (data) {
                    var json=data.i;
                    if(json==1){
                        alert("选课成功");
                    }else {
                        alert("选课失败");
                    }
                }
            })
        }
    }
</script>
<form action="" id="studentCourseForm" method="post">
    <table id="studentCourseTable">
        <thead>
        </thead>
    </table>
</form>
</body>
</html>

</body>
</html>
