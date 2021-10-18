package home.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, id, pw;
	
	public BookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		id = "spring";
		pw = "spring";
		
	}
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql = "select * from book";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			return listBook;
		}finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
			
		}
		
	}
	protected ArrayList<BookDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<BookDTO> listBook = new ArrayList<BookDTO>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setName(rs.getString(1));
			dto.setWriter(rs.getString(2));
			dto.setPublisher(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			dto.setJoindate(rs.getString(5));
			listBook.add(dto);
		}
		return listBook;
	}

}
