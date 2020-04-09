<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>登录</title>
<style type="text/css">
div{
	width: 340px;
	margin-left: 38%;
	
}
input {
	width: 200 px;
	height: 25px;
	margin-bottom: 10px;
}
 form{
	text-align: center;

} 
.btn
{
    cursor:pointer;
    border:1px solid #2b87c8;
    border-radius:15px; /*实现圆角*/
    background-image:url("images/con2-r.jpg") repeat-x;
    min-width:100px;
    height:30px;
    text-align:center;
    padding-left:10px;
    padding-right:10px;
    color:white;
    background-color: #22a038;
    vertical-align:middle;
    margin-left: 25%; 
}
.btn:hover
{
    background:url("images/con2-r.jpg") repeat-x; 
    color:yellow;
    background-color: greenyellow;
}
h1{
	text-align: center;
	margin-top: 8%;
	color: white;
}
table{
	color: white;
	width: 500px;
	height: 40px;
}
td {
	width: 200px;
	height: 25px;
}
</style>
</head>
<h1>登录</h1>
<body style="background-image: url('images/back1.jpg');">
<div>

  <form:form action="LoginRegister.action" modelAttribute="customer" id="loginForm">
  
  	<table >
  	<tr>
	  	<td >账号：</td>
	  	<td><form:input path="account" id="user"></form:input>
	  	<form:errors path="account" element="span"></form:errors></td>
  	</tr>
  	<tr>
	<td>&nbsp;</td><td>&nbsp;</td>
	</tr>
  	<tr>
	  	<td >密码：</td>
	  	<td><form:password path="password" id="pswd"></form:password>
	  	<form:errors path="password" element="span"></form:errors><br></td>
  	</tr>
  	<tr>
	<td>&nbsp;</td><td>&nbsp;</td>
	</tr>
  	<tr>
  	<td>验证码：</td>
  	<td><input name="codelogin">
  		</td>
		<td><img id="image1" src="Kaptcha.jpg" onclick="change2()" style=" width: 200 px;height: 40px;"><br>
		<input type="hidden" value="${vcodelogin}" id="vcode"></td>
  	</tr>
  	
  	</table>
  <%-- 	验证码：<input name="codelogin">
  		<img id="image1" src="Kaptcha.jpg" onclick="change2()"><br>
		<input type="hidden" value="${vcodelogin}" id="vcode"> --%>
  		<label style="margin-left: 60%; margin-top: 5px; color: white;"><input id="remember" type="checkbox">记住密码</label><br>
  	<p> 
  	<input  class="btn"  type="submit" value="登陆" >${msg}
	</p>
  
	</form:form>
	</div>
</body>
<script type="text/javascript">
function change2(){
	  document.getElementById("image1").src="Kaptcha.jpg?";
	}
	
	 window.onload = function(){
  var oForm = document.getElementById('loginForm');
  var oUser = document.getElementById('user');
  var oPswd = document.getElementById('pswd');
  var oRemember = document.getElementById('remember');
  //页面初始化时，如果帐号密码cookie存在则填充
  if(getCookie('user') && getCookie('pswd')){
    oUser.value = getCookie('user');
    oPswd.value = getCookie('pswd');
    oRemember.checked = true;
  }
  //复选框勾选状态发生改变时，如果未勾选则清除cookie
  oRemember.onchange = function(){
    if(!this.checked){
      delCookie('user');
      delCookie('pswd');
    }
  };
  //表单提交事件触发时，如果复选框是勾选状态则保存cookie
  oForm.onsubmit = function(){
    if(remember.checked){ 
      setCookie('user',oUser.value,7); //保存帐号到cookie，有效期7天
      setCookie('pswd',oPswd.value,7); //保存密码到cookie，有效期7天
    }
  };
};
//设置cookie
function setCookie(name,value,day){
  var date = new Date();
  date.setDate(date.getDate() + day);
  document.cookie = name + '=' + value + ';expires='+ date;
};
//获取cookie
function getCookie(name){
  var reg = RegExp(name+'=([^;]+)');
  var arr = document.cookie.match(reg);
  if(arr){
    return arr[1];
  }else{
    return '';
  }
};
//删除cookie
function delCookie(name){
  setCookie(name,null,-1);
};

  </script>
</html>