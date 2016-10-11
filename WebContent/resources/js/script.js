var names=[];
var processes = [];
var country;
var xmlHttp;  
var id; 

/**
*时间处理
* 对Date的扩展，将 Date 转化为指定格式的String * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q)
*可以用 1-2 个占位符 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) * eg: * (new
*Date()).pattern("yyyy-MM-dd hh:mm:ss.S")==> 2006-07-02 08:09:04.423      
* (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04      
* (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04      
* (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04      
* (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18      
*/        
Date.prototype.pattern=function(fmt) {         
var o = {         
"M+" : this.getMonth()+1, //月份         
"d+" : this.getDate(), //日         
"h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时         
"H+" : this.getHours(), //小时         
"m+" : this.getMinutes(), //分         
"s+" : this.getSeconds(), //秒         
<<<<<<< HEAD
"q+" : Math.floor((this.getMonth()+3)/3), //季度    
=======
"q+" : Math.floor((this.getMonth()+3)/3), //季度         
>>>>>>> origin/master
"S" : this.getMilliseconds() //毫秒         
};         
var week = {         
"0" : "/u65e5",         
"1" : "/u4e00",         
"2" : "/u4e8c",         
"3" : "/u4e09",         
"4" : "/u56db",         
"5" : "/u4e94",         
"6" : "/u516d"        
};         
if(/(y+)/.test(fmt)){         
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));         
}         
if(/(E+)/.test(fmt)){         
    fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);         
}         
for(var k in o){         
    if(new RegExp("("+ k +")").test(fmt)){         
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));         
    }         
}         
return fmt;         
}       

function change(obj){
	names.push(document.getElementById(obj.name).innerText);
	processes.push(obj.value);
}
function choosecountry(obj){
	country=obj.value;
}

function init(){
	var option="<option value='ChooseCountry'>请选择申签国家</option>";
	$.ajax({
		type:"GET",
		url:"./visaprocess/getInitData",
		data:{
			"aim":"getData",
		},
		dataType:'json',
		traditional:true,
		success:function(data){
			var countryCount=data["countryCount"];
			var destinations  = data["destinations"];
			$.each(destinations,function(i,list){
				option+="<option value="+list.name+">"+list.name+"</option>";
			});
<<<<<<< HEAD
			if(document.getElementById("destinationlist")!=null){
				document.getElementById("destinationlist").innerHTML=option;
			}else{
				document.getElementById("destinationlist1").innerHTML=option;
				document.getElementById("destinationlist2").innerHTML=option;
			}
=======
			document.getElementById("destinationlist").innerHTML=option;
			document.getElementById("destinationlist1").innerHTML=option;
			document.getElementById("destinationlist2").innerHTML=option;
>>>>>>> origin/master
		},
		error:function(data){
			//alert("数据获取失败");
			//window.location.reload();
		}
	});
}

$("#updatebutton").click(function(){
	if(names.length>0){
		$.ajax({
			type:"POST",
			url:"./visaprocess/updatelist",
			data:{
				"username":names,
				"process":processes,
			},
			dataType:'json',
			traditional:true,
			success:function(data){
				var sn=1;
				var content="<div>";
				var travellers = data["travellers"];
				$.each(travellers,function(i,list){
					//var date = (Date)list.startTime;
					//date=new Date();
					//alert(date.pattern("yyyy-MM-dd hh:mm:ss"));
					var options="<option value=0>请选择进度</option>";
					for(var i=1;i<=list.myProcessCount;i++){
						if(i==list.currentStage){
							options+="<option value="+i+" selected='selected'>流程"+i+"</option>";
						}else{
							options+="<option value="+i+">流程"+i+"</option>";
						}
					}
					options+="<option value=4>结束</option>";
					
					content+="<tr>"+
								"<td><span>"+(sn)+"</span></td>" +
								"<td><span id="+(sn++)+">"+list.name+"</span></td>"+
								"<td><span>"+list.sex+"</span></td>" +
								"<td><span>"+list.phoneNum+"</span></td>" +
								"<td><span>"+list.id+"</span></td>" +
								"<td><span>"+list.destination+"</span></td>" +
								"<td><fmt:formatDate value="+list.startTime+" pattern='yyyy-MM-dd' /></td>" +
								"<td>" +
								"<div class='left'>" +
								"<div class='selector' id='uniform-undefined' style='width:85px!important'>" +
								"<select id='options' name="+(i+1)+" style='opacity: 1;' onchange='change(this)'>" +
								options +
								"</select>" +
								"</div>" +
								"</div>" +
								"</td>" +
							"<td><span>"+new Date().pattern("yyyy-MM-dd hh:mm:ss")+"</span></td>" +
							"<td><span>admin</span></td>" +
							"<td><a title='删除该用户' onclick='if(confirm('确定删除${traveller.name}?')==false)return false;' href='/Visa/traveller/deletetraveller/"+list.name+"'> <img src='/resources/img/icons/actions/delete.png' alt='' id='delete'>" +
							"</a>" +
							"</td>" +
							"</tr>" +
							"</div>" +
							"<tr>" +
							"</tr>";
				});
				content+="" +
						"<tr>" +
						"<td colspan='11' style='text-align: center;'>" +
						"<input type='button' value='更新' name='btnUpdateVisaList' id='updatebutton'>" +
						"</td>" +
						"</tr>";
				content+="</div>";
				document.getElementById("processlist").innerHTML=content;
				//window.location.reload();
			},
			error:function(){
				alert("更新失败，请稍后重试");
			}
		});
	}else{
		alert("没有更新项");
	}
});

function microwebtoggle(){
	$("#microwebmanage").toggle(400);
}

function customertoggle(){
	$("#customermanage").toggle(400);
}


function updatePassword(){
	var oldPassword = txt1.value;
	var newPassword = txt2.value;
	$.ajax({
		type:"POST",
		data:{
			"oldPassword":oldPassword,
			"newPassword":newPassword,
		},
		dataType:'json',
		traditional:true,
		success:function(data){
			alert("更新成功");
			window.location.href="../login";
		},
		error:function(data){
			alert("更新失败,原因：原始密码错误");
			window.location.reload();
		}
	});
}

$("#submitMessage").click(function(){
	var messagername = txt1.value;
	var messagerphone = txt2.value;
	var message = txt3.value;
	$.ajax({
		type:"POST",
		data:{
			"messagername":messagername,
			"messagerphone":messagerphone,
			"message":message,
		},
		dataType:"json",
		success:function(){
			alert("留言成功"),
			window.location.href="./homePage";
		},
		error:function(){
			alert("留言失败"),
			window.location.reload();
		}
	});
});

$("#addVisaProcessButton").click(function(){
<<<<<<< HEAD
	alert("start add");
	if(CouponFlow()){
		var visaprocess = document.getElementById("visaProcess").value;
		var description = document.getElementById("description").value;
		$.ajax({
			type:"POST",
			url:'./visasetting/addvisaprocess',
			data:{
				"countryname":country,
				"visaprocess":visaprocess,
				"description":description,
			},
			success:function(){
				alert("添加成功"),
				window.location.href="./visasetting";
			},
			error:function(){
				alert("添加失败"),
				window.location.reload();
			}
		});
	}
});



function CouponFlow() {

	if (document.getElementById("visaProcess").value == "" || null == document.getElementById("visaProcess").value) {
		alert("请输入签证流程");
		return false;
	}
	if (document.getElementById("description").value == "" || null == document.getElementById("description").value) {
		alert("请输入签证描述");
		return false;
	}
	return true;
}
=======
	var visaprocess = document.getElementById("visaProcess").value;
	var description = document.getElementById("description").value;
	$.ajax({
		type:"POST",
		url:'./visasetting/addvisaprocess',
		data:{
			"countryname":country,
			"visaprocess":visaprocess,
			"description":description,
		},
		success:function(){
			alert("添加成功"),
			window.location.href="./visasetting";
		},
		error:function(){
			alert("添加失败"),
			window.location.reload();
		}
	});
});
>>>>>>> origin/master
