package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.BoardVO;
import vo.WebBoardVO;

public class WebBoardDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public WebBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	public ArrayList<WebBoardVO> getHitData(){
		
		ArrayList<WebBoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from (select * ");
		sb.append("from webboard ");
		sb.append("order by hits desc) ");
		sb.append("where rownum <= 3 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String bname = rs.getString("bname");
				
				WebBoardVO vo = new WebBoardVO();
				
				vo.setBno(bno);
				vo.setBname(bname);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 데이터 한 건 조회 메소드
	public WebBoardVO getData(int bno) {
		sb.setLength(0);
		sb.append("select * from webboard ");
		sb.append("where bno = ? ");
		
		WebBoardVO vo = null;
		
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, bno);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				String userno = rs.getString(2);
				String code = rs.getString(3);
				String ip = rs.getString(4);
				String bname = rs.getString(5);
				String bcontent = rs.getString(6);
				String regdate = rs.getString(7);
				int hits = rs.getInt(8);
				
				vo = new WebBoardVO(bno, userno, code, ip, bname, bcontent, regdate, hits);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return vo;
	}// getData() end
	
	// 게시글 입력 메소드
	public void addData(WebBoardVO vo) {
		sb.setLength(0);
		sb.append("insert into webboard ");
		sb.append("values (webboard_bno_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0 ) ");
		
		// status : 정상글 - 0, 블라인드 처리 - 1
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getUserno());
			pstmt.setString(2, "fb1");
			pstmt.setString(3, vo.getIp());
			pstmt.setString(4, vo.getBname());
			pstmt.setString(5, vo.getBcontent());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end

	// 게시글 수정 메소드
	public void modifyData(WebBoardVO vo) {
		
		sb.setLength(0);
		sb.append("update webboard ");
		sb.append("set bname = ?, bcontent = ? ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getBname());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setInt(3, vo.getBno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// modifyData() end
	
	// 게시글 삭제 메소드
	public void deleteData(int bno) {
		sb.setLength(0);
		sb.append("delete from webboard ");
		sb.append("where bno= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 조회수 증가 메소드
	public void raiseHits(int bno) {
		sb.setLength(0);
		sb.append("update webboard ");
		sb.append("set hits = hits+1 ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// raiseHits() end
	
	public ArrayList<WebBoardVO> getFullData(){
		ArrayList<WebBoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from webboard ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String userno = rs.getString("userno");
				String code = rs.getString("code");
				String ip = rs.getString("ip");
				String bname = rs.getString("bname");
				String bcontent = rs.getString("bcontent");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				
				WebBoardVO vo = new WebBoardVO(bno, userno, code, ip, bname, bcontent, regdate, hits);
				
				list.add(vo);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<WebBoardVO> getAllData(int startNo, int endNo){
		
		ArrayList<WebBoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from (select rownum rn, bno, userno, code, ip, bname, bcontent, regdate, hits ");
		sb.append("from (select * ");
		sb.append("from webboard ");
		sb.append("order by rownum desc ) ");
		sb.append("where rownum <= ? ) ");
		sb.append("where rn >= ? ");
		sb.append("order by bno desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String userno = rs.getString("userno");
				String code = rs.getString("code");
				String ip = rs.getString("ip");
				String bname = rs.getString("bname");
				String bcontent = rs.getString("bcontent");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				
				WebBoardVO vo = new WebBoardVO(bno, userno, code, ip, bname, bcontent, regdate, hits);
				
				list.add(vo);		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<WebBoardVO> searchData(String userno){
		
		ArrayList<WebBoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from webboard ");
		sb.append("where userno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, userno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String code = rs.getString("code");
				String ip = rs.getString("ip");
				String bname = rs.getString("bname");
				String bcontent = rs.getString("bcontent");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				
				WebBoardVO vo = new WebBoardVO(bno, userno, code, ip, bname, bcontent, regdate, hits);
				
				list.add(vo);	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int SearchCount(String userno) {
		
		sb.setLength(0);
		sb.append("select count(*) cnt ");
		sb.append("from webboard ");
		sb.append("where userno = ? ");
		
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, userno);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			cnt = rs.getInt("cnt");
			// 컬럼 이름으로 불러올 경우 함수사용시에는 별칭을 사용하기
			//cnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}//getTotalCount() end
	
	public int getTotalCount() {
		
		sb.setLength(0);
		sb.append("select count(*) cnt ");
		sb.append("from webboard ");
		
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			rs.next();
			
			cnt = rs.getInt("cnt");
			// 컬럼 이름으로 불러올 경우 함수사용시에는 별칭을 사용하기
			//cnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}//getTotalCount() end
	
	//자원 반납 메소드 
	public void close() {
		if(rs != null) {
			try {
				rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			}
		}
	}//close() end
}
