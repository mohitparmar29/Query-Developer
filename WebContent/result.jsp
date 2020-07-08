<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result Page</title>
</head>
<%--<body style='background-color: yellow;'>--%>
<body bgcolor="#a3ddc4"'>
<style>
table, th, td {
  border: 2px solid black; 
}
th {
  background-color: black;
  color: white;
}
tbody td {
  text-align: center;
}
table {
  background-color: #e495e4;
}
</style>
<form action="FetchData" method="post">
<% 
ArrayList tablelist= (ArrayList)request.getAttribute("tablelist");
//out.println("\n Table list is: " +tablelist);
if (tablelist != null) {
%>

<h4>Table List:</h4>
<input type = "checkbox"  value="empdata" name="emp" /><%=tablelist.get(0)%><br />
<input type = "checkbox"  value="deptdata" name="dept" /><%=tablelist.get(1)%><br />
<input type = "checkbox"  value="managerdata" name="managers" /><%=tablelist.get(2)%><br /><br />
<input type = "submit" value = "Show Table Data"  /><br /><br />
<input type="submit" value="Truncate Table" name="trunc"/>
<% 
}
//Array List creation for EMP , DEPT and Managers
ArrayList empdata= (ArrayList)request.getAttribute("empdata");
ArrayList deptdata= (ArrayList)request.getAttribute("deptdata");
ArrayList managersdata= (ArrayList)request.getAttribute("managersdata");
//ArrayList deptdata= (ArrayList)request.getAttribute("deptdata");
//out.println(empdata);
%>
<%--Array List creation for EMP , DEPT and Managers--%>
<%--Start EMP CheckBox Code--%>
<% 
if (empdata != null) {
%>
<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:120%;">Query Used To Select Table Record:</p>
<p style="font-family:courier;color:orange red;font-size:120%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:70%;">
select * from emp order by empid;</p>
<br /><br />
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
<input type = "submit" value = "Show Table Data" /><br /><br />
<input type="submit" value="Truncate Table" name="trunc"/>

<%} %>
<%--End EMP CheckBox Code--%>
<%--Start Department CheckBox Code--%>
<%
//out.println(deptdata);
if (deptdata != null) {
%>
<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:120%;">Query Used To Select Table Record:</p>
<p style="font-family:courier;color:orange red;font-size:120%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:70%;">
select * from departments order by department_id;</p>	
<table border="1" align="right" style="width:70%">
<tr><th>Department ID</th><th>Depatment Name</th><th>Manager ID</th><th>Location ID</th></tr>
<%Iterator itr;
for (itr=deptdata.iterator(); itr.hasNext(); )
{
%>
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

<%} %>
<%--End Department CheckBox Code--%>
<%--Start Managers CheckBox Code--%>
<%
//out.println(managerdata);
if (managersdata != null) {
%>
<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:120%;">Query Used To Select Table Record:</p>
<p style="font-family:courier;color:orange red;font-size:120%;border-color: #FF0000 #00FF00;border-style:inset; float:right;width:70%;">
select * from managers order by mngrid;</p>
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
<%} %>
<%--End Managers CheckBox Code--%>
</form><br />
<%--<form action="FetchData" method="post">
<input type="submit" value="Truncate Table" name="trunc"/>
</form><br />--%>
<form action="index.jsp">
<input type="submit" value="HOME" />
</form>
</body>
</html>