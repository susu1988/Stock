<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.score!=null && #attr.score.scoreId!=0">编辑</s:if><s:else>添加</s:else>成绩信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	
	var num = /^\d+(\.\d+)?$/;
	 $("#addBtn").bind('click',function(){
	    if($("#courseId").val()=='0'){
			alert('课程不能为空');
			return;
		}
		if($("#userId").val()=='0'){
			alert('学生不能为空');
			return;
		}
		if(!num.exec($("#paramsScore\\.scoreValue").val())){
			alert('成绩必须为数字');
			return;
		}
		$("#paramsScore\\.scoreId").val(0);
		$("#info").attr('action','Admin_addScore.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
			if(!num.exec($("#paramsScore\\.scoreValue").val())){
				alert('成绩必须为数字');
				return;
			}
			$("#info").attr('action','Admin_saveScore.action').submit();
			 
	});
	
    $("#courseId").change(function(){
    	var courseId = $("#courseId").val();
    	loadStudent(courseId);
    });
    
    function loadStudent(courseId){
    	if(courseId!='0'){
    		$("#userId").empty();
    		$("#userId").append("<option value='0'>请选择</option>"); 
    		$("#op").show();
    		var postParams={'paramsUser.courseId':courseId};
    		$.post('queryStudent.action',postParams,
  				function(responseObj) {
  						if(responseObj.success) {	
  							 var users = responseObj.data.users;
  							 if(users!=null && users.length>0){
  								for(var i=0;i<users.length;i++){
  									if(userId == users[i].userId){
  										$("#userId").append("<option selected='selected' value='"+users[i].userId+"'>"+users[i].realName+"</option>"); 
  									}else{
  										$("#userId").append("<option value='"+users[i].userId+"'>"+users[i].realName+"</option>"); 
  									}
  	  							 }
  							 }
  							 $("#op").hide();
  						}else  if(responseObj.err.msg){
  							 alert('失败：'+responseObj.err.msg);
  							 $("#op").hide();
  						}else{
  							 alert('失败：服务器异常！');
  							 $("#op").hide();
  						}	
  			 },'json');
    	}
    }
    
    var courseId = $("#courseId").val();
 	var userId = 0;
 	<s:if test="#attr.score!=null && #attr.score.user!=null">
 		userId="<s:property value='#attr.score.user.userId'/>";
 	</s:if>
 	loadStudent(courseId);
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">成绩管理&gt;&gt;<s:if test="#attr.score!=null && #attr.score.scoreId!=0">编辑</s:if><s:else>添加</s:else>成绩</span>
</div>
<form id="info" name="info" action="Admin_addScore.action" method="post">   
<s:hidden id="paramsScore.scoreId" name="paramsScore.scoreId" value="%{#attr.score.scoreId}" /> 
<table width="800" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.score!=null && #attr.score.scoreId!=0">编辑</s:if><s:else>添加</s:else>成绩</TD>
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
          <td width="35%" align="right" style="padding-right:5px"><font color="red">*</font> 课程：</td>
          <td width="65%" >
          	<s:if test="#attr.score!=null && #attr.score.scoreId!=0"><s:property value="#attr.score.course.courseName" /></s:if>
          	<s:else>
          	<s:select id="courseId" name="paramsScore.course.courseId" 
          			list="#attr.courses" listKey="courseId" listValue="courseName" 
          			headerKey="0" headerValue="请选择" cssStyle="width:155px">
          	</s:select>
          	</s:else>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 学生：</td>
          <td>
          	<s:if test="#attr.score!=null && #attr.score.scoreId!=0"><s:property value="#attr.score.user.realName" /></s:if>
          	<s:else>
            <select id="userId" name="paramsScore.user.userId"  style="width:80px">
            	<option value="0">请选择</option>
            </select>&nbsp;
            <span id="op" style="display:none;width:50px"><img src="images/loading001.gif"/></span>
            </s:else>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 成绩：</td>
          <td>
            <s:textfield name="paramsScore.scoreValue" id="paramsScore.scoreValue" value="%{#attr.score.scoreValue}" />
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
          	<s:if test="#attr.score!=null && #attr.score.scoreId!=0">
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