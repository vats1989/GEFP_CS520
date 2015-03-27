<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Add CheckPoint</title>

  
<link rel="stylesheet"
      href="../css/styles.css"
      type="text/css"/>
      
<script src="../ckeditor/ckeditor.js"></script>
      
</head>
<body onload="resetall()">

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>

<form:form  modelAttribute="checkpoint">
<div  align="center" style="top:200px; height:10px"></div>
<div>
<table class="title">
  <tr><th>Add New CheckPoint</th></tr>
</table>
</div>
<br/>

<!--    New Added Code to Check Stage and Runway present -->
<c:set var="stage_flag" value="0" scope="page" />
<c:set var="runway_flag" value="0" scope="page" />

<c:forEach items="${plan.stages }" var="st">
	<c:if test="${st.stage_name != null }"> 
		<c:set var="stage_flag" value="1" />
	</c:if>
</c:forEach>

<c:forEach items="${plan.runways}" var="rn">
	<c:if test="${rn.runway_name != null }"> 
		<c:set var="runway_flag" value="1" />
	</c:if>
</c:forEach>

<c:if test="${stage_flag != \"1\" and runway_flag != \"1\"}">
<center><font size="4" color="#FF0000">Cannot Add CheckPoint.<br/>Stage/Runway Not Exist.</font></center>
</c:if>

<c:if test="${stage_flag != \"1\" and runway_flag != \"0\"}">
<center><font size="4" color="#FF0000">Cannot Add CheckPoint.<br/>Stage Not Exist.</font></center>
</c:if>

<c:if test="${ stage_flag != \"0\" and runway_flag != \"1\"}">
<center><font size="4" color="#FF0000">Cannot Add CheckPoint.<br/>Runway Not Exist.</font></center>
</c:if>

<c:if test="${ stage_flag == \"1\" and runway_flag == \"1\"}">
<!--  Code Changes Ends Here -->

<div align="center" style="padding-top: 50px">
<table class="imagetable" style="padding-right: 100px;">
<tr>
	<th align="left">Plan</th>
	<th>${plan.plan_name} </th>
</tr>
 
<tr>
	<td>Stage:</td>
	<td>
		<select name="cp_stage">
			<c:forEach items="${plan.stages}" var="st">
				<option value="${st.id}">${st.stage_name}</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td>Runway:</td>
	<td>
		<select name="cp_runway">
			<c:forEach items="${plan.runways}" var="run">
				<option value="${run.id}">${run.runway_name}</option>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td align="left">CheckPoint Name: </td> 
	<td> <form:textarea id="cp_textarea" class="ckeditor" cols="50" rows="10" path="checkPoint_name"/></td> 
</tr> 
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>

<tr>
	<td colspan="2" align="center" style="padding-left: 25px"> <input type="submit" name="submit" value="Submit"> </td>
</tr> 
</table>
</div>
</c:if>
<div  align="center" style="top:200px; height:10px"><font size="+1" color="#FF6600"></font></div>

<center>
<h3><a href="EditPlan.html?plan_id=${plan.id}"><button class="button" type="button">Back</button></a></h3>
<h3><a href="GefpAdmin.html?dept_id=${plan.department.id}"><button class="button" type="button">Return to Main Page</button></a></h3>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>
</form:form>
</body></html>