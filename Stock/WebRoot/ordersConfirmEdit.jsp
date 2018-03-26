<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	var num = /^\d+?$/;
	 $("#addBtn").bind('click',function(){
		if($("#carInfo").val()==''){
			alert('车辆信息不能为空');
			return;
		}
		if($("#sendId").val()=='0'){
			alert('配送人不能为空');
			return;
		}
		$("#info").attr('action','Admin_confirmOrders.action').submit();
		 
	 });
	 
	 function decodeEntities(s){ 
		    var str, temp= document.createElement('p'); 
		    temp.innerHTML= s; 
		    str= temp.textContent || temp.innerText; 
		    temp=null; 
		    return str; 
	}
	 
	 var sends = {};
	 <s:if test="#attr.senders!=null&&#attr.senders.size()>0">
	 <s:iterator value="#attr.senders" id="sender">
	 	var sendId = "<s:property value='#sender.userId'/>";
	 	var sendName = decodeEntities("<s:property value='#sender.realName'/>");
	 	sends[sendId] = sendName;
	 </s:iterator>
	 </s:if>
	 
	$("#sendId").change(function(){
		var sendId = $(this).val();
		if(sendId!='0'){
			$("#sendName").val(sends[sendId]);
		}
    });
	 
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">订单管理&gt;&gt;确认订单</span>
</div>
<form id="info" name="info" action="Admin_confirmOrders.action" method="post">   
<s:hidden id="paramsOrders.ordersId" name="paramsOrders.ordersId" value="%{#attr.orders.ordersId}" /> 
<s:hidden id="sendName" name="paramsOrders.sendName" value="" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">确认订单</TD>
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
          <td align="right" style="padding-right:5px"><font color="red">*</font> 订单编号：</td>
          <td>
          	<s:property value="#attr.orders.ordersNo"/>
          </td>
       </tr> 
       <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 订货人：</td>
          <td>
          	<s:property value="#attr.orders.realName"/>
          </td>
       </tr> 
       <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 货物名称：</td>
          <td>
          	<s:property value="#attr.orders.goodsName"/>
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 货物数量：</td>
          <td width="65%" >
          	<s:property value="#attr.orders.goodsCount"/>
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 送货地点：</td>
          <td width="65%" >
          	<s:property value="#attr.orders.ordersAddress"/>
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 下单日期：</td>
          <td width="65%" >
          	<s:property value="#attr.orders.ordersDateDesc"/>
          </td>
       </tr> 
       <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 车辆信息：</td>
          <td>
          	<s:select id="carInfo" name="paramsOrders.carInfo" 
          			list="#attr.cars" listKey="%{carModel+' '+carNumber}" listValue="%{carModel+' '+carNumber}" 
          			headerKey="0" headerValue="请选择" cssStyle="width:155px">
          	</s:select>
          </td>
       </tr> 
       <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 配送人员：</td>
          <td>
          	<s:select id="sendId" name="paramsOrders.sendId" 
          			list="#attr.senders" listKey="userId" listValue="realName" 
          			headerKey="0" headerValue="请选择" cssStyle="width:155px">
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
          	<input type="button" id="addBtn" Class="btnstyle" value="确 认" />
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