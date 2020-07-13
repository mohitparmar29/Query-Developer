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
 * Servlet implementation class InsertRows
 */
@WebServlet("/InsertRows")
public class InsertRows extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try
		{
			int inum=0;			
			int Flag=0;
			int emptableFlag=0;
			int deptFlag=0;
			int managersFlag=0;
			int tableFlag=0;
			String nextJSP;
			//------------- insertdata.jsp-----------------------
			String insertbutton=request.getParameter("insrt");
			String addrow=request.getParameter("addrow");
			String managerid = request.getParameter("managerid");  
	        String deptname = request.getParameter("deptname");  
	        String salary = request.getParameter("salary");
	        String managerstable=request.getParameter("managers");
	        String[] managersdata=request.getParameterValues("managers");
			//------------- insertdata.jsp-----------------------
			
			response.setContentType("text/html");
			//PrintWriter pw = response.getWriter();
			ArrayList dataList = new ArrayList();			
			System.out.println("\n I am step 1");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
			PreparedStatement ps1=null;
			PreparedStatement ps2=null;
			
			if (managerstable != null) 
			{
				if ((managerstable.trim()) != "managersdata") 
				{
					System.out.println("\nand the managersdata inside is: " +managersdata);
					System.out.println("\nand the managersdata length inside is: " +managersdata.length);
		
					if(managersdata.length > 0)
					{//If checkbox is checked than assign it with true or 1       
						System.out.println("\nand the chkSms is: " +managersdata);
						ps1=conn.prepareStatement("select * from managers order by mngrid");
						Flag = 1;
						deptFlag =1;
						managersFlag =1;
					}				
					System.out.println("\n I am at 249");					
					ResultSet rs3=ps1.executeQuery();
					while (rs3.next()) 
					{		
						//Add records into data list
						dataList.add(rs3.getString(1));
						dataList.add(rs3.getString(2));
						dataList.add(rs3.getString(3));													
					}// while rs3 closed here
					if (managersFlag ==1)
					{
						nextJSP = "/shodata.jsp";				  
						request.setAttribute("managersdata", dataList);
						RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
						dispatcher.forward(request,response);
						Flag =2;
						deptFlag =2;
					}//managersFlag ==1 closed here
				}
				else
				{
					//Do Nothing
				}
			}//End here managerstable not null	
			
			System.out.println("\n Before insert record");
			System.out.println("\nand the addrow is: " +addrow);
			System.out.println("\nand the managerid is: " +managerid);
			System.out.println("\nand the deptname is: " +deptname);
			System.out.println("\nand the salary is: " +salary);
			
			if (addrow != null)
			{
				System.out.println("\n Inside addrow record");
				ps2=conn.prepareStatement("insert into managers (MNGRID,DEPTNAME,SALARY) values(?,?,?)");
				ps2.setString(1,managerid);  
		        ps2.setString(2,deptname);        
		        ps2.setString(3,salary);
				System.out.println("\n After insert query");
				int i=ps2.executeUpdate();
				System.out.println("\n After result set: ");
				response.setContentType("text/html");
				System.out.println("\n I am @ line 74 Inside");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Records inserted successfully');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	
		
	}

}
