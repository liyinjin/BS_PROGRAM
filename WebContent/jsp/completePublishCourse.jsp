<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/17
  Time: 下午1:13
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
        $(function () {
            var r=$("#classesRoomForm").form().form("load",row);
            console.log(1);
        })
        $(document).ready(function () {
            $("#classesRoomTable").datagrid({
                border:false,
                fitColumns:true,
                singleSelect:true,
                url:'publish/showClassroom',
                columns:[[
                    {field:'classroomId',title:'教室编号'},
                    {field:'classroomName',title:'教室名称'},
                    {field:'time',title:'上课时间'},
                    {field:'learnDay',title:'日期'},
                    {field:'state',title:'状态'},
                    {field:'sure',title:'加入',
                        formatter:function () {
                            var stt='<button id="bu" type="button" onclick="insertCourseClassroom();">确定</button>'
                            return stt;
                        }
                    }
                ]],

            });
        });


        function insertCourseClassroom() {
            var r=$("#classesRoomForm").form().form("load",row);
            console.log(r);
            var c=$("#classesRoomTable").datagrid("getSelected");
            var i=document.getElementById("inp");
            alert(1);
            $.ajax({
                type:'post',
                url:"publish/insertCourseClassroom",
                data:{'id':i.value,'classroomId':c.classroomId},
                success:function(data){
                    var json=data.i;
                    if(json==1){
                        alert("添加教室成功");
                        $("#publishWin").window("close");
                    }
                }
            })
        }
    </script>
    <form id="classesRoomForm" action="" method="post">
       <table>
           <div>
               <table>
                   <tr>
                       <td>课程编号</td>
                       <td><input type="text" id="inp" name="id"></td>
                   </tr>
               </table>
           </div>
           <div>
               <table id="classesRoomTable" class="easyui-datagrid">
               </table>
           </div>
       </table>
    </form>
</body>
</html>
