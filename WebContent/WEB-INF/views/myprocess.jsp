<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wicket="http://wicket.apache.org">
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>签证查询</title>
	<script type="text/javascript" src="<s:url value="/resources/js/libs/jqueryui/1.8.13/jquery-ui.min.js"/>"></script>
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/resources/js/content/settings/main.js"/>"></script>
    <link href="mobile/css/css.css" rel="stylesheet" type="text/css"/>
    <style>
        * {
            font-family: 'SimHei';
            color: #555;
        }

        body {
            font-size: 1em;
            margin: 0;
            padding: 0;
        }

        .all {
            height: auto;
            width: auto;
        }

        .input-group {
            margin-left: -20px;
        }

        .a {
            font-size: 2em;
            width: 80%;
            border: 1px solid #cacaca;
            border-radius: 3px;
            padding: 10px;
            color: #555;
            background-color: #fff;
            background-image: none;
            outline: 0px;
            margin-left: 10%;
        }

        .a:focus {
            border: 1px solid #0099ff;
        }

        .btn-group {
            width: 100%;
            text-align: center;
            position: absolute;
            bottom: 30px;
        }

        .b {
            height: 50px;
            width: 120px;
            font-size: 1em;
        }

        .b1 {
            -moz-box-shadow: inset 0px 1px 0px 0px #9acc85;
            -webkit-box-shadow: inset 0px 1px 0px 0px #9acc85;
            box-shadow: inset 0px 1px 0px 0px #9acc85;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #74ad5a), color-stop(1, #68a54b));
            background: -moz-linear-gradient(top, #74ad5a 5%, #68a54b 100%);
            background: -webkit-linear-gradient(top, #74ad5a 5%, #68a54b 100%);
            background: -o-linear-gradient(top, #74ad5a 5%, #68a54b 100%);
            background: -ms-linear-gradient(top, #74ad5a 5%, #68a54b 100%);
            background: linear-gradient(to bottom, #74ad5a 5%, #68a54b 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#74ad5a', endColorstr='#68a54b', GradientType=0);
            background-color: #74ad5a;
            border: 1px solid #3b6e22;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            padding: 6px 12px;
            text-decoration: none;
            outline: 0px;
        }

        .b1:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #68a54b), color-stop(1, #74ad5a));
            background: -moz-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -webkit-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -o-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -ms-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: linear-gradient(to bottom, #68a54b 5%, #74ad5a 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#68a54b', endColorstr='#74ad5a', GradientType=0);
            background-color: #68a54b;
        }

        .b1:active {
            position: relative;
            top: 1px;
        }

        .header {
            width: 100%;
            height: 80px;
            background: #00CCFF;
            margin-top: -20px;
        }

        .header h3 {
            color: #fff;
            padding-left: 40px;
            line-height: 80px;
        }

        .list-table {
            width: 100%;
            text-align: center;
            font-size: 2em;
        }
    </style>
</head>
<body>
<div class="header">
    <h3>签证查询</h3>
</div>
<form id="form">
    <div id="all">
        <div id="down">
            <p style="margin:30px 0 30px 5%;">
                <span id="username">
                	<security:authorize access="hasRole('TRAVELLER')">
                		<security:authentication property="principal.username" />的当前进度
                	</security:authorize>
                </span>
            </p>
            <table class="list-table" border="0">
                <tr>
                	<td>姓      名</td>
                	<td>性		别</td>
                	<td>联 系 电 话</td>
                	<td>签 证 地 点</td>
                    <td>当 前 进 度</td>
                    <td>最近更新时间</td>
                    <td>总 流 程 数</td>
                    <td>备      注</td>
                </tr>
                <tr>
                	<td>${traveller.name}</td>
                	<td>${traveller.sex }</td>
                	<td>${traveller.phoneNum }</td>
                	<td>${traveller.destination}</td>
                	<td>${traveller.currentStage}</td>
                	<td>${traveller.startTime }</td>
                	<td>${traveller.myProcessCount}</td>
                	<td>尚无</td>
                </tr>
            </table>
        </div>
    </div>
</form>
<script type="text/javascript" src="<s:url value="/resources/js/script.js"/>"></script>
</body>
</html>