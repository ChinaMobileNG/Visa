<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:wicket="http://wicket.apache.org">
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>投诉</title>
    <style type="text/css">
        <!--
        * {
            font-family: 'SimHei';
            color: #555;
        }

        body {
            font-size: 1em;
            margin: 0;
            padding: 0;
        }

        .all ul {
            list-style-type: none;
            margin-bottom: 20px;
        }

        .all {
            height: auto;
            width: auto;
        }

        .all li {
            margin-top: 20px;
            font-size: 1em;
        }

        .all li span {
            width: 39%;
        }

        .all textarea {
            height: 200px;
            font-size: 1em;
            width: 55%;
            outline: 0px;
            border: 1px solid #cacaca;
            border-radius: 3px;
            padding: 10px;
            color: #555;
            background-color: #fff;
            background-image: none;
            margin-left: 10px;
        }

        .all textarea:focus {
            border: 1px solid #0099ff;
        }

        .all li select {
            font-size: 1em;
            width: 61%;
            border: 1px solid #cacaca;
            border-radius: 3px;
            padding: 10px;
            color: #555;
            background-color: #fff;
            background-image: none;
            outline: 0px;
        }

        .all li select:focus {
            border: 1px solid #0099ff;
        }

        .all .textarea-label {
            float: left;
            width: auto !important;
        }

        body {
            margin: 0px;
            padding: 0px;
        }

        .all .a {
            font-size: 1em;
            width: 55%;
            border: 1px solid #cacaca;
            border-radius: 3px;
            padding: 10px;
            color: #555;
            background-color: #fff;
            background-image: none;
            outline: 0px;
        }

        .all .a:focus {
            border: 1px solid #0099ff;
        }

        .all .btn-group {
            width: 100%;
            text-align: center;
            position: absolute;
            bottom: 30px;
        }

        .all .b {
            height: 50px;
            width: 120px;
            font-size: 1em;
        }

        .all .b1 {
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

        .all .b1:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #68a54b), color-stop(1, #74ad5a));
            background: -moz-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -webkit-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -o-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: -ms-linear-gradient(top, #68a54b 5%, #74ad5a 100%);
            background: linear-gradient(to bottom, #68a54b 5%, #74ad5a 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#68a54b', endColorstr='#74ad5a', GradientType=0);
            background-color: #68a54b;
        }

        .all .b1:active {
            position: relative;
            top: 1px;
        }

        .all .b2 {
            margin-left: 20px;
            -moz-box-shadow: inset 0px 1px 0px 0px #a3a3a3;
            -webkit-box-shadow: inset 0px 1px 0px 0px #a3a3a3;
            box-shadow: inset 0px 1px 0px 0px #a3a3a3;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #808080), color-stop(1, #666666));
            background: -moz-linear-gradient(top, #808080 5%, #666666 100%);
            background: -webkit-linear-gradient(top, #808080 5%, #666666 100%);
            background: -o-linear-gradient(top, #808080 5%, #666666 100%);
            background: -ms-linear-gradient(top, #808080 5%, #666666 100%);
            background: linear-gradient(to bottom, #808080 5%, #666666 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#808080', endColorstr='#666666', GradientType=0);
            background-color: #808080;
            border: 1px solid #4f4f4f;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            padding: 6px 12px;
            text-decoration: none;
            outline: 0px;
        }

        .all .b2:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #666666), color-stop(1, #808080));
            background: -moz-linear-gradient(top, #666666 5%, #808080 100%);
            background: -webkit-linear-gradient(top, #666666 5%, #808080 100%);
            background: -o-linear-gradient(top, #666666 5%, #808080 100%);
            background: -ms-linear-gradient(top, #666666 5%, #808080 100%);
            background: linear-gradient(to bottom, #666666 5%, #808080 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#666666', endColorstr='#808080', GradientType=0);
            background-color: #666666;
        }

        .all .b2:active {
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

        -->
    </style>
    <script>
        function notNull() {

            if (tousu_name.value == "" || null == tousu_name.value) {
                alert("请选择要投诉的人");
                return false;
            }
            if (flow.value == "" || null == flow.value) {
                alert("请输入投诉原因");
                return false;
            }
            if (desc.value == "" || null == desc.value) {
                alert("请输入投诉描述");
                return false;
            }

        }
    </script>
</head>

<body>
<div class="header">
    <h3>投诉</h3>
</div>
<div class="all">
	<s:url value="/mycomplain/savecomplains" var="saveComplain"/>
    <form id="form" onsubmit="return notNull()" action="${saveComplain }" method="post">
        <ul>
            <li><span id="lblMsg">请填写投诉信息</span></li>
            <li><span>被投诉人：</span> <label for="tousu_name"></label> 
            <select id="nameSelect"
                    name="tousu_name" id="tousu_name">
                    <option value="0">请选择投诉人</option>
					<option value="shilei">shilei</option>
					<option value="sunheyang">sunheyang</option>

            </select>
            </li>
            <li><span>投诉原因：</span> <input class="a" name="reason" id="flow" type="text" autocomplete="off"
                                          size="30" id="reason" maxlength="13"/></li>
            <li><span>详细说明：</span> <input class="a" name="description" type="text" autocomplete="off" id="desc"
                                          id="discription" size="30" maxlength="13"/>
            </li>
        </ul>
        <div class="btn-group">
            <input class="b b1" name="sb" type="submit" id="btnSubmit"
                   value="提交"/> <input class="b b2" name="cz" type="reset" value="重置"/>
        </div>
    </form>
</div>

</body>
</html>
