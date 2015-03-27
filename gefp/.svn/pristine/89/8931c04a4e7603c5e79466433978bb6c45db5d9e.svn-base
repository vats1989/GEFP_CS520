<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Add Stage</title>

  
<link rel="stylesheet"
      href="../css/styles.css"
      type="text/css"/>
      
</head>
<body onload="resetall()">

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>

<form:form  modelAttribute="stage">
<div  align="center" style="top:200px; height:10px"></div>
<div>
<table class="title">
  <tr><th>Add New Stage</th></tr>
</table>
</div>
<br/>
<div align="center" style="padding-top: 50px">
<table class="imagetable" style="padding-right: 100px;">
<tr>
	<th align="left">Plan</th>
	<th>${plan.plan_name}</th>
</tr>
<tr>
	<td align="left"> Stage Name: </td> 
	<td> <form:input path="stage_name" placeholder="Enter Stage Name"/></td> 
</tr> 
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>

<tr>
	<td colspan="2" align="center" style="padding-left: 25px"> <input type="submit" name="submit" value="Submit"> </td>
</tr> 
</table>
</div>
<div  align="center" style="top:200px; height:10px"><font size="+1" color="#FF6600"></font></div>

<center>
<h3><a href="EditPlan.html?plan_id=${plan.id}"><button class="button" type="button">Back</button></a></h3>
<h3><a href="GefpAdmin.html?dept_id=${plan.department.id}"><button class="button" type="button">Return to Main Page</button></a></h3>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>
</form:form>
</body></html>