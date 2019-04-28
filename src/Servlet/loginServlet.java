package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.DBsearch;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
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
    		
    	}catch(Exception exception){
    		exception.printStackTrace();
    		throw new UnavailableException(exception.getMessage());
    	}//end catch
    }//end method init
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		DBsearch dbs = new DBsearch();
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		boolean loginState;
		try{
			loginState = dbs.login(id, pwd);
			if(loginState == true){
				String userIDKey = new String("userID");
				String userID = new String(id);
				request.getSession().setAttribute(userIDKey, userID);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('登入成功');");
				out.println("location='afterIndex.jsp';");
				out.println("</script>");
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('帳號或密碼錯誤');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
		}catch(SQLException e){
			e.printStackTrace();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('登入失敗');");
			out.println("location='login.jsp';");
			out.println("</script>");
		}
	}

}
