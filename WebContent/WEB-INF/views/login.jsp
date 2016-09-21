<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="true" %>
<html>
<head>
	<title>首页-大连海之韵国际旅行社</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jquery/1.6/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
	<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/css/min.css"/>"><link>
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/css/content/settings/style.css"/>"><link>
<script>
/*<![CDATA[*/

	function checkValue() {
		if (txt.value == "" || null == txt.value) {
			alert("请输入用户名");
			return false;
		} else if (psw.value == "" || null == psw.value) {
			alert("请输入密码");
			return false;
		} else {
			return true;
		}
	}

/*]]>*/
</script>
</head>
<body onload='document.f.username.focus();'> 
	<s:url value="/login" var="LogIn"></s:url>
	<form onsubmit="return checkValue()" name="f" method="post" action="${LogIn}">
	<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
		<input type="hidden" name="id1_hf_0" id="id1_hf_0" />
	</div>
		<div id="content" class="white"
			style="position: absolute; top: 20%; left: 20%;">
			<div class="" style="display: none;">
				<strong>
				<span></span>
				</strong> 
				<span></span> 
				<a href="#" class="close"></a>
			</div>
			<div class="bloc center">
				<div>
					<font color="red" size="50px">  
				        <c:if test="${param.failed==true }">  
				           <div>login failed,try again!</div> 
				        </c:if>  
				    </font> 
				</div>
				<div class="title">用户登录</div>
				<div class="content">
					<div class="cb">
						<div class="input">
							<input type="text" autocomplete="off" placeholder="请输入用户名" id="txt" value="" name="username"/> 
							<input type="password" placeholder="请输入密码" id="psw" value="" name="password"/>
						</div>
						<div class="submit" style="text-align: center;">
							<input type="submit" value="登录" name="submitbutton" id="id2"/> 
							<input type="reset" value="取消" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>