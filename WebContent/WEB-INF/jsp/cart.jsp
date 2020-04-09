<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>
<style type="text/css">
.mask { /*遮罩层*/
    background-color:gray;
    left:0;
    position:absolute;
    top:0;
    z-index:100;
    filter:alpha(opacity=30);
   opacity:0.3;
}

div.dialog {
	width: 296px;
	height:173px;
	position: absolute;
	z-index: 101;
	display: none;
    background-image:url(images/dialog.png)
}

div.title {
	padding-top: 5px;
	padding-left:270px;
}
div.dialog div.content {

	height: 90px;
	text-align:center;

	font:bold 15px/90px Verdana, Geneva, sans-serif;
}

div.dialog div.bottom {
	text-align: right;
	padding: 10px 10px 10px 0px;
	border-top:1px dashed #999999;

}
div.bottom .btn1 {
	border:none;
	width: 63px;
	height: 29px;
	cursor:pointer;
	
}
div.bottom #btnSure{
	background-image:url(images/delSure.jpg);
}
div.bottom #btnCancel{
	background-image:url(images/delCancel.jpg);
}
</style>
<script type="text/javascript">
/* 	function del(obj){
		var r = confirm("是否删除?");
		if(r){
			location.href="removecart.action?cartid="+obj;
		}else{
			
		}
		
	} */

</script>
</head>

<body>
<!--头部-->
<div id="top-cont">
  <div id="top-min">
    <div id="min-left"></div>
    <div id="min-right"></div>
  </div>
</div>
<div id="menu">
  <div id="menu-m">
	<ul>
      <li><a href="index.action">首页</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="leixing.action?linetypename=境内游">境内游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="leixing.action?linetypename=境外游">境外游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="leixing.action?linetypename=热门游">热门游</a></li>
      <li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
      <li><a href="TuanGou.action">团购</a></li>
      <li><a href="GoCar1.action"><img src="images/che.jpg" width="176" height="42" /></a></li>
    </ul>
  </div>
</div>
<!--广告位图片-->


<!--注册版块-->
<div id="shop">
  <div id="shop-t">
    <div id="shop-l"><img src="images/sh.jpg" width="74" height="67" /></div>
    <div id="shop-r">我的购物车</div>
  </div>
  <div id="shop-inf">
    <ul>
      <li class="xh">序号</li>
      <li class="lx">路线名称</li>
      <li class="rs">单价</li>
      <li class="dj">下单</li>
      <li class="cz">操作</li>
    </ul>
  </div>
<div id="shop-xx" style="width: 100%">
			<c:forEach items="${linelist}" var="line" varStatus="l">
			    <ul id="shop1">
			      <li class="xh">${l.count}</li>
			      <li class="lx">
			        <div id="luxian">
			        <input type="hidden" value="${line.carlist[0].carid}">
			          <ul>
			            <li><a href="images/${line.picturelist[0].name}" title="${line.linename}"><img src="images/${line.picturelist[0].name}" width="87" height="58"  /></a></li>
			            <li><a href="#"><span style="font-size: 13px">产品编号：${line.lineid} 线路名：${line.linename}${line.days}【交通工具+${line.vehicle}】</span></a></li>
			          </ul>
			        </div>
			      </li>
			      <li class="rs">
			     		 <c:if test="${line.teambuyprice!=null}">￥${line.teambuyprice}</c:if>
						<c:if test="${line.teambuyprice==null}">￥${line.price}</c:if>
			      </li>
			      <li class="dj"><a href="order.action?lineid=${line.lineid}">下单</a></li>
			      <li class="cz"><a href="delete.action?carid=${line.carlist[0].carid}"><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
			    </ul>
		   </c:forEach>
</div>
<p>   </p>
应付金额：<span style="color:#F00;">${price}</span>元
<div id="js">
	<!-- 结算按钮 -->
	<a href="orderall.action?customerid=${customerid}"><img src="images/js.jpg"></a>
</div>
</div>
<!--底部-->
<div id="foot">
  <div id="foot-t">
    <p>许可证编号：WE125482154 鄂ICP备125478966</p>
    <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
  </div>
</div>
<div class="mask"></div>
<div class="dialog">
  <div class="title">
    <img src="images/del.png" id="closePic" title="关闭"/> </div>
  <div class="content"> <p>您真的要删除这条记录吗？</p></div>
  <div class="bottom">
    <input type="button" value="" class="btn1"  id="btnSure"/>
    <input type="button" value="" class="btn1" id="btnCancel" />
  </div>
</div>
</body>
</html>
