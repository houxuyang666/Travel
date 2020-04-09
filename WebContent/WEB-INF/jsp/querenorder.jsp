<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>途乐行--订单</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.4.custom.min.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script  type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/dingdan.js"></script>
</head>

<body>
<!--头部-->
<div id="top-cont">
<div id="top-min">
<div id="min-left"></div>
<div id="min-right"></div>
</div>
</div>
<!--导航-->
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
<form:form  action="tiaozhuan.action" modelAttribute="tourist" method="post" >
<!--主体内容第一部分开始-->
<div class="dingdan">
<div class="dingdan-m">
<ul>
<li><img src="images/n11.jpg" width="205" height="62" /></li>
<li><img src="images/jt2.jpg" width="44" height="60" /></li>
<li><img src="images/n2.jpg" width="205" height="62" /></li>
<li><img src="images/jt21.jpg" width="44" height="60" /></li>
<li><img src="images/n33.jpg" width="205" height="62" /></li>
<li></li>
</ul>
</div>
<div class="dingdan-inf">
<div class="dingdan-infm">线路信息</div>
<div class="dingdan-mm">
<div class="dingdan-x">线路信息</div>
<div class="dingdan-lx">
<ul>
<li class="ds">线路编号</li>
<li class="ds">线路名称</li>
<li class="ds">单价</li>
<li class="ds">出行工具</li>
<c:if test="${linelist!=null}">
	<c:forEach items="${linelist}" var="line" varStatus="l">
	<input type="hidden" name="lineid" value="${line.lineid}"></input>
	<input type="hidden" name="inserttype" value="${inserttype}"></input>
	<li>${line.lineid}</li>
	<li>${line.linename}</li>
	<li>
		<c:if test="${line.teambuyprice!=null}">￥${line.teambuyprice}</c:if>
		<c:if test="${line.teambuyprice==null}">￥${line.price}</c:if></li>
	<li>${line.vehicle}</li>
	</c:forEach>
</c:if>
<c:if test="${Carlist!=null}">
	<c:forEach items="${Carlist}" var="car" varStatus="l">
		<c:forEach items="${car.linelist}" var="line" varStatus="l">
			<input type="hidden" name="lineid" value="${line.lineid}"></input>
			<input type="hidden" name="inserttype" value="${inserttype}"></input>
			<li>${line.lineid}</li>
			<li>${line.linename}</li>
			<li>
				<c:if test="${line.teambuyprice!=null}">￥${line.teambuyprice}</c:if>
				<c:if test="${line.teambuyprice==null}">￥${line.price}</c:if>
			</li>
			<li>${line.vehicle}</li>
		</c:forEach>
	</c:forEach>
</c:if>
</ul>
</div>
</div>  
<div class="dingdan-infm">游客信息&nbsp;&nbsp;<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<!--    <span style="color:red">*</span>选择出游日期：<input type="text" value="" id="txtLeaveDate" /><span></span> -->
</div>
<div class="vistor_info"> <!--游客的信息,以下是增加，删除的内容-->
<div class="dingdan-mm">
  <div class="dingdan-x">游客信息</div>
  <div class="youke">
  <ul>
  <li>真实姓名: ${tourist.realname} <input type="hidden" name="realname" value="${tourist.realname}"></input></li>
        <li>手机号: ${tourist.tel} <input type="hidden" name="tel" value="${tourist.tel}"></input></li>
        <li>身 份 证: ${tourist.idcard} <input type="hidden" name="idcard" value="${tourist.idcard}"></input></li>
    </ul>
  </div>
</div>
</div>  <!--游客结束-->

<div class="xyb">
  <input name="button" type="submit" id="button" value="确认付款" />
</div>
</div>
</div>
</form:form>
<!--主体内容第一部分结束-->
<!--底部-->
<div id="foot">
<div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
<p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
</div>
</div>
</body>
</html>
