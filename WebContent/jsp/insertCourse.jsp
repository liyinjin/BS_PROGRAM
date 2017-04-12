<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/6
  Time: 下午7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加课程</title>
</head>
<body>
    <script>
        function insertCourse() {
            alert(11111);
            $("#insertCourseForm").form().form("submit",{
                url:'${pageContext.request.contextPath}/course/insertCourse',
                success:function (data) {
                    var json=eval('('+data+')');
                    if (json.i==1){
                        alert("添加成功");
                        $("#CourseWin").window("close");
                        $("#showCourseTable").datagrid("reload");
                    }
                }
            })
        }
    </script>
    <form id="insertCourseForm" action="" method="post">
        <table id="insertCourseTable">
            <tr>
                <td>课程编号</td>

                <td><input type="text" name="id" ></td>
            </tr>
            <tr>
                <td>课程名称</td>

                <td><input class="form-control" type="text" name="name"></td>
            </tr>
            <tr>
                <td>课程学分</td>

                <td><input class="form-control" type="text" name="allScores"></td>
            </tr>
        </table>
    </form>
    <div style="text-align:right; ;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton"
           onclick="insertCourse();">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton"
           onclick="clear();">关闭</a>
    </div>
</body>
</html>
