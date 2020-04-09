<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<title>查看线路</title>
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
}
body {
	background: url('images/a2.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 990px;
}
.go{
	width: 20px;
	text-align: center;
}
</style>
<body>
<h1>查看线路</h1>
<table border="1" cellspacing="0" cellpadding="0" >
       <tr style="background-color: gray"><td><span>序号</span></td><td><span>线路编号</span></td>
       <td><span>线路名称</span></td><td><span>出游天数</span></td><td><span>线路价格</span></td>
       <td><span>交通工具</span></td><td><span>线路类型</span></td><td><span>操作</span></td>
       </tr>
       <c:forEach items="${linelist}" var="line" varStatus="l">
	   <tr>
				<td>${l.count}</td>
				<td>${line.lineid}</td>
				<td>${line.linename}</td>
				<td>${line.days}</td>
				<td>${line.price}</td>
				<td>${line.vehicle}</td>
				<td>${line.linetype.typename}</td>
				<td><a href="updateline1.action?lineid=${line.lineid}">修改</a></td>
			</tr>
		</c:forEach>
		<tr>
		 <td colspan="8">
     <a href="Linelist.action?pageIndex=1">首页</a>&nbsp;
	 <c:if test="${pageIndex>1}"><a href="Linelist.action?pageIndex=${pageIndex-1}">上一页</a>&nbsp;</c:if>
     <c:if test="${pageIndex<endRow}"><a href="Linelist.action?pageIndex=${pageIndex+1}">下一页</a>&nbsp;</c:if>
	 <a href="Linelist.action?pageIndex=${endRow}">尾页</a>&nbsp;&nbsp;
	 <span>当前是第${pageIndex}页</span>&nbsp;&nbsp;
	 <span>共${endRow}页</span>&nbsp;&nbsp;
	 <input type="hidden" id="total" value="${endRow}">
	 <span>跳转至<input type="text" id="pages" value="${pageIndex}" class="go"/>页<a href="javascript:_go();">Go</a></span>
	 </td>
     </tr>
</table>
	<script type="text/javascript">  
    function _go() {  
        var p= $("#pages").val();//获取文本框中的当前页码  
        if(!/^[1-9]\d*$/.test(p)) {//对当前页码进行整数校验  
            alert('请输入正确的页码！');  
            return;  
        }  
        if(p>$("#total").val()) {//判断当前页码是否大于最大页  
            alert('请输入正确的页码！');  
            return;  
        }  
        location = "Linelist.action?pageIndex="+p;  
    }  
</script>  
</body>
</html>