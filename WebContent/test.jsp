<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <table width="703" height="474" border="0" align="center" bgcolor="#FFFFFF">
                  <tr>
                    <td align="center" width="647" height="470">
    				<form name="form1" method="post">
    					<table align="center" width="606" border="0">
                      	<tr>
                       	 <td width="144">
                       	   <input name="R2" type="radio" value="radiobutton" /><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">To 
                               All User</font></b>
                       	  </td>
                       	 <td width="235">
                       	   <input name="R2" type="radio" value="radiobutton" /><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">All
                               at Particular Level</font></b>
    					</td>
                       	 <td width="213">
                       	   <input name="R2" type="radio" value="radiobutton" /><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> Individual at Particular 				    					level</font></b>
    					</td>
                      </tr>
                    </table>
    				<table border="0">
    				<tr>
    				<td width="57">&nbsp;</td>
    				<td width="35">&nbsp;</td>
    				</form>
    				<form>
    				<td width="96">&nbsp;</td>
    				</tr>
    				</table>
    				</form>
    				</td>
                  </tr>
                </table>
<form action="FetchData" method="post">
    <p>Normal text field.        
    <input type="text" name="name" /></p>

    <p>Secret text field.        
    <input type="password" name="pass" /></p>

    <p>Single-selection radiobuttons.        
    <input type="radio" name="gender" value="M" /> Male
    <input type="radio" name="gender" value="F" /> Female</p>

    <p>Single-selection checkbox.
    <input type="checkbox" name="agree" /> Agree?</p>

    <p>Multi-selection checkboxes.
    <input type="checkbox" name="role" value="USER" /> User
    <input type="checkbox" name="role" value="ADMIN" /> Admin</p>

    <p>Single-selection dropdown.
    <select name="countryCode">
        <option value="NL">Netherlands</option>
        <option value="US">United States</option>
    </select></p>

    <p>Multi-selection listbox.
    <select name="animalId" multiple="true" size="2">
        <option value="1">Cat</option>
        <option value="2">Dog</option>
    </select></p>

    <p>Text area.
    <textarea name="message"></textarea></p>

    <p>Submit button.
    <input type="submit" name="submit" value="submit" /></p>
</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result Page</title>
</head>
<body style='background-color: yellow;'>
<%-- 
<form action="FetchData" method="post">
<p>Available Tables:<br />
<input type = "checkbox"  name="chkSms" />EMP<input type="submit" name="all_data" value="Get All Data" style="float: right;" /><br />
<input type = "checkbox"  name="chkSms1" />DEPT<input type="submit" name="highest" value="Highest Salary" style="float: right;" /><br /><br />
<input type = "checkbox"  name="chkSms2" />Managers<br />
<input type = "submit" value = "Select Table" /></p>
<p>Check The Nth Highest Salary.Example: for 3rd highest salary enter 3.        
    <input type="text" name="number" /><br />
    <input type="submit" value="Nth Highest Salary" style="float: right;"></p>
<p>Write Your SQL Query on above table:        
    <input type="text" name="query" /><br />
    <input type="text" name="query" style="font-size: 18pt; height: 300px; width:600px; margin-left:150px;margin-right:auto;display:block;margin-top:2%;margin-bottom:0%" /><br />
    <input type="submit" value="Submit Query" style="float: right;"></p> 
   
</form>
<style>
body {
    background-image: url("D:/HOME Photos whtasup/im3.jpg");
}
</style>
--%>
<%--
<table border='1'><tr><td>Employee Number</td><td>Employee Name</td><td>salary</td></tr>
<%Iterator itr;%>
<% ArrayList data= (ArrayList)request.getAttribute("data");
for (itr=data.iterator(); itr.hasNext(); )
{
%>
<tr>
<td width="40"><%=itr.next()%></td>
<td width="80"><%=itr.next()%></td>
<td width="68"><%=itr.next()%></td>
</tr>
<%}%>
</table>
--%>
<form name="Form1" method="post">
<%--<table border='1'><tr><td>Table List:</td></tr>--%>
<% 
ArrayList tablelist= (ArrayList)request.getAttribute("tablelist");


//for(int i=0 ; i < tablelist.size();i++){
	%>
	
<%--<tr><br />--%>
<%--<td width="120"><input type = "checkbox"  name="emp" /><%=tablelist.get(0)%></td>--%>
<P>Table List:<br /><br />
<input type = "checkbox"  name="emp" /><%=tablelist.get(0)%><br />
<input type = "checkbox"  name="dept" /><%=tablelist.get(1)%><br />
<input type = "checkbox"  name="dept" /><%=tablelist.get(2)%></p>
<%--<td width="120"><input type = "checkbox"  name="dept" /><%=tablelist.get(1)%></td>--%>
<%--<td width="120"><input type = "checkbox"  name="managers" /><%=tablelist.get(2)%></td>--%>
<%--</tr>--%>

	<%-- out.println(tablelist.get(i));--%>
	
<%
//}
%>
	
<%--</table>--%>
</form><br />
<form action="index.jsp">
<input type="submit" value="HOME">
</form>
</body>
</html>