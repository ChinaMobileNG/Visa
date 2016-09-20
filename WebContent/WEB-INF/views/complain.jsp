<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>
<html>
<head>
	<title>首页-大连海之韵国际旅行社</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jquery/1.6/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
	<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/css/min.css"/>"><link>
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/css/content/settings/style.css"/>"><link>
	<script type="text/javascript">
		/*<![CDATA[*/

		function checkValue() {
			if(confirm("是否确认删除")){
				return true;
			}else{
				return false;
			}
		}

		/*]]>*/
	</script>
</head>
<body>
<s:url value="/complain/deletecomplains" var="deleteComplains"/>
<form onsubmit="return checkValue();" id="id4" method="post" action="${deleteComplains }">
<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
	<input type="hidden" name="id4_hf_0" id="id4_hf_0">
</div>
	<!--HEAD-->
	<div id="head">
		<div class="left">
			Hi, <a href="center.html"><span>admin</span></a> | <a href="logout/">退出</a>
		</div>
	</div>
	<!--SIDEBAR-->
	<div id="sidebar">
		<ul>
			<li class="nosubmenu"><a href="<s:url value="/"/>"> <img src="img/icons/menu/inbox.png" alt=""> 控制台</a></li>
			<li><a href="#"><img src="img/icons/menu/layout.png" alt="">微网站管理</a>
				<ul style="display: none;">
					<li><a href="coupon.html">签证进度</a></li>
					<li><a href="homePage/">主页管理</a></li>
					<li><a href="flight/">航班查询</a></li>
					<li><a href="weather/">天气查询</a></li>
					<li><a href="exchange/">汇率转换</a></li>
				</ul>
			</li>
			<li class="current"><a href="#"><img src="img/icons/menu/users.png" alt=""> 微会员管理</a>
				<ul>
					<li class="current"><a href="<s:url value="/complain"/>">投诉管理</a></li>
					<li><a href="messagePage/">留言管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!--CONTENT-->
	<div id="content" class="white">
		<h1><img src="img/icons/posts.png" alt=""> 投诉管理</h1>
		<div class="bloc left">
			<div class="title">批量处理<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<div class="submit">
						<input type="submit" value="删除投诉" name="btnSubmit" id="id6">
					</div>
				</div>
			</div>
		</div>
		<div class="cb"></div>
		<div class="bloc">
			<div class="title">投诉管理<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">

					<table>
						<thead>
						<tr>
							<th><input type="hidden" id="id5"></th>
							<th><span>被投诉人</span></th>
							<th><span>投诉原因</span></th>
							<th><span>详细说明</span></th>
							<th><span>投诉时间</span></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${items }" var="item" varStatus="status">
							<tr>
								<td><input type="checkbox" name="ids" value="${item.id }"></td>
								<td><span>${item.accused}</span></td>
								<td><span>${item.reason }</span></td>
								<td><span>${item.details }</span></td>
								<td><span>${item.accusedTime}</span></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</form>

</body></html>