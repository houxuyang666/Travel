<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加路线类型 </title>
<style type="text/css">
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
    
}
.btn:hover
{
    background:url("images/con2-r.jpg") repeat-x; 
    color:yellow;
    background-color: greenyellow;
}
input {
	width: 200px;
	height: 25px;
	margin-bottom: 20px;
}

 form{
	/* margin-left: 40%; */
	margin-top: 6%;
	text-align: center;
	color: white;
}
body {
	background: url('images/102.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
	
}
h1{
	text-align: center;
	color: white;
}
</style>

</head>
<body>
<!-- 添加路线类型 -->
<h1>添加路线类型</h1>
<form:form action="insertLineType.action" modelAttribute="linetype" method="post" enctype="multipart/form-data">
	<div>
		线路类型名称：<form:input path="typename"></form:input><br>
		线路类型图标：<input type="file" name="filename">${msg}<br>
		<input type="submit" value="添加" class="btn">
	</div>
	
	
</form:form>
</body>
</html>