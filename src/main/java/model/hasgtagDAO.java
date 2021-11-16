package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class hasgtagDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	hashtagVO vo = null;
	int cnt = 0;
	
	public void conn() {
		try {

			// jdbd ���̺귯�� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB�� �α����� �ּ�, ID, PW ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_4_3";
			String dbpw = "smhrd3";

			// Connection ��ü ����
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {

				rs.close();
			}
			if (psmt != null) {

				psmt.close();
			}
			if (conn != null) {

				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// ================================================
	
	public int registHash(hashtagVO vo) {

		
		try {

			conn();

			
			// sql�� �ۼ�
		
			String sql = "insert into tb_hashtag values(HASHTAG_SEQ.NEXTVAL,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, vo.getMood());
			psmt.setString(2, vo.getWith_who());
			psmt.setString(3, vo.getFacil());
			
			cnt = psmt.executeUpdate();
			
			if (cnt ==0) {
				System.out.println("�ؽ��±� ������ �������");
			}  else {
				System.out.println("�ؽ��±� ���� ����");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
public hashtagVO print(int review_num) {
		
		
		
		try {

			conn();

			
			// sql�� �ۼ�
		
			String sql = "select * from tb_hashtag where review_num = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, review_num);
			
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int reviewNum = rs.getInt(1);
				String mood = rs.getString(2);
				String with_who = rs.getString(3);
				String facil = rs.getString(4);

				vo = new hashtagVO(mood, with_who, facil);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return vo;
}
}

