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
		
		<center>
		<h1 style="background-color:powderblue;color:red;">Update Table Records</h1>
		</center>			
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
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				update EMP set empname=value of empname,salary=value of salary where EMPID = value of empid;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
				<b><U>Note:</U></b> To update records in EMP table , Please click on edit button.</p>							
												
				<table  id="myTableEmp" align="right" style="width:70%">
				
					<tr><th>EMPLOYEE NUMBER</th><th>EMPLOYEE NAME</th><th>SALARY</th><th>EDIT</th></tr>
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
							<td><a href=FetchData?empid_edt=<%=empid%>> Edit </a></td>					
						</tr>
						
					<%}%>
				</table>				
				<%if (empdata.isEmpty() == true) 
				{%>
				<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
					-------------No DATA Found-----------</p>	
				<%}%>
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "View Records"  /><br /><br />				
				<input type="submit" value="Modify Records" name="updte" /><br /><br />
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br />
				</th></tr></table>

			<%}%> <%--End EMP CheckBox Code--%>
			<%--Start Department CheckBox Code--%>
			<%
			//out.println(deptdata);
			if (deptdata != null) 
			{%>
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Update dept set department_name=value of department_name,manager_id=value of manager_id,location_id=value of location_id where department_id=value of department_id;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
				<b><U>Note:</U></b> To update records in DEPT table , Please click on edit button.</p>
				
				<table  id="myTableDept" align="right" style="width:70%">
				
					<tr><th>Department ID</th><th>Depatment Name</th><th>Manager ID</th><th>Location ID</th><th>Edit</th></tr>
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
							<td><%=itr.next()%></td>
							<td><a href=FetchData?deptid_edt=<%=deptid%>> Edit </a></td>					
						</tr>						
					<%}%>
				</table>
				<%if (deptdata.isEmpty() == true) 
				{%>
				<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
					-------------No DATA Found-----------</p>	
				<%}%>
				
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "View Records"  /><br /><br />				
				<input type="submit" value="Modify Records" name="updte" /><br /><br />
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br />
				</th></tr></table>

			<%} %><%--End Department CheckBox Code--%>

			<%--Start Managers CheckBox Code--%>
			<%
				//out.println(managerdata);
			if (managersdata != null)
			{%>				
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Update managers set department_name=value of department_name,salary=value of salary where manager_id=value of manager_id;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
					<b><U>Note:</U></b> To update records in Managers table , Please click on edit button.</p>
									
					<table  id="myTableMang" align="right" style="width:70%"> 
				
						<tr><th>Manager ID</th><th>Depatment Name</th><th>Salary</th><th>Edit</th></tr>
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
								<td><a href=FetchData?mgid_edt=<%=mgid%>> Edit </a></td>					
							</tr>						
						<%}%>					
					</table>
					<%if (managersdata.isEmpty() == true) 
					{%>
						<p style="font-family:courier;color:orange red;font-size:110%;float:right;width:60%;">
							-------------No DATA Found-----------</p>	
					<%}%>						
					
				<table><tr><th style="background-color: gold;color: olivedrab;">
				<h4 style="background-color:powderblue;color:red;">Table List:</h4> 
				<h4 style="color:indigo;">Please select one table ,</h4>
				<h4 style="color:indigo;">before clicking on below buttons.</h4>
				<h5 style="color:orangered;">Please select one table at a time.</h5>
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "View Records"  /><br /><br />				
				<input type="submit" value="Modify Records" name="updte" /><br /><br />
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br />
				</th></tr></table>	
			<%} %><%--End Managers CheckBox Code--%>
		</form>
		<%-- 
		<script>				
				var table = document.getElementById("myTableEmp"),rIndex;
				
				for (var i=0 ; i < table.rows.length; i++ )
				{
					table.rows[i].onclick = function()
					{
						rIndex = this.rowIndex;
						console.log(rIndex);
						
						document.getElementById("empid_edt").value = this.cells[0].innerHTML;
						document.getElementById("empname_edt").value = this.cells[1].innerHTML;
						document.getElementById("sal_edt").value = this.cells[2].innerHTML;
					};
						
				}
				
				function editRow()
				{
					table.rows[rIndex].cells[0].innerHTML = document.getElementById("empid_edt").value;
					table.rows[rIndex].cells[1].innerHTML = document.getElementById("empname_edt").value;
					table.rows[rIndex].cells[2].innerHTML = document.getElementById("sal_edt").value;
				}
				</script>	--%>	
	</body>
</html>