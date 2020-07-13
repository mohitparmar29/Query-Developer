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
				Query Used To Insert Data into Table:</p>
			
				<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Insert into EMP (EMPID,EMPNAME,SALARY) values(value of column1,value of column2,value of column3);</p>
				
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				
				EMPLOYEE NUMBER:<input type="text" name="empid" id="empid" /><br/>
				Employee Name:<input type="text" name="empname" id="empname" /><br/>
				Salary:<input type="text" name="sal" id="sal" /><br/><br/>
								
				<input type="submit" name="addrowemp" value="ADD ROW" onclick="AddRowEmp()" /></p>
				
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
				
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc"/><br /><br />
				<input type="submit" value="Insert Data into Table" name="insrt"/>

			<%}%> <%--End EMP CheckBox Code--%>
			<%--Start Department CheckBox Code--%>
			<%
			//out.println(deptdata);
			if (deptdata != null) 
			{%>
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				Query Used To Insert Data into Table:</p>
			
				<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Insert into dept_new (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values(value of column1,value of column2,value of column3,value of column4);</p>
				
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				
				Department ID:<input type="text" name="deptid" id="deptid" /><br/>
				Department Name:<input type="text" name="deptname" id="deptname" /><br/>
				Manager ID:<input type="text" name="mgid" id="mgid" /><br/><br/>
				Location ID:<input type="text" name="lcid" id="lcid" /><br/><br/>
				
				<input type="submit" name="addrowdept" value="ADD ROW" onclick="AddRowDept()" /></p>
				
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
				
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc"/><br /><br />
				<input type="submit" value="Insert Data into Table" name="insrt"/>

			<%} %><%--End Department CheckBox Code--%>

			<%--Start Managers CheckBox Code--%>
			<%
				//out.println(managerdata);
			if (managersdata != null)
			{%>				
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					Query Used To Insert Data into Table:</p>
				
					<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
					Insert into managers (MNGRID,DEPTNAME,SALARY) values(value of column1,value of column2,value of column3);</p>
					
					<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
					
					Manager ID:<input type="text" name="managerid" id="managerid" /><br/>
					Department Name:<input type="text" name="deptname" id="deptname" /><br/>
					Salary:<input type="text" name="salary" id="salary" /><br/><br/>
					
					<input type="submit" name="addrowmngr" value="ADD ROW" onclick="AddRow()" /></p>
					
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
						
					
				<h4>Table List:</h4>
				<input type = "checkbox"  value="empdata" name="emp" />EMP<br />
				<input type = "checkbox"  value="deptdata" name="dept" />DEPT<br />
				<input type = "checkbox"  value="managerdata" name="managers" />MANAGERS<br /><br />
				<input type = "submit" value = "Show Table Data" /><br /><br />
				<input type="submit" value="Truncate Table" name="trunc"/><br /><br />
				<input type="submit" value="Insert Data into Table" name="insrt"/>	
			<%} %><%--End Managers CheckBox Code--%>
		</form><br />
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
		
	</body>
</html>