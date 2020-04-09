<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>途乐行--首页</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
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
<div id="content1"> 
  <!--左侧-->
  <div id="con1-left">
    <div class="con1-1">境内游</div>
    <div class="cs">
      <ul>
   		<c:forEach items="${jingneilinetype}" var="jingneilinetype" begin="0" end="8">
			<c:forEach items="${jingneilinetype.linelist}" var="line" begin="0" end="8">
				<li><a href="dingdan.action?lineid=${line.lineid}">${line.linename}</a></li>
			</c:forEach>
		</c:forEach>
      </ul>
    </div>
    <div class="con1-2">境外游</div>
    <div class="cs">
      <ul>
   		<c:forEach items="${jingwailinetype}" var="jingwailinetype" begin="0" end="8">
			<c:forEach items="${jingwailinetype.linelist}" var="line" begin="0" end="8">
				<li><a href="dingdan.action?lineid=${line.lineid}">${line.linename}</a></li>
			</c:forEach>
		</c:forEach>
      </ul>
    </div>
    <div class="con1-3">热门游</div>
    <div class="cs">
    <ul>
      <c:forEach items="${remenlinetype}" var="remenlinetype" begin="0" end="8">
			<c:forEach items="${remenlinetype.linelist}" var="line" begin="0" end="8">
				<li><a href="dingdan.action?lineid=${line.lineid}">${line.linename}</a></li>
			</c:forEach>
		</c:forEach>
      </ul>
    </div>
  </div>
  <!--右侧-->
  <div id="con1-right">
    <div id="right-top">
      <div class="banner">
        <ul id="imgs">
          <li><img src="images/tg.jpg" width="540" height="240"/></li>
          <li><img src="images/tg2.jpg" width="540" height="240"/></li>
          <li><img src="images/tg3.jpg" width="540" height="240"/></li>
          <li><img src="images/tg4.jpg" width="540" height="240"/></li>
        </ul>
        <ul id="numbers">
          <li>1</li>
          <li>2</li>
          <li>3</li>
          <li>4</li>
        </ul>
      </div>
      <div class="zcdl">
        <ul>
          <li style="margin-right:3px;">您好！${customername}</li>
          <li><a href="Admin.action"><img src="images/zc.jpg" width="85" height="36" /></a></li>
        </ul>
      </div>
      <div class="my">
        <ul>
          <li><span class="myd">96%</span>满意度</li>
          <li class="xt">已有<span class="rs">${count}</span>人预订出游</li>
          <li class="cls"><a href="History.action?customerid=${customerid}">查看历史订单</a></li>
        </ul>
      </div>
    </div>
    <div id="right-btm">
      <div class="tgj"><span><a href="#">更多旅游特价>></a></span></div>
      <div class="tgjlx">
        <ul style="width:1446px">
        
        <c:forEach items="${linelist}" var="line" varStatus="l">
        	<li><a href="dingdan.action?lineid=${line.lineid}"><img src="images/${line.picturelist[1].name}" width="160" height="88" />${line.linename}</a><br />
           		 <span>￥${line.price}</span>起</li>
        </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
<!--主体内容第一部分结束--> 
<!--主体内容第二部分开始-->
<div id="con-2"> 
  <!--左侧开始-->
  <div id="con-2left">
    <div id="con-2left1">
      <div class="con-21"></div>
      <div class="jingdian">
        <ul>
          <li><a href="#">古琴台</a></li>
          <li><a href="#">黄鹤楼</a></li>
          <li><a href="#">海洋世界</a></li>
          <li><a href="#">武汉东湖</a></li>
          <li><a href="#">木兰天地</a></li>
          <li><a href="#">汉正街</a></li>
          <li><a href="#">坝子岭</a></li>
          <li><a href="#">武汉欢乐谷</a></li>
        </ul>
      </div>
      <div class="con-22"></div>
      <div class="jingdian">
        <ul>
          <li><a href="#">澳门</a></li>
          <li><a href="#">烟台</a></li>
          <li><a href="#">仰光</a></li>
          <li><a href="#">约旦</a></li>
          <li><a href="#">伊朗</a></li>
          <li><a href="#">德国</a></li>
          <li><a href="#">缅甸</a></li>
          <li><a href="#">希腊</a></li>
        </ul>
      </div>
      <div class="con-23"></div>
      <div class="jingdian">
        <ul>
          <li><a href="#">北京</a></li>
          <li><a href="#">上海</a></li>
          <li><a href="#">加拿大</a></li>
          <li><a href="#">香港</a></li>
          <li><a href="#">海南</a></li>
          <li><a href="#">马尔代夫</a></li>
          <li><a href="#">韩国</a></li>
          <li><a href="#">福建</a></li>
        </ul>
      </div>
      <div class="picj"><img src="images/bb1.jpg" width="248" height="94" /></div>
      <div class="picj"><img src="images/bb2.jpg" width="248" height="94" /></div>
      <div class="picj"><img src="images/bb3.jpg" width="248" height="94" /></div>
    </div>
  </div>
  <!--左侧结束--> 
  <!--右侧开始-->
  <div id="con-2right">
    <div id="con-2meun">
      <ul>
        <li><a href="leixing.action?linetypename=境内游">境内游</a></li>
        <li><a href="leixing.action?linetypename=境外游">境外游</a></li>
        <li><a href="leixing.action?linetypename=热门游">热门游</a></li>
        <li><a href="TuanGou.action">团购游</a></li>
      </ul>
    </div>
    
     <c:forEach items="${linelist}" var="line" varStatus="l" begin="0" end="4">
    <div class="con-2inf" style="height: 121px">
      <ul>
        <li class="w130"><a href="dingdan.action?lineid=${line.lineid}"><img src="images/${line.picturelist[0].name}" width="120" height="75" /></a> 产品编号：${line.lineid}</li>
        <li class="w440">
          <div class="w440lx"><a href="dingdan.action?lineid=${line.lineid}">[${line.days}游] &nbsp;&nbsp;${line.linename} &nbsp;&nbsp;交通工具（${line.vehicle}）</a></div>
          <div class="w440xx"><a href="dingdan.action?lineid=${line.lineid}">简介：${line.introduction}</a> <br />
            本线路已有<span>5144</span>人出游 </div>
        </li>
        	<li class="w140"><br />
         	 <span><c:if test="${line.teambuyprice!=null}">￥${line.teambuyprice}</c:if>
					<c:if test="${line.teambuyprice==null}">￥${line.price}</c:if>
			</span>
          </li>
      </ul>
    </div>
    </c:forEach>
  </div>
</div>
<!--主体内容第二部分结束--> 
<!--底部-->
<div id="foot">
  <div id="foot-t">
    <p>许可证编号：WE125482154 鄂ICP备125478966</p>
    <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
  </div>
</div>
</body>
</html>
