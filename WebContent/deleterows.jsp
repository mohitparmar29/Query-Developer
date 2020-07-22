<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="functions.js"></script>
</head>
<body bgcolor="#E6E6FA"'>
		<style>
			table, th, td
			{
  				border: 1px solid black; 
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
  				background-color: #F5FFFA;
			}
		</style>
		
		<script>				
				function deleteRow(r) {
					  var i = r.parentNode.parentNode.rowIndex;
					  document.getElementById("myTableEmp").deleteRow(i);
					  document.getElementById("myTableDept").deleteRow(i);
					  document.getElementById("myTableMang").deleteRow(i);
					}
		</script> 
		<center>
		<h1 style="background-color:powderblue;color:red;">Delete Records From Table</h1>
		</center>			
		<form action="FetchData" method="post">
		<% 			
			//Array List creation for EMP , DEPT and Managers
			ArrayList empdata= (ArrayList)request.getAttribute("empdata");
			ArrayList deptdata= (ArrayList)request.getAttribute("deptdata");
			ArrayList managersdata= (ArrayList)request.getAttribute("managersdata");
			
			//out.println(empdata);
			/*
			out.println("the size of empdata is :"+empdata.size());
			out.println("\nthe empdata.get(0) is :"+empdata.get(0));
			out.println("\nthe empdata.get(1) is :"+empdata.get(1));
			out.println("\nthe empdata.get(2) is :"+empdata.get(2));
			out.println("\nthe empdata.get(3) is :"+empdata.get(3));
			out.println("\nthe empdata.get(4) is :"+empdata.get(4));
			out.println("\nthe empdata.get(5) is :"+empdata.get(5));
			out.println("\nthe empdata.get(6) is :"+empdata.get(6));
			out.println("\nthe empdata.get(7) is :"+empdata.get(7));
			out.println("\nthe empdata.get(8) is :"+empdata.get(8));*/
				%>
			<%--Array List creation for EMP , DEPT and Managers--%>
			<%--Start EMP CheckBox Code--%>
			<% 
			if (empdata != null) 
			{%>
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				Query Used To Delete Data from Table:</p>
			
				<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Delete from EMP where EMPID = value of empid;</p>
											
				<table  id="myTableEmp" align="right" style="width:70%">
				
					<tr><th>EMPLOYEE NUMBER</th><th>EMPLOYEE NAME</th><th>SALARY</th><th>Delete Rows</th></tr>
					<%
					
					Iterator itr = empdata.iterator();
					
					while (itr.hasNext())
					{
					 	String empid = (String)itr.next();				
					%>
						<tr>
							<td><%=empid%></td>
							<td><%=itr.next()%></td>
							<td><%=itr.next()%></td>
							<td><a href=deleteData?empid=<%=empid%>> Delete </a></td>					
						</tr>
						
					<%}%>
				</table>
				<%if (empdata.isEmpty() == true) 
				{%>
				<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
					-------------No DATA Found-----------</p>	
				<%}%>
				<table>
				<tr><th style="background-color: gold;color: olivedrab;">
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />				
				<input type="submit" value="Delete Data From Table" name="delte"/>
				</th></tr></table>

			<%}%> <%--End EMP CheckBox Code--%>
			<%--Start Department CheckBox Code--%>
			<%
			//out.println(deptdata);
			if (deptdata != null) 
			{%>
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				Query Used To Delete Data from Table:</p>
			
				<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Delete From dept_new  where DEPARTMENT_ID = value of deptid;</p>
				
				<table  id="myTableDept" align="right" style="width:70%">
				
					<tr><th>Department ID</th><th>Depatment Name</th><th>Manager ID</th><th>Location ID</th><th>Delete Rows</th></tr>
					<% 
					Iterator itr = deptdata.iterator();					
					while (itr.hasNext())
					{
					 	String deptid = (String)itr.next();
					 	%>
						<tr>
							<td><%=deptid%></td>
							<td><%=itr.next()%></td>
							<td><%=itr.next()%></td>
							<td><a href=deleteData?deptid=<%=deptid%>> Delete </a></td>					
						</tr>						
					<%}%>
				</table>
				<%if (deptdata.isEmpty() == true) 
				{%>
				<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
					-------------No DATA Found-----------</p>	
				<%}%>
				
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Delete Data From Table" name="delte"/>

			<%} %><%--End Department CheckBox Code--%>

			<%--Start Managers CheckBox Code--%>
			<%
				//out.println(managerdata);
			if (managersdata != null)
			{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					Query Used To Delete Data From Table:</p>
				
					<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					Delete from managers where managerid = value of managerid;</p>					
			
					<table  id="myTableMang" align="right" style="width:70%"> 
				
						<tr><th>Manager ID</th><th>Depatment Name</th><th>Salary</th><th>Delete Rows</th></tr>
					
						
						<%
						Iterator itr = managersdata.iterator();					
						while (itr.hasNext())
						{
						 	String mgid = (String)itr.next();
						 	%>
							<tr>
								<td><%=mgid%></td>
								<td><%=itr.next()%></td>
								<td><%=itr.next()%></td>
								<td><a href=deleteData?mgid=<%=mgid%>> Delete </a></td>					
							</tr>						
						<%}%>					
					</table>
					<%if (managersdata.isEmpty() == true) 
					{%>
						<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
							-------------No DATA Found-----------</p>	
					<%}%>
						
					
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />				
				<input type="submit" value="Delete Data From Table" name="delte"/>	
			<%} %><%--End Managers CheckBox Code--%>
		</form><br />
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
		
	</body>
</html>