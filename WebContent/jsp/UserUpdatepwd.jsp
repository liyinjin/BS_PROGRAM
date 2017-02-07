<%--
  Created by IntelliJ IDEA.
  User: liyingjin
  Date: 2017/2/7
  Time: 下午2:50
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
    <title>修改个人密码</title>
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
        function ver() {
            var pwd=document.getElementById("pwd").value;
            var password=document.getElementById("password").value;
            if(pwd==password){
                document.getElementById("pd").innerHTML="<font color='green'>&nbsp;&nbsp;✔两次密码相同</font>";
                document.getElementById("submit").disabled=false;
            }else{
                document.getElementById("pd").innerHTML="<font color='red'> &nbsp;&nbsp;❌两次密码不相同</font>";
                document.getElementById("submit").disabled = true;
            }
        }
        function updatePasswordUser() {
            var value=$("#password").val();
            queryParams: {
                password: value
            };
            $("#updatePasswordForm").form().form("submit",{
                url:'my/userUpdatePwd',
                success:function(data){
                    var json=eval('('+data+')');
                    if(json.i==1){
                        alert("修改成功");
                    }
                }
            });
        }

    </script>
    <form action="" id="updatePasswordForm" method="POST">
        <table id="updataPasswordTb">
            <tbody>
            <tr>
                <td>请输入密码</td>
                <td><input type="text" required="true" missingMessage="密码必须填写" size="20" name="password" id="pwd"></td>
            </tr>
            <tr>
                <td>请重复密码</td>
                <td><input type="text" required="true" missingMessage="密码必须填写" size="20" name="password" id="password" onkeyup="ver()"><span id="pd"></span></td>
            </tr>
            </tbody>
        </table>
    </form>
    <div style="text-align:right;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatePasswordUser()" id="submit">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clear()">关闭</a>
    </div>
</body>
</html>
