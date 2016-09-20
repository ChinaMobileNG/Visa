<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>
<html>
<head>
	<title>签证进度-大连海之韵国际旅行社</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jquery/1.6/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
	<link type="text/css"  rel="stylesheet" href="<s:url value="/resources/css/min.css"/>"><link>
	<link type="text/css" rel="stylesheet" href="<s:url value="/resources/css/content/settings/style.css"/>"><link>
</head>
<body>
<div id="head">
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}"
	method="post">
Hi,<security:authentication property="principal.username"/>
 <security:authorize access="hasRole('ROLE_ADMIN')">
			[Admin]
</security:authorize> | 
<input type="submit"
	value="Log out" />
<input type="hidden"
	name="${_csrf.parameterName}"
	value="${_csrf.token}"/>
</form>
</div>
<!--SIDEBAR -->
<div id="sidebar">
	<ul>														
		<li class="nosubmenu"><a href="<s:url value="/"/>"> <img src="<s:url value="/resources/img/icons/menu/inbox.png"/>" alt=""> 控制台
		</a></li>
		<li class="current"><a href="javascript:void(0)" onclick="microwebtoggle()"><img src="<s:url value="/resources/img/icons/menu/layout.png"/>" alt=""> 微网站管理</a>
			<ul id="microwebmanage">
				<li class="current"><a href="<s:url value="/visaprocess"/>">签证进度</a></li>
				<li><a href="homePage/">主页管理</a></li>
				<li><a href="flight/">航班查询</a></li>
				<li><a href="weather/">天气查询</a></li>
				<li><a href="exchange/">汇率转换</a></li>
			</ul></li>
		<li><a href="javascript:void(0)" onclick="customertoggle()"><img src="<s:url value="/resources/img/icons/menu/users.png"/>" alt="">微会员管理</a>
			<ul id="customermanage" style="display: none;">
				<li><a href="complainPage.html">投诉管理</a></li>
				<li><a href="messagePage/">留言管理</a></li>
			</ul></li>
	</ul>
</div>
<!--CONTENT-->
<div id="content" class="white">
	<h1>
		<img src="<s:url value="/resources/img/page.png"/>" alt=""> 签证进度
	</h1>
	<div class="cb"></div>
	<div class="notif warning bloc" style="display: none;">
		<strong><span></span></strong> <span></span> <a href="#" class="close"></a>
	</div>
	<s:url value="/traveller/addtraveller" var="addtraveller"/>
	
	<sf:form id="idc" method="POST" commandName="traveller" action="${addtraveller}" >
		<div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden">
			<input type="hidden" name="idc_hf_0" id="idc_hf_0">
		</div>
		<div class="bloc">
			<div class="title">添加<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<table>
						<thead>
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>身份证号码</th>
							<th>手机号码</th>
							<th>申签国家</th>
							<th>开始时间</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td>
								<div class="input">
									<sf:input style="width: 120px;" type="text" placeholder="your name" autocomplete="off" id="txt1" value="" path="name"/>
								</div>
							</td>
							<td>
								<div class="input">
									<div class="selector" id="uniform-txt2"><span>男</span><select id="txt2" name="sex" style="opacity: 0;">
										<option value="0">请选择性别</option>
										<option value="man">男</option>
										<option value="woman">女</option>
									</select></div>
								</div>
							</td>
							<td>
								<div class="input">
									<sf:input style="width: 150px;" type="text" placeholder="your ID" autocomplete="off" id="txt3" maxlength="18" value="" path="id"/>
									<sf:errors path="id" cssClass="redcolor"/>
								</div>
							</td>
							<td>
								<div class="input">
									<sf:input style="width: 130px;" type="text" placeholder="your telephone number" autocomplete="off" id="txt4" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" value="" path="phoneNum"/>
									<sf:errors path="phoneNum" cssClass="redcolor"></sf:errors>
								</div>
							</td>
							<td>
								<div class="input">
									<div class="selector" id="uniform-txt5"><select id="txt5" name="destination" style="opacity: 0;">
										<option value="0">请选择申签国家</option>
										<option value="China">中国</option>
										<option value="American">美国</option>
										<option value="Japan">日本</option>
										<option value="Thailand">泰国</option>
									</select></div>
								</div>
							</td>
							<td>
								<div class="input">
									<input type="text" name="startTime" value=<%=new java.sql.Date(System.currentTimeMillis())%> >
								</div>
							</td>
							<td>
								<div class="submit">
									<input type="submit" value="添加" name="btnAddVisaUser" id="idd">
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</sf:form>

	<s:url value="/traveller/filter" var="filter"/>
	<sf:form id="ide" method="post" action="${filter}"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="ide_hf_0" id="ide_hf_0"></div>
		<div class="cb"></div>
		<div class="bloc">
			<div class="title">筛选<a href="#" class="toggle"></a></div>
			<div class="content">
				<table>
					<tbody><tr>
						<td>
							<div class="input">
								<div class="selector" id="uniform-idb"><span>请选择申签国家</span><select name="visaCountry" id="idb" style="opacity: 0;">
									<option selected="selected" value="0">请选择申签国家</option>
									<option value="China">中国</option>
									<option value="American">美国</option>
									<option value="Japan">日本</option>
									<option value="Thailand">泰国</option>
								</select></div>
							</div>
						</td>
						<td>
							<div class="input">
								<div class="selector" id="uniform-undefined"><span>请选择</span><select name="ddlVisaType" style="opacity: 0;">
									<option selected="selected" value="">请选择</option>
								</select></div>
							</div>
						</td>
						<td>
							<div class="input">
								<input style="width: 250px;" type="text" autocomplete="off" placeholder="请输入搜索内容..." value="" name="txtSearch">
							</div>
						</td>
						<td>
							<div class="submit">
								<input type="submit" value="查询" name="btnSearch" id="idf">
							</div>
						</td>
					</tr>
					</tbody></table>
				<div class="cb"></div>
			</div>
		</div>
		<div class="cb"></div>
	</sf:form>

	<s:url value="/visaprocess/update" var="update"/>
	<sf:form id="id12" method="post" action="${update}"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="id12_hf_0" id="id12_hf_0"></div>
		<div class="bloc">
			<div class="title">进度一览<a href="#" class="toggle"></a></div>
			<div class="content">
				<div class="cb">
					<table>
						<thead>
						<tr>
							<th>序号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>手机号码</th>
							<th>身份证号码</th>
							<th>申签国家</th>
							<th>开始日期</th>
							<th>进度级别</th>
							<th>更新时间</th>
							<th>更新者</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${travellers}" var="traveller" varStatus="status">
							<div>
								<tr>
									<td><span>${status.index+1}</span></td>
									<td><span id="${status.index+1}">${traveller.name}</span></td>
									<td><span>${traveller.sex }</span></td>
									<td><span>${traveller.phoneNum }</span></td>
									<td><span>${traveller.id }</span></td>
									<td><span>${traveller.destination}</span></td>
									<td><fmt:formatDate value="${traveller.startTime }" pattern="yyyy-MM-dd" /></td> <!-- ,HH:mm -->
									<c:if test="${traveller.destination=='American'}" >	
										<td>
											<input type="hidden" value="18" name="rptList:1:hiddenLevel_id">
											<div class="left">
												<div class="selector" id="uniform-undefined"><span>流程1</span>
												<select name="${status.index+1}" style="opacity: 0;" onchange="change(this)">
													<option value="0">请选择进度</option>
													<option value=1>流程1</option>
													<option value="2">流程2</option>
													<option value="3">流程3</option>
													<option value="9">结束</option>
												</select>
												</div>
											</div>
										</td>
									</c:if>
									<c:if test="${traveller.destination=='Japan'}" >	
										<td>
											<input type="hidden" value="18" name="rptList:1:hiddenLevel_id">
											<div class="left">
												<div class="selector" id="uniform-undefined"><span>流程1</span>
												<select name="${status.index+1}" style="opacity: 0;" onchange="change(this)">
													<option value="0">请选择进度</option>
													<option value=2>流程2</option>
													<option value="2">流程2</option>
													<option value="9">结束</option>
												</select></div>
											</div>
										</td>
									</c:if>
									<c:if test="${traveller.destination=='Thailand'}" >	
										<td>
											<input type="hidden" value="18" name="rptList:1:hiddenLevel_id">
											<div class="left">
												<div class="selector" id="uniform-undefined"><span>流程1</span>
												<select name="${status.index+1}" style="opacity: 0;" onchange="change(this)">
													<option value="0">请选择进度</option>
													<option value=4>流程4</option>
													<option value="2">流程2</option>
													<option value="3">流程3</option>
													<option value="4">流程4</option>
													<option value="9">结束</option>
												</select></div>
											</div>
										</td>
									</c:if>
									<c:if test="${traveller.destination=='China'}" >	
										<td>
											<input type="hidden" value="18" name="rptList:1:hiddenLevel_id">
											<div class="left">
												<div class="selector" id="uniform-undefined"><span>流程1</span>
												<select name="${status.index+1}" style="opacity: 0;" onchange="change(this)">
													<option value="0">请选择进度</option>
													<option value=1>流程1</option>
												</select></div>
											</div>
										</td>
									</c:if>
									<td><span>${traveller.startTime }</span></td>
									<td><span>admin</span></td>
									<td><a title="删除该用户" onclick="if(confirm('确定删除${traveller.name}?')==false)return false;" href="<s:url value="/traveller/deletetraveller/${traveller.name }"/>"> <img src="<s:url value="/resources/img/icons/actions/delete.png"/>" alt="" id="delete">
										</a>
									</td>
								</tr>
							</div>
						</c:forEach>
						
						<tr>
							<td colspan="11" style="text-align: center;">
								<div class="submit">
									<input type="button" value="更新" name="btnUpdateVisaList" id="updatebutton">
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</sf:form>

</div>
<script type="text/javascript" src="<s:url value="/resources/js/script.js"/>">
</script>

</body>
</html>