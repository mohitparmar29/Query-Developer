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

/**
 * Servlet implementation class deleteData
 */
@WebServlet("/deleteData")
public class deleteData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    		response.setContentType("text/html");
    	    PrintWriter out = response.getWriter();
    	    
    	    String valueemp = request.getParameter("empid");
    	    String valuedept = request.getParameter("deptid");
    	    String valuemngr = request.getParameter("mgid");
    	    
    	    try {
    	    	Class.forName("oracle.jdbc.driver.OracleDriver");
    			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");

    	        Statement st = conn.createStatement();
    	        System.out.println("\n I am at 38 for value is: "+valuemngr);
    	        
    	        if (valueemp != null) 
    	        {    	        
    	        System.out.println("\n I am inside valueemp at not null where value is: "+valueemp);
    	        st.executeUpdate("DELETE FROM emp WHERE empid=" + valueemp);
    	        response.setContentType("text/html");
				System.out.println("\n I am @ line 46 in deleteData.java");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Records deleted successfully!');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
    	        //out.print(valueemp);
    	        //response.sendRedirect("http://localhost:8080/How_to_fetch_data_from_oracle/index.jsp");
    	        }
    	        if (valuedept != null) 
    	        {    	        
    	        System.out.println("\n I am inside valuedept at not null where value is: "+valuedept);
    	        st.executeUpdate("Delete From dept_new  where DEPARTMENT_ID =" + valuedept);
    	        
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
    	        st.executeUpdate("DELETE FROM managers WHERE MNGRID=" + valuemngr);
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
	
}
