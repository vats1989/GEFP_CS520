<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Department Select</title>

<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
            
<style>
	table,td,th,tr { border-collapse: collapse; 
					 border: solid thin;}
</style>
            
</head>
<body onload="resetall()">

<c:set var="log_user" scope="page" value="${login_user}" />
<c:if test="${log_user != \"admin\"}">
	<c:redirect url="logout.html"></c:redirect>
</c:if>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="logout.html"><button class="button" type="button">Logout</button></a></font>

<form:form action="DepartmentSelect.html" method="post">

<table class="title">
  <tr><th>CSULA - Golden Eagle Flight Plan</th></tr>
</table>

<div align="center" style="padding-top: 150px">
<table class="imagetable" style="padding-right: 100px;">
<tr>
	<th> Select Department: </th>
	<th> 
	<select name="select_dept">
		<c:forEach items="${department}" var="dept">
			<option value="${dept.id}">${dept.dept_name}</option>
		</c:forEach>
	</select>
	</th>
</tr>
<tr>
	<td colspan="2" align="center"> <input type="submit" name="submit" value="Submit"> </td>
</tr> 
</table>
</div>
</form:form>
</body></html>