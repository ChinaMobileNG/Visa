<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page session="false" %>
<html>
<head>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<title>签证进度-大连海之韵国际旅行社</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jquery/1.6/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
	<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/css/min.css"/>"><link>
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/css/content/settings/style.css"/>"><link>
	<script>
		/*<![CDATA[*/

		function CouponFlow() {

			if (flow.value == "" || null == flow.value) {
				alert("请输入签证流程");
				return false;
			}
			if (desc.value == "" || null == desc.value) {
				alert("请输入签证描述");
				return false;
			}
		}

		/*]]>*/
	</script>
	<script>
		/*<![CDATA[*/

		function Coupontype() {
			if (addcoupon.value == "" || null == addcoupon.value) {
				alert("请输入签证种类");
				return false;
			}
		}

		/*]]>*/
	</script>
	<style>
		/*<![CDATA[*/

		.aaa {
			display: none;
		}

		/*]]>*/
	</style>
</head>
<body onload="init()">
<!-- HEAD -->
<div id="head">
	<div class="left">
		Hi, <a href="center.html"><span>admin</span></a> | <a href="logout/">退出</a>
	</div>
</div>
<!--SIDEBAR-->
<div id="sidebar">
	<ul>
		<li class="nosubmenu"><a href="<s:url value="/"/>"> <img src="img/icons/menu/inbox.png" alt=""> 控制台
		</a></li>
		<li><a href="#"><img src="img/icons/menu/layout.png" alt="">
			微网站管理</a>
			<ul style="display: none;">
				<li><a href="<s:url value="/visaprocess"/>">签证进度</a></li>
				<li><a href="homePage/">主页管理</a></li>
				<li><a href="flight/">航班查询</a></li>
				<li><a href="weather/">天气查询</a></li>
				<li><a href="exchang/">汇率转换</a></li>
			</ul></li>
		<li><a href="#"><img src="img/icons/menu/users.png" alt="">
			微会员管理</a>
			<ul style="display: none;">
				<li><a href="complainPage.html">投诉管理</a></li>
				<li><a href="messagePage/">留言管理</a></li>
			</ul></li>
		<li class="current"><a href="#"><img src="img/icons/menu/idea.png" alt=""> 后台管理</a>
			<ul>
				<li><a href="userSet.html">用户设置</a></li>
				<li class="current"><a href="couponAdmin.html">签证设置</a></li>
			</ul></li>
	</ul>
</div>

<!--CONTENT-->
<div id="content" class="white">
	<h1>
		<img src="img/icons/cog.png" alt=""> 签证设置
	</h1>
	<form onsubmit="return Coupontype()" id="id12" method="post" action="./?7-1.IFormSubmitListener-formAddVisaCountry"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="id12_hf_0" id="id12_hf_0"></div>
		<div class="" style="display: none;">
			<strong><span></span></strong> <span></span> <a href="#" class="close"></a>
		</div>
		<div class="cb"></div>
		<div class="bloc">
			<div class="title">签证种类<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<table class="noalt">
						<thead>
						<tr>
							<th><em>序号</em></th>
							<th><em>签证种类</em></th>
							<th><em>添加时间</em></th>
							<th><em>操作</em></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${countries }" var="country" varStatus="status">
							<tr>
								<td><span>${status.index+1}</span></td>
								<td class="neutral"><a href="#"><span>${country.name}</span></a></td>
								<td class="good"><span>${country.addDate}</span></td>
								<td><a onclick="if(confirm('确定删除?')==false)return false;" title="删除该流程" href="<s:url value="/visasetting/deletecountry/${country.name }"/>"><img src="img/icons/actions/delete.png" alt="" id="delete"></a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	
	<s:url value="/visasetting/addvisaprocess" var="addVisaProcess"></s:url>
	<form onsubmit="return CouponFlow()" id="id14" method="post" action="${addVisaProcess }"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="id14_hf_0" id="id14_hf_0"></div>
		<div class="bloc right">
			<div class="title">添加签证流程<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<table class="noalt">
						<thead>
						<tr>
							<th><em>签证种类</em></th>
							<th><em>流程</em></th>
							<th><em>描述</em></th>
							<th><em>操作</em></th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="neutral">
							<div class="selector" style="width:70px"  id="uniform-undefined" ><span>流程1</span>
								<select id="destinationlist" name="countryselector" style="opacity: 0;" onchange="choosecountry(this)">
									<option value="NOCOUNTRY">选择国家</option>
									<option value="China">中国</option>
									<option value="American">美国</option>
									<option value="Japan">日本</option>
									<option value="Thailand">泰国</option>
									<option value="Indian">印度</option>
								</select>
							</div>
							<input type="hidden" value="6" name="hiddenCountryId">
							</td>
							<td><div class="input">
								<input style="width: 150px;" type="text" autocomplete="off" placeholder="请输入签证流程"  value="" id="visaProcess">
							</div></td>
							<td><div class="input">
								<input style="width: 200px;" type="text" autocomplete="off" placeholder="请输入流程描述"  value="" id="description">
							</div></td>
							<td><div class="submit">
								<input type="button" value="添加" name="btnAddVisaType" id="addVisaProcessButton">
							</div></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	
	<s:url value="/visasetting/addvisacountry" var="addVisaCountry"/>
	<form method="post" action="${addVisaCountry }">
	<div class="bloc left" style="margin-top:20px">
			<div class="title">添加签证种类<a href="#" class="toggle"></a></div>
			<div class="content">
					<table class="noalt">
						<thead>
						<tr>
							<th><em>内容</em></th>
							<th><em>操作</em></th>
						</tr>
						</thead>

						<tbody>
						<tr>
							<td>
								<div class="input">
									<input type="text" autocomplete="off" placeholder="请输入国家名称" id="addcoupon" value="" name="visaCountryName">
								</div>
							</td>
							<td><div class="submit">
								<input type="submit" value="添加" name="btnAddCountryName" id="id13">
							</div></td>
						</tr>
						</tbody>
					</table>
					<div class="cb"></div>
			</div>
		</div>
	</form>
	<form id="id16" method="post" action="./?7-1.IFormSubmitListener-formVisaType">
	<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
	<input type="hidden" name="id16_hf_0" id="id16_hf_0"></div>
		<div class="cb">
		</div>
		<c:forEach items="${countries }" var="country" varStatus="status">
			<div class="bloc">
				<div class="title">
					<span>${country.name }</span>签证流程
					<a href="#" class="toggle"></a></div>
				<div class="content">
					<table class="noalt">
						<thead>
						<tr>
							<th><em>序号</em></th>
							<th><em>流程</em></th>
							<th><em>描述</em></th>
							<th><em>添加时间</em></th>
							<th><em>操作</em></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${country.processes }" var="process" varStatus="status">
							<tr>
								<td><span>${status.index+1 }</span></td>
								<td class="neutral"><span>${process }</span></td>
								<td class="neutral"><span>
								<c:choose>
									<c:when test="${process==1 }">
										开始办理
									</c:when>
									<c:when test="${process!=1 && !status.last }">
										流程${process-1 }
									</c:when>
									<c:when test="${status.last }">
										办理结束
									</c:when>
								</c:choose>
								</span></td>
								<td class="good"><span>${country.addDate }</span></td>
								<td><a onclick="if(confirm('确定删除?')==false)return false;" title="删除该流程" href="./?7-1.ILinkListener-formVisaType-rptVisaType-2-lnkDelVisaType"><img src="img/icons/actions/delete.png" alt="" id="delete"> </a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="cb"></div>
				</div>
			</div>
		</c:forEach>
	</form>
</div>
<script type="text/javascript" src="<s:url value="/resources/js/script.js"/>">
</script>
</body></html>