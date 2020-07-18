<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="update_record.jsp"></jsp:include>
<p style="font-family:courier;float:right;width:70%;color:crimson;font-size:80%;">
				
				EMPLOYEE NUMBER:<input type="text" name="empid_edt" id="empid_edt" /><br/>
				Employee Name:	<input type="text" name="empname_edt" id="empname_edt" /><br/>
				Salary:			<input type="text" name="sal_edt" id="sal_edt" /><br/><br/>
								
				<input type="submit" name="editbutton" value="EDIT ROW" onclick="editRow();" /></p>
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
				</script>
</body>
</html>