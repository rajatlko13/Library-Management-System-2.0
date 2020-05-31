package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetTable")
public class GetTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String number = request.getParameter("number");
		
		if(!number.isEmpty())
		{
			int n = Integer.parseInt(number);
			for(int i=1;i<=10;i++)
			{
		//		out.print(number+i+"<br>");
				response.getWriter().write(n*i+"<br>");
			}
		}
		else
		{
//			out.print(number+i+"<br>");
			response.getWriter().write("");
		}
	}

}
