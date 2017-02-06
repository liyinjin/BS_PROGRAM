<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/6
  Time: 下午2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
        $(function () {
            $("#upClassesForm").form().form("load",row);
        })
        
        function updateClasses() {
            alert(1111);
          $("#upClassesForm").form().form("submit",{
              url:'classes/upClasses',
              success:function(data) {
                  alert(data[0].i);
                  var json=eval('('+data+')');
                  if(json.i==1){
                      alert("修改成功!");
                      $("#classesWin").window("close");
                      $("#classesTable").datagrid("reload");
                  }
              }
          })
        }

    </script>
    <form id="upClassesForm" action="" method="POST">
        <table id="upClassesTable">
            <tr>
                <td>班级编号</td>
                <td><input type="hidden" name="id"></td>
            </tr>
            <tr>
                <td>新名称</td>
                <td><input type="text" name="name"></td>
            </tr>
        </table>
    </form>
    <div style="text-align:right;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateClasses()" id="submit">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clear()">关闭</a>
    </div>
</body>
</html>
