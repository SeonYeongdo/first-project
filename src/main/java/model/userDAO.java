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
			
		//jdbd 라이브러리 동적로딩
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		
		//DB에 로그인할 주소, ID, PW 지정
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String dbid = "cgi_4_3";
		String dbpw = "smhrd3";
		
		//Connection 객체 생성
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
			// 실행할 sql문 작성
			String sql = "insert into TB_USER(USER_ID, USER_PWD, USER_NAME, USER_ADDR, USER_PREFER) values(?,?,?,?,?)";
			
			// sql문 실행 준비, PreparedStatement 객체 생성
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getUser_id());
			psmt.setString(2, vo.getUser_pwd());
			psmt.setString(3, vo.getUser_name());
			psmt.setString(4, vo.getUser_addr());
			psmt.setString(5, vo.getUser_prefer());
			
			//sql문 실행(execute())
			// executeUpdate() update, delete, insert = 테이블 상 변ㄴ화가 있을 때 
														//int반환 (몇개 레코드에서 변화가 일어났는지)
			// executeQuery() select = 테이블 상 변화가 없을 때 / 값을 가지고 올때
										// ResultSet(객체)
			
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
			
			//sql문 작성
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
			
			//sql문 작성
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
		
		//sql문 작성
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
