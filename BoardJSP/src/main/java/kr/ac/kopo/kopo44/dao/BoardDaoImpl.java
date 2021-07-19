package kr.ac.kopo.kopo44.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.domain.Board;


public class BoardDaoImpl implements BoardDao {
	private static String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/myBoard";
	private static String DB_ID = "root";
	private static String DB_PW = "gusehdqls92410!@";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rset;
	private static BoardDaoImpl instance;
	
	private BoardDaoImpl() {
	  try {
	         Class.forName(DRIVER_NAME);
	         conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
		
	}
	 
	public static BoardDaoImpl getInstance() {
	      if (instance == null) {
	          instance = new BoardDaoImpl();
	       }
	       return instance;
	    }

	@Override
	public void create(Board board) {
		try {
			stmt = conn.createStatement();
			stmt.execute("insert into boards(title) value('" + board.getTitle() + "');");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Board selectOne(int id) {
		Board board = new Board();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from boards where id=" + id + ";");
			while(rset.next()) {
				board.setId(rset.getInt(1));
				board.setTitle(rset.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return board;
	}

	@Override
	public List<Board> selectAll() {
		List<Board> boards = new ArrayList<Board>();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from boards;");
			//select * from boards order by id desc limit " + ((current_page - 1) * CntLIst) + "," + CntLIst + ";
			while(rset.next()) {
				Board board = new Board();
				board.setId(rset.getInt(1));
				board.setTitle(rset.getString(2));
				boards.add(board);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return boards;
	}

	@Override
	public void update(Board board) {
		try {
			stmt = conn.createStatement();
			stmt.execute("update boards set title='" + board.getTitle() + "' where id = " + board.getId() + ";");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Board board) {
		try {
			stmt = conn.createStatement();
			stmt.execute("delete from boards where id = " + board.getId() + ";");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Board> search(String searchWord) {
		List<Board> boards = new ArrayList<Board>();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from boards where title like '%" + searchWord + "%';");
			
			while(rset.next()) {
				Board board = new Board();
				board.setId(rset.getInt(1));
				board.setTitle(rset.getString(2));
				boards.add(board);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return boards;
		
	}

	@Override
	public List<Board> boardListPaing(int current_page, int CntList) {
		List<Board> boards = new ArrayList<Board>();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from boards limit " + ((current_page - 1) * CntList) + ", " + CntList + ";");
			
			while(rset.next()) {
				Board board = new Board();
				board.setId(rset.getInt(1));
				board.setTitle(rset.getString(2));
				boards.add(board);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return boards;
	}

}
