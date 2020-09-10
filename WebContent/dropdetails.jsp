<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#a3ddc4"'>
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
  				background-color: #FFDEAD;
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
					<b><U>Query Used To Drop Table:</U></b></p>
				
					<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					drop table emp;</p>
				
					<p style="font-family:courier;color:darkgreen;background-color:wheat;font-size:94%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:68%;">
					<b>Note:</b>The SQL DROP TABLE statement is used to remove the table.If you want to remove table from database.Click Here->
					
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
				
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />				
				<input type = "submit" value = "View Records"  /><br /><br />
				<input type="submit" value="Drop Table" name="dropt"/><br /><br />					
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br /> 
				</th></tr></table>
				

			<%}%> <%--End EMP CheckBox Code--%>
			<%--Start Department CheckBox Code--%>
			<%
			//out.println(deptdata);
			if (deptdata != null) 
			{
				if (deptdata.isEmpty() == false) 
				{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					<b><U>Query Used To Drop Table:</U></b></p>
				
					<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					drop table dept;</p>
				
					<p style="font-family:courier;color:darkgreen;background-color:wheat;font-size:94%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:68%;">
					<b>Note:</b>The SQL DROP TABLE statement is used to remove the table.If you want to remove table from database.Click Here->
					
					<input type="submit" value="Drop Table" name="dropdept"/></p>
					
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
				
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />				
				<input type = "submit" value = "View Records"  /><br /><br />
				<input type="submit" value="Drop Table" name="dropt"/><br /><br />					
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br /> 
				</th></tr></table>

			<%} %><%--End Department CheckBox Code--%>

			<%--Start Managers CheckBox Code--%>
			<%
				//out.println(managerdata);
			if (managersdata != null)
			{
				if (managersdata.isEmpty() == false) 
				{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					<b><U>Query Used To Drop Table:</U></b></p>
				
					<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					drop table managers;</p>
				
					<p style="font-family:courier;color:darkgreen;background-color:wheat;font-size:94%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:68%;">
					<b>Note:</b>The SQL DROP TABLE statement is used to remove the table.If you want to remove table from database.Click Here->
					
					<input type="submit" value="Drop Table" name="dropmngr"/></p>
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
				
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />				
				<input type = "submit" value = "View Records"  /><br /><br />
				<input type="submit" value="Drop Table" name="dropt"/><br /><br />					
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br /> 
				</th></tr></table>
					
			<%} %><%--End Managers CheckBox Code--%>
		</form><br />		
	</body>
</html>