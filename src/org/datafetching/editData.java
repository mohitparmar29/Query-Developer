package org.datafetching;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class editData
 */
@WebServlet("/editData")
public class editData extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    ArrayList dataList = new ArrayList();
	    
	    String valueemp = request.getParameter("empid");
	    String valuedept = request.getParameter("deptid");
	    String valuemngr = request.getParameter("mgid");
	    
	    try {
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");

	        //Statement st = conn.createStatement();
	        PreparedStatement ps1=null;
	        
	        System.out.println("\n I am at 38 for value is: "+valuemngr);
	        
	        if (valueemp != null) 
	        {    	        
	        System.out.println("\n I am inside valueemp at not null where value is: "+valueemp);
	        ps1=conn.prepareStatement("select * from emp where empid=" + valueemp);
	        //st.executeQuery("select * from emp WHERE empid=" + valueemp);
	        
	        ResultSet rs1=ps1.executeQuery();
			while (rs1.next()) 
			{
				//Add records into data list
				dataList.add(rs1.getString(1));
				dataList.add(rs1.getString(2));
				dataList.add(rs1.getString(3));
			}//while loop rs1 closed here
			
			request.setAttribute("empdata", dataList);				  
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_record.jsp") ;							
			dispatcher.forward(request,response);
				        
	        }
	        if (valuedept != null) 
	        {    	        
	        System.out.println("\n I am inside valuedept at not null where value is: "+valuedept);
	        //st.executeUpdate("Delete From dept_new  where DEPARTMENT_ID =" + valuedept);
	        
	        response.setContentType("text/html");
			System.out.println("\n I am @ line 63 in deleteData.java");
			PrintWriter pw1=response.getWriter();				
			pw1.println("<script type=\"text/javascript\">");
			pw1.println("alert('Records deleted successfully!');");
			pw1.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
			rd.include(request, response);
			
	        //out.print(valuedept);
	        //response.sendRedirect("http://localhost:8080/How_to_fetch_data_from_oracle/index.jsp");
	        }
	        if (valuemngr != null) 
	        {    	        
	        System.out.println("\n I am inside value at not null where value is: "+valuemngr);
	        //st.executeUpdate("DELETE FROM managers WHERE MNGRID=" + valuemngr);
	        //out.print(valuemngr);
	        //response.sendRedirect("http://localhost:8080/How_to_fetch_data_from_oracle/index.jsp");
	        
	        response.setContentType("text/html");
			System.out.println("\n I am @ line 81 in deleteData.java");
			PrintWriter pw1=response.getWriter();				
			pw1.println("<script type=\"text/javascript\">");
			pw1.println("alert('Records deleted successfully!');");
			pw1.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
			rd.include(request, response);
	        }

	        conn.close();
	    }
	    catch(Exception e){
	        e.printStackTrace();
	    }	
	
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			ArrayList dataList = new ArrayList();
			String salary = request.getParameter("salary");
	        String empid = request.getParameter("empid");  
	        String empname = request.getParameter("empname");
			
	        System.out.println("\n Before connection And empid is : "+empid);
	        
	        Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
			PreparedStatement ps2=null;
			
			ps2=conn.prepareStatement("Update EMP set EMPNAME=?,SALARY=? where EMPID=?");
			ps2.setString(1,empid);  
	        ps2.setString(2,empname);        
	        ps2.setString(3,salary);
			System.out.println("\n And empid is : "+empid);
			System.out.println("\n And empname is : "+empname);
			System.out.println("\n And sal is : "+salary);
			int i=ps2.executeUpdate();
			request.setAttribute("empdata", dataList);				  
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_record.jsp") ;							
			dispatcher.forward(request,response);
		}
		catch(Exception e){
	        e.printStackTrace();
	    }
		
		
	}

}
