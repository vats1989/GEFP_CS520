<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Add Plan</title>

  
<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
      
</head>
<body onload="resetall()">

<c:set var="log_user" scope="page" value="${login_user}" />
<c:if test="${log_user != \"admin\"}">
	<c:redirect url="logout.html"></c:redirect>
</c:if>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="4" color="#FF6600"><a href="logout.html"><button class="button" type="button">Logout</button></a></font>	

<form:form  modelAttribute="plan">
<div  align="center" style="top:200px; height:10px"></div>
<div>
<table class="title">
  <tr><th>Add New Plan</th></tr>
</table>
</div>
<br/>

<div align="center" style="padding-top: 50px">

<table class="imagetable" style="padding-right: 100px;">
<tr>
	<th align="left">Department:</th>
	<th>${plan.department.dept_name}</th>
</tr>
<tr>
	<td align="left"> Plan Name: </td> 
	<td> <form:input path="plan_name" placeholder="Enter Plan Description"/></td> 
</tr> 
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>

<tr>
	<td colspan="2" align="center" style="padding-left: 30px"> <input type="submit" name="submit" value="Submit"> </td>
</tr> 
</table>
<br/><br/>
</div>
<center>
<h3><a href="GefpAdmin.html?dept_id=${plan.department.id}"><button class="button" type="button">Return to Main Page</button></a></h3>
<br/>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>

<div  align="center" style="top:200px; height:10px"><font size="+1" color="#FF6600"></font></div>
</form:form>
</body></html>