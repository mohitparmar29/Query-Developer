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
			.column
			{
  				float: right;  				
  				padding: 5px;
  				width:60%;  				
			}
		</style>
		<script>					
				function AddRow() {
  						var table = document.getElementById("myTableMang");  						
  						var managerid = document.getElementById('managerid').value;
  						var deptname = document.getElementById('deptname').value;
  						var salary = document.getElementById('salary').value;
  						var row = table.insertRow();
  						var cell1 = row.insertCell(0);
  						var cell2 = row.insertCell(1);
  						var cell3 = row.insertCell(2);  						 						
  						}
				function AddRowEmp() {
						var table = document.getElementById("myTableEmp");  						
						var empid = document.getElementById('empid').value;
						var empname = document.getElementById('empname').value;
						var sal = document.getElementById('sal').value;
						var row = table.insertRow();
						var cell1 = row.insertCell(0);
						var cell2 = row.insertCell(1);
						var cell3 = row.insertCell(2);  						
						}
				function AddRowDept() {
						var table = document.getElementById("myTableDept");  						
						var deptid = document.getElementById('deptid').value;
						var deptname = document.getElementById('deptname').value;
						var mgid = document.getElementById('mgid').value;
						var lcid = document.getElementById('lcid').value;
						var row = table.insertRow();
						var cell1 = row.insertCell(0);
						var cell2 = row.insertCell(1);
						var cell3 = row.insertCell(2);
						var cell4 = row.insertCell(3);
						}
					</script>
		<center>
		<h1 style="background-color:powderblue;color:red;">Insert Records Into Table</h1>
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
				<b><U>Query Used To Insert Data into Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Insert into EMP (EMPID,EMPNAME,SALARY) values(value of column1,value of column2,value of column3);</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
					<b><U>Note:</U></b> To add records in EMP table , Please enter the data in below fields and click ADD ROW button.</p>
				
				<div class="column">
				<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">					
				
				<label for="enum">Employee Number:</label>
				<input size="25" type="text" name="empid" value="" placeholder="Enter Employee Number" id="empid" /><br />
				<label for="ename">Employee Name:</label>
				<input size="25" type="text" name="empname" placeholder="Enter Employee Name" id="empname" /><br />
				<label for="esal">Salary:</label><br />
				<input size="25" type="text" name="sal" placeholder="Enter Salary" id="sal" /><br /><br />					
								
				<input type="submit" name="addrowemp" value="ADD ROW" onclick="AddRowEmp()" /></p></b>
				</div>
				
				<table  id="myTableEmp" align="right" style="width:70%">
				
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
				<input type="submit" value="Insert Records" name="insrt"/><br /><br />
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
				<b><U>Query Used To Insert Data into Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:60%;">
				Insert into dept_new (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values(value of column1,value of column2,value of column3,value of column4);</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
					<b><U>Note:</U></b> To add records in DEPT table , Please enter the data in below fields and click ADD ROW button.</p>
				
				<div class="column">
				<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">				
				
				Department ID:	<input size="25" type="text" name="deptid" value="" placeholder="Enter Department Number" id="deptid" /><br/>
				Department Name:<input size="25" type="text" name="deptname" value="" placeholder="Enter Department Name" id="deptname" /><br/>
				Manager ID:		<input size="25" type="text" name="mgid" value="" placeholder="Enter Manager ID" id="mgid" /><br/>
				Location ID:	<input size="25" type="text" name="lcid" value="" placeholder="Enter Location Number" id="lcid" /><br/><br/>
				
				<input type="submit" name="addrowdept" value="ADD ROW" onclick="AddRowDept()" /></p>
				</div>
				
				<table  id="myTableDept" align="right" style="width:70%">
				
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
				<input type="submit" value="Insert Records" name="insrt"/><br /><br />
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
					<b><U>Query Used To Insert Data into Table:</U></b></p>
				
					<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					Insert into managers (MNGRID,DEPTNAME,SALARY) values(value of column1,value of column2,value of column3);</p>
					
					<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
					<b><U>Note:</U></b> To add records in MANAGERS table , Please enter the data in below fields and click ADD ROW button.</p>
				
					<div class="column">
						<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">
					
					<label for="enum">Manager ID:</label>
					<input size="25" type="text" name="managerid" value="" placeholder="Enter Manager ID" id="managerid" /><br />
					<label for="enum">Department Name:</label>
					<input size="25" type="text" name="deptname" value="" placeholder="Enter Department Name" id="deptname" /><br />
					<label for="enum">Salary:</label><br />
					<input size="25" type="text" name="salary" value="" placeholder="Enter Salary" id="salary" /><br /><br />
					
					<input type="submit" name="addrowmngr" value="ADD ROW" onclick="AddRow()" /></p>
					</div>
					
					<table  id="myTableMang" align="right" style="width:70%"> 
				
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
				<input type = "checkbox"  value="deptdata" 		name="dept" />DEPT<br />
				<input type = "checkbox"  value="empdata" 		name="emp" />EMP<br />				
				<input type = "checkbox"  value="managerdata" 	name="managers" />MANAGERS<br /><br />				
				<input type = "submit"    value = "View Records"  /><br /><br />				
				<input type = "submit" 	  value="Insert Records"name="insrt"/><br /><br />
				<form action="index.jsp">
					<input type="submit" value="HOME" />
				</form><br /><br />
				</th></tr></table>	
				
			<%} %><%--End Managers CheckBox Code--%>
		</form><br />		
	</body>
</html>