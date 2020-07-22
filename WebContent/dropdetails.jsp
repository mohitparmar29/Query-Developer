<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6FA"'>
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
  				background-color: #F5FFFA;
			}
		</style>
		<form action="FetchData" method="post">
		<% 			
			//Array List creation for EMP , DEPT and Managers
			ArrayList empdata= (ArrayList)request.getAttribute("empdata");
			ArrayList deptdata= (ArrayList)request.getAttribute("deptdata");
			ArrayList managersdata= (ArrayList)request.getAttribute("managersdata");
			
			//out.println(empdata);
				%>
			<%--Array List creation for EMP , DEPT and Managers--%>
			<%--Start EMP CheckBox Code--%>
			<% 
			if (empdata != null) 
			{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					Query Used To Drop Table:</p>
				
					<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					drop table emp;</p>
				
					<p style="font-family:courier;float:right;width:70%;color:darkmagenta;font-size:80%;">
					Note: The SQL DROP TABLE statement is used to remove the table.If you want to remove table from database.Click Here->
					
					<input type="submit" value="Drop Table" name="dropemp"/></p>				
							
								
				<table border="1" align="right" style="width:70%;">
					<tr><th>EMPLOYEE NUMBER</th><th>EMPLOYEE NAME</th><th>SALARY</th></tr>
					<%Iterator itr;
					for (itr=empdata.iterator(); itr.hasNext(); )
					{
						%>
						<tr>
							<center>
								<td width="40"><%=itr.next()%></td>
								<td width="80"><%=itr.next()%></td>
								<td width="68"><%=itr.next()%></td>
							</center>
						</tr>
					<%}%>
				</table>
				
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "checkbox"  value="testerdata" name="testers" />TESTERDATA<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Drop Table" name="dropt"/>

			<%}%> <%--End EMP CheckBox Code--%>
			<%--Start Department CheckBox Code--%>
			<%
			//out.println(deptdata);
			if (deptdata != null) 
			{
				if (deptdata.isEmpty() == false) 
				{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					Query Used To Truncate Table Record:</p>
				
					<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					truncate table dept_new;</p>
				
					<p style="font-family:courier;float:right;width:70%;color:darkmagenta;font-size:80%;">
					Note: The SQL TRUNCATE TABLE statement is used to remove all records from a table.If you want to remove all below records.Click Here->
					
					<input type="submit" value="Truncate Table" name="truncdept"/></p>
					
				<%}
				
				else
				{%>
					<p style="font-family:courier;color:orange red;font-size:180%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:70%;">
					Department Table is empty. Please insert some data to perform truncate operation.</p>	
				<%}%>	
				
				<table border="1" align="right" style="width:70%">
					<tr><th>Department ID</th><th>Depatment Name</th><th>Manager ID</th><th>Location ID</th></tr>
					<% Iterator itr;
					for (itr=deptdata.iterator(); itr.hasNext(); )
					{%>
						<tr>
							<td width="40"><%=itr.next()%></td>
							<td width="80"><%=itr.next()%></td>
							<td width="68"><%=itr.next()%></td>
							<td width="68"><%=itr.next()%></td>
						</tr>
					<%}%>
				</table>
				
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc"/>

			<%} %><%--End Department CheckBox Code--%>

			<%--Start Managers CheckBox Code--%>
			<%
				//out.println(managerdata);
			if (managersdata != null)
			{
				if (managersdata.isEmpty() == false) 
				{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					Query Used To Truncate Table Record:</p>
				
					<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					truncate table managers;</p>
				
					<p style="font-family:courier;float:right;width:70%;color:darkmagenta;font-size:80%;">
					Note: The SQL TRUNCATE TABLE statement is used to remove all records from a table.If you want to remove all below records.Click Here->
					
					<input type="submit" value="Truncate Table" name="truncmngr"/></p>
					
				<%}
				
				else
				{%>
					<p style="font-family:courier;color:orange red;font-size:180%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:70%;">
					Managers Table is empty. Please insert some data to perform truncate operation.</p>	
				<%}%>
								
				<table border="1" align="right" style="width:70%">
					<tr><th>Manager ID</th><th>Depatment Name</th><th>Salary</th></tr>
					<%Iterator itr;
					for (itr=managersdata.iterator(); itr.hasNext(); )
					{
					%>
						<tr>
							<td width="40"><%=itr.next()%></td>
							<td width="80"><%=itr.next()%></td>
							<td width="68"><%=itr.next()%></td>
						</tr>
					<%}%>
				</table>
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc"/>	
			<%} %><%--End Managers CheckBox Code--%>
		</form><br />
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
	</body>
</html>