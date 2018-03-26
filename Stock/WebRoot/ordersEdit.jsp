<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加订单信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	var num = /^\d+?$/;
	 $("#addBtn").bind('click',function(){
		if($("#goodsId").val()=='0'){
			alert('货物名称不能为空');
			return;
		}
		if(!num.exec($("#paramsOrders\\.goodsCount").val())){
			alert('货物数量不能为空');
			return;
		}
		if($("#paramsOrders\\.orders_address").val()==''){
			alert('送货地点不能为空');
			return;
		}
		$("#paramsOrders\\.ordersId").val(0);
		$("#info").attr('action','Admin_addOrders.action').submit();
		 
	 });
	 
	 function decodeEntities(s){ 
		    var str, temp= document.createElement('p'); 
		    temp.innerHTML= s; 
		    str= temp.textContent || temp.innerText; 
		    temp=null; 
		    return str; 
	}
	 
	 var goodss = {};
	 var goodss2 = {};
	 <s:if test="#attr.goodss!=null&&#attr.goodss.size()>0">
	 <s:iterator value="#attr.goodss" id="goods">
	 	var goodsId = "<s:property value='#goods.goodsId'/>";
	 	var goodsNo = decodeEntities("<s:property value='#goods.goodsNo'/>");
	 	var goodsName = decodeEntities("<s:property value='#goods.goodsName'/>");
	 	goodss[goodsId] = goodsNo;
	 	goodss2[goodsId] = goodsName;
	 </s:iterator>
	 </s:if>
	 
	$("#goodsId").change(function(){
		var goodsId = $(this).val();
		if(goodsId!='0'){
			$("#goodsNo").val(goodss[goodsId]);
			$("#goodsName").val(goodss2[goodsId]);
		}
    });
	 
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">订单管理&gt;&gt;添加订单</span>
</div>
<form id="info" name="info" action="Admin_addOrders.action" method="post">   
<s:hidden id="paramsOrders.ordersId" name="paramsOrders.ordersId" value="%{#attr.orders.ordersId}" /> 
<s:hidden id="paramsOrders.userId" name="paramsOrders.userId" value="%{#attr.admin.userId}" /> 
<s:hidden id="paramsOrders.realName" name="paramsOrders.realName" value="%{#attr.admin.realName}" /> 
<s:hidden id="goodsNo" name="paramsOrders.goodsNo" value="" /> 
<s:hidden id="goodsName" name="paramsOrders.goodsName" value="" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">添加订单</TD>
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
          <td align="right" style="padding-right:5px"><font color="red">*</font> 货物名称：</td>
          <td>
          	<s:select id="goodsId" name="paramsOrders.goodsId" 
          			list="#attr.goodss" listKey="goodsId" listValue="goodsName" 
          			headerKey="0" headerValue="请选择" cssStyle="width:155px">
          	</s:select>
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 货物数量：</td>
          <td width="65%" >
          	<s:textfield name="paramsOrders.goodsCount" id="paramsOrders.goodsCount" value="%{#attr.orders.goodsCount}" />
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 送货地点：</td>
          <td width="65%" >
          	<s:textfield name="paramsOrders.ordersAddress" id="paramsOrders.ordersAddress" value="%{#attr.orders.ordersAddress}" />
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
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
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