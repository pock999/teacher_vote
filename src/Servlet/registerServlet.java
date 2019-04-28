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

import control.*;


@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
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
    public registerServlet() {
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
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("account");
		DBsearch dbs = new DBsearch();
		DBupdater dpu = new DBupdater();
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		boolean repeat;
		if(name.length()>255){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('名子長度超過上限');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}else if(name.length()<1){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('請輸入名子');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}
		if(pwd.length()<8){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('密碼小於8字元');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}else if(pwd.length()>255){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('密碼超過上限');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}else if(id.length()>255){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('帳號超過上限');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}else if(id.length()<8){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('帳號小於8字元');");
			out.println("location='register.jsp';");
			out.println("</script>");
		}else{
			try{
				repeat = dbs.repeatID(id);
				if(repeat == true){
					out.println("<script type=\"text/javascript\">");
					out.println("alert('帳號已經重複');");
					out.println("location='register.jsp';");
					out.println("</script>");
				}else{
					if(dpu.register(name, id, pwd)){
						out.println("<script type=\"text/javascript\">");
						out.println("alert('註冊成功');");
						out.println("location='index.jsp';");
						out.println("</script>");
					}else{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('註冊失敗，請重新註冊');");
						out.println("location='register.jsp';");
						out.println("</script>");
					}
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		
	}

}
