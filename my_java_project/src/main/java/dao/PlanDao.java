package dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBConnection;

public class PlanDao extends HttpServlet{
	private DBConnection connection;
	public PlanDao() {
		this.connection
	}
}