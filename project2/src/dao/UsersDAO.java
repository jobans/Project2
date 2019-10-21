package dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.ws.Response;

import connection.OracleXEConnection;
import vo.UsersVO;

public class UsersDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public UsersDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	//회원가입 메소드
	public void addUser(UsersVO vo) {
		sb.setLength(0);
		sb.append("insert into users ");
		sb.append("values (users_userno_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getSex());
			pstmt.setString(5, vo.getDob());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getPno());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getPost());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL문 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//addUser() end
	
	//id 중복검사 값이 0이면 사용 가능 
	public String getId(String id) {
		String ckid = "";
		sb.setLength(0);
		sb.append("select count(id) from users ");
		sb.append("where id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			rs.next();
			
			ckid = rs.getString(1);
			
			
		} catch (SQLException e) {
			System.out.println("SQL문 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ckid;
		
	}
	
	//login 메소드
	public boolean login(String id, String pw) {
		boolean ck = false;
		sb.setLength(0);
		sb.append("select id ");
		sb.append("from users ");
		sb.append("where id = ? and pw = ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String ckid = rs.getString(1);
			
			if(ckid!=null) {
				ck=true;
			}
			
		} catch (SQLException e) {
			
		}
		
		
		
		return ck;
		
	}
	
	//회원찾기 메소드
	public UsersVO findMember(String name, String pno, String email) {
		UsersVO vo = null;
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from users ");
		sb.append("where name = ? and pno = ? and email = ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, pno);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			
			vo = new UsersVO();
			vo.setId(id);
			vo.setPw(pw);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public boolean duplicateIdCheck(String id)
	{
		boolean x= false;
		       
		sb.setLength(0);
		sb.append("SELECT ID FROM USERS WHERE ID=?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) //해당 아이디 존재
				x= true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	} // end duplicateIdCheck()

	//자원 반납 메소드 
	public void close() {
		if(rs != null) {
			try {
				rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}//close() end
	
}
