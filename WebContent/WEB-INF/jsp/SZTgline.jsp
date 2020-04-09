<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置团购信息</title>
<style type="text/css">
h1 {
	text-align: center;
	color: white;
}
body {
	background: url('images/103.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
	color: white;
}
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
	color:white; 
} 
table{
 	text-align: center;
 	width: 800px;
 	height: 40%;
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
    color: white;
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

</style>
</head>
<body>
<h1>设置团购信息</h1>
<form:form action="SZTgLine.action" modelAttribute="line" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${line.lineid}" name="lineid" >
	<table>
	<tr>
		<td>线路名称:<form:input path="linename"></form:input></td>
		<td>线路价格:<form:input path="price"></form:input></td>
	</tr>
	<tr>
		<td>路线类型:<form:select path="linetypeid">
				<form:options items="${linetype}" itemValue="linetypeid" itemLabel="typename"/>
		</form:select>
		</td>
		<td>团购价格:<form:input path="teambuyprice"></form:input></td>
	</tr>
	<tr>
		<td>开团时间:<input name="begintime" type="date"></td>
		<td>闭团时间:<input name="endtime" type="date"></td>
	</tr>
	<tr>
		<td>出游天数:<form:select path="days">
				<form:option value="1天">1天</form:option>
				<form:option value="3天">3天</form:option>
				<form:option value="7天">7天</form:option>
				<form:option value="15天">15天</form:option>
		    </form:select>
		</td>
		<td>交通工具:<form:select path="vehicle">
				<form:option value="长途汽车">长途汽车</form:option>
				<form:option value="火车">火车</form:option>
				<form:option value="高铁">高铁</form:option>
				<form:option value="飞机">飞机</form:option>
		    </form:select>
		</td>
	</tr>
	</table>
	<table>
	<tr>
		<td>推荐理由:</td>
		<td>行程安排:</td>
		<td>线路介绍:</td>
	</tr>
	<tr>
		<td><form:textarea path="reason" rows="6" cols="33"/></td>
		<td><form:textarea path="arrange" rows="6" cols="32"/></td>
		<td><form:textarea path="introduction" rows="6" cols="33"/></td>
	</tr>
	</table><br><br>
      <input type="submit" value="设置团购信息" class="btn">
		</form:form>
</body>
</html>