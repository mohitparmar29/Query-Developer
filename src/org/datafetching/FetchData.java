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
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    ArrayList dataList = new ArrayList();
	    
	    String valueemp = request.getParameter("empid_edt");
	    String valuedept = request.getParameter("deptid_edt");
	    String valuemngr = request.getParameter("mgid_edt");
	    
	    try {
	    	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");

	        //Statement st = conn.createStatement();
	        PreparedStatement ps1=null;
	        
	        System.out.println("\n I am at 38 for value is: "+valueemp);
	        System.out.println("\n I am at 38 for value is: "+valuedept);
	        System.out.println("\n I am at 38 for value is: "+valuemngr);
	        
	        if (valueemp != null) 
	        {    	        
	        System.out.println("\n I am inside editData.java where valueemp is: "+valueemp);
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/editDataNew.jsp") ;							
			dispatcher.forward(request,response);
				        
	        }
	        if (valuedept != null) 
	        {    	        
	        	System.out.println("\n I am inside FetchData.java where valuedept is: "+valuedept);
		        ps1=conn.prepareStatement("select * from dept where department_id=" + valuedept);
		        //st.executeQuery("select * from emp WHERE empid=" + valueemp);
		        
		        ResultSet rs1=ps1.executeQuery();
				while (rs1.next()) 
				{
					//Add records into data list
					dataList.add(rs1.getString(1));
					dataList.add(rs1.getString(2));
					dataList.add(rs1.getString(3));
					dataList.add(rs1.getString(4));
				}//while loop rs1 closed here
				
				request.setAttribute("deptdata", dataList);				  
				RequestDispatcher dispatcher = request.getRequestDispatcher("/editDataNew.jsp") ;							
				dispatcher.forward(request,response);
	        }
	        if (valuemngr != null) 
	        {    	        
	        	System.out.println("\n I am inside FetchData.java where valuemngr is: "+valuemngr);
		        ps1=conn.prepareStatement("select * from managers where mngrid=" + valuemngr);
		        //st.executeQuery("select * from emp WHERE empid=" + valueemp);
		        
		        ResultSet rs1=ps1.executeQuery();
				while (rs1.next()) 
				{
					//Add records into data list
					dataList.add(rs1.getString(1));
					dataList.add(rs1.getString(2));
					dataList.add(rs1.getString(3));
				}//while loop rs1 closed here
				
				request.setAttribute("managersdata", dataList);				  
				RequestDispatcher dispatcher = request.getRequestDispatcher("/editDataNew.jsp") ;							
				dispatcher.forward(request,response);
	        }

	        conn.close();
	    }
	    catch(Exception e){
	        e.printStackTrace();
	    }	
	
}

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
			String editbuttondept = request.getParameter("editbuttondept");
			String editbuttonmngr = request.getParameter("editbuttonmngr");
			String sal_edt = request.getParameter("sal_edt");
	        String empid_edt = request.getParameter("empid_edt");  
	        String empname_edt = request.getParameter("empname_edt");	        
	        String managerid_edt = request.getParameter("managerid_edt");  
	        String deptname_edt = request.getParameter("deptname_edt");  
	        String salary_edt = request.getParameter("salary_edt");	        
	        String deptid_edt = request.getParameter("deptid_edt");	          
	        String mgid_edt = request.getParameter("mgid_edt");	 
	        String lcid_edt = request.getParameter("lcid_edt");
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
			
			if (truncdata == null && insertdata == null && deletedata == null && editdata == null 
					&& editbutton == null && createtable == null && createtablequery == null
					&& droptable == null && editbuttondept == null && editbuttonmngr == null)
			{
				if (cstdata != null)
				{
					//al.add("EMP");
					//al.add("DEPT");
					//al.add("MANAGERS");
					System.out.println("\n Before Query");
					/*
					ps1=conn.prepareStatement(" select table_name from all_tables where table_name IN ('EMP','DEPT','MANAGERS') and OWNER ='HR'\r\n" + 
							"Union\r\n" + 
							"select object_name from all_objects where trunc(created)>= '19-jul-2020' \r\n" + 
							"and owner = 'HR' and object_type = 'TABLE' \r\n" + 
							"order by table_name asc");
					*/		
					ps1=conn.prepareStatement(" select table_name from all_tables where table_name IN ('EMP','DEPT','MANAGERS','TESTERDATA') and OWNER ='HR'\r\n" + 
							"order by table_name asc");		
					
					System.out.println("\n After Query");
					ResultSet rs3=ps1.executeQuery();
					System.out.println("\n After execute query");
					//System.out.println("\n rs3.next():" +rs3.next());
										
					while (rs3.next()) 
					{		
						//Add records into data list
						dataList.add(rs3.getString(1));
						System.out.println("\n rs3.getString(1): " +rs3.getString(1));
					}// while rs3 closed here
					
					//System.out.println("\n rs3.getString(1): " +rs3.getString(1));
					
					
					request.setAttribute("tablelist", dataList);
					RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
					rd.forward(request, response);
				}//cstdata not null condition end
		
				System.out.println("\nand the emptable is: " +emptable);
				System.out.println("\nand the empdata is: " +empdata);
				System.out.println("\nand the depttable is: " +depttable);
				System.out.println("\nand the deptdata is: " +deptdata);
				System.out.println("\nand the managerstable is: " +managerstable);
				System.out.println("\nand the managersdata is: " +managersdata);
				System.out.println("\nand the truncdata is: " +truncdata);
				System.out.println("\nand the insertdata is: " +insertdata);
				
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
				}// tableFlag is 1 when more than one table selected else it will be zero
				
				if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
				{
					if (emptable != null) 
					{
						if ((emptable.trim()) != "empdata") 
						{
							System.out.println("\nand the empdata inside is: " +empdata);
							System.out.println("\nand the empdata length inside is: " +empdata.length);
						
							if(empdata.length > 0)
							{//If checkbox is checked than assign it with true or 1
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
			
					if (depttable != null) 
					{
						if ((depttable.trim()) != "deptdata") 
						{
							System.out.println("\nand the deptdata inside is: " +deptdata);
							System.out.println("\nand the deptdata length inside is: " +deptdata.length);
				
							if(deptdata.length > 0)
							{//If checkbox is checked than assign it with true or 1       
								System.out.println("\nand the chkSms is: " +deptdata);
								ps2=conn.prepareStatement("select * from dept order by department_id");
								Flag = 1;
								deptFlag =1;
							}
						}
						else
						{
							//	Do Nothing
						}
					}
					System.out.println("\nand the managerstable is: " +managerstable);
					System.out.println("\nand the managersdata is: " +managersdata);
					if (managerstable != null) 
					{
						if ((managerstable.trim()) != "managersdata") 
						{
							System.out.println("\nand the managersdata inside is: " +managersdata);
							System.out.println("\nand the managersdata length inside is: " +managersdata.length);
				
							if(managersdata.length > 0)
							{//If checkbox is checked than assign it with true or 1       
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
					System.out.println("\n I am @ line 192");
					System.out.println("\nand the truncallemprecord is: " +truncallemprecord);
					System.out.println("\nand the truncalldeptrecord is: " +truncalldeptrecord);
					System.out.println("\nand the truncallmngrrecord is: " +truncallmngrrecord);
					if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0 
							&& truncallmngrrecord == null && truncalldeptrecord == null && truncallemprecord == null 
							&& addrowemp == null && addrowdept == null && addrowmngr == null && droptable == null
							&& droptableemp == null && droptabledept == null && droptablemngr == null)
					{
						response.setContentType("text/html");
						System.out.println("\n I am @ line 196 Inside");
						PrintWriter pw=response.getWriter();				
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Please select table');");
						pw.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
						rd.include(request, response);
					}//If any table not selected box closed here		
						
					System.out.println("\n I am at 246");
						if (tableFlag == 0)
						{
							if (depttable != null) 
							{
								System.out.println("\n I am at 252");			
								ResultSet rs2=ps2.executeQuery();
								System.out.println("\n I am at 256");			
								while (rs2.next())
								{
										//Add records into data list
									dataList.add(rs2.getString(1));
									dataList.add(rs2.getString(2));
									dataList.add(rs2.getString(3));
									dataList.add(rs2.getString(4));
								}// While rs2 closed here			
							}//depttable != null closed here
			
							if (emptable != null) 
							{
								System.out.println("\n I am at 200");
								ResultSet rs1=ps1.executeQuery();
								while (rs1.next()) 
								{
									//Add records into data list
									dataList.add(rs1.getString(1));
									dataList.add(rs1.getString(2));
									dataList.add(rs1.getString(3));
								}//while loop rs1 closed here
							}// emptable != null closed here
			
							if (managerstable != null)
							{
				
								System.out.println("\n I am at 249");					
								ResultSet rs3=ps3.executeQuery();
								while (rs3.next()) 
								{		
									//Add records into data list
									dataList.add(rs3.getString(1));
									dataList.add(rs3.getString(2));
									dataList.add(rs3.getString(3));													
								}// while rs3 closed here
							}// managerstable != null closed here
			
							//out.println("</table></center></body></html>");
							if (managersFlag ==1)
							{
								nextJSP = "/shodata.jsp";				  
								request.setAttribute("managersdata", dataList);
								RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
								dispatcher.forward(request,response);
								Flag =2;
								deptFlag =2;
							}//managersFlag ==1 closed here			
							if (deptFlag ==1)
							{
								nextJSP = "/shodata.jsp";				  
								request.setAttribute("deptdata", dataList);
								RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
								dispatcher.forward(request,response);
								Flag =2;
							}//deptFlag ==1 closed here
			
							if (Flag ==1)
							{
								nextJSP = "/shodata.jsp";
								request.setAttribute("empdata", dataList);				  
								RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
								dispatcher.forward(request,response);
							}//Flag ==1 closed here
						}// tableFlag == 0 closed here line 192
			} // truncdata and insertdata is null is closed here
			
			if (truncdata != null || droptable != null)
			{
				System.out.println("\nI am here in truncdata-droptable");
				
				if (((emptable != null) && (depttable != null) && (managerstable != null)) ||
						((emptable != null) && (depttable != null)) ||
						((depttable != null) && (managerstable != null)) ||
						((emptable != null) && (managerstable != null)))   
					{
						System.out.println("\n Inside first IF 263");
						response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Please select one table at a time');");
						pw.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
						rd.include(request, response);				
						tableFlag = 1;
					}// tableFlag is 1 when more than one table selected else it will be zero
					
					if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
					{
						if (emptable != null) 
						{
							if ((emptable.trim()) != "empdata") 
							{
								System.out.println("\nand the empdata inside is 280 : " +empdata);
								System.out.println("\nand the empdata length inside is 281: " +empdata.length);
							
								if(empdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						if (depttable != null) 
						{
							if ((depttable.trim()) != "deptdata") 
							{
								System.out.println("\nand the deptdata inside 299 is: " +deptdata);
								System.out.println("\nand the deptdata length inside 300 is: " +deptdata.length);
					
								if(deptdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
									ps2=conn.prepareStatement("select * from dept order by department_id");
									Flag = 1;
									deptFlag =1;
								}
							}
							else
							{
								//	Do Nothing
							}
						}						
						if (managerstable != null) 
						{
							if ((managerstable.trim()) != "managersdata") 
							{
								System.out.println("\nand the managersdata inside 318 is: " +managersdata);
								System.out.println("\nand the managersdata length inside 319 is: " +managersdata.length);
					
								if(managersdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						System.out.println("\n I am @ line 335");
						if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0)
						{
							response.setContentType("text/html");
							System.out.println("\n I am @ line 339 Inside");
							PrintWriter pw=response.getWriter();				
							pw.println("<script type=\"text/javascript\">");
							pw.println("alert('Please select table');");
							pw.println("</script>");
							RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
							rd.include(request, response);
						}//If any table not selected box closed here		
							
						System.out.println("\n I am at 348");
							if (tableFlag == 0)
							{
								if (depttable != null) 
								{											
									ResultSet rs2=ps2.executeQuery();
									System.out.println("\n I am at 354");	
									
									while (rs2.next())
									{
											//Add records into data list
										dataList.add(rs2.getString(1));
										dataList.add(rs2.getString(2));
										dataList.add(rs2.getString(3));
										dataList.add(rs2.getString(4));
									}// While rs2 closed here			
									
								}//depttable != null closed here
				
								if (emptable != null) 
								{
									System.out.println("\n I am at 446");
									ResultSet rs1=ps1.executeQuery();
									while (rs1.next()) 
									{
										//Add records into data list
										dataList.add(rs1.getString(1));
										dataList.add(rs1.getString(2));
										dataList.add(rs1.getString(3));
									}//while loop rs1 closed here
									
								}// emptable != null closed here
				
								if (managerstable != null)
								{
					
									System.out.println("\n I am at 384");					
									ResultSet rs3=ps3.executeQuery();
									while (rs3.next()) 
									{		
										//Add records into data list
										dataList.add(rs3.getString(1));
										dataList.add(rs3.getString(2));
										dataList.add(rs3.getString(3));													
									}// while rs3 closed here
									
								}// managerstable != null closed here
				
								//out.println("</table></center></body></html>");
								if (managersFlag ==1)
								{
									if (droptable != null) 
									{
										nextJSP = "/dropdetails.jsp";
									}
									else
									{
										nextJSP = "/truncatedetails.jsp";
									}				  
									request.setAttribute("managersdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
									dispatcher.forward(request,response);
									Flag =2;
									deptFlag =2;
								}//managersFlag ==1 closed here
								if (deptFlag ==1)
								{
									if (droptable != null) 
									{
										nextJSP = "/dropdetails.jsp";
									}
									else
									{
										nextJSP = "/truncatedetails.jsp";
									}				  
									request.setAttribute("deptdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
									Flag =2;
								}//deptFlag ==1 closed here
				
								if (Flag ==1)
								{
									if (droptable != null) 
										{
											nextJSP = "/dropdetails.jsp";
										}
									else
										{
											nextJSP = "/truncatedetails.jsp";
										}									
									request.setAttribute("empdata", dataList);				  
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
								}//Flag ==1 closed here
								
							}// tableFlag == 0 closed here line 192
							
			}//End of truncate data button code
			if (truncallemprecord != null)
			{
				System.out.println("\nI am here in truncallemprecord");				
				PreparedStatement ps4=conn.prepareStatement("truncate table emp");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 453 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Records removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of truncallemprecord button code
			if (truncalldeptrecord != null)
			{
				System.out.println("\nI am here in truncalldeptrecord");				
				PreparedStatement ps4=conn.prepareStatement("truncate table dept");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 467 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Records removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of truncalldeptrecord button code
			if (truncallmngrrecord != null)
			{
				System.out.println("\nI am here in truncallmngrrecord");				
				PreparedStatement ps4=conn.prepareStatement("truncate table managers");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 481 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Records removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of truncallmngrrecord button code
			if (droptableemp != null)
			{
				System.out.println("\nI am here in droptableemp");				
				PreparedStatement ps4=conn.prepareStatement("drop table emp");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 555 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Table removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of droptableemp button code
			if (droptabledept != null)
			{
				System.out.println("\nI am here in droptableemp");				
				PreparedStatement ps4=conn.prepareStatement("drop table dept");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 583 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Table removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of droptabledept button code
			if (droptablemngr != null)
			{
				System.out.println("\nI am here in droptablemngr");				
				PreparedStatement ps4=conn.prepareStatement("drop table managers");
				ResultSet rs4=ps4.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 597 Inside");
				PrintWriter pw=response.getWriter();				
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Table removed successfully');");
				pw.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);			
			}//End of droptablemngr button code
			
			if (insertdata != null)
			{
				System.out.println("\nI am here in insertdata");
				
				if (((emptable != null) && (depttable != null) && (managerstable != null)) ||
						((emptable != null) && (depttable != null)) ||
						((depttable != null) && (managerstable != null)) ||
						((emptable != null) && (managerstable != null)))   
					{
						System.out.println("\n Inside first IF 263");
						response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Please select one table at a time');");
						pw.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
						rd.include(request, response);				
						tableFlag = 1;
					}// tableFlag is 1 when more than one table selected else it will be zero
					
					if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
					{
						if (emptable != null) 
						{
							if ((emptable.trim()) != "empdata") 
							{
								System.out.println("\nand the empdata inside is 280 : " +empdata);
								System.out.println("\nand the empdata length inside is 281: " +empdata.length);
							
								if(empdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						if (depttable != null) 
						{
							if ((depttable.trim()) != "deptdata") 
							{
								System.out.println("\nand the deptdata inside 299 is: " +deptdata);
								System.out.println("\nand the deptdata length inside 300 is: " +deptdata.length);
					
								if(deptdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
									ps2=conn.prepareStatement("select * from dept order by department_id");
									Flag = 1;
									deptFlag =1;
								}
							}
							else
							{
								//	Do Nothing
							}
						}						
						if (managerstable != null) 
						{
							if ((managerstable.trim()) != "managersdata") 
							{
								System.out.println("\nand the managersdata inside 318 is: " +managersdata);
								System.out.println("\nand the managersdata length inside 319 is: " +managersdata.length);
					
								if(managersdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						System.out.println("\n I am @ line 335");
						if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0)
						{
							response.setContentType("text/html");
							System.out.println("\n I am @ line 339 Inside");
							PrintWriter pw=response.getWriter();				
							pw.println("<script type=\"text/javascript\">");
							pw.println("alert('Please select table');");
							pw.println("</script>");
							RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
							rd.include(request, response);
						}//If any table not selected box closed here		
							
						System.out.println("\n I am at 348");
							if (tableFlag == 0)
							{
								if (depttable != null) 
								{											
									ResultSet rs2=ps2.executeQuery();
									System.out.println("\n I am at 354");	
									
									while (rs2.next())
									{
											//Add records into data list
										dataList.add(rs2.getString(1));
										dataList.add(rs2.getString(2));
										dataList.add(rs2.getString(3));
										dataList.add(rs2.getString(4));
									}// While rs2 closed here			
									
								}//depttable != null closed here
				
								if (emptable != null) 
								{
									System.out.println("\n I am at 724");
									ResultSet rs1=ps1.executeQuery();
									while (rs1.next()) 
									{
										//Add records into data list
										dataList.add(rs1.getString(1));
										dataList.add(rs1.getString(2));
										dataList.add(rs1.getString(3));
									}//while loop rs1 closed here
									
								}// emptable != null closed here
				
								if (managerstable != null)
								{
					
									System.out.println("\n I am at 384");					
									ResultSet rs3=ps3.executeQuery();
									while (rs3.next()) 
									{		
										//Add records into data list
										dataList.add(rs3.getString(1));
										dataList.add(rs3.getString(2));
										dataList.add(rs3.getString(3));													
									}// while rs3 closed here
									
								}// managerstable != null closed here
				
								//out.println("</table></center></body></html>");
								if (managersFlag ==1)
								{
									nextJSP = "/insertdata.jsp";				  
									request.setAttribute("managersdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
									dispatcher.forward(request,response);
									Flag =2;
									deptFlag =2;
								}//managersFlag ==1 closed here
								if (deptFlag ==1)
								{
									nextJSP = "/insertdata.jsp";				  
									request.setAttribute("deptdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
									Flag =2;
								}//deptFlag ==1 closed here
				
								if (Flag ==1)
								{
									nextJSP = "/insertdata.jsp";
									request.setAttribute("empdata", dataList);				  
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
								}//Flag ==1 closed here
								
							}// tableFlag == 0 closed here line 192
							
			}//End of insert data button code
			if (addrowemp != null)
			{				
				if ((empid == null || empid.isEmpty()== true) && (empname == null || empname.isEmpty()== true) && (sal == null || sal.isEmpty()== true)) 
				{
					response.setContentType("text/html");
					System.out.println("\n I am @ line 681 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Please insert the data!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}
				else
				{
					System.out.println("\n Inside addrowemp record");
					String sql = "Insert into EMP (EMPID,EMPNAME,SALARY) values(?,?,?)";
					ps2=conn.prepareStatement(sql);
					ps2.setString(1,empid);  
			        ps2.setString(2,empname);        
			        ps2.setString(3,sal);
					System.out.println("\n And empid is : "+empid);
					System.out.println("\n And empname is : "+empname);
					System.out.println("\n And sal is : "+sal);
					int i=ps2.executeUpdate();
					System.out.println("\n And sql is : "+ps2.getResultSet());
					response.setContentType("text/html");
					System.out.println("\n I am @ line 701 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Records inserted successfully!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}								
				
			}//End of add row emp button
			if (addrowdept != null)
			{				
				if ((deptid == null || deptid.isEmpty()== true) 
						&& (deptname == null || deptname.isEmpty()== true) 
						&& (mgid == null || mgid.isEmpty()== true)
						&& (lcid == null || lcid.isEmpty()== true)) 
				{
					response.setContentType("text/html");
					System.out.println("\n I am @ line 719 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Please insert the data!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}
				else
				{
					System.out.println("\n Inside addrowdept record");				
					ps2=conn.prepareStatement("Insert into dept (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values(?,?,?,?)");
					ps2.setString(1,deptid);  
			        ps2.setString(2,deptname);        
			        ps2.setString(3,mgid);
			        ps2.setString(4,lcid);
					System.out.println("\n And deptid is : "+deptid);
					System.out.println("\n And deptname is : "+deptname);
					System.out.println("\n And mgid is : "+mgid);
					System.out.println("\n And lcid is : "+lcid);
					int i=ps2.executeUpdate();
					response.setContentType("text/html");
					System.out.println("\n I am @ line 741 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Records inserted successfully!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}				
			}//End of add row dept button
			if (addrowmngr != null)
			{								
				if ((managerid == null || managerid.isEmpty()== true) 
						&& (deptname == null || deptname.isEmpty()== true) 
						&& (salary == null || salary.isEmpty()== true)) 
				{
					response.setContentType("text/html");
					System.out.println("\n I am @ line 757 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Please insert the data!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}
				else
				{
					System.out.println("\n Inside addrowmngr record");				
					ps2=conn.prepareStatement("insert into managers (MNGRID,DEPTNAME,SALARY) values(?,?,?)");
					ps2.setString(1,managerid);  
			        ps2.setString(2,deptname);        
			        ps2.setString(3,salary);
					System.out.println("\n And managerid is : "+managerid);
					System.out.println("\n And deptname is : "+deptname);
					System.out.println("\n And salary is : "+salary);
					int i=ps2.executeUpdate();
					response.setContentType("text/html");
					System.out.println("\n I am @ line 777 Inside");
					PrintWriter pw1=response.getWriter();				
					pw1.println("<script type=\"text/javascript\">");
					pw1.println("alert('Records inserted successfully!');");
					pw1.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
					rd.include(request, response);
				}								
				
			}//End of add row manager button
			if (deletedata != null || editdata != null)
			{
				System.out.println("\nI am here in deletedata");
				
				if (((emptable != null) && (depttable != null) && (managerstable != null)) ||
						((emptable != null) && (depttable != null)) ||
						((depttable != null) && (managerstable != null)) ||
						((emptable != null) && (managerstable != null)))   
					{
						System.out.println("\n Inside first IF 263");
						response.setContentType("text/html");
						PrintWriter pw=response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Please select one table at a time');");
						pw.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
						rd.include(request, response);				
						tableFlag = 1;
					}// tableFlag is 1 when more than one table selected else it will be zero
					
					if (((emptable != null) || (depttable != null) || (managerstable != null)) && tableFlag == 0)
					{
						if (emptable != null) 
						{
							if ((emptable.trim()) != "empdata") 
							{
								System.out.println("\nand the empdata inside is 280 : " +empdata);
								System.out.println("\nand the empdata length inside is 281: " +empdata.length);
							
								if(empdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						if (depttable != null) 
						{
							if ((depttable.trim()) != "deptdata") 
							{
								System.out.println("\nand the deptdata inside 299 is: " +deptdata);
								System.out.println("\nand the deptdata length inside 300 is: " +deptdata.length);
					
								if(deptdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
									ps2=conn.prepareStatement("select * from dept order by department_id");
									Flag = 1;
									deptFlag =1;
								}
							}
							else
							{
								//	Do Nothing
							}
						}						
						if (managerstable != null) 
						{
							if ((managerstable.trim()) != "managersdata") 
							{
								System.out.println("\nand the managersdata inside 318 is: " +managersdata);
								System.out.println("\nand the managersdata length inside 319 is: " +managersdata.length);
					
								if(managersdata.length > 0)
								{//If checkbox is checked than assign it with true or 1									
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
						System.out.println("\n I am @ line 335");
						if (((emptable == null) && (depttable == null) && (managerstable == null)) && tableFlag == 0)
						{
							response.setContentType("text/html");
							System.out.println("\n I am @ line 339 Inside");
							PrintWriter pw=response.getWriter();				
							pw.println("<script type=\"text/javascript\">");
							pw.println("alert('Please select table');");
							pw.println("</script>");
							RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
							rd.include(request, response);
						}//If any table not selected box closed here		
							
						System.out.println("\n I am at 348");
							if (tableFlag == 0)
							{
								if (depttable != null) 
								{											
									ResultSet rs2=ps2.executeQuery();
									System.out.println("\n I am at 354");	
									
									while (rs2.next())
									{
											//Add records into data list
										dataList.add(rs2.getString(1));
										dataList.add(rs2.getString(2));
										dataList.add(rs2.getString(3));
										dataList.add(rs2.getString(4));
									}// While rs2 closed here			
									
								}//depttable != null closed here
				
								if (emptable != null) 
								{
									System.out.println("\n I am at 1009");
									ResultSet rs1=ps1.executeQuery();
									while (rs1.next()) 
									{
										//Add records into data list
										dataList.add(rs1.getString(1));
										dataList.add(rs1.getString(2));
										dataList.add(rs1.getString(3));
									}//while loop rs1 closed here
									
								}// emptable != null closed here
				
								if (managerstable != null)
								{
					
									System.out.println("\n I am at 384");					
									ResultSet rs3=ps3.executeQuery();
									while (rs3.next()) 
									{		
										//Add records into data list
										dataList.add(rs3.getString(1));
										dataList.add(rs3.getString(2));
										dataList.add(rs3.getString(3));													
									}// while rs3 closed here									
								}// managerstable != null closed here				
								//out.println("</table></center></body></html>");
								if (managersFlag ==1)
								{
									if (editdata != null) 
									{
										nextJSP = "/update_record.jsp";
									}
									else
									{	
									nextJSP = "/deleterows.jsp";
									}
									request.setAttribute("managersdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;
									dispatcher.forward(request,response);
									Flag =2;
									deptFlag =2;
								}//managersFlag ==1 closed here
								if (deptFlag ==1)
								{
									if (editdata != null) 
									{
										nextJSP = "/update_record.jsp";
									}
									else
									{	
										nextJSP = "/deleterows.jsp";
									}				  
									request.setAttribute("deptdata", dataList);
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
									Flag =2;
								}//deptFlag ==1 closed here
				
								if (Flag ==1)
								{
									if (editdata != null) 
									{
										nextJSP = "/update_record.jsp";
									}
									else
									{	
										nextJSP = "/deleterows.jsp";
										System.out.println("\n I am here at line 1033 after /deleterows.jsp");
									}
									request.setAttribute("empdata", dataList);				  
									RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP) ;							
									dispatcher.forward(request,response);
								}//Flag ==1 closed here
								
							}// tableFlag == 0 closed here line 192
							
			}// End of delete data & editdata
			if (editbutton != null) 
			{
				String sql = "update EMP set EMPNAME=?,SALARY=? where EMPID=? ";						
				ps2=conn.prepareStatement(sql);
				ps2.setString(1,empname_edt);        
		        ps2.setString(2,sal_edt);
		        ps2.setString(3,empid_edt);
		        ps2.executeUpdate();	        
				System.out.println("\n And empid is : "+empid_edt);
				System.out.println("\n And empname is : "+empname_edt);
				System.out.println("\n And sal is : "+sal_edt);				
				response.setContentType("text/html");
				System.out.println("\n I am @ line 1103 Inside");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Records Updated successfully!');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
				}// End of editbutton EMP table
			if (editbuttondept != null) 
			{
				String sql = "update DEPT set DEPARTMENT_NAME=?,MANAGER_ID=?,LOCATION_ID=? where DEPARTMENT_ID=? ";						
				ps2=conn.prepareStatement(sql);
				ps2.setString(1,deptname_edt);        
		        ps2.setString(2,mgid_edt);
		        ps2.setString(3,lcid_edt);
		        ps2.setString(4,deptid_edt);
		        ps2.executeUpdate();	        
				System.out.println("\n And deptid_edt is : "+deptid_edt);
				System.out.println("\n And deptname_edt is : "+deptname_edt);
				System.out.println("\n And mgid_edt is : "+mgid_edt);
				System.out.println("\n And lcid_edt is : "+lcid_edt);
				response.setContentType("text/html");
				System.out.println("\n I am @ line 1217 Inside");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Records Updated successfully!');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
				}// End of editbutton EMP table
			if (editbuttonmngr != null) 
			{
				String sql = "update MANAGERS set DEPTNAME=?,SALARY=? where MNGRID=? ";						
				ps2=conn.prepareStatement(sql);
				ps2.setString(1,deptname_edt);        
		        ps2.setString(2,salary_edt);
		        ps2.setString(3,managerid_edt);
		        ps2.executeUpdate();	        
				System.out.println("\n And managerid_edt is : "+managerid_edt);
				System.out.println("\n And deptname_edt is : "+deptname_edt);
				System.out.println("\n And salary_edt is : "+salary_edt);				
				response.setContentType("text/html");
				System.out.println("\n I am @ line 1237 Inside");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Records Updated successfully!');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
				}// End of editbutton EMP table
			//Start of createtable
			if (createtablequery != null) 
			{
				System.out.println("\n And creatquery message is : "+creatquery);
				ps2=conn.prepareStatement(creatquery);				
		        ps2.executeQuery();
				response.setContentType("text/html");
				System.out.println("\n I am @ line 1033 Inside");
				PrintWriter pw1=response.getWriter();				
				pw1.println("<script type=\"text/javascript\">");
				pw1.println("alert('Table Created successfully!');");
				pw1.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");				
				rd.include(request, response);
				
			}//End of createtable
		} // End of Try box closed
		
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		
	}//End of doPost function

}//End of HttpServlet -FetchData Class
