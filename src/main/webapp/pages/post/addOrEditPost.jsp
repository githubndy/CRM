<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/sys.css" type="text/css" rel="stylesheet" />

</head>

<body class="emp_body">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="${pageContext.request.contextPath}/images/tleft.gif"/></td>
    <td width="44%" align="left">[职务管理]</td>
   
    <td width="52%"align="right">
    	<!-- 提交表单 -->
       <a href="javascript:void(0)" onclick="document.forms[0].submit()">
       	<img src="${pageContext.request.contextPath}/images/button/save.gif" />
       </a>
       <!-- 执行js，进行返回 -->
       <a href="javascript:void(0)" onclick="window.history.go(-1)"><img src="${pageContext.request.contextPath}/images/button/tuihui.gif" /></a>
      
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>
<%
String depId = request.getParameter("depId");
    session.setAttribute("depId",depId);
%>
<form action="${pageContext.request.contextPath}addPost.action" method="post">
	<table width="88%" border="0" class="emp_table" style="width:80%;">
        <tr>
            <td>选择部门：</td>

            <td><select name="department.depId">
                <option value="-1" selected>----请--选--择----</option>
                <s:iterator value="#session.dept" var="dep">
                    <s:if test="#dep.depId==#session.depId">
                        <option value="${dep.depId}" selected="selected">${dep.depName}</option>
                    </s:if>
                    <s:else>
                        <option value="${dep.depId}">${dep.depName}</option>
                    </s:else>
                </s:iterator>
            </select>
            </td>
            <td>职务：</td>
            <td><s:textfield name="postName" value="%{#byPostId.postName}"/></td>
            <td><s:hidden name="postId" value="%{#byPostId.postId}"/></td>

        </tr>
	</table>
</form>
<span style="color: red">
    <s:actionerror/>
</span>
</body>
</html>
