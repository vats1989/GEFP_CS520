<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Plan</title>

<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
            
<style>
	table,td,th,tr { border-collapse: collapse; 
					 border: solid thin;}
</style>

<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript">
	$(function(){
	    $('input[name="checkpoint1"]').click(function(){
	    var cp  = $(this).attr("value");  
	    var user_id = ${user.id};
	    var operation_type;
	    	if($(this).is(":checked"))
	    	{	
	    		operation_type = "checked";
	    	}
	    	else
	    	{	operation_type = "unchecked";
	    	}
	    	
	    	$.ajax({
	    		type: "POST",
	    		url:  "checkPointAddRemove.html",
	    		data: {user_id:user_id, cp:cp, operation_type:operation_type}, 
	    		success: function(data) {}
	    	});
	    });
	});
</script>
</head>
<body onload="resetall()">

<c:set var="log_user" scope="page" value="${login_user}" />
<c:if test="${log_user != \"student\"}">
	<c:redirect url="logout.html"></c:redirect>
</c:if>

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<a href="logout.html"><button class="button" type="button">Logout</button></a>

<form:form  modelAttribute="user">
<table class="title">
  <tr><th>CSULA - Golden Eagle Flight Plan</th></tr>
</table>
<br/>
<div class="left">
</div>

<div class="content">
<font size="+1">Department - ${user.major.dept_name}<br/>
Plan - ${user.plan.plan_name}
</font>
<table class="imagetable" align="center" border="1" style="width:850px" cellpadding="1" cellspacing="2">
<thead>
<tr>
	<th></th>
	<c:forEach items="${user.plan.runways}" var="run">
		<th>${run.runway_name}</th>
	</c:forEach>
</tr>
</thead>
<tbody>
	<c:forEach items="${user.plan.stages}" var="stage">
		<tr>	
			<td>${stage.stage_name}</td>
			<c:forEach items="${stage.cells}" var="cell">
			<td>
				<c:forEach items="${cell.checkpoints}" var="cp">
					<c:set var="flag" value="0"/>
					<c:forEach items="${user.checkpoints}" var="user_cp">
						<c:if test="${user_cp.id == cp.id}">
							<input type="checkbox" name="checkpoint1" value="${cp.id}" checked="checked"/>
							${cp.checkPoint_name} 
							<br />
							<c:set var="flag" value="1"/>
						</c:if>
					</c:forEach>
					<c:if test="${flag == 0}">
						<input type="checkbox" name="checkpoint1" value="${cp.id}"/>
						${cp.checkPoint_name} 
						<br />
					</c:if>
				</c:forEach>			
			</td>
			</c:forEach>
		</tr>
	</c:forEach>
</tbody>
</table>
<br/>
<br/>
<br/>
<center>
<a href="ChangeDetails.html?user_id=${user.id}"><button class="button" type="button">Change User Details</button></a> &nbsp;&nbsp;&nbsp;&nbsp; 
<a href="ChangeMajor.html?user_id=${user.id}"><button class="button" type="button">Change Major</button></a>
</center>
</div>
</form:form>
</body></html>