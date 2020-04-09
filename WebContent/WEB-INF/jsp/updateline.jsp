<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>线路修改</title>
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
/*  form{
	
	 text-align: center; 
	 color:white; 
} */ 

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

span{/*windowframe  */
	color: white;
}
h1{
	text-align: center;
	color: white;
}
body {
	background: url('images/104.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
	color: white;
}
#box{
	/*  margin-left:35%; */
	 color:white; 
	text-align:center;
	  height: 50%;
}
</style>
</head>
<body>
<h1>线路修改</h1>
	<div id="box" >
		<form:form action="updateline.action" method="post" enctype="multipart/form-data" modelAttribute="line">
			<div >
				<input type="hidden" value="${line.lineid}" name="lineid" >
				<input type="hidden" value="${linetype.linetypeid}" name="linetypeid" >
				线路类型名称:<input type="text" value="${line.linename}" name="linename"><br>
			          线路类型图标:<img src="upload/${linetype.icon}"><br><br>
				更换类型图标: <input type="file" name="file"><br>
				<input type="submit" value="修改线路信息" class="btn"><br>
				</div>
				
			</form:form>
	</div>
</body>
</html>