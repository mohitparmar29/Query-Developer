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
  				width:67%;  				
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
				<input type="hidden" id="myemp" value="myemp">
				
				<p id="demo"></p>
				
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				update EMP set empname=value of empname,salary=value of salary where EMPID = value of empid;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
					<b><U>Note:</U></b> To update records in EMP table , Please click on any column value.Values will populate in text boxes.</p>
								
				<div class="column">				
				<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">				
				
				<label for="enum">Employee Number:</label>
				<input size="25" type="text" name="empid_edt" id="empid_edt" style="pointer-events: none;" readonly/><br />
				<label for="ename">Employee Name:</label>
				<input size="25" type="text" name="empname_edt" id="empname_edt" /><br />
				<label for="esal">Salary:</label><br />
				<input size="25" type="text" name="sal_edt" id="sal_edt" /><br /><br />				
				
				<input type="submit" name="editbutton" value="EDIT ROW" onclick="editRowemp();" /></p></b>
				</div>	
				
				<%-- <p><textarea id="demo" name="message" rows="4" cols="30"></textarea></p>--%>									
												
				<table  id="myTableEmp" align="right" style="width:70%">
				
					<tr><th>EMPLOYEE NUMBER</th><th>EMPLOYEE NAME</th><th>SALARY</th></tr>
					<%
					Iterator itr = empdata.iterator();
					
					while (itr.hasNext())
					{
					 	String empid = (String)itr.next();				
					%>	<tr>
							<td><%=empid%></td>
							<td><%=itr.next()%></td>
							<td><%=itr.next()%></td>												
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
				<input type="hidden" id="mydept" value="mydept">
				<p id="demo"></p>
				
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Update dept set department_name=value of department_name,manager_id=value of manager_id,location_id=value of location_id where department_id=value of department_id;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
				<b><U>Note:</U></b> To update records in DEPT table , Please click on edit button.</p>
				
				<div class="column">
				<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">				
				
				Department ID:	<input size="25" type="text" name="deptid_edt" id="deptid_edt" /><br/>
				Department Name:<input size="25" type="text" name="deptname_edt" id="deptname_edt" /><br/>
				Manager ID:		<input size="25" type="text" name="mgid_edt" id="mgid_edt" /><br/>
				Location ID:	<input size="25" type="text" name="lcid_edt" id="lcid_edt" /><br/><br/>
				
				<input type="submit" name="editbuttondept" value="EDIT ROW" onclick="editRowDept();" /></p>
				</div>
				
								
				<table  id="myTableDept" align="right" style="width:70%">
				
					<tr><th>Department ID</th><th>Depatment Name</th><th>Manager ID</th><th>Location ID</th></tr>
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
				<input type="hidden" id="mymanager" value="mymanager">
				<p id="demo"></p>
			
				<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				<b><U>Query Used To update Data in Table:</U></b></p>
			
				<p style="font-family:courier;background-color:maroon;color:ivory;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				Update managers set department_name=value of department_name,salary=value of salary where manager_id=value of manager_id;</p>
				
				<p style="font-family:courier;font-size:94%;background-color:wheat;border-color: #1E90FF #FF0000;border-style:dotted; float:right;width:68%;color:darkgreen">
				<b><U>Note:</U></b> To update records in Managers table , Please click on edit button.</p>
				
				<div class="column">
						<b><p style="font-family:courier;text-align:left;width:50%;color:navy;font-size:90%;">
					
					<label for="enum">Manager ID:</label>
					<input size="25" type="text" name="managerid_edt" id="managerid_edt" /><br />
					<label for="enum">Department Name:</label>
					<input size="25" type="text" name="deptname_edt" id="deptname_edt" /><br />
					<label for="enum">Salary:</label><br />
					<input size="25" type="text" name="salary_edt" id="salary_edt" /><br /><br />
					
					<input type="submit" name="editbuttonmngr" value="EDIT ROW" onclick="editRowMngr();" /></p>
					</div>				
			
					<table  id="myTableManager" align="right" style="width:70%"> 
				
						<tr><th>Manager ID</th><th>Depatment Name</th><th>Salary</th></tr>
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
		<script>				
						
		//	function editRowemp()
		//		{			
			
				var table = document.getElementById("myTableEmp"),				
				rIndex;
				
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
						function editRowemp()
						{
							table.rows[rIndex].cells[0].innerHTML = document.getElementById("empid_edt").value;
							table.rows[rIndex].cells[1].innerHTML = document.getElementById("empname_edt").value;
							table.rows[rIndex].cells[2].innerHTML = document.getElementById("sal_edt").value;
						}
			//	}	
			</script>
			<script>		
			//function editRowDept()
			//{	
				var table1 = document.getElementById("myTableDept"),
				rIndex1;
				
					for (var i=0 ; i < table1.rows.length; i++ )
						{
							table1.rows[i].onclick = function()
							{
								rIndex1 = this.rowIndex;
								console.log(rIndex1);
						
								document.getElementById("deptid_edt").value = this.cells[0].innerHTML;
								document.getElementById("deptname_edt").value = this.cells[1].innerHTML;
								document.getElementById("mgid_edt").value = this.cells[2].innerHTML;
								document.getElementById("lcid_edt").value = this.cells[3].innerHTML;
							};						
						}
						
						function editRowDept()
						{
							table1.rows[rIndex1].cells[0].innerHTML = document.getElementById("deptid_edt").value;
							table1.rows[rIndex1].cells[1].innerHTML = document.getElementById("deptname_edt").value;
							table1.rows[rIndex1].cells[2].innerHTML = document.getElementById("mgid_edt").value;
							table1.rows[rIndex1].cells[3].innerHTML = document.getElementById("lcid_edt").value;
						}						
			//}	
			</script>
			<script>
			//function editRowMngr()
			//{
				var table2 = document.getElementById("myTableManager"),
				rIndex2;
			
						for (var i=0 ; i < table2.rows.length; i++ )
						{
							table2.rows[i].onclick = function()
							{
								rIndex2 = this.rowIndex;
								console.log(rIndex2);
						
								document.getElementById("managerid_edt").value = this.cells[0].innerHTML;
								document.getElementById("deptname_edt").value = this.cells[1].innerHTML;
								document.getElementById("salary_edt").value = this.cells[2].innerHTML;
							};						
						}			
				
						function editRowMngr()
						{
							table2.rows[rIndex2].cells[0].innerHTML = document.getElementById("managerid_edt").value;
							table2.rows[rIndex2].cells[1].innerHTML = document.getElementById("deptname_edt").value;
							table2.rows[rIndex2].cells[2].innerHTML = document.getElementById("salary_edt").value;
						}
			//}	
				</script>		
	</body>
</html>