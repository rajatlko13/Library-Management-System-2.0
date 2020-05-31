package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/VerifyStudentUsername",  name = "verifyStudentUsername")
public class VerifyStudentUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String username=request.getParameter("username");
			if(username.isEmpty())
			{
				response.getWriter().write("0");
			}
			String url="jdbc:mysql://localhost:3306/librarymanagement?useSSL=false";
			String uname="root";
			String pass="Rajat123";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);

			String query="select username from student_details where username=?";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				response.getWriter().write("0");
			else
				response.getWriter().write("1");
				
			st.close();
			con.close();
			}
			catch(Exception e)
			{
				return;
			}
	}

}
