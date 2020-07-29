<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>HOME</title>
		<style>

.column {
  float: left;
  width: 32.33%;
  padding: 5px;  
}

.columnnew {
  float: left;
  width: 45.33%;
  padding: 15px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
</style>
	</head>
	<body style='background-color: linen;'>
		<div class="row">
			<div class="column">
				<img src="C:\Users\ADMIN\eclipse-workspace\Query_Developer\images\qdnew.png" style="width:100%"/>
			</div>	
			<div class="column">
				<h1 style="font-family:verdana;color:mediumaquamarine;font-size:200%;">Query Developer</h1>
			</div>
		</div>
		<hr>	
		<h3 style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">Introduction</h3>
				
		<div class="row">
			<div class="columnnew">
				<img src="C:\Users\ADMIN\eclipse-workspace\Query_Developer\images\sql.jpg" />
			</div>
			<div class="column">	
				<p style="font-family:verdana;color:midnightblue;font-size:100%;"><b>SQL</b> stands for <b>Structured Query Language</b>.<b>SQL</b> is a language that is designed for the storing,retrieving and modifying data in a relational database.</p>	
			</div>
		</div>
		<hr>	
			<p style="font-family:verdana;color:indigo;font-size:100%;">* This web application will give you a quick start to SQL.</p>	
			<p style="font-family:verdana;color:darkmagenta;font-size:100%;">* It covers the basic operations for understanding of SQL and to get a feel of how it works.</p>
		<form action="FetchData" method="post">
			<p style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">
				Start Learning SQL <img src="C:\Users\ADMIN\eclipse-workspace\Query_Developer\images\clickhere.jpg" style="width:5%"/><input type = "submit" value = "Click Here" name="CST" /></p>
		</form>
	</body>
</html>