package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		boolean check = true; // check = true (��� �Ұ�) // false(��밡��)

		try {
			// jdbc ����̹� ���� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// db�� �α��� �� url id pw ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_4_3";
			String dbpw = "smhrd3";

			// Connection��ü ����
			conn = DriverManager.getConnection(url, dbid, dbpw);

			// sql�� �ۼ�
			String sql = "select user_id from tb_user where user_id=?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				check = true;

			} else {
				check = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				psmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		PrintWriter out = response.getWriter();

		out.print(check);
	}

}
