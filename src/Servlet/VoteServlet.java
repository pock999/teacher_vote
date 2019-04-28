package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import control.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
    private Statement statement;
    
    public void init(ServletConfig config) throws ServletException{
    	//attempt database connection and create Statements
    	try{
    		Class.forName(config.getInitParameter("databaseDriver"));
    		connection = DriverManager.getConnection(
    				config.getInitParameter("databaseName")+"?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC",
    				config.getInitParameter("username"),
    				config.getInitParameter("password")
    				);
    		
    		//create statement to query database
    		statement = connection.createStatement();
    		/*end try
    		 * 
    		 * for any exception throw an UnavailableException
    		 * indicate that the servlet is not currently available
    		 * */
    	}catch(Exception exception){
    		exception.printStackTrace();
    		throw new UnavailableException(exception.getMessage());
    	}//end catch
    }//end method init  
    
    public VoteServlet() {
        super();
       
    }
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//set up response to client
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				DBupdater dbu = new DBupdater();
				String id = request.getParameter("teacher");
				String userID = (String)request.getSession().getAttribute("userID");
				id = id.replaceAll("/", "");
				boolean status = dbu.voteTeacher(id,userID);
				if(status==true){
					response.sendRedirect("index.jsp");
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('投票失敗，請重試');");
					out.println("</script>");
					response.sendRedirect("votehome.jsp");
				}
					
				
	}

}
