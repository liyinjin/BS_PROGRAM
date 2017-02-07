<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/6
  Time: 下午7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<base href="<%=basePath%>">
<head>
    <title>查询所有课程</title>
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
        var row;
        function addCourse() {
            $("#CourseWin").window({
                title:'添加课程',
                width: 200,
                height:200,
                href:'jsp/insertCourse.jsp'
            })
        }
        function editCourse() {
            row=$("#showCourseTable").datagrid("getSelected");
            if (row==null){
                alert("请选择课程");
                return;
            }else {
                $("#CourseWin").window({
                    title:'修改课程信息',
                    width:200,
                    height:200,
                    href:'jsp/updateCourse.jsp'
                })
            }
        }
        
        function delCourse() {
            row=$("#showCourseTable").datagrid("getSelected");
            if(row==null){
                alert("请选择要删除的课程");
                return;
            }else{
                var url='course/delCourse';
                $.post(url,row,delCourseSuccess);
            }
        }

        function delCourseSuccess(data) {
            var json=data.i;
            if(json==1){
                alert("删除课程成功");
                $("#showCourseTable").datagrid("reload");
            }
        }
    </script>
    <form id="showCourseForm" action="" method="post">
        <table id="showCourseTable" class="easyui-datagrid" data-options="url:'/course/selectAll',toolbar:'#coursetb'">
            <thead>
                <tr>
                    <th data-options="field:'id'">课程编号</th>
                    <th data-options="field:'name'">课程名称</th>
                    <th data-options="field:'allScores'">课程学分</th>
                </tr>
            </thead>
        </table>
    </form>
    <div id="coursetb">
        <a href="javascript:void(0)" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true" onclick="addCourse();">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit',plain:true" onclick="editCourse();">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton"
           data-options="iconCls:'icon-cut',plain:true" onclick="delCourse();">删除</a>
    </div>
    <div id="CourseWin"></div>
</body>
</html>
