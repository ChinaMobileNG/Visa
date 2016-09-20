var names=[];
var processes = [];
function change(obj){
	names.push(document.getElementById(obj.name).innerText);
	processes.push(obj.value);
}

$("#updatebutton").click(function(){
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
			window.location.reload();
		},
		error:function(){
			alert("更新失败，请稍后重试");
		}
	});
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