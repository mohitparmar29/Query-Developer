<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>HOME</title>
	</head>
	<body style='background-color: linen;'>
		<form action="FetchData" method="post">
			<center>
				<h1 style="background-color:powderblue;color:red;">
				Welcome to Query Developer</h1>
				<table>
				<tr><th>
				<h3 style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">
				Introduction</h3>
				<p style="font-family:courier;border-color: #FF0000 #00FF00 #0000FF #000000; border-style:dotted solid;font-size:100%;">
				I have prepared this application for "First Time" learner or who have just wanted to start SQL learning.</p>
				<p style="font-family:courier;border-color: #FF0000 #00FF00 #0000FF #000000; border-style:solid;font-size:100%;">
					This application is for those who don't know how to write query and what will be the output we will get,if we execute
					the query.</p>
				<p style="font-family:verdana;background-color:palegoldenrod;color:mediumaquamarine;font-size:150%;">
				Click Here to start Learning SQL</p>
				<input type = "submit" value = "Check and Select Table" name="CST" /></p>
				</th>
				</tr>
				</table>
			</center>
		</form>
	</body>
</html>