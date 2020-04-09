<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<style type="text/css">
input {
	width: 200 px;
	height: 25px;
	margin-bottom: 10px;
}
 form{
margin-left: 4%;

}
img{
    width: 200 px;
	height: 40px;
}
div {
	margin-left: 20%;
 	margin-top:-6%;
 	float: left;
}
.btn
{
    cursor:pointer;
    border:1px solid #2b87c8;
    border-radius:15px; /*实现圆角*/
    background-image:url("images/con2-r.jpg") repeat-x;
    min-width:130px;
    height:30px;
    text-align:center;
    padding-left:10px;
    padding-right:10px;
    color:white;
    background-color: #22a038;
    vertical-align:middle;
    margin-left:30%; 
}
.btn:hover
{
    background:url("images/con2-r.jpg") repeat-x; 
    color: yellow;
    background-color: greenyellow;
}
.cen{
/* background-color: white; */
	width: 100%;
	margin-left: 36%;
	margin-top: 1%; 
}
h1{
	text-align: center;
	margin-top: 8%;
	color: white;
}
</style>
</head>
<h1>注册</h1>
<body style="background-image: url('images/BA.jpg');">
<div class="cen">

<form:form action="AdminRegister.action" modelAttribute="customer">

	<table style="color: white;">
	<tr>
		<td >账号：</td>
		<td><form:input path="account"></form:input><form:errors path="account" element="span"></form:errors></td>
	</tr>
	<tr>
		<td>姓名：</td>
		<td><form:input path="name"></form:input><form:errors path="name" element="span"></form:errors></td>
	</tr>
	<tr>
		<td>密码：</td>
		<td><form:password path="password"></form:password>
		<form:errors path="password" element="span"></form:errors></td>
	</tr>
	<tr>
		<td>性别：</td>
		<td><form:input path="sex"></form:input><form:errors path="sex" element="span"></form:errors><br></td>
	</tr>
	<tr>
		<td>身份证号：</td>
		<td><form:input path="identityid"></form:input>
		<form:errors path="identityid" element="span"></form:errors><br></td>
	</tr>
	<tr>
		<td>手机号：</td>
		<td><form:input path="tel"></form:input><form:errors path="tel" element="span"></form:errors><br></td>
	</tr>
	<tr>
		<td>状态：</td>
		<td><form:input path="type"></form:input><br></td>
	</tr>
	<tr>
		<td>验证码：</td>
		<td><input name="code" ></td>
	</tr>
	<tr>
	<td>&nbsp;</td><td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="注册" class="btn">${msg}</td>
	</tr>
	<tr>
		<td colspan="2">
		<button class="btn" value="已有账号请登录" type="button" onclick="javascript:tiaozhuan();">已有账号请登录</button>
		</td>
	</tr>
	</table>
</form:form>
		<div>
	<img id="image1" src="Kaptcha.jpg" onclick="change2()"><br>
		<input type="hidden" value="${vcode}" id="vcode">
	</div>
</div>
</body>
<script type="text/javascript">
	function change2(){
		  document.getElementById("image1").src="Kaptcha.jpg?";
		}
	
	function tiaozhuan(){
		location.href = "Login.action";
	}
</script>
</html>