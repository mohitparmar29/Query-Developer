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
		<table><tr><th style="background-color: gold;color: olivedrab;">
		<form action="FetchData" method="post">
			<%		
			ArrayList tablelist= (ArrayList)request.getAttribute("tablelist");
			//out.println("\n Table list is: " +tablelist);
			if (tablelist != null) 
			{%>
				
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
											
				<input type = "checkbox"  value="deptdata" name="dept" id="deptid" /><%=tablelist.get(0)%><br />
				<input type = "checkbox"  value="empdata" name="emp" id="empid" /><%=tablelist.get(1)%><br />				
				<input type = "checkbox"  value="managerdata" name="managers" id="mgid" /><%=tablelist.get(2)%><br />
				<input type = "checkbox"  value="testerdata" name="testers" id="deptid" /><%=tablelist.get(3)%><br /><br />
				
				<input type = "submit" value = "View Records" onclick="checkEmptyInput();" /><br /><br />				
				<input type="submit" value="Truncate Table" name="trunc" /><br /><br />
				<input type="submit" value="Insert Records" name="insrt" /><br /><br />
				<input type="submit" value="Modify Records" name="updte" /><br /><br />
				<input type="submit" value="Delete Records" name="delte" /><br /><br />				
				<input type="submit" value="Drop Table" name="dropt" /><br /><br />				
		</form>									
			<%}%>	
		<script>	
		function checkEmptyInput()
            {
                var isEmpty = false;                
            
                if (document.getElementById("deptid").checked == false && document.getElementById("empid").checked == false 
                		&& document.getElementById("mgid").checked == false){
                    alert("Please select atleast one table");
                    document.getElementById(deptid).focus();
                    isEmpty = true;
                }
              //  return isEmpty;
            }
            </script>
		
		<form action="CreateTable.jsp">
			<input type="submit" value="Create Table" /><br /><br />
		</form>	
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
		</th></tr></table>
	</body>
</html>