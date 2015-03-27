<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan Advisor Page</title>

<link rel="stylesheet"
      href="../css/styles.css"
      type="text/css"/>
            
<style>
	table,td,th,tr { border-collapse: collapse; 
					 border: solid thin;}
</style>
              
</head>
<body>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>
<table class="title">
  <tr><th>CSULA - Golden Eagle Flight Plan</th></tr>
</table>
<div class="left"></div>
<div class="content">

<fmt:formatDate value="${now}" var="currentDate" pattern="yyyy-MM-dd HH:mm:ss"/>

<c:forEach items="${department.plans}" var="plan">
	<fmt:formatDate value="${plan.publishedDate}" var="planPublishDate" pattern="yyyy-MM-dd HH:mm:ss"/>
	<c:if test="${planPublishDate le currentDate}" >
		<h3><button class="button" type="button">${plan.plan_name}</button></h3>
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
							* ${cp.checkPoint_name} 
							<br/>
						</c:forEach>			
					</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
</table>
<br/>
</c:if>
</c:forEach>
<br/>
<br/>

<center>
<a  href="GefpAdvisor.html"><button class="button" type="button">Back</button></a>
</center>
</div>
</body>
</html>