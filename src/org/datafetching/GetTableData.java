package org.datafetching;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetTableData
 */
@WebServlet("/GetTableData")
public class GetTableData extends HttpServlet {
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
				//------------- index.jsp-----------------------
				String cstdata=request.getParameter("CST");
				String truncdata=request.getParameter("trunc");
				//------------- index.jsp-----------------------
				//------------- CreateTable.jsp-----------------------
				String createtable=request.getParameter("crete");
				String createtablequery=request.getParameter("createtablequery");
				String creatquery=request.getParameter("message");			
				//------------- CreateTable.jsp-----------------------
				//------------- deleterows.jsp-----------------------
				String deletedata=request.getParameter("delte");
				String deletevalue = request.getParameter("id");
				//------------- deleterows.jsp-----------------------
				//------------- droptable.jsp-----------------------
				String droptable=request.getParameter("dropt");
				String droptableemp=request.getParameter("dropemp");
				String droptabledept=request.getParameter("dropdept");
				String droptablemngr=request.getParameter("dropmngr");
				//------------- droptable.jsp-----------------------
				//------------- update_reocrd.jsp-----------------------
				String editdata=request.getParameter("updte");			
				String editbutton = request.getParameter("editbutton");
				String sal_edt = request.getParameter("sal_edt");
		        String empid_edt = request.getParameter("empid_edt");  
		        String empname_edt = request.getParameter("empname_edt");
				//------------- update_reocrd.jsp-----------------------
				//------------- insertdata.jsp-----------------------			
				String insertdata=request.getParameter("insrt");
				String addrowemp=request.getParameter("addrowemp");
				String addrowdept=request.getParameter("addrowdept");
				String addrowmngr=request.getParameter("addrowmngr");
				String managerid = request.getParameter("managerid");  
		        String deptname = request.getParameter("deptname");  
		        String salary = request.getParameter("salary");
		        String empid = request.getParameter("empid");  
		        String empname = request.getParameter("empname");  
		        String sal = request.getParameter("sal");
		        String deptid = request.getParameter("deptid");	          
		        String mgid = request.getParameter("mgid");	 
		        String lcid = request.getParameter("lcid");
				//------------- insertdata.jsp-----------------------
				//------------- result.jsp-----------------------
				String emptable=request.getParameter("emp");
				String depttable=request.getParameter("dept");
				String managerstable=request.getParameter("managers");
				//------------- result.jsp-----------------------					
			    //----------result.jsp--------------------------------
			    String[] empdata=request.getParameterValues("emp");
			    String[] deptdata=request.getParameterValues("dept");
			    String[] managersdata=request.getParameterValues("managers");
			    //----------result.jsp-------------------------------- 
			    //------------- truncatedetails.jsp-----------------------
				String truncallemprecord=request.getParameter("truncemp");
				String truncalldeptrecord=request.getParameter("truncdept");
				String truncallmngrrecord=request.getParameter("truncmngr");
				//------------- truncatedetails.jsp-----------------------
			    
			    
			    
				//Print the above got values in console			    
				response.setContentType("text/html");
				ArrayList dataList = new ArrayList();
				ArrayList al=new ArrayList();
				System.out.println("\n I am step 2");
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
				PreparedStatement ps1=null;
				PreparedStatement ps2=null;
				PreparedStatement ps3=null;						
								
				if (truncdata == null && insertdata == null && deletedata == null && editdata == null 
						&& editbutton == null && createtable == null && createtablequery == null
						&& droptable == null)
				{
					if (cstdata != null)
					{						
						ps1=conn.prepareStatement(" select table_name from all_tables where table_name IN ('EMP','DEPT_NEW','MANAGERS') and OWNER ='HR'\r\n" + 
								"Union\r\n" + 
								"select object_name from all_objects where trunc(created)>= '19-jul-2020' \r\n" + 
								"and owner = 'HR' and object_type = 'TABLE' \r\n" + 
								"order by table_name asc");
						
						ResultSet rs3=ps1.executeQuery();																	
						while (rs3.next()) 
						{	
							//Add records into data list
							dataList.add(rs3.getString(1));						
						}// while rs3 closed here
						request.setAttribute("tablelist", dataList);
						RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
						rd.forward(request, response);
					}//cstdata not null condition end	
					
				
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
						RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");				
						rd.include(request, response);				
						tableFlag = 1;
					}// tableFlag is 1 when more than one table selected else it will be zero
					
					System.out.println("\n Inside first IF emptable:"+emptable);
					
					if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
					{
						if (emptable != null) 
						{
							ps1=conn.prepareStatement("select * from emp order by empid");
							ResultSet rs1=ps1.executeQuery();
							while (rs1.next()) 
							{
								//Add records into data list
								dataList.add(rs1.getString(1));
								dataList.add(rs1.getString(2));
								dataList.add(rs1.getString(3));
							}//while loop rs1 closed here
							nextJSP = "/shodata.jsp";
							request.setAttribute("empdata", dataList);				  
							RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
							dispatcher.forward(request,response);
						}
						if (depttable != null) 
						{
							ps1=conn.prepareStatement("select * from dept_new order by department_id");
							ResultSet rs1=ps1.executeQuery();
							while (rs1.next()) 
							{
								//Add records into data list
								dataList.add(rs1.getString(1));
								dataList.add(rs1.getString(2));
								dataList.add(rs1.getString(3));
							}//while loop rs1 closed here
							nextJSP = "/shodata.jsp";
							request.setAttribute("deptdata", dataList);				  
							RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
							dispatcher.forward(request,response);									
						}
						
						if (managerstable != null) 
						{
							ps1=conn.prepareStatement("select * from managers order by mngrid");
							ResultSet rs1=ps1.executeQuery();
							while (rs1.next()) 
							{
								//Add records into data list
								dataList.add(rs1.getString(1));
								dataList.add(rs1.getString(2));
								dataList.add(rs1.getString(3));
							}//while loop rs1 closed here
							nextJSP = "/shodata.jsp";
							request.setAttribute("managersdata", dataList);				  
							RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
							dispatcher.forward(request,response);							
						}
					}//End of All the not null like emptable,depttable, managerstable and tableFlag =0 code
						
						System.out.println("\n I am @ line 192");
						System.out.println("\nand the truncallemprecord is: " +truncallemprecord);
						System.out.println("\nand the truncalldeptrecord is: " +truncalldeptrecord);
						System.out.println("\nand the truncallmngrrecord is: " +truncallmngrrecord);
						
					
						if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0 
								&& truncallmngrrecord == null && truncalldeptrecord == null && truncallemprecord == null 
								&& addrowemp == null && addrowdept == null && addrowmngr == null 
								&& droptableemp == null && droptabledept == null && droptablemngr == null)
						{
							ps1=conn.prepareStatement(" select table_name from all_tables where table_name IN ('EMP','DEPT_NEW','MANAGERS') and OWNER ='HR'\r\n" + 
									"Union\r\n" + 
									"select object_name from all_objects where trunc(created)>= '19-jul-2020' \r\n" + 
									"and owner = 'HR' and object_type = 'TABLE' \r\n" + 
									"order by table_name asc");
							
							ResultSet rs3=ps1.executeQuery();																	
							while (rs3.next()) 
							{	
								//Add records into data list
								dataList.add(rs3.getString(1));						
							}// while rs3 closed here
							request.setAttribute("tablelist", dataList);
							RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
							rd.forward(request, response);
						}//If any table not selected box closed here
				} // truncdata and insertdata is null is closed here				
				
			} // End of Try box closed
			
			catch(Exception e) 
			{
				e.printStackTrace();
			}

	}

}
