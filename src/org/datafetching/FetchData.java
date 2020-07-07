package org.datafetching;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import java.sql.*;
import java.util.ArrayList;
import java.io.PrintWriter;

@WebServlet("/FetchData")
public class FetchData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int inum=0;			
			int Flag=0;
			int emptableFlag=0;
			int deptFlag=0;
			int managersFlag=0;
			int tableFlag=0;
			String nextJSP;
			String all_data=request.getParameter("all_data");
			//------------- index.jsp-----------------------
			String cstdata=request.getParameter("CST");
			String insertdata=request.getParameter("INST");
			String deletedata=request.getParameter("DELT");
			String droptable=request.getParameter("DROPT");
			String truncdata=request.getParameter("trunc");
			//------------- index.jsp-----------------------
			//------------- result.jsp-----------------------
			String emptable=request.getParameter("emp");
			String depttable=request.getParameter("dept");
			String managerstable=request.getParameter("managers");
			//------------- result.jsp-----------------------
			
			String highest=request.getParameter("highest");
			String str =request.getParameter("number");
			String Query=request.getParameter("query");
			
			//String idStr=request.getParameter("chkSms");
		     //int id= Integer.parseInt(idStr);// If you need to parse to int
		    String[] chkSms=request.getParameterValues("chkSms");
		    //----------result.jsp--------------------------------
		    String[] empdata=request.getParameterValues("emp");
		    String[] deptdata=request.getParameterValues("dept");
		    String[] managersdata=request.getParameterValues("managers");
		  //----------result.jsp-------------------------------- 
		     
			
		    //int num=Integer.parseInt(number.trim());
		 //   int number = Integer.parseInt(request.getParameter("number"));
            			
			//Print the above got values in console
		    System.out.println("The Check and Select table is: " +cstdata);
		    System.out.println("\n I am step 1");
			response.setContentType("text/html");
			ArrayList dataList = new ArrayList();
			ArrayList al=new ArrayList();
			System.out.println("\n I am step 2");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
			PreparedStatement ps1=null;
			PreparedStatement ps2=null;
			PreparedStatement ps3=null;
			System.out.println("\n I am step 3");
			
			if (cstdata != null || insertdata != null || deletedata != null || droptable != null || truncdata != null) 
			{
				/*if (cstdata != null) { al.add(cstdata); }
				if (insertdata != null) { al.add(insertdata); }
				if (deletedata != null) { al.add(deletedata); }
				if (droptable != null) { al.add(droptable); }
				if (trundata != null) { al.add(trundata); }*/
				
				al.add("EMP");
				al.add("DEPT");
				al.add("MANAGERS");
				
				request.setAttribute("tablelist", al);
				RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
				rd.forward(request, response);				
			}
		
			System.out.println("\nand the emptable is: " +emptable);
			System.out.println("\nand the empdata is: " +empdata);
			System.out.println("\nand the depttable is: " +depttable);
			System.out.println("\nand the deptdata is: " +deptdata);
			System.out.println("\nand the managerstable is: " +managerstable);
			System.out.println("\nand the managersdata is: " +managersdata);
			System.out.println("\nand the truncdata is: " +truncdata);
			System.out.println("\nand the tableFlag is: " +tableFlag);
			System.out.println("\n I am line 100 Code");
			
			if (((emptable != null) && (depttable != null) && (managerstable != null)) ||
					((emptable != null) && (depttable != null)) ||
					((depttable != null) && (managerstable != null)) ||
					((emptable != null) && (managerstable != null)))   
			{
				System.out.println("\n Inside first IF");
								
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Please select one table at a time');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
				
				tableFlag = 1;
			}
			// tableFlag is 1 when more than one table selected else it will be zero
			if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
			{			
			if (emptable != null) {
			if ((emptable.trim()) != "empdata") {
				
			System.out.println("\nand the empdata inside is: " +empdata);
			System.out.println("\nand the empdata length inside is: " +empdata.length);
			
			if(empdata.length > 0){//If checkbox is checked than assign it with true or 1       
				System.out.println("\nand the chkSms is: " +empdata);
				ps1=conn.prepareStatement("select * from emp order by empid");
				Flag = 1;
				emptableFlag=1;
			 }
			
			}
			else
			{
				//Do Nothing
			}
		}
			System.out.println("\nand the depttable is: " +depttable);
			System.out.println("\nand the deptdata is: " +deptdata);
			
			if (depttable != null) {
			
			if ((depttable.trim()) != "deptdata") {
				
				System.out.println("\nand the deptdata inside is: " +deptdata);
				System.out.println("\nand the deptdata length inside is: " +deptdata.length);
				
				if(deptdata.length > 0){//If checkbox is checked than assign it with true or 1       
					System.out.println("\nand the chkSms is: " +deptdata);
					ps2=conn.prepareStatement("select * from departments order by department_id");
					Flag = 1;
					deptFlag =1;
				 }
				
			}
			else
			{
				//Do Nothing
			}
			}
			
			System.out.println("\nand the managerstable is: " +managerstable);
			System.out.println("\nand the managersdata is: " +managersdata);
			
			if (managerstable != null) {
			
			if ((managerstable.trim()) != "managersdata") {
				
				System.out.println("\nand the managersdata inside is: " +managersdata);
				System.out.println("\nand the managersdata length inside is: " +managersdata.length);
				
				if(managersdata.length > 0){//If checkbox is checked than assign it with true or 1       
					System.out.println("\nand the chkSms is: " +managersdata);
					ps3=conn.prepareStatement("select * from managers order by mngrid");
					Flag = 1;
					deptFlag =1;
					managersFlag =1;
				 }
				
			}
			else
			{
				//Do Nothing
			}
			}
			}//End of All the not null like emptable,depttable, managerstable and tableFlag =0 code
			if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0)
			{
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Please select table');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
			}		
			
			/*
			
			if (all_data != null) {			
			ps=conn.prepareStatement("select * from emp order by empid");}
			if (highest != null) {
			ps=conn.prepareStatement("select * from emp where salary in (select max(salary) from emp) order by empid");}
			System.out.println("\n I am step 4");
			
			if(chkSms !=null && chkSms.length > 0){//If checkbox is checked than assign it with true or 1       
				System.out.println("\nand the chkSms is: " +chkSms);
				ps=conn.prepareStatement("select * from emp order by empid");
				Flag = 1;
		     }
			
			if (str == null || str.isEmpty()) {
				System.out.println("\n Do nothing");
				}
			else {
				inum = Integer.valueOf(str);
				ps=conn.prepareStatement("select * from emp where salary in (select min(salary) from(select distinct salary from emp order by salary desc)\r\n" + 
						"where ROWNUM <=" +inum+")");
				}			
			
			if (Query == null || Query.isEmpty()) {
				System.out.println("\n Do not print anything");
				}
			else {
				ps=conn.prepareStatement(Query);
				}
				*/
			//System.out.println("\n ps.executeQuery() is : "  +ps.executeQuery());
			System.out.println("\n I am at 246");
			
			if (tableFlag == 0)
			{
			
			if (depttable != null) 
			{
			System.out.println("\n I am at 252");			
			
			ResultSet rs2=ps2.executeQuery();
			
			System.out.println("\n I am at 256");			
			
			
		//	PrintWriter out=response.getWriter();
		//	out.println("<html><body><center><table border='2'><tr><td>Employee Number</td><td>Employee Name</td><td>salary</td></tr>");
			
				while (rs2.next()) {
					
					//Add records into data list

					  dataList.add(rs2.getString(1));
					  dataList.add(rs2.getString(2));
					  dataList.add(rs2.getString(3));
					  dataList.add(rs2.getString(4));
					  
					//out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");				
				}
			
			}
			if (emptable != null) {
				
			System.out.println("\n I am at 200");
				
			ResultSet rs1=ps1.executeQuery();
									
			while (rs1.next()) {
			
				//Add records into data list

				  dataList.add(rs1.getString(1));
				  dataList.add(rs1.getString(2));
				  dataList.add(rs1.getString(3));
				  
				//out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");				
			}
		}
			
			if (managerstable != null) {
				
				System.out.println("\n I am at 249");
					
				ResultSet rs3=ps3.executeQuery();
									
				while (rs3.next()) {
				
					//Add records into data list

					  dataList.add(rs3.getString(1));
					  dataList.add(rs3.getString(2));
					  dataList.add(rs3.getString(3));
					  
					//out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");				
				}
			}

			
			//out.println("</table></center></body></html>");
			if (managersFlag ==1){
				  nextJSP = "/result.jsp";				  
				  request.setAttribute("managersdata", dataList);
			      RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
			    		  //getServletContext().getRequestDispatcher(nextJSP);
			      dispatcher.forward(request,response);
			      Flag =2;
			      deptFlag =2;
			}			
			if (deptFlag ==1){
				  nextJSP = "/result.jsp";				  
				  request.setAttribute("deptdata", dataList);
			      RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
			    		  //getServletContext().getRequestDispatcher(nextJSP);
			      dispatcher.forward(request,response);
			      Flag =2;
			}
			
			if (Flag ==1){
				  nextJSP = "/result.jsp";
				  request.setAttribute("empdata", dataList);				  
			      RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
			    		  //getServletContext().getRequestDispatcher(nextJSP);
			      dispatcher.forward(request,response);
			}
			}
			/*
			
			if (Flag ==1){
				  nextJSP = "/index.jsp";
				  request.setAttribute("data", dataList);
			      RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
			    		  //getServletContext().getRequestDispatcher(nextJSP);
			      dispatcher.forward(request,response);
			}
			else {
			
			  nextJSP = "/result.jsp";
			  request.setAttribute("data", dataList);
		      RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
		    		  //getServletContext().getRequestDispatcher(nextJSP);
		      dispatcher.forward(request,response);
			}
			*/
			if (emptableFlag == 1)
			{
				System.out.println("\nI am here in truncdata");
				
			}
			
		}		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
