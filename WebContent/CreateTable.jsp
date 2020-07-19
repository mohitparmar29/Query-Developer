<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
            
            .container{overflow: hidden}
            .tab{float: left;}
            .tab-2{margin-left: 50px}
            .tab-3{margin-left: 50px}
            .tab-1 input{display: block;margin-bottom: 10px}            
            
 </style>
</head>
<body bgcolor="wheat">
	
		<center>		
			<h1 style="background-color:powderblue;color:red;">Create Table</h1>
		</center>
		<form action="index.jsp">
			<input type="submit" value="HOME" />
		</form>	
			<p style="border-style:dotted solid;border-color: #800080 #800080;width:10%;font-family:courier;color:maroon;font-size:120%;">STEP -1</p>
			<h4 style="color:blue;">Enter the Table Name:<input type="text" id="tablename"/></h4><br />
		
		
		<div class="container">						
            <div class="tab tab-1">
            	<p style="border-style:dotted solid;border-color: #800080 #800080;width:55%;font-family:courier;color:maroon;font-size:120%;">STEP -2</p><br/>
                Column Name :<input type="text" id="column_id" name="column_id">
                Data Type :<select name="datatypes" id="datatype_id" name="datatype_id"><br />
        						<option value="number">number</option>
        						<option value="varchar2">varchar2</option>        		
    						</select><br />
                Size :<input type="text" id="size_id" name="size_id">
                
                <button onclick="addHtmlTableRow();">Add</button>
              <%--  <button onclick="editHtmlTbleSelectedRow();">Edit</button>
                <button onclick="removeSelectedRow();">Remove</button>  --%>  
            </div>
            
            <div class="tab tab-2">
            	<p style="border-style:dotted solid;border-color: #800080 #800080;width:40%;font-family:courier;color:maroon;font-size:120%;">STEP -3</p><br/>
            	<table id="myTable" border="1">
                    <tr><th>Column Name</th><th>Data Type</th><th>Size</th></tr>                                                  
                </table>                              
                <input type="submit" value="Generate Query" name="gnrtq" onclick="Createtablequery();"/>
                <input type="submit" value="Clear Table" name="clearT" onclick="ClearTable();"/><br /><br />
            </div>
            
            <div class="tab tab-3">
            	<p style="border-style:dotted solid;border-color: #800080 #800080;width:40%;font-family:courier;color:maroon;font-size:120%;">STEP -4</p><br />
            	<p style="font-family:courier;float:right;color:crimson;font-size:100%;">
				Query Used To Create Table:</p><br /><br />
				<form action="FetchData" method="post">
               	 <p><textarea id="demo" name="message" rows="4" cols="30"></textarea></p>
               	         			                             
                <input type="submit" value="Create Table" name="createtablequery" /><br /><br />
                </form>                
            </div>            
        </div>		
        
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
                var tablename = document.getElementById("tablename").value;
            
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
                else if(tablename === ""){
                    alert("Table Name Connot Be Empty");
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
            	if(table.rows.length >= 4)
            		{
                    	alert("Your can insert 3 rows only!"); 
                    }
            	else 
            		{
            			if(!checkEmptyInput()){
                        var newRow = table.insertRow();
                        var cell1 = newRow.insertCell(0);
                        var cell2 = newRow.insertCell(1);
                        var cell3 = newRow.insertCell(2);
                        var column_id = document.getElementById("column_id").value;
                        var datatype_id = document.getElementById("datatype_id").value;
                        var size_id = document.getElementById("size_id").value;
                    
                        cell1.innerHTML = column_id;
                        cell2.innerHTML = datatype_id;
                        cell3.innerHTML = size_id;
                        // call the function to set the event to the new row
                      //  selectedRowToInput();
                        ClearInputText();
            		}                
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
            
            /*
            
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
            */
            
            function ClearTable()
            {
                table.deleteRow();               
            }
            
            
            function ClearInputText()
            {
                 // clear input text
                document.getElementById("column_id").value = "";
                document.getElementById("datatype_id").value = "";
                document.getElementById("size_id").value = "";
            }
            
            function Createtablequery()
            {
            	var x =" ";
            	var y =" ";
            	var z =" ";
            	var text = " ";
            	var text1 = " ";
            	var text2 = " ";
            	var text3 = " ";
            	var len = table.rows.length;
            	var tablename = document.getElementById("tablename").value;
            	
            	
            	//x = document.getElementById("myTable").rows[1].cells.item(0).innerHTML;
            	//y = document.getElementById("myTable").rows[1].cells.item(1).innerHTML;
            	//z = document.getElementById("myTable").rows[1].cells.item(2).innerHTML;
            	for (i=0 ; i < (len-1) ; i++)
            		{
            		
            			for (j=0;j<3;j++)
            				{
            				//text += document.getElementById("myTable").rows[i+1].cells.item(j).innerHTML + " ";
            				if (j==0){x = document.getElementById("myTable").rows[i+1].cells.item(j).innerHTML;}
            				if (j==1){y = document.getElementById("myTable").rows[i+1].cells.item(j).innerHTML;}
            				if (j==2){z = document.getElementById("myTable").rows[i+1].cells.item(j).innerHTML;}
            				}
            			if ((len-1)==3)
            				{
            					if (i==0){text1 = x+" "+y+"("+z+")"+",";}
            					if (i==1){text2 = x+" "+y+"("+z+")"+",";}
            					if (i==2){text3 = x+" "+y+"("+z+")";}
            				}
            			if ((len-1)==2)
        					{
        						if (i==0){text1 = x+" "+y+"("+z+")"+",";}
        							if (i==1)
        								{
        									text2 = x +" "+ y + "(" + z +")";
        									text3 = "";
        								}        						
        					}
            			if ((len-1)==1)
        					{
        						if (i==0)
        							{
        								text1 = x+" "+y+"("+z+")";
        								text2 = "";
        								text3 = "";
        							}        							
        					}
            		//	text += x+" "+y+"("+z+")"+"," +"<br>";
            		}
            	text = text1 + text2 + text3;
            	document.getElementById("demo").innerHTML = "Create table " + tablename +" (" + text +")";
            	//document.getElementById("demo").innerHTML = "Found " + x + y + z + " cells in the first tr element.";
            }
            
        </script>
		


</body>
</html>