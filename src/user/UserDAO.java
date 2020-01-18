package user;
//데이터베이스에서 회원정보를 불러오거나 insert하기위한 클래스

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			//설치된 mySql 서버 접속. BBS 접속
			String dbURL = "jdbc:mysql://localhost:3307/BBS?serverTimezone=UTC";
			String dbId = "root";
			String dbPassword = "1q2w3e4r%T";			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbId, dbPassword);
		}catch(Exception e){
			//오류 발생시 오류 출력
			e.printStackTrace();
		}finally {
			
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("userPassword").equals(userPassword)) {
					return 1; // 로그인 성공 
				}else {
					return 0; // 비밀번호 불일치 
				}

			}
			return -1; // 아이디가 없을 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류시 리턴 값
	}
	
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //회원가입 실패	
	}
}
