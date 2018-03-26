<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加入库信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="ext/ext-base.js"></script>
<script type="text/javascript" src="ext/ext-all.js"></script>
<script type="text/javascript" src="ext/ext-lang-zh_CN.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	var num = /^\d+?$/;
	jq=jQuery.noConflict(); 
	jq("#addBtn").bind('click',function(){
		if(jq("#goodsId").val()=='0'){
			alert('货物名称不能为空');
			return;
		}
		if(!num.exec(jq("#paramsPurchase\\.purchaseCount").val())){
			alert('货物数量不能为空');
			return;
		}
		if(jq("#paramsPurchase\\.purchaseAdmin").val()==''){
			alert('供货商不能为空');
			return;
		}
		if(jq("#paramsPurchase\\.purchaseDate").val()==''){
			alert('入库日期不能为空');
			return;
		}
		jq("#paramsPurchase\\.purchaseId").val(0);
		jq("#info").attr('action','Admin_addPurchase.action').submit();
		 
	 });
	 
});
Ext.onReady(function(){
	Ext.get("op").show();
	Ext.Ajax.request({
	   url: 'queryGoods.action',
	   params: {},
	   success: function(response){
		   var responseObj=Ext.util.JSON.decode(response.responseText);
		   if(responseObj.success) {	
				 var goodss = responseObj.data.goodss;
				 if(goodss!=null && goodss.length>0){
					for(var i=0;i<goodss.length;i++){
						Ext.DomHelper.useDom=true;  
						Ext.DomHelper.append(Ext.get('goodsId'), {tag:'option',value:goodss[i].goodsId,html:goodss[i].goodsName});  
					}
				 }
				 Ext.get("op").hide();
			}else  if(responseObj.err.msg){
				 alert('失败：'+responseObj.err.msg);
				 Ext.get("op").hide();
			}else{
				 alert('失败：服务器异常！');
				 Ext.get("op").hide();
			}	
	   },
	   failure: function(response) {
		   alert('失败','服务器异常！');
	   }	   
	});
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">入库管理&gt;&gt;添加入库</span>
</div>
<form id="info" name="info" action="Admin_addPurchase.action" method="post">   
<s:hidden id="paramsPurchase.purchaseId" name="paramsPurchase.purchaseId" value="%{#attr.purchase.purchaseId}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle">添加入库</TD>
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
          	<select id="goodsId" name="paramsPurchase.goods.goodsId" style="width:155px">
          		<option value="0">请选择</option>
            </select>&nbsp;
            <span id="op" style="display:none;width:50px"><img src="images/loading001.gif"/></span>
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 入库数量：</td>
          <td width="65%" >
          	<s:textfield name="paramsPurchase.purchaseCount" id="paramsPurchase.purchaseCount" value="%{#attr.purchase.purchaseCount}" />
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 供货商：</td>
          <td width="65%" >
          	<s:textfield name="paramsPurchase.purchaseAdmin" id="paramsPurchase.purchaseAdmin" value="%{#attr.purchase.purchaseAdmin}" />
          </td>
       </tr> 
       <tr>
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 入库日期：</td>
          <td width="65%" >
          	<s:textfield name="paramsPurchase.purchaseDate" id="paramsPurchase.purchaseDate" 
					 value="%{#attr.purchase.purchaseDateDesc}" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
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