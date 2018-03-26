<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.car!=null && #attr.car.carId!=0">编辑</s:if><s:else>添加</s:else>车辆信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 
	 $("#addBtn").bind('click',function(){
		if($("#paramsCar\\.carModel").val()==''){
			alert('车辆型号不能为空');
			return;
		}
		if($("#paramsCar\\.carNumber").val()==''){
			alert('车牌号不能为空');
			return;
		}
		if($("#paramsCar\\.carFlag").val()=='0'){
			alert('车辆状态不能为空');
			return;
		}
		$("#paramsCar\\.carId").val(0);
		$("#info").attr('action','Admin_addCar.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		if($("#paramsCar\\.carModel").val()==''){
			alert('车辆型号不能为空');
			return;
		}
		if($("#paramsCar\\.carFlag").val()=='0'){
			alert('车辆状态不能为空');
			return;
		}
		$("#info").attr('action','Admin_saveCar.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">车辆管理&gt;&gt;<s:if test="#attr.car!=null && #attr.car.carId!=0">编辑</s:if><s:else>添加</s:else>车辆</span>
</div>
<form id="info" name="info" action="Admin_addCar.action" method="post">   
<s:hidden id="paramsCar.carId" name="paramsCar.carId" value="%{#attr.car.carId}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.car!=null && #attr.car.carId!=0">编辑</s:if><s:else>添加</s:else>车辆</TD>
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
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 车辆型号：</td>
          <td width="65%">
          	<s:textfield name="paramsCar.carModel" id="paramsCar.carModel" value="%{#attr.car.carModel}"/>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 车牌号：</td>
          <td width="65%">
          	<s:if test="#attr.car!=null && #attr.car.carId!=0">
          	<s:property value="#attr.car.carNumber"/>
          	</s:if>
          	<s:else>
          	<s:textfield name="paramsCar.carNumber" id="paramsCar.carNumber" value="%{#attr.car.carNumber}"/>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td width="35%" align="right" style="padding-right:5px">车辆状态：</td>
          <td width="65%">
          	<s:select list="#{'1':'闲置',2:'在用' }" id="paramsCar.carFlag" name="paramsCar.carFlag" value="%{#attr.car.carFlag}"
          			listKey="key" listValue="value" headerKey="0" headerValue="请选择" cssStyle="width:155px;">
          	</s:select>
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
          	<s:if test="#attr.car!=null && #attr.car.carId!=0">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</s:else>
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>