<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Result Page</title>
	</head>
	<body bgcolor="#a3ddc4"'>
		<style>
			table, th, td
			{
  				border: 2px solid black; 
			}
			th
			{
				background-color: black;
				color: white;
			}
			tbody td
			{
  				text-align: center;
			}
			table
			{
  				background-color: #e495e4;
			}
		</style>
		<form action="FetchData" method="post">
			<%		
			ArrayList tablelist= (ArrayList)request.getAttribute("tablelist");
			//out.println("\n Table list is: " +tablelist);
			if (tablelist != null) 
			{%>
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" /><%=tablelist.get(0)%><br />
				<input type = "checkbox"  value="deptdata" name="dept" /><%=tablelist.get(1)%><br />
				<input type = "checkbox"  value="managerdata" name="managers" /><%=tablelist.get(2)%><br /><br />
				<input type = "submit" value = "Show Table Data"  /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc" /><br /><br />
				<input type="submit" value="Insert Data into Table" name="insrt" /><br /><br />				
		</form>									
			<%}%>	
		<%-- <form action="InsertRows" method="post">	
			<input type="submit" value="Insert Data" name="insrt" /><br /><br />
		</form>--%>	
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
	</body>
</html>