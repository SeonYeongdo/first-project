package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	userVO vo = null;
	int cnt = 0;
	public void conn() {
		try {
			
		//jdbd ���̺귯�� �����ε�
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		
		//DB�� �α����� �ּ�, ID, PW ����
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String dbid = "cgi_4_3";
		String dbpw = "smhrd3";
		
		//Connection ��ü ����
		conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {	
			if (rs!=null) {
				rs.close();
			}
			psmt.close();
			conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int join(userVO vo) {
		
		try{
			conn();
			// ������ sql�� �ۼ�
			String sql = "insert into TB_USER(USER_ID, USER_PWD, USER_NAME, USER_ADDR, USER_PREFER) values(?,?,?,?,?)";
			
			// sql�� ���� �غ�, PreparedStatement ��ü ����
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getUser_id());
			psmt.setString(2, vo.getUser_pwd());
			psmt.setString(3, vo.getUser_name());
			psmt.setString(4, vo.getUser_addr());
			psmt.setString(5, vo.getUser_prefer());
			
			//sql�� ����(execute())
			// executeUpdate() update, delete, insert = ���̺� �� ����ȭ�� ���� �� 
														//int��ȯ (� ���ڵ忡�� ��ȭ�� �Ͼ����)
			// executeQuery() select = ���̺� �� ��ȭ�� ���� �� / ���� ������ �ö�
										// ResultSet(��ü)
			
			cnt = psmt.executeUpdate();
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		} finally {
			close();
		}
		return cnt;
	}
	
	public userVO login(String id, String pw) {
		
		try{
			
			conn();
			
			//sql�� �ۼ�
			String sql = "select * from TB_USER where USER_ID=? and USER_pwD=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String user_id = rs.getString(1);
				String user_pwd = rs.getString(2);
				String user_name = rs.getString(3);
				String user_addr = rs.getString(4);
				String user_prefer = rs.getString(5);
				int user_mileage = rs.getInt(7);
				vo = new userVO(user_id, user_pwd, user_name, user_addr, user_prefer, user_mileage);
						
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			close();
		}
		return vo;
	}
	
public userVO logout(String id, String pw) {
		
		try{
			
			conn();
			
			//sql�� �ۼ�
			String sql = "select * from TB_USER where USER_ID=? and USER_pwD=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String user_id = rs.getString(1);
				String user_pwd = rs.getString(2);
				String user_name = rs.getString(3);
				String user_addr = rs.getString(4);
				String user_prefer = rs.getString(5);
				int user_mileage = rs.getInt(7);
				vo = new userVO(user_id, user_pwd, user_name, user_addr, user_prefer, user_mileage);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			close();
		}
		return vo;
	}
public userVO mileage(String id) {
	
	try{
		
		conn();
		
		//sql�� �ۼ�
		String sql = "select user_mileage from TB_USER where USER_ID=?";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, id);
	
		
		rs = psmt.executeQuery();
		
		if (rs.next()) {
			String user_id = rs.getString(1);
			String user_pwd = rs.getString(2);
			String user_name = rs.getString(3);
			String user_addr = rs.getString(4);
			String user_prefer = rs.getString(5);
			int user_mileage = rs.getInt(7);
			vo = new userVO(user_id, user_pwd, user_name, user_addr, user_prefer, user_mileage);
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		
		close();
	}
	return vo;
}
}
