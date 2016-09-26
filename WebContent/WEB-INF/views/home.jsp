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
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
	<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/css/min.css"/>"><link>
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/css/content/settings/style.css"/>"><link>
</head>
<body>

<!-- HEAD -->
<div id="head">
	<s:url value="/logout" var="logout"/>
	<div class="left">
		<security:authorize access="isAuthenticated()">
		<sf:form action="${logout }" method="POST">
		Hi,<security:authentication property="principal.username"/>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			[Admin]
		</security:authorize>| 
   			<input type="submit" value="Logout" />
		</sf:form>
		</security:authorize>
	</div>
</div>
<form id="id1" method="post" action="./?0-1.IFormSubmitListener-form">
<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
	<input type="hidden" name="id8_hf_0" id="id8_hf_0">
</div>
	<!--SIDEBAR-->
	<security:authorize access="hasRole('ADMIN')">
		<div id="sidebar">
			<ul>
				<li class="nosubmenu current">
					<a href="<s:url value="/"/>"> 
						<img src="img/icons/menu/inbox.png" alt="">
						控制台
					</a>
				</li>
				<li class="current"><a href="javascript:void(0)" onclick="microwebtoggle()"><img src="img/icons/menu/layout.png" alt="">
					微网站管理</a>
					<ul  id="microwebmanage" style="display: none;">
						<li><a href="visaprocess">签证进度</a></li>
						<li><a href="homePage/">主页管理</a></li>
						<li><a href="flight/">航班查询</a></li>
						<li><a href="weather/">天气查询</a></li>
						<li><a href="exchange/">汇率转换</a></li>
					</ul>
				</li>
				<li class=""><a href="javascript:void(0)" onclick="customertoggle()"><img src="img/icons/menu/users.png" alt="">
					微会员管理</a>
					<ul id="customermanage" style="display: none;">
						<li><a href="<s:url value="/complain"/>">投诉管理</a></li>
						<li><a href="messagePage/">留言管理</a></li>
					</ul></li>
			</ul>
		</div>
	</security:authorize>
	<!--CONTENT-->

	<div id="content" class="white" 
	<security:authorize access="hasRole('TRAVELLER')">
	style="margin: 28px 40px 0px 30px;
			color: #6D6D6D;
			padding: 0px 0px 20px;
			font-size: 12px"
	</security:authorize> >
		<h1>
			<img src="img/icons/dashboard.png" alt="">
				<security:authorize access="hasRole('ADMIN')">
						控制台
				</security:authorize> 
				<security:authorize access="hasRole('TRAVELLER')">
					首页
				</security:authorize>
		</h1>
		<div class="bloc left">
			<div class="title">快捷入口<a href="#" class="toggle"></a></div>
			<div class="content dashboard" style="display: block;">
				<div class="center" style="display: block; width: auto;">
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<a  class="shortcut" href="<c:url value="/visaprocess"/>"> <img src="img/page.png" alt="" width="48" height="48"> 签证进度</a>
				<a href="<c:url value="/visasetting"/>" class="shortcut"> <img src="img/contact.png" alt="" width="48" height="48"> 签证设置</a> 
				<a href="<s:url value="/message"/>" class="shortcut"> <img src="img/checkin.png" alt="" width="48" height="48"> 留言管理</a> 
				<a href="<s:url value="/complain"/>" class="shortcut last"> <img src="img/event.png" alt="" width="48" height="48"> 投诉管理</a>
				</security:authorize>
				<security:authorize access="hasRole('TRAVELLER')">
				<a class="shortcut" href="<c:url value="/myprocess"/>"> <img src="img/page.png" alt="" width="48" height="48"> 我的进度</a> 
				<a href="<s:url value="/mymessage"/>" class="shortcut"> <img src="img/checkin.png" alt="" width="48" height="48"> 我要留言</a> 
				<a href="<s:url value="/mycomplain"/>" class="shortcut last"> <img src="img/event.png" alt="" width="48" height="48"> 我要投诉</a>
				</security:authorize>
					<div class="cb">
					</div>
				</div>
			</div>
		</div>
		<div class="bloc right">
			<div class="title">常用功能<a href="#" class="toggle"></a></div>
			<div class="content">
			<a href="flight/" class="shortcut"> <img src="img/icons/search.png" alt="" width="32" height="32"> 航班查询
			</a> 
			<a href="weather/" class="shortcut"> <img src="img/icons/chart.png" alt="" width="32" height="32"> 天气查询
			</a> 
			<a href="exchange/" class="shortcut"> <img src="img/icons/money.png" alt="" width="32" height="32"> 汇率转换
			</a> 
			<security:authorize access="hasRole('ADMIN')">
				<a href="messagePage/" class="shortcut"> <img src="img/icons/posts.png" alt="" width="32" height="32"> 留言管理
				</a> 
			</security:authorize>
			<security:authorize access="hasRole('TRAVELLER')">
				<a href="messagePage/" class="shortcut"> <img src="img/icons/posts.png" alt="" width="32" height="32"> 我要留言
				</a> 
			</security:authorize>
			<a href="<s:url value="/traveller/personalcenter"/>" class="shortcut"> <img src="img/icons/smiley-happy.png" alt="" width="32" height="32">
				个人中心
			</a>
				<div class="cb"></div>
			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="cb"></div>

	<div class="bloc"></div>
</form>
</body>
<script type="text/javascript" src="<s:url value="/resources/js/script.js"/>">
</script>
</html>
