<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Admin Page</title>

<link rel="stylesheet"
      href="../css/styles.css"
      type="text/css"/>
            
<style>
	table,td,th,tr { border-collapse: collapse; 
					 border: solid thin;}
</style>
            
</head>
<body onload="resetall()">

<fmt:formatDate value="${now}" var="currentDate" pattern="yyyy-MM-dd HH:mm:ss"/>
<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>

<table class="title">
  <tr><th>CSULA - Golden Eagle Flight Plan</th></tr>
</table>

<div class="left"></div>
<div class="content">
	<h3><button class="button" type="button">${department.dept_name} Department Plan(s):</button> &nbsp;&nbsp;&nbsp;&nbsp; <a href="AddPlan.html?dept_id=${department.id}"><button class="button" type="button">Add New Plan</button></a></h3>
	<table class="imagetable" align="center" border="1" style="width:850px" cellpadding="1" cellspacing="2">
		<tr>
		<th>Plan</th><th>Publish Date</th><th>Current Plan</th><th>View</th></tr>
		<c:forEach items="${department.plans}" var="plan">
		<fmt:formatDate value="${plan.publishedDate}" var="planPublishDate" pattern="yyyy-MM-dd HH:mm:ss"/>
			<tr>
				<td align="center">${plan.plan_name} </td>
				<td align="center">
					<c:choose>
						<c:when test="${planPublishDate le currentDate}">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${plan.publishedDate}"/>	
						</c:when>				
						<c:otherwise>
							<font color="blue"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${plan.publishedDate}"/></font>
						</c:otherwise>
					</c:choose>
				</td>
				<td align="center">
					<c:if test="${ department.currentPlan.id == plan.id }" >
						Yes
					</c:if>
					<c:if test="${ department.currentPlan.id != plan.id }" >
					<a href="MakeCurrentPlan.html?plan_id=${plan.id}"><button class="button" type="button">Make Current Plan</button></a>
					</c:if>
				</td>
				<td align="center"> <a href="EditPlan.html?plan_id=${plan.id}"><button class="button" type="button">View Plan</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
<center>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>	
</div>
</body>
</html>