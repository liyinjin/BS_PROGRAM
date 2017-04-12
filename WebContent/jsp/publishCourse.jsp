<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/9
  Time: 下午1:00
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
        var row;
        $(document).ready(function () {
            $("#publishTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect: true,
                url:'publish/showCourse',
                columns:[[
                    {field:'id',title:'课程编号'},
                    {field:'name',title:'课程名称'},
                    {field:'allScores',title:'课程学分'},
                    {field:'person',title:'上课人数'},
                    {field:'opt',title:'上课地点',
                        formatter:function () {
                            var str='<a href="javascript:void(0)" name="opera" class="editcls" onclick="publishCourse();">添加教室</a>';
                            return str;
                        }
                    },
                    {field:'tpt',title:'任课教师',
                        formatter:function () {
                            var str1='<a href="javascript:void(0)" name="opera" class="ttt" onclick="publishCourseTeacher();">添加教师</a>';
                            return str1;
                        }
                    },
                    {field:'insert',title:'发布',
                        formatter:function () {
                            var ab='<button id="buu" type="button" onclick="publishCc();">确定</button>';
                            return ab;
                        }
                    }

                ]],
                onLoadSuccess:function(data){
                    $('.editcls').linkbutton({text:'添加教室',plain:true,iconCls:'icon-add'});
                    $('.ttt').linkbutton({text:'添加教师',plain:true,iconCls:'icon-add'});
                }
            });
        });
        
        function publishCourse() {
            row=$("#publishTable").datagrid("getSelected");
            if (row==null){
                alert("请选择要发布的课程");
                return;
            }else {
                $("#publishWin").window({
                    title:'发布课程信息完善',
                    width:500,
                    height:300,
                    href:'jsp/completePublishCourse.jsp'
                })
            }
        }

        function publishCourseTeacher() {
            row=$("#publishTable").datagrid("getSelected");
            if (row==null){
                alert("请选择要发布的课程");
                return;
            }else {
                $("#publishWin").window({
                    title:'发布课程信息完善',
                    width:500,
                    height:300,
                    href:'jsp/completePublishCourse1.jsp'
                })
            }
        }

        function publishCc(){
            var pp=$("#publishTable").datagrid("getSelected");
            if(pp==null){
                alert("请选择要发布的课程");
            }
            $.ajax({
                type:'post',
                url:'course/updateCourseState',
                data:{'id':pp.id},
                success:function (data) {
                    var json=data.i;
                    if(json==1){
                        alert("发布成功");
                    }else{
                        alert("发布失败");
                    }
                }
            })
        }

    </script>
    <form id="publishCourseForm" action="" method="post">
        <table class="easyui-datagrid" id="publishTable">
        </table>
    </form>
    <div id="publishWin"></div>
</body>
</html>
