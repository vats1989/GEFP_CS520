<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div align="center" style="padding-top: 70px">

*&nbsp;Login Error. Following may be the reason for error:
<ul>
<li>Username is Empty !!!</li>
<li>Password is Empty !!!</li>
<li>Invalid Username or Password !!!</li>
</ul>
Please try again.<br/><br/>
<a href="login.html">Back To Login Page</a>
</div>

</form>
</body></html>