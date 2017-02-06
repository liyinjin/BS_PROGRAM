<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/6
  Time: 下午9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改课程信息</title>
</head>
<body>
    <script>
        $(function () {
            $("#upCourseForm").form().form("load",row);
        })
        function updateCourse() {
            $("#upCourseForm").form().form("submit",{
                url:'course/updateCourse',
                success:function (data) {
                    var json=eval('('+data+')');
                    if(json.i==1){
                        alert("修改成功");
                        $("#CourseWin").window("close");
                        $("#showCourseTable").datagrid("reload");
                    }
                }
            })
        }
    </script>
    <form id="upCourseForm" action="" method="post">
        <table id="upCourseTable">
            <tr>
                <td>课程编号</td>
                <td><input type="hidden" name="id"></td>
            </tr>
            <tr>
                <td>课程名称</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>课程学分</td>
                <td><input type="text" name="allScores"></td>
            </tr>
        </table>
    </form>
    <div style="text-align:right;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateCourse()" id="submit">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clear()">关闭</a>
    </div>
</body>
</html>
