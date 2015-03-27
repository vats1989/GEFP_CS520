<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Login Page</title>
  
<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
      
</head>
<body onload="resetall()">

<c:set var="log_user" scope="page" value="${login_user}" />
<c:if test="${log_user != \"student\"}">
	<c:redirect url="logout.html"></c:redirect>
</c:if>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="logout.html"><button class="button" type="button">Logout</button></a></font>


<form:form  modelAttribute="user">
<div  align="center" style="top:100px; height:10px">
<table class="title">
  <tr><th>Change User Details</th></tr>
</table>
</div>
<div align="center" style="padding-top: 160px">
<table class="imagetable" style="padding-right: 100px;">
<tr>
	<td align="left"> User Name </td> 
	<td>${user.username}</td>
</tr> 
<tr> 
	<td align="left"> Password </td>  
	<td> <form:input path="password" type="password" placeholder="Enter Password"/></td>
</tr>
<tr>
	<td align="left">Retype Password</td>
	<td> <input type="password" name="repassword" placeholder="Enter Re Password" /></td>
</tr>
<tr>
	<td colspan="2" align="center" style="padding-left: 25px"> <input type="submit" name="submit" value="Submit"> </td>
</tr> 
</table>
</div>
<br />
<br />
<div  align="center" style="top:200px; height:10px">
	<font size="+1" color="#FF0000"> 
		<form:errors path="username" /> <br /> 
		<form:errors path="password" /> <br />
	  	<form:errors path="enabled" />  <br />
	  	${pass_error}
	</font>
</div>
<center>
<a href="GefpStudent.html?id=${user.id}"><button class="button" type="button">Back</button></a> &nbsp;&nbsp;&nbsp;&nbsp;
</center>
</form:form>
</body></html>