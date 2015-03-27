<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Login Page</title>
  
<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
    
</head>
<body onload="resetall()">

<form id="login" name="login" action="j_spring_security_check" method="post">
<div  align="center" style="top:200px; height:10px"></div>
<div>
<table class="title">
  <tr><th>Welcome To CSULA Golden Eagle Flight Plan</th></tr>
</table>
</div>
<div align="center" style="padding-top: 160px">
<table class="imagetable" style="padding-right: 100px;">
<tr>
	<td align="left"> User Name </td> 
	<td> <input placeholder="Enter Username" type="text" name="j_username" /></td> 
</tr> 
<tr> 
	<td align="left"> Password </td>  
	<td> <input type="password" name="j_password" placeholder="Enter Password" /></td>
</tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>

<tr>
	<td colspan="2" align="center" style="padding-left: 25px"> <input type="submit" name="login" value="Login"> </td>
</tr> 
</table>
</div>

</form>
</body></html>