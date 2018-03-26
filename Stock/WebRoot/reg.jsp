<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
</script>
<style type="text/css">
.label{
	text-align:right;
	padding-right:20px;
}
.field{
	text-align:left;
	padding-left:20px;
}
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">仓储物流管理系统&gt;&gt;用户注册</span>
</div>
<form id="info" name="info" action="LoginRegSystem.action" method="post">   
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">用户注册</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="35%" class="label"><font color="red">*</font> 用户名</td>
          <td width="65%" class="field">
          	<input type="text" name="params.userName" id="params.user_name"  style="width:200px;"/>
          	&nbsp;<label id="user_nameTip" style="color:red"></label>
          </td>
        </tr> 
        <tr>
          <td class="label"><font color="red">*</font> 密码</td>
          <td class="field">
            <input type="password" name="params.userPass" id="params.user_pass" style="width:200px;"/>
            &nbsp;<label id="user_passTip" style="color:red"></label>
          </td>
        </tr> 
        <tr>
          <td class="label"><font color="red">*</font> 确认密码</td>
          <td class="field">
            <input type="password" name="user_rpass" id="user_rpass" style="width:200px;"/>
            &nbsp;<label id="user_rpassTip" style="color:red"></label>
          </td>
        </tr> 
        <tr>
          <td class="label"><font color="red">*</font> 姓名</td>
          <td class="field">
            <input type="text" name="params.realName" id="params.real_name" style="width:200px;"/>
            &nbsp;<label id="real_nameTip" style="color:red"></label>
          </td>
        </tr>   
        <tr>
          <td class="label"><font color="red">*</font> 性别</td>
          <td class="field">
            <input type="radio" id="sex1" name="params.userSex" checked="checked" value="1"/>男&nbsp;&nbsp;
            <input type="radio" id="sex2" name="params.userSex" value="2"/>女
          </td>
        </tr>  
        <tr>
          <td class="label">公司</td>
          <td class="field">
            <input type="text" name="params.userCompany" id="paramsUser.user_company" style="width:200px;" />
          </td> 
        </tr>
        <tr>
          <td class="label">地址</td>
          <td class="field">
          	<input type="text"  name="params.userAddress" id="paramsUser.user_address" style="width:200px;"/>
          </td>
        </tr>
        <tr>
          <td class="label">邮箱</td>
          <td class="field">
            <input type="text" name="params.userMail" id="paramsUser.user_mail" style="width:200px;" />
          </td> 
        </tr>
        <tr>
          <td class="label"><font color="red">*</font> 电话</td>
          <td class="field">
          	<input type="text"  name="params.userPhone" id="paramsUser.user_phone" style="width:200px;"/>
          	 &nbsp;<label id="user_phoneTip" style="color:red"></label>
          </td>
        </tr>
        <tr>
          <td class="label"><font color="red">*</font> 验证码</td>
          <td class="field">
           <input type="text" id="params.random" name="params.random" style="width:80px;" class="inputstyle"/>
		   &nbsp;<img src="Random.jsp" width="60" height="22" style="cursor:pointer;padding-top:5px" title="换一张" id="safecode" border="0" onClick="reloadcode()"/>
		   &nbsp;<label id="randomTip" style="color:red"></label>
          </td>
        </tr> 
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<input type="button" id="addBtn" Class="btnstyle" value="注 册" />
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
<script language="javascript" type="text/javascript">
//实现验证码点击刷新
function reloadcode(){
	var verify=document.getElementById('safecode');
	verify.setAttribute('src','Random.jsp?'+Math.random());
}
$(document).ready(function(){
	var addBtn = $("#addBtn");
	var user_name = $("#params\\.user_name");
	var user_pass = $("#params\\.user_pass");
	var user_rpass = $("#user_rpass");
	var real_name = $("#params\\.real_name");
	var user_phone = $("#params\\.user_phone");
	var random = $("#params\\.random");
	
	var name=/^[a-zA-Z][a-zA-Z0-9_]{5,14}$/;
    var pass=/^[a-zA-Z0-9]{7,14}$/;
    var age=/^\d+$/;
    var mail=/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
    
    user_name.blur(function(){
    	if(user_name.val()==""){
			$("#user_nameTip").html("登录名不能为空");
			return;
		}else{
			$("#user_nameTip").html('');
		}
    });
    user_pass.blur(function(){
    	if(user_pass.val()==""){
    		$("#user_passTip").html("密码不能为空");
			return;
		}else{
			$("#user_passTip").html('');
		}
    });
    user_rpass.blur(function(){
    	if(user_rpass.val()==''){
    		$("#user_rpassTip").html("确认密码不能为空");
			return;
		}
    	if(user_pass.val()!=user_rpass.val()){
    		$("#user_rpassTip").html("两次输入密码不一致");
			return;
		}else{
			$("#user_rpassTip").html('');
		}
    });
    real_name.blur(function(){
    	if(real_name.val()==''){
			$("#real_nameTip").html("姓名不能为空");
			return;
		}else{
			$("#real_nameTip").html('');
		}
    });
    user_phone.blur(function(){
    	if(real_name.val()==''){
			$("#user_phoneTip").html("电话不能为空");
			return;
		}else{
			$("user_phoneTip").html('');
		}
    });
	random.blur(function(){
    	if(random.val()==''){
			$("#randomTip").html("验证码不能为空");
			return;
		}else{
			$("#randomTip").html('');
		}
    });
    
	addBtn.bind("click",function(){
		
		var tips = $("#user_nameTip").html()
				  +$("#user_passTip").html()
				  +$("#user_rpassTip").html()
				  +$("#real_nameTip").html()
				  +$("#user_phoneTip").html()
				  +$("#randomTip").html();
		
		if(tips!=""){
			alert('请按照提示输入注册信息!');
			return;
		}
		
		var aQuery = $("#info").serialize();  
		$.post('LoginRegSystem.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('注册成功！即将进入系统……');
						 window.location.href="index.jsp";
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	});
});
</script>
</body>
</html>