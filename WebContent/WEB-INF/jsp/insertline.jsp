<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加线路</title>
<style type="text/css">
input {
	width: 200px;
	height: 25px;
	margin-bottom: 20px;
}
select{
	width: 200px;
	height: 25px;
	margin-bottom: 20px;
}
 form{
	 margin-left: 25%; 
	/* text-align: center; */
	color:white; 
} 
table{
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
h4{
	font-weight: lighter;
	color: white;
}
span{/*windowframe  */
	color: white;
}
h1{
	text-align: center;
	color: white;
}
body {
	background: url('images/a1.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
	letter-spacing: 5px;
}
</style>
</head>
<body >
	<h1>添加线路</h1>
<form:form action="insertLine.action" modelAttribute="line" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td style="text-align: left;">线路名称：<form:input path="linename"></form:input></td>
			<td>线路价格：<form:input path="price"></form:input><br></td>
		</tr>
		<tr>
			<td style="text-align: left;">团购线路:<form:input path="teambuy"></form:input>（1为团购路线）</td>
			<td>团购价格：<form:input path="teambuyprice"></form:input><br></td>
		</tr>
		<tr>
			<td style="text-align: left;">开团时间：<input name="begintime" type="date"></input><br></td>	
			<td>闭团时间：<input name="endtime" type="date"></input><br></td>		
		</tr>
	</table>
	
	出游天数:<form:select path="days">
				<form:option value="1天">1天</form:option>
				<form:option value="3天">3天</form:option>
				<form:option value="7天">7天</form:option>
				<form:option value="15天">15天</form:option>
		</form:select><br>
	交通工具:<form:select path="vehicle">
				<form:option value="长途汽车">长途汽车</form:option>
				<form:option value="火车">火车</form:option>
				<form:option value="高铁">高铁</form:option>
				<form:option value="飞机">飞机</form:option>
		</form:select><br>				  
	路线类型:<form:select path="linetypeid">
				<form:options items="${LineType}" itemValue="linetypeid" itemLabel="typename"/>
		</form:select><br>
	<table>
		<tr>
			<td>推荐理由 </td>
			<td>行程安排</td>
			<td>线路介绍:</td>
		</tr>
		<tr>
			<td><form:textarea path="reason" rows="6" cols="33"/>&nbsp;</td>
			<td><form:textarea path="arrange" rows="6" cols="32"/>&nbsp;</td>
			<td><form:textarea path="introduction" rows="6" cols="33"/></td>
		</tr>
	</table>	

	<h4 >选择上传路线图片(说明:用户查看具体路线时有4张图片作为简介部分)</h4>
	<span>图片1:</span><input type="file" name="file">  <span>图片介绍:</span><input name="text" type="text"><br>
	<span>图片2:</span><input type="file" name="file">  <span>图片介绍:</span><input 	name="text" type="text"><br> 
	<span>图片3:</span><input type="file" name="file">  <span>图片介绍:</span><input name="text" type="text"><br>
	<span>图片4:</span><input type="file" name="file">  <span>图片介绍:</span><input  name="text" type="text"><br> 
	<br>
				<input type="submit" value="添加" class="btn">
		</form:form>
</body>
</html>