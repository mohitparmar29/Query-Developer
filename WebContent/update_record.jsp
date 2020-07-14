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
				Query Used To update Data in Table:</p>
			
				<p style="font-family:courier;color:orange red;font-size:80%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:50%;">
				update table EMP set empname=value of empname,salary=value of salary where EMPID = value of empid;</p>
											
				<table  id="myTableEmp" align="right" style="width:70%">
				
					<tr><th>EMPLOYEE NUMBER</th><th>EMPLOYEE NAME</th><th>SALARY</th><th>Delete Rows</th></tr>
					<%Iterator itr;
					for (itr=empdata.iterator(); itr.hasNext(); )
					{
						%>
						<tr>
							<center>
								<td width="140"><%=itr.next()%></td>
								<td width="180"><%=itr.next()%></td>
								<td width="168"><%=itr.next()%></td>
								<td><a href=editData?empid=<%=empdata.get(0) %>> Edit </a></td>
							</center>
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
				<input type="submit" value="Update Data In Table" name="updte"/>
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
					<% Iterator itr;
					for (itr=deptdata.iterator(); itr.hasNext(); )
					{%>
						<tr>
							<td width="140"><%=itr.next()%></td>
							<td width="180"><%=itr.next()%></td>
							<td width="168"><%=itr.next()%></td>
							<td width="168"><%=itr.next()%></td>
							<td><a href=deleteData?deptid=<%=deptdata.get(0) %>> Delete </a></td>
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
					
						<%Iterator itr;
						for (itr=managersdata.iterator(); itr.hasNext(); )
						{
						%>
							<tr>
								<td width="150"><%=itr.next()%></td>							
								<td width="170"><%=itr.next()%></td>									
								<td width="150"><%=itr.next()%></td>
								<td><a href=deleteData?mgid=<%=managersdata.get(0) %>> Delete </a></td>								
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
		<form method="POST" action="editData">
            <input type="hidden" name="code" value="${empdata.get(0)}" />
            <table border="0">
               <tr>
                  <td>empid</td>
                  <td style="color:red;">
                  <input type="text" name="empid" value="${empdata.get(0)}" /></td>
               </tr>
               <tr>
                  <td>empname</td>
                  <td><input type="text" name="empname" value="${empdata.get(1)}" /></td>
               </tr>
               <tr>
                  <td>salary</td>
                  <td><input type="text" name="salary" value="${empdata.get(2)}" /></td>
               </tr>
               <tr>
                  <td colspan = "2">
                      <input type="submit" value="Submit" />
                      <a href="index.jsp">Cancel</a>
                  </td>
               </tr>
            </table>
         </form>
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>
		
	</body>
</html>