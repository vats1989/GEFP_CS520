<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Edit CheckPoint</title>
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

<form:form  modelAttribute="checkpoint">
<div  align="center" style="top:200px; height:10px"></div>
<div>
<table class="title">
  <tr><th>Edit CheckPoint</th></tr>
</table>
</div>

<div align="center" style="padding-top: 50px">

<table class="imagetable" style="padding-right: 100px;">
<tr>
	<th align="left">Plan</th>
	<th>${plan.plan_name}</th>
</tr>
 
<tr>
	<td>Stage:</td>
	<td>
		<select name="ecp_stage">
			<c:forEach items="${plan.stages}" var="st">
				<c:choose>
					<c:when test="${checkpoint.cell.stage.id == st.id }">
						<option selected="selected" value="${st.id}">${st.stage_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${st.id}">${st.stage_name}</option>
					</c:otherwise>
				</c:choose>
			<%-- 
				<c:if test="${ checkpoint.cell.stage.id == st.id }">
					<option selected="selected" value="${st.id}">${st.stage_name}</option>
				</c:if>
				<c:if test="${ checkpoint.cell.stage.id != st.id }">
					<option value="${st.id}">${st.stage_name}</option>
				</c:if>
			--%>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td>Runway:</td>
	<td>
		<select name="ecp_runway">
			<c:forEach items="${plan.runways}" var="run">
				<c:choose>
					<c:when test="${checkpoint.cell.runway.id == run.id}">
						<option selected="selected"  value="${run.id}">${run.runway_name}</option>
					</c:when>
					<c:otherwise>
						<option value="${run.id}">${run.runway_name}</option>
					</c:otherwise>
				</c:choose>
			<%-- 
				<c:if test="${checkpoint.cell.runway.id == run.id}">
					<option selected="selected"  value="${run.id}">${run.runway_name}</option>
				</c:if>
				<c:if test="${checkpoint.cell.runway.id != run.id}">
					<option value="${run.id}">${run.runway_name}</option>
				</c:if>
			--%>
			</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<td align="left">CheckPoint Name: </td> 
	<td> <form:input path="checkPoint_name"/></td> 
</tr> 
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td colspan="2" align="center" style="padding-left: 25px"> <input type="submit" name="submit" value="Submit"> </td></tr> 
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