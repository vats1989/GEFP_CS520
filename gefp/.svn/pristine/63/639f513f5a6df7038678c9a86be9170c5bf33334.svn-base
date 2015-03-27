<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Golden Eagle Flight Edit Plan</title>

<link rel="stylesheet" href="../css/styles.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="../css/akottr.css" />
<link rel="stylesheet" type="text/css" href="../css/dragtable.css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script src="../js/jquery.dragtable.js"></script>


<script type="text/javascript">
$(document).ready(function() {      
   
$('.defaultTable').dragtable({persistState: function(table) {
	var tableOrder = "";
    table.el.find('th').each(function(i) { 
      if(this.id != '') 
      {
    	  table.sortOrder[this.id]=i;
    	  tableOrder+= this.id + " ";  
      }
    });
    $.ajax({
    		type: "GET",
    		url: "myAjax.html?tableOrder="+tableOrder,
            success: function(data) {}        
    }); 
  } 
});

$("#tableBody").sortable({
    items: "tr",
    cursor: 'move',
    opacity: 0.6,
    update: function(event, ui) {
    	var planId = ${plan.id};
    	var rowOrder = $(this).sortable('toArray');
    	 $.ajax({
             type: "GET",
             url:  "reorderRow.html?rowOrder="+rowOrder,
             data: {'planId' : planId },
         	success: function(data) {} 
         });
    }
});
$("#tableBody").disableSelection();

$(".qa_list").sortable({
    update: function(event, ui) {
    	var new_positions = $(this).sortable('toArray');    	
        $.ajax({
            type: "GET",
            url:  "reorderCheckPoint.html?new_positions="+new_positions,
            data: {
                'checkPointId' : ui.item.attr("id"),
            },
        	success: function(data) {} 
        });
    }
});
$(".qa_list").disableSelection();

});

function changeStageName(id, name) {
	var retVal = prompt("Change Stage Name : ", name);
	if(name != retVal && retVal != null)
	window.location.href = "editStageName.html?id="+id+"&name="+retVal;
}
function changeRunwayName(id, name) {
	var retVal = prompt("Change Runway Name : ", name);
	if(name != retVal && retVal != null)
	window.location.href = "editRunwayName.html?id="+id+"&name="+retVal;
}
function confirm_deletion(cp_id) {
	var plan_id = ${plan.id};
	if(confirm("Do you really want to delete checkpoint?"))	{
		window.location.href = "deleteCheckPoint.html?plan_id="+plan_id+"&cp_id="+cp_id;
	}else{
		return false;
	}
	return true;
}
</script>
</head>
<body onload="resetall()">

<font size="+2" color="blue">Welcome ${user.username}, </font> <br/>
<font size="+1" color="#FF6600"><a href="<c:url value='/j_spring_security_logout' />"><button class="button" type="button">Logout</button></a></font>

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
<table class="defaultTable sar-table" id="dragTable" align="center" border="1" style="width:850px" cellpadding="1" cellspacing="2">
<thead>
	<tr>
		<th id="0"></th>
		<c:forEach items="${plan.runways}" var="run">
			<th id="${run.id}">${run.runway_name}<a onclick="changeRunwayName(${run.id},'${run.runway_name}');" href="javascript:void(0);">[Edit]</a></th>
		</c:forEach>
	</tr>
</thead>
<tbody id="tableBody">
	<c:forEach items="${plan.stages}" var="stage">
		<tr id="${stage.id}">
			<td>${stage.stage_name}<a onclick="changeStageName(${stage.id},'${stage.stage_name}');" href="javascript:void(0);">[Edit]</a></td>
				<c:forEach items="${plan.runways}" var="runway">
					<c:forEach items="${stage.cells}" var="cell">
						<c:forEach items="${runway.cells}" var="run_cell">
							<c:if test="${ cell.id == run_cell.id}">
								<td>
									<ol class="qa_list">
										<c:forEach items="${cell.checkpoints}" var="cp">
											<li id="${cp.id}">
												${cp.checkPoint_name} 
												<a href="EditCheckPoint.html?cp_id=${cp.id}&plan_id=${plan.id}">[Edit]</a>
												<a href="javascript:void(0);" onclick="confirm_deletion(${cp.id});">[Delete]</a>										
												<br />
											</li>
										</c:forEach>
									</ol>
								</td>
							</c:if>
						</c:forEach>
					</c:forEach>
				</c:forEach>
		</tr>
	</c:forEach>
</tbody>
</table>
<br/>
<center>
<h3><a href="DepartmentSelect.html"><button class="button" type="button">Change Department</button></a></h3>
</center>
<br/><br/><br/><br/>
</div>
</body></html>