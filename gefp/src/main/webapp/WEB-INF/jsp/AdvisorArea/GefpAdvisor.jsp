<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resource/demos/style.css">

<script type="text/javascript">
$(function(){
	$("#search").autocomplete({
        source: "autocomplete/usersearch.html",
        select: function(event, ui) {
            if( ui.item )
                window.location.href = "AdvisorStudent.html?id=" + ui.item.id;
        }
    });
});
</script>   
</head>
<body>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>
<table class="title">
  <tr><th>CSULA - Golden Eagle Flight Plan</th></tr>
</table>
<div class="left"></div>
<div class="content">
<div align="left" style="width:400px;">
<form action="AdvisorSearchUsers.html">
<input id="search" name="term" type="text" size="40" />
<input name="search" type="submit" class="button" value="Search" /> 
</form>
</div>
<br/><br/><br/>

<form method="post" action="DeptPublishedPlan.html">
<select name="select_dept">
	<c:forEach items="${departments}" var="dept">
		<option value="${dept.id}">${dept.dept_name}</option>
	</c:forEach>
</select>	
<input name="search" type="submit" class="button" value="View Published Plans" /> 
</form>


<br/><br/><br/>

<c:set var="flag" value="0" />
<c:forEach items="${searchUsers}" var="user">
	<c:set var="flag" value="1" />
</c:forEach>

<c:if test="${ flag == 1}">
	<table class="imagetable" align="center" border="1" style="width:850px" cellpadding="1" cellspacing="2">
		<tr>
			<th>CIN</th><th>Username</th><th>email</th><th>Department</th><th>View Plan</th>
		</tr>
		<c:forEach items="${searchUsers}" var="user">
			<tr>
				<td align="center">${user.cin}</td>
				<td align="center">${user.username}</td>
				<td align="center">${user.email_id}</td>
				<td align="center">${user.major.dept_name}</td>
				<td align="center"><a href="AdvisorStudent.html?id=${user.id}">View</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</div>
</body>
</html>