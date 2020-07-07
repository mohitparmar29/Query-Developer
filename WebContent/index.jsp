<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body style='background-color: pink;'>
<style>
body {
    background-image: url("D:/HOME Photos whtasup/im33.jpg");
}
</style>
<form action="FetchData" method="post">
<%-- <p><h1><marquee behavior="scroll" direction="left" scrollamount="5">Welcome to Query Developer</marquee></p></h1>--%>
<center>
<h1 style="background-color:powderblue;color:red;">Welcome to Query Developer</h1>
<h3 style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">Introduction</h3>
<p style="font-family:courier;border-color: #FF0000 #00FF00 #0000FF #000000; border-style:dotted solid;font-size:100%;">I have prepared this application for "First Time" learner or who have just wanted to start SQL learning.</p>
<p style="font-family:courier;border-color: #FF0000 #00FF00 #0000FF #000000; border-style:solid;font-size:100%;">
This application is for those who don't know how to write query and what will be the output we will get,if we execute
the query.</p>
<p style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">Click Here to start Learning SQL</p>
<input type = "submit" value = "Check and Select Table" name="CST" /></p>
<%-- 
<input type = "submit" value = "Insert Data Into Table" name="INST" /></p>
<input type = "submit" value = "Truncate The Table" name="TRUN" /></p>
<input type = "submit" value = "Delete The Table Data" name="DELT" /></p>
<input type = "submit" value = "Drop The Table" name="DROPT" /></p>
<input type = "submit" value = "Create New Table" name="CRET" /></p>--%>
</center>

<input style="visibility:hidden;" type = "checkbox"  name="chkSms"   /><br />
<input style="visibility:hidden;" type = "checkbox"  name="chkSms1" /><br />
<input style="visibility:hidden;" type = "checkbox"  name="chkSms2" /><br />

</form>

<div style="width:50%; margin:auto;">
  <div style="display:inline-block; width:45%;text-align:center;">
<form action="FetchData" method="post">
<p><input style="visibility:hidden;" type="text" name="query" /><br />
    <input style="visibility:hidden;" type="submit" value="Submit Query" /></p>
    
<input style="visibility:hidden;" type="submit" name="all_data" value="Get All Data" style="float: right;margin-top:2%;" />
<input style="visibility:hidden;" type="submit" name="highest" value="Highest Salary" style="float: right;" /><br />

<p><input style="visibility:hidden;" type="text" name="number" style="float: right;" />
    <input style="visibility:hidden;" type="submit" value="Nth Highest Salary" style="float: right;" /></p>
   
</form>
</div>
</div>
</body>
</html>