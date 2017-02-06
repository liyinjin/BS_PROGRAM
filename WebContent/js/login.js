/**
 * Created by Administrator on 2016/9/2.
 */
window.onload = function () {
    bgSwitch();
}
/*登录*/

function btnOk(){
	
    var uName = document.getElementById("userName");
    var uPwd = document.getElementById("userPwd");
    var rname=document.getElementsByName("roleId");
    var checkName = '';
    for(var i = 0;i<rname.length;i++){
    	if(rname[i].checked){
    		checkName = rname[i].value;
    	}
    }
    if(checkName == ''){
    	alert('请选择类型');
    }
    if(uName.value == '' && uPwd.value == ''){
    	alert('账号或密码不能为空');
    }
    //ajax登录请求
    $.ajax({
		type:'POST',
		url:"my/login",
		data:{'id':uName.value,'password':uPwd.value,'roleId':checkName},
		success: function(data){
			if(!data.flag){
				alert("登录失败");
				return;
			}else{
				window.location.href='jsp/index.jsp';
			}
		},
	});
    
    
}
/*保存数据*/
function saveStorage(){
    var data = new Object;
    var str;
    data.name = document.getElementById("userName").value;
    data.pwd = document.getElementById("userPwd").value;
    str = JSON.stringify(data);
    sessionStorage.setItem(data.name,str);
}
/*背景切换*/
function bgSwitch() {
    var i = 1;
   $("#bgChange").children("img").eq(0).css("opacity","1");
    setInterval(function(){
        if(i >= $("#bgChange").find("img").length){
           i = 0;
        }
        /*$("#bgChange").children("img").eq(i).addClass("imgShow").removeClass("imgHide").siblings().removeClass("imgShow").addClass("imgHide");*/

        $("#bgChange").children("img").eq(i).css({"opacity":"1"}).siblings().css({"opacity":"0"});
        i++;
    },5000);
}