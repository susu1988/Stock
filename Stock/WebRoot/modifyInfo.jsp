<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
$(document).ready(function(){
	 var user_sex = "${admin.userSex}";
	 $("#sex"+user_sex).attr('checked','checked');
	 
	 var num = /^\d+$/;
	 $("#saveBtn").bind('click',function(){
		if($("#paramsUser\\.realName").val()==''){
			alert('用户姓名不能为空');
			return;
		}
		if($("#paramsUser\\.userPhone").val()==''){
			alert('用户电话不能为空');
			return;
		}
		$("#info").submit();
	 });
	
});	 
	
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">系统管理&gt;&gt;个人信息</span>
</div>
<form id="info" name="info" action="Admin_saveAdmin.action" method="post">    
<input type="hidden" name="paramsUser.userId" value="${admin.userId}"/>
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">编辑个人信息</TD>
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
          <td width="15%" align="right" style="padding-right:5px">用户名：</td>
          <td width="35%">${admin.userName}</td>
          <td width="15%" align="right" style="padding-right:5px"></td>
          <td width="35%"></td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 用户姓名：</td>
          <td>
             <input type="text" id="paramsUser.realName" name="paramsUser.realName" value="${admin.realName}"/>
          </td>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 用户性别：</td>
          <td>
             <input type="radio" name="paramsUser.userSex" id="sex1" value="1"/>男&nbsp;&nbsp;
             <input type="radio" name="paramsUser.userSex" id="sex2" value="2"/>女
          </td>
        </tr>     
        <c:if test="${admin.userType==1}">
        <tr>
          <td width="15%" align="right" style="padding-right:5px">用户公司：</td>
          <td width="35%">
          	<input type="text" id="paramsUser.userCompany" name="paramsUser.userCompany" value="${admin.userCompany}"/>
          </td>
          <td width="15%" align="right" style="padding-right:5px">用户地址：</td>
          <td width="35%">
          	<input type="text" id="paramsUser.userAddress" name="paramsUser.userAddress" value="${admin.userAddress}"/>
          </td>
        </tr> 
        </c:if>  
        <tr>
          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 用户邮箱：</td>
          <td width="35%">
          	<input type="text" id="paramsUser.userMail" name="paramsUser.userMail" value="${admin.userMail}"/>
          </td>
          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 用户电话：</td>
          <td width="35%">
          	<input type="text" id="paramsUser.userPhone" name="paramsUser.userPhone" value="${admin.userPhone}"/>
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
            <input type="button" id="saveBtn" Class="btnstyle" value="编 辑"/> 
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>