<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看类型</title>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
</head>
<style type="text/css">
table {
    width:100%;
    height:70%;
	padding: 0;
	text-align: center;
	color: white;
}
td {
	width: 200px;
	height: 30px;
	text-align: center;
}
span{
font-weight: bold;
text-align: center;

}
a{
	text-decoration:none;
}
a:link{
	color: white;
}
a:visited{
	color: white;
}
a:hover {
	color: red;
}
h1{
	text-align: center;
	color: white;
}
body {
	background: url('images/106.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
}
.go{
	width: 20px;
	text-align: center;
}
</style>
<body>
<h1>查看类型</h1>
<table  border="1" cellspacing="0" cellpadding="0" >
       <tr style="background-color: gray"><td><span>序号</span></td><td><span>类型编号</span></td>
       <td><span>类型名称</span></td><td><span>创建时间</span></td><td><span>操作</span></td></tr>
       <c:forEach items="${linetypelist}" var="linetype" varStatus="ltype">
	   <tr>
				<td>${ltype.count}</td>
				<td>${linetype.linetypeid}</td>
				<td>${linetype.typename}</td>
				<td><spring:eval expression="linetype.time"></spring:eval></td>
				<td><a href="updatelinetype1.action?linetypeid=${linetype.linetypeid}">修改</a></td>
			</tr>
		</c:forEach>
		<tr>
		<td colspan="5">
     <a href="LineTypelist.action?pageIndex=1">首页</a>&nbsp;
	 <c:if test="${pageIndex>1}"><a href="LinetgTypelist.action?pageIndex=${pageIndex-1}">上一页</a>&nbsp;</c:if>
     <c:if test="${pageIndex<endRow}"><a href="LineTypelist.action?pageIndex=${pageIndex+1}">下一页</a>&nbsp;</c:if>
	 <a href="LineTypelist.action?pageIndex=${endRow}">尾页</a>&nbsp;&nbsp;
	 <span>当前是第${pageIndex}页</span>&nbsp;&nbsp;
	 <span>共${endRow}页</span>
	 <input type="hidden" id="totaltype" value="${endRow}">
	 <span>跳转至<input type="text" id="typepages" value="${pageIndex}" class="go"/>页<a href="javascript:_go();">Go</a></span>
    </td>
	</tr>
</table>
	<script type="text/javascript">  
    function _go() {  
        var pt= $("#typepages").val();//获取文本框中的当前页码  
        if(!/^[1-9]\d*$/.test(pt)) {//对当前页码进行整数校验  
            alert('请输入正确的页码！');  
            return;  
        }  
        if(pt>$("#totaltype").val()) {//判断当前页码是否大于最大页  
            alert('请输入正确的页码！');  
            return;  
        }  
        location = "LineTypelist.action?pageIndex="+pt;  
    }  
</script>  
</body>
</html>