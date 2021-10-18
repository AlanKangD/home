package home.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, id, pw;
public MemberDAO() {
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	url = "jdbc:oracle:thin:@localhost:1521:xe";
	id = "spring";
	pw = "spring";

}
	String search, searchString;
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	
	
	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException{
		String sql = "select * from jsp_member where ssn1=? and ssn2=?";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if(rs.next()) return true; //주민버호는 고유의 값이라는 같은 값이 나오면 이미 회원이다.
			else return false; 
		}finally {
			if(con!=null) con.close();
			if(rs!=null) rs.close();
			if(ps != null) ps.close();
		}
		
		
	}
	public int insertMember(MemberDTO dto) throws SQLException {
		String sql = "insert into jsp_member values(jsp_member_no.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try {
			con = DriverManager.getConnection(url,id,pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if(ps!=null) ps.close();
			if(con != null) con.close();
		}
		
	}	
	public ArrayList<MemberDTO> listMember() throws SQLException {	
		String sql = "select * from jsp_member";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> listMember = makeArrayList(rs);
			return listMember;
		}finally {
			if(ps!=null) ps.close();
			if(con != null) con.close();
			if(rs != null) rs.close();
		}
		
		
		
		
	}
	
	public ArrayList<MemberDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<MemberDTO> listMember = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setId(rs.getString(3));
			dto.setPassword(rs.getString(4));
			dto.setSsn1(rs.getString(5));
			dto.setSsn2(rs.getString(6));
			dto.setEmail(rs.getString(7));
			dto.setHp1(rs.getString(8));
			dto.setHp2(rs.getString(9));
			dto.setHp3(rs.getString(10));
			dto.setJoindate(rs.getString(11));
			listMember.add(dto);
			
		}
		return listMember;
	}
	public ArrayList<MemberDTO> findMember() throws SQLException{
		String sql = "select * from jsp_member where" +search+"=?";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> findMember = makeArrayList(rs);
			return findMember;
		}finally {
			if(ps!=null) ps.close();
			if(con != null) con.close();
			if(rs != null) rs.close();
		}
	}	
	public int deleteMember(int no) throws SQLException {
		String sql = "delete from jsp_member where no=?";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int res = ps.executeUpdate();
			return res;
					
		}finally {
			if(ps!=null) ps.close();
			if(con != null) con.close();
			if(rs != null) rs.close();
			
		}
		
		
	}
	
	
}



























