<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>境内游</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/type.js"></script>
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
       <li><a href="javascript:void(0)">暂无功能</a></li>
      <li><a href="GoCar1.action"><img src="images/che.jpg" width="176" height="42" /></a></li>
    </ul>
</div>
</div>
<!--广告位图片-->
<div id="banner"> <img src="images/banner.jpg" width="1003" height="93" /></div>

<!--主体内容第一部分开始-->
<div class="jindinf">
<div class="jindinf-left">
<ul>
<li>当月景点推荐</li>
<li><a href="#">武汉欢乐谷</a>  <a href="#">| 海洋世界</a></li>
<li>武汉热门景点</li>
<li><a href="#">黄鹤楼</a>  <a href="#">| 海洋世界</a></li>
<li>咸宁热门景点</li>
<li><a href="#">咸宁温泉</a>  <a href="#">| 九宫山</a></li>
<li>宜昌热门景点</li>
<li><a href="#">三峡大坝</a>  <a href="#">| 当阳</a></li>
<li>热门景点酒店</li>
<li><a href="#">武汉景点酒店</a>  <a href="#">|宜昌景点酒店 </a></li>
</ul>
</div>
<div class="jindinf-right">
    <ul class="jnImgs">
    <c:forEach items="${linetype}" var="linetype" begin="0" end="9">
		<c:forEach items="${linetype.linelist}" var="line" begin="0" end="9">
		<li><img src="images/${line.picturelist[1].name}" style="width: 100%;height: 100%"/></li>
		</c:forEach>
	</c:forEach>

    </ul>
    <ul class="jnText">
	    <c:forEach items="${linetype}" var="linetype" begin="0" end="9">
			<c:forEach items="${linetype.linelist}" var="line" begin="0" end="9">
	        <li><a href="dingdan.action?lineid=${line.lineid}" style="color: white;">${line.linename}</a></li>
	   		 </c:forEach>
		</c:forEach>
    </ul>
</div>
</div>
<!--主体内容第一部分结束-->
<!--主体内容第二部分开始-->
<div class="huodong">
<div class="huodong-meun1">最新活动</div>
<div class="huodong-inf">
<ul>
<c:forEach items="${linetype}" var="linetype" begin="0" end="9">
	<c:forEach items="${linetype.linelist}" var="line" begin="0" end="9">
	<li><a href="dingdan.action?lineid=${line.lineid}">
		<c:if test="${line.picturelist[0].name!=null}"><img src="images/${line.picturelist[1].name}" width="180" height="120" /></c:if>
		<c:if test="${line.picturelist[0].name==null}"><img src="images/typeact1.jpg" width="180" height="120" /></c:if>
		<span>旅游地点：${line.linename},${line.days}游</span></a></li>
	</c:forEach>
</c:forEach>
</ul>
</div>
<div></div>
</div>
<!--主体内容第三部分结束-->
<!--主体内容第四部分开始-->
<div class="jdtj" >
<div class="jdtj-meun">推荐景点</div>
<div class="jdtj-inf" style="width:100%;margin-left:0px;">
<ul>
<c:forEach items="${linetype}" var="linetype" begin="0" end="7">
<c:forEach items="${linetype.linelist}" var="line" begin="0" end="7">
	<li><a href="dingdan.action?lineid=${line.lineid}">
		<img src="images/${line.picturelist[2].name}" width="240" height="160" /><span>推荐理由：</span>${line.reason}
		</a></li>
	</c:forEach>
	</c:forEach>
</ul>
</div>
</div>
<!--主体内容第四部分结束-->
<!--底部-->
<div id="foot">
<div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
<p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
</div>
</div>

</body>
</html>
