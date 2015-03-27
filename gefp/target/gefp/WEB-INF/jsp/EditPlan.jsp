<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Edit Plan</title>

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
<font size="4" color="#FF6600"><a href="logout.html"><button class="button" type="button">Logout</button></a></font>

<table class="title"> <tr><th>Golden Eagle Flight Edit Plan</th></tr> </table>
<center>
<h3><a href="GefpAdmin.html?dept_id=${plan.department.id}"><button class="button" type="button">Return to Main Page</button></a></h3>
</center>
<div class="left"></div>
<div class="content">
<center>
<font size="+1" color="#FF6600">
<a href="AddRunway.html?plan_id=${plan.id}"><button class="button" type="button">Add Runway</button></a> | 
<a href="AddStage.html?plan_id=${plan.id}"><button class="button" type="button">Add Stage</button></a> | 
<a href="AddCheckPoint.html?plan_id=${plan.id}"><button class="button" type="button">Add CheckPoint</button></a><br/>
</font>
</center>
<br/>
<font size="+1">Department - ${plan.department.dept_name}<br/>
Plan - ${plan.plan_name}
</font>
<table class="imagetable" align="center" border="1" style="width:850px" cellpadding="1" cellspacing="2">
<thead>
<tr>
	<th></th>
	<c:forEach items="${plan.runways}" var="run">
		<th>${run.runway_name}</th>
	</c:forEach>
</tr>
</thead>
<tbody>
	<c:forEach items="${plan.stages}" var="stage">
		<tr>	
			<td>${stage.stage_name}</td>
			<c:forEach items="${stage.cells}" var="cell">
			<td>
				<c:forEach items="${cell.checkpoints}" var="cp">
					<input type="checkbox" name="checkpoint1" value="${cp.id}"/>
					${cp.checkPoint_name} 
					<a href="EditCheckPoint.html?cp_id=${cp.id}&plan_id=${plan.id}">[Edit]</a> <br />
				</c:forEach>			
			</td>
			</c:forEach>
		</tr>
	</c:forEach>
</tbody>
</table>
<center>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>
<br/><br/><br/><br/>
</div>
</body></html>