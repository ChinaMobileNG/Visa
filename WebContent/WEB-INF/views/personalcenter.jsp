<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>
<html>
<head>
	<title>个人中心-大连海之韵国际旅行社</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jquery/1.6/jquery.min.js"/>"></script>
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
		<sf:form action="${logout }" method="POST">
		Hi,<security:authentication  property="principal.username"/>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			[Admin]
		</security:authorize> | 
   			<input type="submit" value="Logout" />
		</sf:form>
	</div>
</div>
<form id="id8" method="post" action="./?3-1.IFormSubmitListener-form">
<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
	<input type="hidden" name="id8_hf_0" id="id8_hf_0">
</div>
	<!--SIDEBAR-->
	<div id="sidebar">
		<ul>
			<li class="nosubmenu"><a href="<s:url value="/"/>"> <img src="img/icons/menu/inbox.png" alt=""> 控制台</a></li>
			<li class="current">
			<a onclick="microwebtoggle()" href="javascript:void(0)" ><img src="img/icons/menu/layout.png" alt="">微网站管理</a>
				<ul id="microwebmanage" style="display: none;">
					<li><a href="visaprocess">签证进度</a></li>
					<li><a href="#">主页管理</a></li>
					<li><a href="flight/">航班查询</a></li>
					<li><a href="weather/">天气查询</a></li>
					<li><a href="exchange/">汇率转换</a></li>
				</ul>
			</li>
			<li class="current"><a href="javascript:void(0)" onclick="customertoggle()"><img src="img/icons/menu/users.png" alt="">微会员管理</a>
				<ul id="customermanage" style="display: none;">
					<li><a href="<s:url value="/complain"/>">投诉管理</a></li>
					<li><a href="messagePage/">留言管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!--CONTENT-->
	<div id="content" class="white">

		<div class="" style="display: none;">
			<strong><span></span></strong>
			<span></span>
			<a href="#" class="close"></a>
		</div>

		<h1><img src="img/icons/smiley-happy.png" alt=""> 个人中心</h1>

		<div class="bloc left">
			<div class="title">修改密码<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<table>
						<tbody><tr>
							<td>原密码</td>
							<td>
								<div class="input">
									<input type="text" autocomplete="off" id="txt1" placeholder="请输入原密码" value="" name="oldPwd">
								</div>
							</td>
						</tr>
						<tr>
							<td rowspan="2">新密码</td>
							<td>
								<div class="input">
									<input type="password" id="txt2" placeholder="请输入新密码" value="" name="firstNewPwd">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="input">
									<input type="password" id="txt3" placeholder="请确认新密码" value="" name="secondNewPwd">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<div class="submit">
									<a href="javascript:void(0)" onclick="updatePassword()">
										<input type="button" value="修改" 
										name="btnUpd" id="modifyButton" onclick="checkValue()">
									</a>
									<input type="reset" value="取消">
								</div>
							</td>
						</tr>
						</tbody></table>
				</div>
			</div>
		</div>
	</div>
</form>
<script src="<s:url value="/resources/js/script.js"/>"></script>
<script>
	function checkValue() {
		if (txt1.value == "" || null == txt1.value) {
			alert("原密码不能为空");
			return false;
		} else if (txt2.value == "" || null == txt2.value) {
			alert("新密码不能为空");
			return false;
		} else if (txt3.value == "" || null == txt3.value) {
			alert("确认新密码不能为空");
			return false;
		} else if(txt2.value != txt3.value){
			alert("新密码输入不一致");
			return false;
		}else {
			if(confirm("是否确认修改")){
				return true;
			}else{
				return false;
			}
		}
	}
</script>
</body>
</html>