<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<link href="jquery-easyui-1.3.3/themes/default/easyui.css" rel="stylesheet" type="text/css"/>
<link href="jquery-easyui-1.3.3/themes/icon.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
#top{
	/* height:70px;padding: 5px; */
	background: url('images/t2.jpg') no-repeat 0 0 transparent;
	background-size: 1920px 150px;
	letter-spacing: 5px;
	height:120px
	}
.top-l{
	float:left;
}
.top-l span{
display: inline-block;
text-shadow: lightsteelblue 3px 0;
color: #ffffff;
font-size: xx-large;
vertical-align: top;
}
.top-r{
	margin-top:22px;
	text-align: right;
	font-size:large;
}
.top-r span{
	margin-right: 20px;
}
.use {
	color: red;
}
.top-r a {
	text-decoration:none;
	margin-right: 20px;
}
.top-r a:visited {
	color: white;
}
.top-r a:hover {
	color: red;
}

</style>
</head>
<script type="text/javascript">
	function line (title,url){
		var isExists = $("#tabs").tabs("exists",title);//判断添加账户页签面板是否存在
		if (isExists) {//存在
			$("#tabs").tabs("select",title);
		}else{
			$("#tabs").tabs("add",{
				title:title,
				closable:true,
				content:"<iframe frameborder='0' scrolling='auto' style='width: 100%;height: 100%;' src='"+url+"'></iframe>"
			})
		}
}
	
	function linetype (title,url){
		var isExists = $("#tabs").tabs("exists",title);//判断添加账户页签面板是否存在
		if (isExists) {//存在
			$("#tabs").tabs("select",title);
		}else{
			$("#tabs").tabs("add",{
				title:title,
				closable:true,
				content:"<iframe frameborder='0' scrolling='auto' style='width: 100%;height: 100%;' src='"+url+"'></iframe>"
			})
		}
}
</script>

<body class="easyui-layout"><!-- style="background-color: #1b3143" -->
<div  region="north" border="true" id="top" >
	<div class="top-l" >
		<span >途乐行后台管理系统</span>
	</div>
	<div class="top-r">
		<span>管理员：<span class="use">${customer.name}</span>您好，感谢登陆使用</span>
		<a href="Login.action" >退出登录</a><!--  style="text-decoration:none" -->
	</div>
	
</div>
	<div data-options="region:'west',title:'菜单' ,border:false,split:true" style="width: 200px;">
		<div class="easyui-accordion" fit="true">
			<div title="旅游线路管理" style="padding: 10px">
				<p><a href="javascript:line('添加线路','Line.action')" class="easyui-linkbutton" plain="true" style="width: 150px">添加线路</a></p>
				<p><a href="javascript:line('查看线路','Linelist.action?pageIndex=1')" class="easyui-linkbutton" plain="true" style="width: 150px">查看线路</a></p>
			</div>
			<div title="团购信息管理" style="padding: 10px">
				<p><a href="javascript:line('查看路线','Linetglist.action?pageIndex=1')" class="easyui-linkbutton" plain="true" style="width: 150px">查看路线</a></p>
				<p><a href="javascript:line('查看团购','LinelistTG.action?pageIndex=1')" class="easyui-linkbutton" plain="true" style="width: 150px">查看团购</a></p>
			</div>
			<div title="线路类型管理" style="padding: 10px">
				<p><a href="javascript:linetype('添加类型','LineType.action')" class="easyui-linkbutton" plain="true" style="width: 150px">添加线路类型</a></p>
				<p><a href="javascript:linetype('类型查看','LineTypeList.action?pageIndex=1')" class="easyui-linkbutton" plain="true" style="width: 150px">查看线路类型</a></p>
			</div>
		</div>
	</div>
	<div region="center" title="显示内容" border="true"> 
		<div class="easyui-tabs" id="tabs" fit="true"></div>
	</div>
</body>
</html>