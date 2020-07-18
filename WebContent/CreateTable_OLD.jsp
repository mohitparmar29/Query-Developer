<%@ psize_id langusize_id="java" contentType="text/html; charset=ISO-8859-1"
    psize_idEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%--
<style>
            
            .container{overflow: hidden}
            .tab{float: left;}
            .tab-2{margin-left: 50px}
            .tab-2 input{display: block;margin-bottom: 10px}
            tr{transition:all .25s ease-in-out}
            tr:hover{background-color:#EEE;cursor: pointer}
            
 </style>
  --%>
</head>
<body bgcolor="wheat">
<center>
		<h1 style="background-color:powderblue;color:red;">Create Table</h1>
		</center>
				
		Enter the Table Name:<input type="text" /><br /><br />
		
		<%--
		<div class="container">
            <div class="tab tab-1">
                <table id="myTable" border="1">
                    <tr><th>Column Name</th><th>Data Type</th><th>Size</th></tr>
                    
                </table>
            </div>
            <div class="tab">
                Column Name :<input type="text" id="column_id">
                Data Type :<select name="datatypes" id="datatype_id">
        						<option value="number">number</option>
        						<option value="varchar2">varchar2</option>        		
    						</select>
                Size :<input type="text" id="size_id">
                
                <button onclick="addHtmlTableRow();">Add</button>
                <button onclick="editHtmlTbleSelectedRow();">Edit</button>
                <button onclick="removeSelectedRow();">Remove</button>
            </div>
        </div>
         --%>
		
    	
    	<input type="submit" value="Create Table" name="createtable" /><br /><br />
		
		 <%-- 
		 <script>
            
            var rIndex,
                table = document.getElementById("myTable");
            
            // check the empty input
            function checkEmptyInput()
            {
                var isEmpty = false,
                    column_id = document.getElementById("column_id").value,
                    datatype_id = document.getElementById("datatype_id").value,
                    size_id = document.getElementById("size_id").value;
            
                if(column_id === ""){
                    alert("Column Name Connot Be Empty");
                    isEmpty = true;
                }
                else if(datatype_id === ""){
                    alert("Data Type Connot Be Empty");
                    isEmpty = true;
                }
                else if(size_id === ""){
                    alert("size_id Connot Be Empty");
                    isEmpty = true;
                }
                return isEmpty;
            }
            
            // add Row
            function addHtmlTableRow()
            {
                // get the table by id
                // create a new row and cells
                // get value from input text
                // set the values into row cell's
                if(!checkEmptyInput()){
                var newRow = table.insertRow(table.length),
                    cell1 = newRow.insertCell(0),
                    cell2 = newRow.insertCell(1),
                    cell3 = newRow.insertCell(2),
                    column_id = document.getElementById("column_id").value,
                    datatype_id = document.getElementById("datatype_id").value,
                    size_id = document.getElementById("size_id").value;
            
                cell1.innerHTML = column_id;
                cell2.innerHTML = datatype_id;
                cell3.innerHTML = size_id;
                // call the function to set the event to the new row
                selectedRowToInput();
            }
            }
            
            // display selected row data into input text
            function selectedRowToInput()
            {
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                      // get the seected row index
                      rIndex = this.rowIndex;
                      document.getElementById("column_id").value = this.cells[0].innerHTML;
                      document.getElementById("datatype_id").value = this.cells[1].innerHTML;
                      document.getElementById("size_id").value = this.cells[2].innerHTML;
                    };
                }
            }
            selectedRowToInput();
            
            function editHtmlTbleSelectedRow()
            {
                var column_id = document.getElementById("column_id").value,
                    datatype_id = document.getElementById("datatype_id").value,
                    size_id = document.getElementById("size_id").value;
               if(!checkEmptyInput()){
                table.rows[rIndex].cells[0].innerHTML = column_id;
                table.rows[rIndex].cells[1].innerHTML = datatype_id;
                table.rows[rIndex].cells[2].innerHTML = size_id;
              }
            }
            
            function removeSelectedRow()
            {
                table.deleteRow(rIndex);
                // clear input text
                document.getElementById("column_id").value = "";
                document.getElementById("datatype_id").value = "";
                document.getElementById("size_id").value = "";
            }
        </script>--%>

<form action="index.jsp">
			<input type="submit" value="HOME" />
</form>
</body>
</html>