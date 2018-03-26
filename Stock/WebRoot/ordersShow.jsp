<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单查询</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
var tempClassName="";
function tr_mouseover(obj) 
{ 
	tempClassName=obj.className;
	obj.className="list_mouseover";
}
function tr_mouseout(obj)      
{ 
	obj.className=tempClassName;
}      
function CheckAll(obj) 
{
	var checks=document.getElementsByName("chkid");
    for (var i=0;i<checks.length;i++)
	{
	    var e = checks[i];
	    e.checked = obj.checked;
	}
    
}


function serch()
{
   document.info.action="Admin_listOrderss.action";
   document.info.submit();
}
function del()
{
	var checks=document.getElementsByName("chkid");
    var ids="";
	for (var i=0;i<checks.length;i++)
    {
        var e = checks[i];
		if(e.checked==true)
		{
		  if(ids=="")
		  {
		    ids=ids+e.value;
		  }
		  else
		  {
		    ids=ids+","+e.value;
		  }
		}
    }
    if(ids=="")
    {
       alert("请至少选择一个要删除的订单！");
       return false;
    }
    if(confirm('确认删除吗!?'))
    {
       document.info.action="Admin_delOrderss.action?paramsOrders.ids="+ids+"&paramsOrders.delType=3";
       document.info.submit();
    }
    
}
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listOrderss.action";
  document.info.submit();
}
function ChangePage(pagenum)
{
  document.getElementById("pageNo").value=pagenum;
  document.info.action="Admin_listOrderss.action";
  document.info.submit();
}
</script>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">订单管理&gt;&gt;订单查询</span>
</div>
<form name="info" id="info" action="Admin_listOrderss.action" method="post">
<input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>
<table width="95%" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2" height="10px">&nbsp;</td></tr>
  <tr>
    <td width="">订单列表</td>
    <td width="" align="right">
            订单编号：
      <input type="text" style="width:100px;" id="paramsOrders.ordersNo" name="paramsOrders.ordersNo" 
      		value="${paramsOrders.ordersNo}" class="inputstyle"/>&nbsp;
            订货人：
      <input type="text" style="width:100px;" id="paramsOrders.realName" name="paramsOrders.realName" 
      		value="${paramsOrders.realName}" class="inputstyle"/>&nbsp;
            货物名称：
      <input type="text" style="width:100px;" id="paramsOrders.goodsName" name="paramsOrders.goodsName" 
      		value="${paramsOrders.goodsName}" class="inputstyle"/>&nbsp;
            下单日期：
      <s:textfield name="paramsOrders.ordersDate" id="paramsOrders.ordersDate" 
					 value="%{#attr.paramsOrders.ordersDateDesc}"  cssStyle="width:100px"
					 onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>&nbsp;&nbsp;
      <input type="button" value="搜索" onclick="serch();" class="btnstyle"/>&nbsp;
      <input type="button" value="增加" onclick="window.location='Admin_addOrdersShow.action';" class="btnstyle"/>&nbsp;
      <s:if test="#attr.admin.userType==3">
      <input type="button" value="删除" onclick="del();" class="btnstyle"/>
      </s:if>
    </td>
  </tr>
  <tr><td colspan="2" height="2px"></td></tr>  
</table>
<table width="95%" align="center" class="table_list" cellpadding="0" cellspacing="0">
   <tr class="listtitle">
     <td width="40" align="center"><input type="checkbox" onclick="CheckAll(this);" style="vertical-align:text-bottom;" title="全选/取消全选"/></td>
     <td width="40" align="center">序号</td>
     <td width="" align="center">订单编号</td>
     <td width="" align="center">订货人</td>
     <td width="" align="center">货物名称</td>
     <td width="" align="center">数量</td>
     <td width="" align="center">下单日期</td>
     <td width="130" align="center">送货地点</td>
     <td width="" align="center">车辆</td>
     <td width="" align="center">配送人</td>
     <td width="" align="center">状态</td>
     <td width="" align="center">操作</td>
   </tr>
   <s:if test="#attr.orderss!=null && #attr.orderss.size()>0">
   <s:iterator value="#attr.orderss" id="orders" status="status">
   <tr class="<s:if test='(#status.index + 1)%2==0'>list1</s:if><s:else>list0</s:else>" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
     <td width="" align="center"><s:checkbox name="chkid" fieldValue="%{#orders.ordersId}" cssStyle="vertical-align:text-bottom;"/></td>
     <td width="" align="center"><s:property value="#status.index+#attr.paramsOrders.start+1"/></td>
     <td width="" align="center"><s:property value="#orders.ordersNo"/></td>
     <td width="" align="center"><s:property value="#orders.realName"/></td>
     <td width="" align="center"><s:property value="#orders.goodsName"/></td>
     <td width="" align="center"><s:property value="#orders.goodsCount"/></td>
     <td width="" align="center"><s:property value="#orders.ordersDateDesc"/></td>  
     <td width="" align="center"><s:property value="#orders.ordersAddress"/></td>
     <td width="" align="center"><s:property value="#orders.carInfo"/></td>
     <td width="" align="center"><s:property value="#orders.sendName"/></td>
     <td width="" align="center"><s:property value="#orders.ordersFlagDesc"/></td>
     <td width="" align="center">
     	<s:if test="#attr.admin.userType==1 && #orders.ordersFlag==1">
     	<s:a href="Admin_delOrderss.action?paramsOrders.ids=%{#orders.ordersId}&paramsOrders.delType=1">撤销</s:a>
     	</s:if>
     	<s:if test="#attr.admin.userType==3 && #orders.ordersFlag==1">
     	<s:a href="Admin_delOrderss.action?paramsOrders.ids=%{#orders.ordersId}&paramsOrders.delType=2">取消</s:a>&nbsp;
     	<s:a href="Admin_confirmOrdersShow.action?paramsOrders.ordersId=%{#orders.ordersId}">确认</s:a>
     	</s:if>
     	<s:if test="#attr.admin.userType==3 && #orders.ordersFlag==2">
     	<s:a href="Admin_sendOrders.action?paramsOrders.ordersId=%{#orders.ordersId}&paramsOrders.goodsNo=%{#orders.goodsNo}&paramsOrders.goodsCount=%{#orders.goodsCount}">发货</s:a>
     	</s:if>
     	<s:if test="#attr.admin.userType==1 && #orders.ordersFlag==3">
     	<s:a href="Admin_receiveOrders.action?paramsOrders.ordersId=%{#orders.ordersId}">收货</s:a>
     	</s:if>
     </td>
   </tr> 
   </s:iterator>
   </s:if>
   <s:else>
   <tr>
     <td height="60" colspan="12" align="center"><b>&lt;不存在订单信息&gt;</b></td>
   </tr>
   </s:else>
   
</table>
<jsp:include page="page.jsp"></jsp:include>
</form> 
</body>
</html>